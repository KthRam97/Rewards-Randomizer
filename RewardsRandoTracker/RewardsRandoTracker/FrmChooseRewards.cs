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
        bool loaded = false;

        public FrmChooseRewards()
        {
            InitializeComponent();
        }

        private class Item
        {
            public string InternalName { get; set; }
            public string DisplayName { get; set; }
            public Item(string InternalName, string DisplayName = "")
            {
                this.InternalName = InternalName;
                this.DisplayName = DisplayName;
            }
            public override string ToString()
            {
                return string.IsNullOrWhiteSpace(DisplayName) ? InternalName : DisplayName;
            }
        }

        private void FrmChooseRewards_Load(object sender, EventArgs e)
        {
            List<Item> items = new List<Item>();
            foreach (KeyValuePair<string, PictureBox> kvp in FrmMain.RestrictionsTracker.RewardPictureBoxes)
            {
                if (FrmMain.NameMap2.ContainsKey(kvp.Key))
                    items.Add(new Item(kvp.Key, FrmMain.NameMap2[kvp.Key]));
                else
                    items.Add(new Item(kvp.Key));
            }
            foreach (Item item in items.OrderBy(x => x.ToString()))
            {
                CLBRewards.Items.Add(item, FrmMain.S.TrackerRewards.Contains(item.InternalName));
            }
            loaded = true;
        }

        private void CLBRewards_ItemCheck(object sender, ItemCheckEventArgs e)
        {
            if (!loaded)
                return;
            string reward = ((Item)CLBRewards.Items[e.Index]).InternalName;
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
