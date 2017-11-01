using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CommerceBit
{
    public partial class ConnectedForm : Form
    {
        public ConnectedForm()
        {
            InitializeComponent();
        }

        private void btnDisconnect_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Disconnected Successfully.", "CommerceBit Suite", MessageBoxButtons.OK, MessageBoxIcon.Information);
            Application.Exit();
            this.Close();
        }

        private void ConnectedForm_SizeChanged(object sender, EventArgs e)
        {
            if (this.WindowState == FormWindowState.Minimized)
            {
                this.Hide();
            }
        }
    }
}
