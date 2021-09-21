using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
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
        private static readonly string OverlaysImageRoot = Path.Combine(ImageRoot, "Overlays");
        private static readonly Image DollarOverlay = Image.FromFile(Path.Combine(OverlaysImageRoot, "dollar.png"));

        public readonly Dictionary<string, PictureBox> RewardPictureBoxes = new Dictionary<string, PictureBox>();
        private readonly Dictionary<string, Image> RewardImages = new Dictionary<string, Image>();
        private readonly Dictionary<string, Image> RewardImagesPurchasable = new Dictionary<string, Image>();
        private readonly Dictionary<string, Image> RewardImagesGreyscale = new Dictionary<string, Image>();
        private readonly Dictionary<int, Panel> LevelPanels = new Dictionary<int, Panel>();

        public FrmRestrictionsTracker()
        {
            InitializeComponent();
        }

        //Stolen from: https://stackoverflow.com/questions/2265910/convert-an-image-to-grayscale
        private static Bitmap MakeGrayscale3(Bitmap original)
        {
            Bitmap newBitmap = new Bitmap(original.Width, original.Height);

            using (Graphics g = Graphics.FromImage(newBitmap))
            {
                ColorMatrix colorMatrix = new ColorMatrix(
                    new float[][]
                    {
                        new float[] {.3f, .3f, .3f, 0, 0},
                        new float[] {.59f, .59f, .59f, 0, 0},
                        new float[] {.11f, .11f, .11f, 0, 0},
                        new float[] {0, 0, 0, 1, 0},
                        new float[] {0, 0, 0, 0, 1}
                    }
                );

                using (ImageAttributes attributes = new ImageAttributes())
                {
                    attributes.SetColorMatrix(colorMatrix);
                    g.DrawImage(original, new Rectangle(0, 0, original.Width, original.Height), 0, 0, original.Width, original.Height, GraphicsUnit.Pixel, attributes);
                }
            }
            return newBitmap;
        }

        private static Bitmap AddDollar(Bitmap original)
        {
            Bitmap newBitmap = new Bitmap(original.Width, original.Height);

            using (Graphics g = Graphics.FromImage(newBitmap))
            {
                g.SmoothingMode = SmoothingMode.AntiAlias;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.DrawImage(original, new Rectangle(0, 0, original.Width, original.Height));
                int height = original.Height;
                float ratio = DollarOverlay.Height / (height * 1.0f);
                int width = (int)(DollarOverlay.Width / ratio);
                g.DrawImage(DollarOverlay, new Rectangle(original.Width / 2 - width / 2, original.Height / 2 - height/ 2, width, height));
            }

            return newBitmap;
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

            LevelPanels[1] = PnlUnlocked1;
            LevelPanels[2] = PnlUnlocked2;
            LevelPanels[3] = PnlUnlocked3;
            LevelPanels[4] = PnlUnlocked4;
            LevelPanels[5] = PnlUnlocked5;
            LevelPanels[6] = PnlUnlocked6;
            LevelPanels[7] = PnlUnlocked7;

            string[] rewardFiles = Directory.GetFiles(RewardsImageRoot, "*.png");
            for (var i = 0; i < rewardFiles.Length; i++)
            {
                string fileName = Path.GetFileNameWithoutExtension(rewardFiles[i]);
                RewardImages[fileName] = Image.FromFile(rewardFiles[i]);
                RewardImagesPurchasable[fileName] = AddDollar(new Bitmap(RewardImages[fileName]));
                RewardImagesGreyscale[fileName] = MakeGrayscale3(new Bitmap(RewardImages[fileName]));
                PictureBox pb = new PictureBox
                {
                    Name = fileName,
                    Image = RewardImagesGreyscale[fileName],
                    SizeMode = PictureBoxSizeMode.Zoom,
                    Dock = DockStyle.Left,
                    Visible = false,
                    BackgroundImageLayout = ImageLayout.Zoom
                };
                pb.SizeChanged += PB_SizeChanged;
                RewardPictureBoxes[fileName] = pb;
                PnlLocked.Controls.Add(pb);
                double ratio = pb.Height / (pb.Image.Height * 1.0f);
                pb.Width = (int)(pb.Image.Width * ratio);
            }
        }

        public void ResetTracker()
        {
            foreach(KeyValuePair<string, PictureBox> kvp in RewardPictureBoxes)
            {
                kvp.Value.BackColor = Color.Transparent;
                kvp.Value.Image = RewardImagesGreyscale[kvp.Key];
                kvp.Value.Parent = PnlLocked;
                kvp.Value.Visible = FrmMain.S.TrackerRewards.Contains(kvp.Key);
            }
            PBCards.Refresh();
        }

        public void SetRewardVisible(string Reward, bool Visible)
        {
            if (!RewardPictureBoxes.ContainsKey(Reward))
                return;
            RewardPictureBoxes[Reward].Visible = Visible;
        }

        public void RewardUnlocked(int Level, string Reward, bool Purchasable = false)
        {
            if (!RewardPictureBoxes.ContainsKey(Reward))
                return;
            PictureBox pb = RewardPictureBoxes[Reward];
            if (Purchasable)
                pb.Image = RewardImagesPurchasable[Reward];
            else
                pb.Image = RewardImages[Reward];
            pb.Parent = LevelPanels[Level];
            LevelPanels[Level].Controls.SetChildIndex(pb, 0);
        }

        public void HintUnlocked(int Level, string Reward)
        {
            if (!RewardPictureBoxes.ContainsKey(Reward))
                return;
            PictureBox pb = RewardPictureBoxes[Reward];
            if (pb.Parent != LevelPanels[Level])
            {
                pb.Parent = LevelPanels[Level];
                LevelPanels[Level].Controls.SetChildIndex(pb, 0);
            }
        }

        public void CardCollected()
        {
            PBCards.Refresh();
        }

        private void PB_SizeChanged(object sender, EventArgs e)
        {
            PictureBox pb = (PictureBox)sender;
            double ratio = pb.Height / (pb.Image.Height * 1.0f);
            pb.Width = (int)(pb.Image.Width * ratio);
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

        private void FrmRestrictionsTracker_LocationChanged(object sender, EventArgs e)
        {
            if (FrmMain.S != null && WindowState == FormWindowState.Normal)
            {
                FrmMain.S.TrackerLocation = Location;
            }
        }

        private void FrmRestrictionsTracker_SizeChanged(object sender, EventArgs e)
        {
            if (FrmMain.S != null)
            {
                if (WindowState == FormWindowState.Normal)
                    FrmMain.S.TrackerSize = Size;
            }
        }
    }
}
