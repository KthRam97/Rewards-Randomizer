using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RewardsRandoTracker
{
    static class Program
    {
        private static string _ExeDirectory;
        public static string ExeDirectory { get { return _ExeDirectory; } }

        private static string _MLDocumentsDirectory;
        public static string MLDocumentsDirectory { get { return _MLDocumentsDirectory; } }

        private static string _Version;
        public static string Version { get { return _Version; } }

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            System.Reflection.Assembly assembly = System.Reflection.Assembly.GetEntryAssembly();
            _ExeDirectory = System.IO.Path.GetDirectoryName(assembly.Location);
            System.IO.Directory.SetCurrentDirectory(ExeDirectory);

            string documents = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
            _MLDocumentsDirectory = System.IO.Path.Combine(documents, "My Games", "Lucas' Simpsons Hit & Run Mod Launcher");

            _Version = System.Reflection.Assembly.GetEntryAssembly().GetName().Version.ToString().Replace(".0", "");

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new FrmMain());
        }
    }
}
