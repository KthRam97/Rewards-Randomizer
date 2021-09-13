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
        private static bool Tracking = false;
        private static string LogFile;

        private readonly FrmRestrictionsTracker restrictionsTracker = new FrmRestrictionsTracker();
        private bool IsLoading = true;
        private bool IsSeedSpoiler = false;
        private string Spoiler;
        public static int CollectedCards = 0;

        public readonly Dictionary<string, string> Rewards = new Dictionary<string, string>();
        public readonly Dictionary<string, string> Restrictions = new Dictionary<string, string>();
        public readonly Dictionary<string, string> NameMap = new Dictionary<string, string>();
        public readonly Dictionary<string, string> NameMap2 = new Dictionary<string, string>();

        public FrmMain()
        {
            InitializeComponent();
        }

        private void SetEnabled(Control ctrl, bool enabled)
        {
            if (ctrl.InvokeRequired)
            {
                Action a = delegate { SetEnabled(ctrl, enabled); };
                ctrl.Invoke(a);
            }
            else
            {
                ctrl.Enabled = enabled;
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
                if (CBTimestamps.Checked)
                {
                    text = DateTime.Now.ToString("[yyyy-MM-dd HH:mm:ss.fff] ") + text;
                }
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

        private void TrackHint(int Level, string Restriction)
        {
            if (restrictionsTracker.InvokeRequired)
            {
                Action a = delegate { TrackHint(Level, Restriction); };
                restrictionsTracker.Invoke(a);
            }
            else
            {
                restrictionsTracker.HintUnlocked(Level, Restriction);
            }
        }

        private void TrackCard()
        {
            if (restrictionsTracker.InvokeRequired)
            {
                Action a = delegate { TrackCard(); };
                restrictionsTracker.Invoke(a);
            }
            else
            {
                restrictionsTracker.CardCollected();
            }
        }

        private long lastSize = 0;
        private async void TrackFile()
        {
            SetEnabled(BtnStart, false);
            SetEnabled(BtnStop, true);

            lastSize = 0;
            while(Tracking && File.Exists(LogFile))
            {
                try
                {
                    FileStream fs = new FileStream(LogFile, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
                    if (fs.Length != lastSize)
                    {
                        long length = fs.Length - lastSize;
                        lastSize = fs.Length;
                        if (length < 0)
                        {
                            length = fs.Length;
                        }
                        using (StreamReader sr = new StreamReader(fs))
                        {
                            fs.Seek(length * -1, SeekOrigin.End);
                            byte[] bytes = new byte[length];
                            fs.Read(bytes, 0, (int)length);
                            string s = Encoding.UTF8.GetString(bytes);
                            foreach (string line in s.Split(new char[] { '\r', '\n' }, StringSplitOptions.RemoveEmptyEntries))
                            {
                                Sif_Message(line);
                            }
                        }
                    }
                    fs.Close();
                    fs.Dispose();
                }
                catch (Exception ex)
                {
                    AddLog("ERROR READING LOG FILE:");
                    foreach (string line in ex.ToString().Split(new char[] { '\r', '\n' }, StringSplitOptions.RemoveEmptyEntries))
                    {
                        AddLog(line);
                    }
                }

                await Task.Delay(1000);
            }

            SetEnabled(BtnStop, false);
            SetEnabled(BtnStart, true);
        }

        private static readonly Regex ConsoleRegex = new Regex(@"^(\[[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}-[0-9]{2}-[0-9]{2}\.[0-9]{3}\] )?(\[(MOD|GAME|HACK)\] )?(.*?)$");
        private static readonly Regex InitialisingRegex = new Regex(@"Rewards Randomiser .*?: Initialising\.\.\.");
        private void Sif_Message(string message)
        {
            if (ConsoleRegex.IsMatch(message))
            {
                Match m = ConsoleRegex.Match(message);
                if (m.Groups[3].Success && m.Groups[3].Length > 0 && m.Groups[3].Value != "MOD")
                    return;
                message = ConsoleRegex.Match(message).Groups[4].Value;
            }
                

            if (string.IsNullOrWhiteSpace(message))
                return;

            if (InitialisingRegex.IsMatch(message))
            {
                ClearLogs();
                CollectedCards = 0;
                ResetLookup();
                ResetTracker();
                IsLoading = true;
                Spoiler = string.Empty;
            }

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
                        if (base64dec.Contains("REWARDS:"))
                        {
                            Spoiler = base64dec;
                            ProcessSpoiler(Spoiler);
                        }
                    }
                    catch (Exception ex)
                    {
                        AddLog("ERROR READING SPOILER:");
                        foreach (string line in ex.ToString().Split(new char[] { '\r', '\n' }, StringSplitOptions.RemoveEmptyEntries))
                        {
                            AddLog(line);
                        }
                    }
                }
            }

            string[] parts = message.Split('|');
            switch (parts[0])
            {
                case "UNLOCK":
                    int UnlockLevel;
                    int UnlockMission;
                    if (parts.Length == 5 && int.TryParse(parts[2], out UnlockLevel) && int.TryParse(parts[3], out UnlockMission))
                    {
                        ProcessReward(UnlockLevel, UnlockMission, parts[1], parts[4]);
                    }
                    break;
                case "HINT":
                    int HintLevel;
                    if (parts.Length == 3 && int.TryParse(parts[1], out HintLevel))
                    {
                        ProcessHint(HintLevel, parts[2]);
                    }
                    break;
                case "CARD":
                    if (parts.Length == 3)
                    {
                        int CardCount;
                        if (parts[1] == "Collected" && int.TryParse(parts[2], out CardCount))
                        {
                            ProcessCard(CardCount);
                        }
                    }
                    break;
            }
        }



        private void ProcessSpoiler(string Spoiler)
        {
            string[] lines = Spoiler.Split(new char[] { '\r', '\n' }, StringSplitOptions.RemoveEmptyEntries);
            bool settings = false;
            bool restrictions = false;
            bool rewards = false;
            Regex r = new Regex("L([0-9])M([0-9]+)");
            List<int> restrictionLevels = new List<int>();
            List<string> restrictionNames = new List<string>();
            foreach (string line in lines)
            {
                switch (line)
                {
                    case "RANDOM SETTINGS:":
                        settings = true;
                        restrictions = false;
                        rewards = false;
                        break;
                    case "RESTRICTIONS:":
                        settings = false;
                        restrictions = true;
                        rewards = false;
                        restrictionLevels.Clear();
                        restrictionNames.Clear();
                        break;
                    case "REWARDS:":
                        settings = false;
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
                                if (Mission > 11 || (Level == 7 && Mission == 7))
                                {
                                    restrictionLevels.Add(Level);
                                    restrictionNames.Add(parts[0]);
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
                                NameMap2[parts[1]] = parts[2];
                            }
                        }
                        break;
                }
            }
            for (int i = 0; i < restrictionLevels.Count; i++)
            {
                TrackReward(restrictionLevels[i], restrictionNames[i]);
            }
            PopulateLookup();
        }

        private void ProcessReward(int Level, int Mission, string Type, string Reward)
        {
            AddLog($"Unlocked {Reward} ({Type}) for completing L{Level}M{Mission}!");
            TrackReward(Level, NameMap[Reward]);
        }

        private void ProcessHint(int Level, string Restriction)
        {
            AddLog($"Hint received! You can find {NameMap2[Restriction]} in level {Level}!");
            TrackHint(Level, Restriction);
        }

        private void ProcessCard(int CardCount)
        {
            CollectedCards++;
            AddLog($"Card collected! {CardCount} towards next hint (depending on mode).");
            LblCards.Text = "Collected Cards: " + CollectedCards;
            TrackCard();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            Text = Text + " v" + Program.Version;
            restrictionsTracker.Show();
            restrictionsTracker.Hide();
            ResetLookup();
        }

        private void BtnLookup_Click(object sender, EventArgs e)
        {
            if (CBLookup.SelectedIndex == -1 || CBLookup.SelectedItem.ToString() == "Rewards Not Loaded")
                return;
            string Reward = CBLookup.SelectedItem.ToString();
            if (MessageBox.Show($"Are you sure you want to lookup the location of {Reward}?", "Are you sure?", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                AddLog($"LOOKED UP REWARD: {Reward}");
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

        private void BtnShowSpoiler_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(Spoiler))
                return;
            if (MessageBox.Show("Are you sure you want to view the spoiler?", "Are you sure?", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                AddLog("SPOILER OPENED!");
                using (FrmSpoiler frm = new FrmSpoiler(Spoiler))
                {
                    frm.ShowDialog();
                }
            }
        }

        private void BtnToggleTracker_Click(object sender, EventArgs e)
        {
            restrictionsTracker.Visible = !restrictionsTracker.Visible;
        }

        private void CBTrackerTopmost_CheckedChanged(object sender, EventArgs e)
        {
            restrictionsTracker.TopMost = CBTrackerTopmost.Checked;
        }

        private void BtnStart_Click(object sender, EventArgs e)
        {
            using (OpenFileDialog openFileDialog = new OpenFileDialog()
            {
                InitialDirectory = Program.MLDocumentsDirectory,
                Filter = "Text Files (*.txt)|*.txt|All Files (*.*)|*.*",
                Multiselect = false
            })
            {
                if (openFileDialog.ShowDialog() == DialogResult.OK)
                {
                    LogFile = openFileDialog.FileName;
                    Tracking = true;
                    TrackFile();
                }
            }
        }

        private void BtnStop_Click(object sender, EventArgs e)
        {
            Tracking = false;
            LogFile = null;
        }

        private void BtnExport_Click(object sender, EventArgs e)
        {
            using (SaveFileDialog saveFileDialog = new SaveFileDialog()
            {
                Filter = "Text Files (*.txt)|*.txt|All Files (*.*)|*.*"
            })
            {
                try
                {
                    if (saveFileDialog.ShowDialog() == DialogResult.OK)
                    {
                        File.WriteAllLines(saveFileDialog.FileName, LBLog.Items.Cast<string>(), Encoding.UTF8);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("There was an error saving the log file: " + ex.Message, "Error saving", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
            }
        }

        private void LBLog_KeyDown(object sender, KeyEventArgs e)
        {
            if (LBLog.SelectedIndex >= 0 && e.Control && e.KeyCode == Keys.C)
            {
                Clipboard.SetText(LBLog.SelectedItem.ToString());
            }
        }
    }
}
