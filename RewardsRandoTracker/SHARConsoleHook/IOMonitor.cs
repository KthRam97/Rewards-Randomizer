using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace SHARConsoleHook
{
    public class InjectionEntryPoint : EasyHook.IEntryPoint
    {
        /// <summary>
        /// Reference to the server interface within FileMonitor
        /// </summary>
        ServerInterface _server = null;

        /// <summary>
        /// Message queue of all files accessed
        /// </summary>
        Queue<string> _messageQueue = new Queue<string>();

        /// <summary>
        /// EasyHook requires a constructor that matches <paramref name="context"/> and any additional parameters as provided
        /// in the original call to <see cref="EasyHook.RemoteHooking.Inject(int, EasyHook.InjectionOptions, string, string, object[])"/>.
        /// 
        /// Multiple constructors can exist on the same <see cref="EasyHook.IEntryPoint"/>, providing that each one has a corresponding Run method (e.g. <see cref="Run(EasyHook.RemoteHooking.IContext, string)"/>).
        /// </summary>
        /// <param name="context">The RemoteHooking context</param>
        /// <param name="channelName">The name of the IPC channel</param>
        public InjectionEntryPoint(
            EasyHook.RemoteHooking.IContext context,
            string channelName)
        {
            // Connect to server object using provided channel name
            _server = EasyHook.RemoteHooking.IpcConnectClient<ServerInterface>(channelName);

            // If Ping fails then the Run method will be not be called
            _server.Ping();
        }

        /// <summary>
        /// The main entry point for our logic once injected within the target process. 
        /// This is where the hooks will be created, and a loop will be entered until host process exits.
        /// EasyHook requires a matching Run method for the constructor
        /// </summary>
        /// <param name="context">The RemoteHooking context</param>
        /// <param name="channelName">The name of the IPC channel</param>
        public void Run(
            EasyHook.RemoteHooking.IContext context,
            string channelName)
        {
            // Injection is now complete and the server interface is connected
            _server.IsInstalled(EasyHook.RemoteHooking.GetCurrentProcessId());

            // Install hooks

            // WriteFile https://msdn.microsoft.com/en-us/library/windows/desktop/aa365747(v=vs.85).aspx
            var writeConsoleHook = EasyHook.LocalHook.Create(
                EasyHook.LocalHook.GetProcAddress("kernel32.dll", "WriteFile"),
                new WriteConsole_Delegate(WriteConsole_Hook),
                this);

            // Activate hooks on all threads except the current thread
            writeConsoleHook.ThreadACL.SetExclusiveACL(new Int32[] { 0 });

            var minidumpHook = EasyHook.LocalHook.Create(
                EasyHook.LocalHook.GetProcAddress("dbghelp.dll", "MiniDumpWriteDump"),
                new MiniDumpWriteDump_Delegate(MiniDumpWriteDump_hook),
                this);

            minidumpHook.ThreadACL.SetExclusiveACL(new Int32[] { 0 });

            _server.ReportMessage("WriteFile hooks installed\r\n");
            _server.ReportMessage("MiniDumpWriteDump hooks installed\r\n");

            // Wake up the process (required if using RemoteHooking.CreateAndInject)
            EasyHook.RemoteHooking.WakeUpProcess();

            try
            {
                // Loop until FileMonitor closes (i.e. IPC fails)
                while (true)
                {
                    System.Threading.Thread.Sleep(500);

                    string[] queued = null;

                    lock (_messageQueue)
                    {
                        queued = _messageQueue.ToArray();
                        _messageQueue.Clear();
                    }

                    // Send newly monitored file accesses to FileMonitor
                    if (queued != null && queued.Length > 0)
                    {
                        _server.ReportMessages(queued);
                    }
                    else
                    {
                        _server.Ping();
                    }
                }
            }
            catch
            {
                // Ping() or ReportMessages() will raise an exception if host is unreachable
            }

            // Remove hooks
            writeConsoleHook.Dispose();
            minidumpHook.Dispose();

            // Finalise cleanup of hooks
            EasyHook.LocalHook.Release();
        }

        /// <summary>
        /// P/Invoke to determine the filename from a file handle
        /// https://msdn.microsoft.com/en-us/library/windows/desktop/aa364962(v=vs.85).aspx
        /// </summary>
        /// <param name="hFile"></param>
        /// <param name="lpszFilePath"></param>
        /// <param name="cchFilePath"></param>
        /// <param name="dwFlags"></param>
        /// <returns></returns>
        [DllImport("Kernel32.dll", SetLastError = true, CharSet = CharSet.Auto)]
        static extern uint GetFinalPathNameByHandle(IntPtr hFile, [MarshalAs(UnmanagedType.LPTStr)] StringBuilder lpszFilePath, uint cchFilePath, uint dwFlags);

        [DllImport("kernel32.dll", SetLastError = true)]
        static extern IntPtr GetStdHandle(uint nStdHandle);

        #region MiniDumpWriteDump hook
        [UnmanagedFunctionPointer(CallingConvention.StdCall, SetLastError = true)]
        [return: MarshalAs(UnmanagedType.Bool)]
        delegate bool MiniDumpWriteDump_Delegate(
            IntPtr hProcess,
            uint processId,
            IntPtr hFile,
            uint DumpType,
            IntPtr ExceptionParam,
            IntPtr UserStreamParam,
            IntPtr CallbackParam
            );

        [DllImport("dbghelp.dll", SetLastError = true, CallingConvention = CallingConvention.StdCall)]
        [return: MarshalAs(UnmanagedType.Bool)]
        static extern bool MiniDumpWriteDump(
            IntPtr hProcess,
            uint processId,
            IntPtr hFile,
            uint DumpType,
            IntPtr ExceptionParam,
            IntPtr UserStreamParam,
            IntPtr CallbackParam
            );

        bool MiniDumpWriteDump_hook(
            IntPtr hProcess,
            uint processId,
            IntPtr hFile,
            uint DumpType,
            IntPtr ExceptionParam,
            IntPtr UserStreamParam,
            IntPtr CallbackParam
            )
        {
            bool result = false;

            // Override with full memory request :o
            // Disabled for release because it's huge and probably unnecessary for now
            //DumpType = 0x00000002;

            // Call original first so we get lpNumberOfBytesWritten
            result = MiniDumpWriteDump(hProcess, processId, hFile, DumpType, ExceptionParam, UserStreamParam, CallbackParam);

            return result;
        }

        #endregion


        #region WriteConsole hook
        [UnmanagedFunctionPointer(CallingConvention.StdCall, CharSet = CharSet.Ansi, SetLastError = true)]
        [return: MarshalAs(UnmanagedType.Bool)]
        delegate bool WriteConsole_Delegate(
            IntPtr hConsoleOutput,
            IntPtr lpBuffer,
            uint nNumberOfCharsToWrite,
            out uint lpNumberofCharsWritten,
            IntPtr lpReserved
            );

        [DllImport("kernel32.dll", CharSet = CharSet.Ansi, SetLastError = true, CallingConvention = CallingConvention.StdCall)]
        static extern IntPtr CreateFile(
            string lpFileName,
            uint dwDesiredAccess,
            uint dwShareMode,
            IntPtr lpSecurityAttributes,
            uint dwCreationDeposition,
            uint dwFlagsAndAttributes,
            IntPtr hTemplateFile);

        [DllImport("kernel32.dll", CharSet = CharSet.Ansi, SetLastError = true, CallingConvention = CallingConvention.StdCall)]
        [return: MarshalAs(UnmanagedType.Bool)]
        static extern bool WriteFile(
            IntPtr hConsoleOutput,
            IntPtr lpBuffer,
            uint nNumberOfCharsToWrite,
            out uint lpNumberofCharsWritten,
            IntPtr lpOverlapped);

        [DllImport("kernel32.dll", SetLastError = true, CallingConvention = CallingConvention.StdCall)]
        static extern uint GetFileType(IntPtr hFile);

        bool WriteConsole_Hook(
            IntPtr hConsoleOutput,
            IntPtr lpBuffer,
            uint nNumberOfCharsToWrite,
            out uint lpNumberofCharsWritten,
            IntPtr lpOverlapped)
        {
            bool result = false;

            // Call original first so we get lpNumberOfBytesWritten
            result = WriteFile(hConsoleOutput, lpBuffer, nNumberOfCharsToWrite, out lpNumberofCharsWritten, lpOverlapped);

            uint type = GetFileType(hConsoleOutput);

            if (type == 2U)
            {
                byte[] data = new byte[nNumberOfCharsToWrite];
                Marshal.Copy(lpBuffer, data, 0, (int)nNumberOfCharsToWrite);
                string buff = Encoding.ASCII.GetString(data);
                try
                {
                    lock (this._messageQueue)
                    {
                        if (this._messageQueue.Count < 1000)
                        {
                            // Add message to send to FileMonitor
                            this._messageQueue.Enqueue(
                                buff);
                        }
                    }
                }
                catch
                {
                    // swallow exceptions so that any issues caused by this code do not crash target process
                }
            }

            return result;
        }
        #endregion


    }
}