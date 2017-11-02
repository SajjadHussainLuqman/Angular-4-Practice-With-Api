namespace CommerceBit
{
    partial class PrintTestLabel
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(PrintTestLabel));
            this.lblTitle = new System.Windows.Forms.Label();
            this.cmbPrinter = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btnPrintInvoice = new System.Windows.Forms.Button();
            this.btnPrintLabel = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lblTitle
            // 
            this.lblTitle.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lblTitle.BackColor = System.Drawing.Color.Navy;
            this.lblTitle.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTitle.ForeColor = System.Drawing.Color.White;
            this.lblTitle.Location = new System.Drawing.Point(-1, 0);
            this.lblTitle.Name = "lblTitle";
            this.lblTitle.Size = new System.Drawing.Size(371, 50);
            this.lblTitle.TabIndex = 21;
            this.lblTitle.Text = "CommerceBit Suite";
            this.lblTitle.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // cmbPrinter
            // 
            this.cmbPrinter.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPrinter.FormattingEnabled = true;
            this.cmbPrinter.Location = new System.Drawing.Point(119, 74);
            this.cmbPrinter.Name = "cmbPrinter";
            this.cmbPrinter.Size = new System.Drawing.Size(208, 21);
            this.cmbPrinter.TabIndex = 22;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(27, 78);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(86, 13);
            this.label1.TabIndex = 23;
            this.label1.Text = "Availabel Printer:";
            // 
            // btnPrintInvoice
            // 
            this.btnPrintInvoice.Location = new System.Drawing.Point(119, 116);
            this.btnPrintInvoice.Name = "btnPrintInvoice";
            this.btnPrintInvoice.Size = new System.Drawing.Size(99, 23);
            this.btnPrintInvoice.TabIndex = 24;
            this.btnPrintInvoice.Text = "Print Invoice";
            this.btnPrintInvoice.UseVisualStyleBackColor = true;
            // 
            // btnPrintLabel
            // 
            this.btnPrintLabel.Location = new System.Drawing.Point(228, 116);
            this.btnPrintLabel.Name = "btnPrintLabel";
            this.btnPrintLabel.Size = new System.Drawing.Size(99, 23);
            this.btnPrintLabel.TabIndex = 25;
            this.btnPrintLabel.Text = "Print Label";
            this.btnPrintLabel.UseVisualStyleBackColor = true;
            this.btnPrintLabel.Click += new System.EventHandler(this.btnPrintLabel_Click);
            // 
            // PrintTestLabel
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(367, 170);
            this.Controls.Add(this.btnPrintLabel);
            this.Controls.Add(this.btnPrintInvoice);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cmbPrinter);
            this.Controls.Add(this.lblTitle);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "PrintTestLabel";
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Toolkit";
            this.Load += new System.EventHandler(this.PrintTestLabel_Load);
            this.SizeChanged += new System.EventHandler(this.PrintTestLabel_SizeChanged);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblTitle;
        private System.Windows.Forms.ComboBox cmbPrinter;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnPrintInvoice;
        private System.Windows.Forms.Button btnPrintLabel;
    }
}