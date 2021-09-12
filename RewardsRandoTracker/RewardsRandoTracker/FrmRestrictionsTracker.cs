using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RewardsRandoTracker
{
    public partial class FrmRestrictionsTracker : Form
    {
        private static readonly string ImageRoot = Path.Combine(Program.ExeDirectory, "Images");
        private static readonly string CardImageRoot = Path.Combine(ImageRoot, "Cards");
        private static readonly string LevelImageRoot = Path.Combine(ImageRoot, "Levels");
        private static readonly string RewardsImageRoot = Path.Combine(ImageRoot, "Rewards");

        public FrmRestrictionsTracker()
        {
            InitializeComponent();
        }

        private void FrmRestrictionsTracker_Load(object sender, EventArgs e)
        {
            PBL1.Image = Image.FromFile(Path.Combine(LevelImageRoot, "1.png"));
            PBL2.Image = Image.FromFile(Path.Combine(LevelImageRoot, "2.png"));
            PBL3.Image = Image.FromFile(Path.Combine(LevelImageRoot, "3.png"));
            PBL4.Image = Image.FromFile(Path.Combine(LevelImageRoot, "4.png"));
            PBL5.Image = Image.FromFile(Path.Combine(LevelImageRoot, "5.png"));
            PBL6.Image = Image.FromFile(Path.Combine(LevelImageRoot, "6.png"));
            PBL7.Image = Image.FromFile(Path.Combine(LevelImageRoot, "7.png"));
            PBCards.Image = Image.FromFile(Path.Combine(CardImageRoot, "Base.png"));

            string[] rewardFiles = System.IO.Directory.GetFiles(RewardsImageRoot, "*.png");
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
                        PnlUnlocked1.Controls.SetChildIndex(pb, 0);
                        break;
                    case 2:
                        PnlUnlocked2.Controls.Add(pb);
                        PnlUnlocked2.Controls.SetChildIndex(pb, 0);
                        break;
                    case 3:
                        PnlUnlocked3.Controls.Add(pb);
                        PnlUnlocked3.Controls.SetChildIndex(pb, 0);
                        break;
                    case 4:
                        PnlUnlocked4.Controls.Add(pb);
                        PnlUnlocked4.Controls.SetChildIndex(pb, 0);
                        break;
                    case 5:
                        PnlUnlocked5.Controls.Add(pb);
                        PnlUnlocked5.Controls.SetChildIndex(pb, 0);
                        break;
                    case 6:
                        PnlUnlocked6.Controls.Add(pb);
                        PnlUnlocked6.Controls.SetChildIndex(pb, 0);
                        break;
                    case 7:
                        PnlUnlocked7.Controls.Add(pb);
                        PnlUnlocked7.Controls.SetChildIndex(pb, 0);
                        break;
                }
            }
        }

        public void HintUnlocked(string Hint)
        {

        }

        public void CardCollected()
        {
            PBCards.Refresh();
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

        private void PBCards_Paint(object sender, PaintEventArgs e)
        {
            e.Graphics.SmoothingMode = SmoothingMode.AntiAlias;
            e.Graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
            GraphicsPath p = new GraphicsPath();
            p.AddString(FrmMain.CollectedCards.ToString(), FontFamily.GenericSansSerif, (int)FontStyle.Bold, e.Graphics.DpiY * (PBCards.Height / 4) / 72, new Point(0, 0), new StringFormat());
            using (Pen pen = new Pen(Brushes.Black, 3))
            {
                e.Graphics.DrawPath(pen, p);
                e.Graphics.FillPath(Brushes.White, p);
            }
        }
    }
}
