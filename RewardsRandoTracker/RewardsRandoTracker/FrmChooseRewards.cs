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
    public partial class FrmChooseRewards : Form
    {
        public FrmChooseRewards()
        {
            InitializeComponent();
        }

        private void FrmChooseRewards_Load(object sender, EventArgs e)
        {
            foreach (KeyValuePair<string, PictureBox> kvp in FrmMain.RestrictionsTracker.RewardPictureBoxes)
            {
                CLBRewards.Items.Add(FrmMain.NameMap2.ContainsKey(kvp.Key) ? FrmMain.NameMap2[kvp.Key] : kvp.Key, FrmMain.S.TrackerRewards.Contains(kvp.Key));
            }
        }

        private void CLBRewards_ItemCheck(object sender, ItemCheckEventArgs e)
        {
            string reward = CLBRewards.Items[e.Index].ToString();
            bool check = e.NewValue == CheckState.Checked;
            FrmMain.RestrictionsTracker.SetRewardVisible(reward, check);
            if (!check)
            {
                FrmMain.S.TrackerRewards.Remove(reward);
            }
            else if (!FrmMain.S.TrackerRewards.Contains(reward))
            {
                FrmMain.S.TrackerRewards.Add(reward);
            }
        }
    }
}
