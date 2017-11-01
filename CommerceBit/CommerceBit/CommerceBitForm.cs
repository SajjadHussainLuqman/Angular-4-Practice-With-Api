using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CommerceBit
{
    public partial class CommerceBitForm : Form
    {
        public CommerceBitForm()
        {
            InitializeComponent();
        }

        #region Event Handlers

        private void btnLogin_Click(object sender, EventArgs e)
        {
            UserInfo p = new UserInfo();
            p.Url = txtUrl.Text;
            p.CompanyCode = txtCompanyCode.Text;
            p.UserName = txtUserName.Text;
            p.Password = txtPassword.Text;

            if (string.IsNullOrEmpty(p.Url))
            {
                MessageBox.Show("Url Required Field.", "CommerceBit Suite", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            if (string.IsNullOrEmpty(p.CompanyCode))
            {
                MessageBox.Show("Company Code Required Field.", "CommerceBit Suite", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            if (string.IsNullOrEmpty(p.UserName))
            {
                MessageBox.Show("UserName Required Field.", "CommerceBit Suite", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            if (string.IsNullOrEmpty(p.Password))
            {
                MessageBox.Show("Password Required Field.", "CommerceBit Suite", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            if (true) //CanLogin(p)
            {
                niMessage.Icon = ProjectResource.Connected;
                niMessage.Text = "CommerceBit Suite: Connected";
                niMessage.ShowBalloonTip(1000, "Important Notification", "CommerceBit Suite: Connected", ToolTipIcon.Info);

                ConnectedForm form = new ConnectedForm();
                form.Show();

                this.Hide();
                ClearAll();
            }
            else
            {
                niMessage.Icon = ProjectResource.Disconnected;
                niMessage.Text = "CommerceBit Suite: Disconnected";
                MessageBox.Show("Invalid User Information.", "CommerceBit Suite", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void btnTestCredentials_Click(object sender, EventArgs e)
        {
            UserInfo p = new UserInfo();
            p.Url = txtUrl.Text;
            p.CompanyCode = txtCompanyCode.Text;
            p.UserName = txtUserName.Text;
            p.Password = txtPassword.Text;

            if (string.IsNullOrEmpty(p.Url))
            {
                MessageBox.Show("Url Required Field.", "CommerceBit Suite", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            if (string.IsNullOrEmpty(p.CompanyCode))
            {
                MessageBox.Show("Company Code Required Field.", "CommerceBit Suite", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            if (string.IsNullOrEmpty(p.UserName))
            {
                MessageBox.Show("UserName Required Field.", "CommerceBit Suite", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            if (string.IsNullOrEmpty(p.Password))
            {
                MessageBox.Show("Password Required Field.", "CommerceBit Suite", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            if (true) //CanLogin(p)
            {
                MessageBox.Show("User Credentials Exist.", "CommerceBit Suite", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            else
            {
                MessageBox.Show("User Credentials Not Exist.", "CommerceBit Suite", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        private void CommerceBitForm_SizeChanged(object sender, EventArgs e)
        {
            if (this.WindowState == FormWindowState.Minimized)
            {
                niMessage.ShowBalloonTip(1000, "Important Notification", "Minimized Successfully", ToolTipIcon.Info);
                this.Hide();
            }
        }
        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        private void openToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if(niMessage.Text == "CommerceBit Suite: Connected")
            {
                ConnectedForm form = new ConnectedForm();
                form.Show();
            }
            else
            {
                this.Show();
            }
        }
        private void niMessage_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            if (niMessage.Text == "CommerceBit Suite: Connected")
            {
                ConnectedForm form = new ConnectedForm();
                form.Show();
            }
            else
            {
                this.Show();
            }
        }

        #endregion

        #region Private Functions

        private async Task<bool> CanLogin(UserInfo p)
        {

            using (var client = new System.Net.Http.HttpClient())
            {
                var serializedProduct = JsonConvert.SerializeObject(p);
                var content = new StringContent(serializedProduct, Encoding.UTF8, "application/json");
                var result = await client.PostAsync("URL", content);
                if (result != null)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
        private async void IsUserExist(UserInfo p)
        {
            using (var client = new System.Net.Http.HttpClient())
            {
                using (var response = await client.GetAsync("Url"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        var productJsonString = await response.Content.ReadAsStringAsync();

                        UserInfo data = JsonConvert.DeserializeObject<UserInfo>(productJsonString);

                    }
                }
            }
        }

        private void ClearAll()
        {
            txtCompanyCode.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtUrl.Text = string.Empty;
            txtUserName.Text = string.Empty;
        }

        #endregion
    }
}
