using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RewardsRandoTracker
{
    public partial class FrmMain : Form
    {
        static Process simpsons;
        private readonly FrmRestrictionsTracker restrictionsTracker = new FrmRestrictionsTracker();
        private bool IsLoading = false;
        private bool IsSeedSpoiler = false;
        private int CollectedCards = 0;

        public readonly Dictionary<string, string> Rewards = new Dictionary<string, string>();
        public readonly Dictionary<string, string> Restrictions = new Dictionary<string, string>();
        public readonly Dictionary<string, string> NameMap = new Dictionary<string, string>();

        public FrmMain()
        {
            InitializeComponent();
        }

        private void SetStatus(string text)
        {
            if (statusStrip1.InvokeRequired)
            {
                Action a = delegate { SetStatus(text); };
                statusStrip1.Invoke(a);
            }
            else
            {
                LblStatus.Text = "Status: " + text;
            }
        }

        private void AddLog(string text)
        {
            if (LBLog.InvokeRequired)
            {
                Action a = delegate { AddLog(text); };
                LBLog.Invoke(a);
            }
            else
            {
                LBLog.TopIndex = LBLog.Items.Add(text);
            }
        }

        private void ClearLogs()
        {
            if (LBLog.InvokeRequired)
            {
                Action a = delegate { ClearLogs(); };
                LBLog.Invoke(a);
            }
            else
            {
                LBLog.Items.Clear();
            }
        }

        private void ResetLookup()
        {
            if (CBLookup.InvokeRequired)
            {
                Action a = delegate { ResetLookup(); };
                CBLookup.Invoke(a);
            }
            else
            {
                CBLookup.Items.Clear();
                CBLookup.Items.Add("Rewards Not Loaded");
                CBLookup.SelectedIndex = 0;
            }
        }

        private void PopulateLookup()
        {
            if (CBLookup.InvokeRequired)
            {
                Action a = delegate { PopulateLookup(); };
                CBLookup.Invoke(a);
            }
            else
            {
                CBLookup.Items.Clear();
                CBLookup.Items.AddRange(NameMap.Keys.OrderBy(x => x).ToArray());
                CBLookup.SelectedIndex = 0;
            }
        }

        private void ResetTracker()
        {
            if (restrictionsTracker.InvokeRequired)
            {
                Action a = delegate { ResetTracker(); };
                restrictionsTracker.Invoke(a);
            }
            else
            {
                restrictionsTracker.ResetTracker();
            }
        }

        private void TrackReward(int Level, string Reward)
        {
            if (restrictionsTracker.InvokeRequired)
            {
                Action a = delegate { TrackReward(Level, Reward); };
                restrictionsTracker.Invoke(a);
            }
            else
            {
                restrictionsTracker.RewardUnlocked(Level, Reward);
            }
        }

        private async void HookSimpsons()
        {
            simpsons = null;
            while (true)
            {
                Process[] processes = Process.GetProcessesByName("Simpsons");
                if (processes.Length > 0)
                    simpsons = processes[0];
                if (simpsons != null)
                    break;
                await Task.Delay(100);
            }

            SetStatus("Configuring tracker...");

            simpsons.EnableRaisingEvents = true;
            simpsons.Exited += Simpsons_Exited;

            SHARConsoleHook.ServerInterface sif = new SHARConsoleHook.ServerInterface();
            sif.Message += Sif_Message;

            string channelName = null;
            EasyHook.RemoteHooking.IpcCreateServer(ref channelName, System.Runtime.Remoting.WellKnownObjectMode.Singleton, sif);
            string injectionLibrary = Path.Combine(Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location), "SHARConsoleHook.dll");

            EasyHook.RemoteHooking.Inject(simpsons.Id, injectionLibrary, injectionLibrary, channelName);

            ClearLogs();
            CollectedCards = 0;
            ResetLookup();
            ResetTracker();

            SetStatus("Monitoring rewards...");
        }

        private void Simpsons_Exited(object sender, EventArgs e)
        {
            SetStatus("Simpsons exited. Waiting for Simpsons.exe...");
            HookSimpsons();
        }

        private void Sif_Message(string message)
        {
            if (string.IsNullOrWhiteSpace(message))
                return;

            if (message == "Loading rewards...")
                IsLoading = true;

            if (IsLoading)
                AddLog(message);

            if (message == "--- BEGIN SEED SPOILERS ---")
            {
                IsSeedSpoiler = true;
            }
            else if (IsSeedSpoiler)
            {
                if (message == "--- END SPOILERS ---")
                {
                    IsSeedSpoiler = false;
                    IsLoading = false;
                }
                else
                {
                    try
                    {
                        byte[] base64bytes = Convert.FromBase64String(message);
                        string base64dec = Encoding.UTF8.GetString(base64bytes);
                        if (base64dec.Contains("L1M1"))
                        {
                            ProcessSpoiler(base64dec);
                        }
                    }
                    catch
                    {}
                }
            }

            string[] parts = message.Split('|');
            switch (parts[0])
            {
                case "UNLOCK":
                    int Level;
                    int Mission;
                    if (parts.Length == 5 && int.TryParse(parts[2], out Level) && int.TryParse(parts[3], out Mission))
                    {
                        ProcessReward(Level, Mission, parts[1], parts[4]);
                    }
                    break;
                case "HINT":
                    if (parts.Length == 2)
                    {
                        ProcessHint(parts[1]);
                    }
                    break;
                case "CARD":
                    if (parts.Length == 3)
                    {
                        if (parts[1] == "Collected")
                        {
                            ProcessCard();
                        }
                    }
                    break;
            }
        }

        private void ProcessSpoiler(string Spoiler)
        {
            string[] lines = Spoiler.Split(new char[] { '\r', '\n' }, StringSplitOptions.RemoveEmptyEntries);
            bool restrictions = true;
            bool rewards = true;
            Regex r = new Regex("L([0-9])M([0-9]+)");
            foreach (string line in lines)
            {
                switch (line)
                {
                    case "RESTRICTIONS:":
                        restrictions = true;
                        rewards = false;
                        break;
                    case "REWARDS:":
                        restrictions = false;
                        rewards = true;
                        break;
                    default:
                        if (restrictions)
                        {
                            string[] parts = line.Split('|');
                            if (parts.Length == 2)
                            {
                                Restrictions[parts[0]] = parts[1];
                                Match m = r.Match(parts[1]);
                                int Level = int.Parse(m.Groups[1].Value);
                                int Mission = int.Parse(m.Groups[2].Value);
                                if (Mission > 11)
                                {
                                    TrackReward(Level, parts[0]);
                                }
                            }
                        }
                        else if (rewards)
                        {
                            string[] parts = line.Split('|');
                            if (parts.Length == 3)
                            {
                                Rewards[parts[2]] = parts[0].Replace("M8", "SR1").Replace("M9", "SR2").Replace("M10", "SR3").Replace("M11", "BM").Replace("M12", " NPC").Replace("M13", " Gil").Replace("M14", " Gil");
                                NameMap[parts[2]] = parts[1];
                            }
                        }
                        break;
                }
            }
            PopulateLookup();
        }

        private void ProcessReward(int Level, int Mission, string Type, string Reward)
        {
            AddLog($"Unlocked {Reward} ({Type}) for completing L{Level}M{Mission}");
            TrackReward(Level, NameMap[Reward]);
        }

        private void ProcessHint(string Hint)
        {
            AddLog($"Hint received! {Hint}");
        }

        private void ProcessCard()
        {
            CollectedCards++;
            LblCards.Text = "Collected Cards: " + CollectedCards;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            restrictionsTracker.Show();
            restrictionsTracker.Hide();
            SetStatus("Waiting for Simpsons.exe...");
            ResetLookup();
            HookSimpsons();
        }

        private void BtnLookup_Click(object sender, EventArgs e)
        {
            if (CBLookup.SelectedIndex == -1 || CBLookup.SelectedItem.ToString() == "Rewards Not Loaded")
                return;
            string Reward = CBLookup.SelectedItem.ToString();
            if (MessageBox.Show($"Are you sure you want to lookup the location of {Reward}?", "Are you sure?", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                if (Rewards.ContainsKey(Reward))
                {
                    MessageBox.Show($"{Reward} can be unlocked from: {Rewards[Reward]}");
                }
                else
                {
                    MessageBox.Show($"{Reward} is not a reward in this seed.");
                }
            }
        }

        private void BtnShowTracker_Click(object sender, EventArgs e)
        {
            restrictionsTracker.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            restrictionsTracker.Hide();
        }

        private void CBTrackerTopmost_CheckedChanged(object sender, EventArgs e)
        {
            restrictionsTracker.TopMost = CBTrackerTopmost.Checked;
        }
    }
}
