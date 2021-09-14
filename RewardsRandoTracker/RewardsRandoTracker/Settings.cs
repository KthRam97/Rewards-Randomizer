using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RewardsRandoTracker
{
    public class Settings
    {
        private static readonly string SettingsFile = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "RewardsRandoTracker", "Settings.json");

        public Point Location { get; set; }
        public Size Size { get; set; }
        public FormWindowState WindowState { get; set; }
        public bool IncludeTimestamps { get; set; }

        public Point TrackerLocation { get; set; }
        public Size TrackerSize { get; set; }
        public bool TrackerTopmost { get; set; }

        public static Settings Load(FrmMain frm)
        {
            try
            {
                if (File.Exists(SettingsFile))
                {
                    Settings loadedSettings = Newtonsoft.Json.JsonConvert.DeserializeObject<Settings>(File.ReadAllText(SettingsFile));

                    if (loadedSettings.Location.X == -32000 || loadedSettings.Location.Y == -32000)
                        loadedSettings.Location = frm.Location;

                    if (loadedSettings.TrackerLocation.X == -32000 || loadedSettings.TrackerLocation.Y == -32000)
                        loadedSettings.TrackerLocation = frm.RestrictionsTracker.Location;

                    return loadedSettings;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error loading settings file:" + Environment.NewLine + ex.ToString(), "Error loading settings", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            Settings newSettings = new Settings()
            {
                Location = frm.Location,
                Size = frm.Size,
                WindowState = frm.WindowState,
                IncludeTimestamps = frm.CBTimestamps.Checked,

                TrackerLocation = frm.RestrictionsTracker.Location,
                TrackerSize = frm.RestrictionsTracker.Size,
                TrackerTopmost = frm.CBTrackerTopmost.Checked,
            };
            return newSettings;
        }

        public void Save()
        {
            try
            {
                string parentDir = Path.GetDirectoryName(SettingsFile);
                if (!Directory.Exists(parentDir))
                    Directory.CreateDirectory(parentDir);
                File.WriteAllText(SettingsFile, Newtonsoft.Json.JsonConvert.SerializeObject(this));
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error saving settings file:" + Environment.NewLine + ex.ToString(), "Error saving settings", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
