
namespace RewardsRandoTracker
{
    partial class FrmSpoiler
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmSpoiler));
            this.TxtSpoiler = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // TxtSpoiler
            // 
            this.TxtSpoiler.BackColor = System.Drawing.SystemColors.Window;
            this.TxtSpoiler.Dock = System.Windows.Forms.DockStyle.Fill;
            this.TxtSpoiler.Location = new System.Drawing.Point(0, 0);
            this.TxtSpoiler.Multiline = true;
            this.TxtSpoiler.Name = "TxtSpoiler";
            this.TxtSpoiler.ReadOnly = true;
            this.TxtSpoiler.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.TxtSpoiler.Size = new System.Drawing.Size(350, 450);
            this.TxtSpoiler.TabIndex = 0;
            // 
            // FrmSpoiler
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(350, 450);
            this.Controls.Add(this.TxtSpoiler);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FrmSpoiler";
            this.Text = "Rewards Rando Tracker Spoiler";
            this.TopMost = true;
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox TxtSpoiler;
    }
}