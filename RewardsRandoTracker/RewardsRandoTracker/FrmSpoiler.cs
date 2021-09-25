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
    public partial class FrmSpoiler : Form
    {
        public FrmSpoiler(string Spoiler)
        {
            InitializeComponent();
            TxtSpoiler.Text = Spoiler.Replace("\r\n", "\n").Replace("\n", "\r\n");
            TxtSpoiler.SelectionStart = 0;
            TxtSpoiler.SelectionLength = 0;
        }
    }
}
