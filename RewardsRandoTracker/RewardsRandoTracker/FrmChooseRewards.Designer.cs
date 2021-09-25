
namespace RewardsRandoTracker
{
    partial class FrmChooseRewards
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmChooseRewards));
            this.CLBRewards = new System.Windows.Forms.CheckedListBox();
            this.SuspendLayout();
            // 
            // CLBRewards
            // 
            this.CLBRewards.Dock = System.Windows.Forms.DockStyle.Fill;
            this.CLBRewards.FormattingEnabled = true;
            this.CLBRewards.Location = new System.Drawing.Point(0, 0);
            this.CLBRewards.Name = "CLBRewards";
            this.CLBRewards.Size = new System.Drawing.Size(282, 450);
            this.CLBRewards.TabIndex = 0;
            this.CLBRewards.ItemCheck += new System.Windows.Forms.ItemCheckEventHandler(this.CLBRewards_ItemCheck);
            // 
            // FrmChooseRewards
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(282, 450);
            this.Controls.Add(this.CLBRewards);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FrmChooseRewards";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Rewards Rando Tracker - Choose Rewards";
            this.Load += new System.EventHandler(this.FrmChooseRewards_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.CheckedListBox CLBRewards;
    }
}