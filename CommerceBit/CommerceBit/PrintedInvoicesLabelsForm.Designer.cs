namespace CommerceBit
{
    partial class PrintedInvoicesLabelsForm
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
            this.lblTitle = new System.Windows.Forms.Label();
            this.dgvResult = new System.Windows.Forms.DataGridView();
            this.DatePrinted = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.JobType = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.OrderNumber = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.MarketPlace = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.FirstLastName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ShippingCarrier = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ShippingService = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.PostageCost = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.PrintedBy = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Action = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dgvResult)).BeginInit();
            this.SuspendLayout();
            // 
            // lblTitle
            // 
            this.lblTitle.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lblTitle.BackColor = System.Drawing.Color.Navy;
            this.lblTitle.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTitle.ForeColor = System.Drawing.Color.White;
            this.lblTitle.Location = new System.Drawing.Point(-4, -2);
            this.lblTitle.Name = "lblTitle";
            this.lblTitle.Size = new System.Drawing.Size(1114, 50);
            this.lblTitle.TabIndex = 22;
            this.lblTitle.Text = "Show Printed Invoices/Labels";
            this.lblTitle.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // dgvResult
            // 
            this.dgvResult.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvResult.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.DatePrinted,
            this.JobType,
            this.OrderNumber,
            this.MarketPlace,
            this.FirstLastName,
            this.ShippingCarrier,
            this.ShippingService,
            this.PostageCost,
            this.PrintedBy,
            this.Action});
            this.dgvResult.Location = new System.Drawing.Point(12, 103);
            this.dgvResult.Name = "dgvResult";
            this.dgvResult.Size = new System.Drawing.Size(1084, 162);
            this.dgvResult.TabIndex = 23;
            // 
            // DatePrinted
            // 
            this.DatePrinted.HeaderText = "Date Printed";
            this.DatePrinted.Name = "DatePrinted";
            // 
            // JobType
            // 
            this.JobType.HeaderText = "Job/Type";
            this.JobType.Name = "JobType";
            this.JobType.Width = 80;
            // 
            // OrderNumber
            // 
            this.OrderNumber.HeaderText = "Order Number";
            this.OrderNumber.Name = "OrderNumber";
            // 
            // MarketPlace
            // 
            this.MarketPlace.HeaderText = "Market Place";
            this.MarketPlace.Name = "MarketPlace";
            // 
            // FirstLastName
            // 
            this.FirstLastName.HeaderText = "First/Last Name";
            this.FirstLastName.Name = "FirstLastName";
            this.FirstLastName.Width = 120;
            // 
            // ShippingCarrier
            // 
            this.ShippingCarrier.HeaderText = "Shipping Carrier";
            this.ShippingCarrier.Name = "ShippingCarrier";
            this.ShippingCarrier.Width = 120;
            // 
            // ShippingService
            // 
            this.ShippingService.HeaderText = "Shipping Service";
            this.ShippingService.Name = "ShippingService";
            this.ShippingService.Width = 120;
            // 
            // PostageCost
            // 
            this.PostageCost.HeaderText = "Postage Cost";
            this.PostageCost.Name = "PostageCost";
            // 
            // PrintedBy
            // 
            this.PrintedBy.HeaderText = "Printed By";
            this.PrintedBy.Name = "PrintedBy";
            // 
            // Action
            // 
            this.Action.HeaderText = "Action";
            this.Action.Name = "Action";
            // 
            // PrintedInvoicesLabelsForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1104, 273);
            this.Controls.Add(this.dgvResult);
            this.Controls.Add(this.lblTitle);
            this.Name = "PrintedInvoicesLabelsForm";
            this.Text = "Printed Invoices Labels";
            this.Load += new System.EventHandler(this.PrintedInvoicesLabelsForm_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvResult)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label lblTitle;
        private System.Windows.Forms.DataGridView dgvResult;
        private System.Windows.Forms.DataGridViewTextBoxColumn DatePrinted;
        private System.Windows.Forms.DataGridViewTextBoxColumn JobType;
        private System.Windows.Forms.DataGridViewTextBoxColumn OrderNumber;
        private System.Windows.Forms.DataGridViewTextBoxColumn MarketPlace;
        private System.Windows.Forms.DataGridViewTextBoxColumn FirstLastName;
        private System.Windows.Forms.DataGridViewTextBoxColumn ShippingCarrier;
        private System.Windows.Forms.DataGridViewTextBoxColumn ShippingService;
        private System.Windows.Forms.DataGridViewTextBoxColumn PostageCost;
        private System.Windows.Forms.DataGridViewTextBoxColumn PrintedBy;
        private System.Windows.Forms.DataGridViewTextBoxColumn Action;
    }
}