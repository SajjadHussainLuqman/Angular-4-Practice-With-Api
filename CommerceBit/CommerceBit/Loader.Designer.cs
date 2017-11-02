namespace CommerceBit
{
    partial class Loader
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Loader));
            this.pbProgressBar = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.pbProgressBar)).BeginInit();
            this.SuspendLayout();
            // 
            // pbProgressBar
            // 
            this.pbProgressBar.Image = ((System.Drawing.Image)(resources.GetObject("pbProgressBar.Image")));
            this.pbProgressBar.Location = new System.Drawing.Point(-2, -2);
            this.pbProgressBar.Name = "pbProgressBar";
            this.pbProgressBar.Size = new System.Drawing.Size(160, 156);
            this.pbProgressBar.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pbProgressBar.TabIndex = 23;
            this.pbProgressBar.TabStop = false;
            // 
            // Loader
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(155, 154);
            this.Controls.Add(this.pbProgressBar);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "Loader";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Loader";
            ((System.ComponentModel.ISupportInitialize)(this.pbProgressBar)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.PictureBox pbProgressBar;
    }
}