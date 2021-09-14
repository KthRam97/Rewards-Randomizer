
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
            this.LBLog = new System.Windows.Forms.ListBox();
            this.LblInfo = new System.Windows.Forms.Label();
            this.CBTimestamps = new System.Windows.Forms.CheckBox();
            this.BtnExport = new System.Windows.Forms.Button();
            this.BtnStop = new System.Windows.Forms.Button();
            this.BtnStart = new System.Windows.Forms.Button();
            this.LblCards = new System.Windows.Forms.Label();
            this.CBTrackerTopmost = new System.Windows.Forms.CheckBox();
            this.BtnToggleTracker = new System.Windows.Forms.Button();
            this.BtnShowSpoiler = new System.Windows.Forms.Button();
            this.BtnLookup = new System.Windows.Forms.Button();
            this.CBLookup = new System.Windows.Forms.ComboBox();
            this.LblLookup = new System.Windows.Forms.Label();
            this.PnlLayout = new System.Windows.Forms.TableLayoutPanel();
            this.PnlButtons = new System.Windows.Forms.Panel();
            this.PnlLog = new System.Windows.Forms.Panel();
            this.PnlLayout.SuspendLayout();
            this.PnlButtons.SuspendLayout();
            this.PnlLog.SuspendLayout();
            this.SuspendLayout();
            // 
            // LBLog
            // 
            this.LBLog.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.LBLog.Dock = System.Windows.Forms.DockStyle.Fill;
            this.LBLog.FormattingEnabled = true;
            this.LBLog.Location = new System.Drawing.Point(0, 0);
            this.LBLog.Name = "LBLog";
            this.LBLog.Size = new System.Drawing.Size(525, 471);
            this.LBLog.TabIndex = 1;
            this.LBLog.KeyDown += new System.Windows.Forms.KeyEventHandler(this.LBLog_KeyDown);
            // 
            // LblInfo
            // 
            this.LblInfo.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.LblInfo.ForeColor = System.Drawing.Color.Red;
            this.LblInfo.Location = new System.Drawing.Point(13, 272);
            this.LblInfo.Name = "LblInfo";
            this.LblInfo.Size = new System.Drawing.Size(238, 200);
            this.LblInfo.TabIndex = 11;
            this.LblInfo.Text = resources.GetString("LblInfo.Text");
            // 
            // CBTimestamps
            // 
            this.CBTimestamps.AutoSize = true;
            this.CBTimestamps.Location = new System.Drawing.Point(16, 237);
            this.CBTimestamps.Name = "CBTimestamps";
            this.CBTimestamps.Size = new System.Drawing.Size(129, 17);
            this.CBTimestamps.TabIndex = 10;
            this.CBTimestamps.Text = "Add timestamps to log";
            this.CBTimestamps.UseVisualStyleBackColor = true;
            // 
            // BtnExport
            // 
            this.BtnExport.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.BtnExport.Location = new System.Drawing.Point(16, 70);
            this.BtnExport.Name = "BtnExport";
            this.BtnExport.Size = new System.Drawing.Size(235, 23);
            this.BtnExport.TabIndex = 9;
            this.BtnExport.Text = "Export Tracker Log";
            this.BtnExport.UseVisualStyleBackColor = true;
            this.BtnExport.Click += new System.EventHandler(this.BtnExport_Click);
            // 
            // BtnStop
            // 
            this.BtnStop.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.BtnStop.Enabled = false;
            this.BtnStop.Location = new System.Drawing.Point(16, 41);
            this.BtnStop.Name = "BtnStop";
            this.BtnStop.Size = new System.Drawing.Size(235, 23);
            this.BtnStop.TabIndex = 8;
            this.BtnStop.Text = "Stop Tracking Log File";
            this.BtnStop.UseVisualStyleBackColor = true;
            this.BtnStop.Click += new System.EventHandler(this.BtnStop_Click);
            // 
            // BtnStart
            // 
            this.BtnStart.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.BtnStart.Location = new System.Drawing.Point(16, 12);
            this.BtnStart.Name = "BtnStart";
            this.BtnStart.Size = new System.Drawing.Size(235, 23);
            this.BtnStart.TabIndex = 7;
            this.BtnStart.Text = "Start Tracking Log File";
            this.BtnStart.UseVisualStyleBackColor = true;
            this.BtnStart.Click += new System.EventHandler(this.BtnStart_Click);
            // 
            // LblCards
            // 
            this.LblCards.AutoSize = true;
            this.LblCards.Location = new System.Drawing.Point(13, 257);
            this.LblCards.Name = "LblCards";
            this.LblCards.Size = new System.Drawing.Size(93, 13);
            this.LblCards.TabIndex = 6;
            this.LblCards.Text = "Collected Cards: 0";
            // 
            // CBTrackerTopmost
            // 
            this.CBTrackerTopmost.AutoSize = true;
            this.CBTrackerTopmost.Location = new System.Drawing.Point(16, 214);
            this.CBTrackerTopmost.Name = "CBTrackerTopmost";
            this.CBTrackerTopmost.Size = new System.Drawing.Size(168, 17);
            this.CBTrackerTopmost.TabIndex = 5;
            this.CBTrackerTopmost.Text = "Make tracker window topmost";
            this.CBTrackerTopmost.UseVisualStyleBackColor = true;
            this.CBTrackerTopmost.CheckedChanged += new System.EventHandler(this.CBTrackerTopmost_CheckedChanged);
            // 
            // BtnToggleTracker
            // 
            this.BtnToggleTracker.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.BtnToggleTracker.Location = new System.Drawing.Point(16, 184);
            this.BtnToggleTracker.Name = "BtnToggleTracker";
            this.BtnToggleTracker.Size = new System.Drawing.Size(235, 23);
            this.BtnToggleTracker.TabIndex = 4;
            this.BtnToggleTracker.Text = "Toggle Restrictions Tracker";
            this.BtnToggleTracker.UseVisualStyleBackColor = true;
            this.BtnToggleTracker.Click += new System.EventHandler(this.BtnToggleTracker_Click);
            // 
            // BtnShowSpoiler
            // 
            this.BtnShowSpoiler.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.BtnShowSpoiler.Location = new System.Drawing.Point(16, 155);
            this.BtnShowSpoiler.Name = "BtnShowSpoiler";
            this.BtnShowSpoiler.Size = new System.Drawing.Size(235, 23);
            this.BtnShowSpoiler.TabIndex = 3;
            this.BtnShowSpoiler.Text = "View Spoiler Log";
            this.BtnShowSpoiler.UseVisualStyleBackColor = true;
            this.BtnShowSpoiler.Click += new System.EventHandler(this.BtnShowSpoiler_Click);
            // 
            // BtnLookup
            // 
            this.BtnLookup.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.BtnLookup.Location = new System.Drawing.Point(16, 126);
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
            this.CBLookup.Location = new System.Drawing.Point(105, 99);
            this.CBLookup.Name = "CBLookup";
            this.CBLookup.Size = new System.Drawing.Size(146, 21);
            this.CBLookup.TabIndex = 1;
            // 
            // LblLookup
            // 
            this.LblLookup.AutoSize = true;
            this.LblLookup.Location = new System.Drawing.Point(13, 102);
            this.LblLookup.Name = "LblLookup";
            this.LblLookup.Size = new System.Drawing.Size(86, 13);
            this.LblLookup.TabIndex = 0;
            this.LblLookup.Text = "Reward Lookup:";
            // 
            // PnlLayout
            // 
            this.PnlLayout.ColumnCount = 2;
            this.PnlLayout.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 265F));
            this.PnlLayout.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle());
            this.PnlLayout.Controls.Add(this.PnlButtons, 0, 0);
            this.PnlLayout.Controls.Add(this.PnlLog, 1, 0);
            this.PnlLayout.Dock = System.Windows.Forms.DockStyle.Fill;
            this.PnlLayout.Location = new System.Drawing.Point(0, 0);
            this.PnlLayout.Name = "PnlLayout";
            this.PnlLayout.RowCount = 1;
            this.PnlLayout.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.PnlLayout.Size = new System.Drawing.Size(800, 481);
            this.PnlLayout.TabIndex = 3;
            // 
            // PnlButtons
            // 
            this.PnlButtons.Controls.Add(this.LblInfo);
            this.PnlButtons.Controls.Add(this.CBTimestamps);
            this.PnlButtons.Controls.Add(this.BtnExport);
            this.PnlButtons.Controls.Add(this.BtnStop);
            this.PnlButtons.Controls.Add(this.BtnStart);
            this.PnlButtons.Controls.Add(this.LblCards);
            this.PnlButtons.Controls.Add(this.CBTrackerTopmost);
            this.PnlButtons.Controls.Add(this.BtnToggleTracker);
            this.PnlButtons.Controls.Add(this.BtnShowSpoiler);
            this.PnlButtons.Controls.Add(this.BtnLookup);
            this.PnlButtons.Controls.Add(this.CBLookup);
            this.PnlButtons.Controls.Add(this.LblLookup);
            this.PnlButtons.Dock = System.Windows.Forms.DockStyle.Fill;
            this.PnlButtons.Location = new System.Drawing.Point(3, 3);
            this.PnlButtons.Name = "PnlButtons";
            this.PnlButtons.Size = new System.Drawing.Size(259, 475);
            this.PnlButtons.TabIndex = 0;
            // 
            // PnlLog
            // 
            this.PnlLog.BackColor = System.Drawing.Color.White;
            this.PnlLog.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.PnlLog.Controls.Add(this.LBLog);
            this.PnlLog.Dock = System.Windows.Forms.DockStyle.Fill;
            this.PnlLog.Location = new System.Drawing.Point(268, 3);
            this.PnlLog.Name = "PnlLog";
            this.PnlLog.Size = new System.Drawing.Size(529, 475);
            this.PnlLog.TabIndex = 1;
            // 
            // FrmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 481);
            this.Controls.Add(this.PnlLayout);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MinimumSize = new System.Drawing.Size(320, 520);
            this.Name = "FrmMain";
            this.Text = "Rewards Rando Tracker";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FrmMain_FormClosing);
            this.Load += new System.EventHandler(this.Form1_Load);
            this.Shown += new System.EventHandler(this.FrmMain_Shown);
            this.LocationChanged += new System.EventHandler(this.FrmMain_LocationChanged);
            this.SizeChanged += new System.EventHandler(this.FrmMain_SizeChanged);
            this.PnlLayout.ResumeLayout(false);
            this.PnlButtons.ResumeLayout(false);
            this.PnlButtons.PerformLayout();
            this.PnlLog.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.ListBox LBLog;
        private System.Windows.Forms.ComboBox CBLookup;
        private System.Windows.Forms.Label LblLookup;
        private System.Windows.Forms.Button BtnLookup;
        private System.Windows.Forms.Button BtnToggleTracker;
        private System.Windows.Forms.Button BtnShowSpoiler;
        private System.Windows.Forms.Label LblCards;
        private System.Windows.Forms.Button BtnStart;
        private System.Windows.Forms.Button BtnStop;
        private System.Windows.Forms.Button BtnExport;
        private System.Windows.Forms.Label LblInfo;
        private System.Windows.Forms.TableLayoutPanel PnlLayout;
        private System.Windows.Forms.Panel PnlButtons;
        private System.Windows.Forms.Panel PnlLog;
        public System.Windows.Forms.CheckBox CBTrackerTopmost;
        public System.Windows.Forms.CheckBox CBTimestamps;
    }
}

