using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RewardsRandoTracker
{
    public partial class FrmRestrictionsTracker : Form
    {
        public FrmRestrictionsTracker()
        {
            InitializeComponent();
        }

        private void FrmRestrictionsTracker_Load(object sender, EventArgs e)
        {
            PBL1.Image = Image.FromFile("Images/Levels/1.png");
            PBL2.Image = Image.FromFile("Images/Levels/2.png");
            PBL3.Image = Image.FromFile("Images/Levels/3.png");
            PBL4.Image = Image.FromFile("Images/Levels/4.png");
            PBL5.Image = Image.FromFile("Images/Levels/5.png");
            PBL6.Image = Image.FromFile("Images/Levels/6.png");
            PBL7.Image = Image.FromFile("Images/Levels/7.png");

            string[] rewardFiles = System.IO.Directory.GetFiles("Images/Rewards/", "*.png");
            for (var i = 0; i < rewardFiles.Length; i++)
            {
                string fileName = System.IO.Path.GetFileNameWithoutExtension(rewardFiles[i]);
                PictureBox pb = new PictureBox
                {
                    Name = fileName,
                    Image = Image.FromFile(rewardFiles[i]),
                    SizeMode = PictureBoxSizeMode.Zoom,
                    Dock = DockStyle.Left
                };
                PnlLocked.Controls.Add(pb);
                double ratio = pb.Height / (pb.Image.Height * 1.0f);
                pb.Width = (int)(pb.Image.Width * ratio);
            }
        }

        public void ResetTracker()
        {
            foreach (Panel pnl in new Panel[]{ PnlUnlocked1, PnlUnlocked2, PnlUnlocked3, PnlUnlocked4, PnlUnlocked5, PnlUnlocked6, PnlUnlocked7})
            {
                for (var i = pnl.Controls.Count - 1; i >= 0; i--)
                {
                    PictureBox pb = (PictureBox)pnl.Controls[i];
                    pnl.Controls.Remove(pb);
                    PnlLocked.Controls.Add(pb);
                }
            }
        }

        public void RewardUnlocked(int Level, string Reward)
        {
            PictureBox pb = null;
            for (var i = 0; i < PnlLocked.Controls.Count; i++)
            {
                if (PnlLocked.Controls[i].Name == Reward)
                {
                    pb = (PictureBox)PnlLocked.Controls[i];
                    break;
                }
            }
            if (pb != null)
            {
                PnlLocked.Controls.Remove(pb);
                switch(Level)
                {
                    case 1:
                        PnlUnlocked1.Controls.Add(pb);
                        break;
                    case 2:
                        PnlUnlocked2.Controls.Add(pb);
                        break;
                    case 3:
                        PnlUnlocked3.Controls.Add(pb);
                        break;
                    case 4:
                        PnlUnlocked4.Controls.Add(pb);
                        break;
                    case 5:
                        PnlUnlocked5.Controls.Add(pb);
                        break;
                    case 6:
                        PnlUnlocked6.Controls.Add(pb);
                        break;
                    case 7:
                        PnlUnlocked7.Controls.Add(pb);
                        break;
                }
            }
        }

        private void Pnl_SizeChanged(object sender, EventArgs e)
        {
            Control ctrl = (Control)sender;
            foreach(PictureBox pb in ctrl.Controls.OfType<PictureBox>())
            {
                double ratio = pb.Height / (pb.Image.Height * 1.0f);
                pb.Width = (int)(pb.Image.Width * ratio);
            }
        }

        private void FrmRestrictionsTracker_FormClosing(object sender, FormClosingEventArgs e)
        {
            e.Cancel = true;
            Hide();
        }
    }
}
