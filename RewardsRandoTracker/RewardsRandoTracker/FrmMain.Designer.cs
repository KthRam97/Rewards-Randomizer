
namespace RewardsRandoTracker
{
    partial class FrmMain
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmMain));
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.LblStatus = new System.Windows.Forms.ToolStripStatusLabel();
            this.LBLog = new System.Windows.Forms.ListBox();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.button2 = new System.Windows.Forms.Button();
            this.BtnShowTracker = new System.Windows.Forms.Button();
            this.BtnLookup = new System.Windows.Forms.Button();
            this.CBLookup = new System.Windows.Forms.ComboBox();
            this.LblLookup = new System.Windows.Forms.Label();
            this.CBTrackerTopmost = new System.Windows.Forms.CheckBox();
            this.statusStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.SuspendLayout();
            // 
            // statusStrip1
            // 
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.LblStatus});
            this.statusStrip1.Location = new System.Drawing.Point(0, 428);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(800, 22);
            this.statusStrip1.TabIndex = 0;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // LblStatus
            // 
            this.LblStatus.Name = "LblStatus";
            this.LblStatus.Size = new System.Drawing.Size(97, 17);
            this.LblStatus.Text = "Status: Loading...";
            // 
            // LBLog
            // 
            this.LBLog.Dock = System.Windows.Forms.DockStyle.Fill;
            this.LBLog.FormattingEnabled = true;
            this.LBLog.Location = new System.Drawing.Point(0, 0);
            this.LBLog.Name = "LBLog";
            this.LBLog.Size = new System.Drawing.Size(530, 428);
            this.LBLog.TabIndex = 1;
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.CBTrackerTopmost);
            this.splitContainer1.Panel1.Controls.Add(this.button2);
            this.splitContainer1.Panel1.Controls.Add(this.BtnShowTracker);
            this.splitContainer1.Panel1.Controls.Add(this.BtnLookup);
            this.splitContainer1.Panel1.Controls.Add(this.CBLookup);
            this.splitContainer1.Panel1.Controls.Add(this.LblLookup);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.LBLog);
            this.splitContainer1.Size = new System.Drawing.Size(800, 428);
            this.splitContainer1.SplitterDistance = 266;
            this.splitContainer1.TabIndex = 2;
            // 
            // button2
            // 
            this.button2.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.button2.Location = new System.Drawing.Point(16, 95);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(235, 23);
            this.button2.TabIndex = 4;
            this.button2.Text = "Hide Tracker";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // BtnShowTracker
            // 
            this.BtnShowTracker.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.BtnShowTracker.Location = new System.Drawing.Point(16, 66);
            this.BtnShowTracker.Name = "BtnShowTracker";
            this.BtnShowTracker.Size = new System.Drawing.Size(235, 23);
            this.BtnShowTracker.TabIndex = 3;
            this.BtnShowTracker.Text = "Show Tracker";
            this.BtnShowTracker.UseVisualStyleBackColor = true;
            this.BtnShowTracker.Click += new System.EventHandler(this.BtnShowTracker_Click);
            // 
            // BtnLookup
            // 
            this.BtnLookup.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.BtnLookup.Location = new System.Drawing.Point(16, 37);
            this.BtnLookup.Name = "BtnLookup";
            this.BtnLookup.Size = new System.Drawing.Size(235, 23);
            this.BtnLookup.TabIndex = 2;
            this.BtnLookup.Text = "Lookup Reward Location";
            this.BtnLookup.UseVisualStyleBackColor = true;
            this.BtnLookup.Click += new System.EventHandler(this.BtnLookup_Click);
            // 
            // CBLookup
            // 
            this.CBLookup.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.CBLookup.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.CBLookup.FormattingEnabled = true;
            this.CBLookup.Location = new System.Drawing.Point(105, 10);
            this.CBLookup.Name = "CBLookup";
            this.CBLookup.Size = new System.Drawing.Size(146, 21);
            this.CBLookup.TabIndex = 1;
            // 
            // LblLookup
            // 
            this.LblLookup.AutoSize = true;
            this.LblLookup.Location = new System.Drawing.Point(13, 13);
            this.LblLookup.Name = "LblLookup";
            this.LblLookup.Size = new System.Drawing.Size(86, 13);
            this.LblLookup.TabIndex = 0;
            this.LblLookup.Text = "Reward Lookup:";
            // 
            // CBTrackerTopmost
            // 
            this.CBTrackerTopmost.AutoSize = true;
            this.CBTrackerTopmost.Location = new System.Drawing.Point(16, 125);
            this.CBTrackerTopmost.Name = "CBTrackerTopmost";
            this.CBTrackerTopmost.Size = new System.Drawing.Size(168, 17);
            this.CBTrackerTopmost.TabIndex = 5;
            this.CBTrackerTopmost.Text = "Make tracker window topmost";
            this.CBTrackerTopmost.UseVisualStyleBackColor = true;
            this.CBTrackerTopmost.CheckedChanged += new System.EventHandler(this.CBTrackerTopmost_CheckedChanged);
            // 
            // FrmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.splitContainer1);
            this.Controls.Add(this.statusStrip1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FrmMain";
            this.Text = "Rewards Rando Tracker";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel1.PerformLayout();
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel LblStatus;
        private System.Windows.Forms.ListBox LBLog;
        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.ComboBox CBLookup;
        private System.Windows.Forms.Label LblLookup;
        private System.Windows.Forms.Button BtnLookup;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button BtnShowTracker;
        private System.Windows.Forms.CheckBox CBTrackerTopmost;
    }
}

