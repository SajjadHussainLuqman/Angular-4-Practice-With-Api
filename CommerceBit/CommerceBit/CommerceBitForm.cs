using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Windows.Forms;

namespace CommerceBit
{
    public partial class CommerceBitForm : Form
    {
        Token tokenInfo;
        public CommerceBitForm(Token t)
        {
            tokenInfo = t;
            InitializeComponent();
        }

        #region Event Handlers

        private void btnLogin_Click(object sender, EventArgs e)
        {
            ForLogin p = new ForLogin();
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

            if (CanLogin(p))
            {
                niMessage.Icon = ProjectResource.Connected;
                niMessage.Text = "CommerceBit Suite: Connected";
                niMessage.ShowBalloonTip(1000, "Important Notification", "CommerceBit Suite: Connected", ToolTipIcon.Info);

                ConnectedForm form = new ConnectedForm(tokenInfo);
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
            ForLogin p = new ForLogin();
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

            if (CanLogin(p))
            {
                MessageBox.Show("Valid User Credentials.", "CommerceBit Suite", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Invalid User Credentials.", "CommerceBit Suite", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
            if (tokenInfo.AccessToken!=null)
            {
                ConnectedForm form = new ConnectedForm(tokenInfo);
                form.Show();
            }
            else
            {
                this.Show();
            }
        }
        private void niMessage_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            if (tokenInfo.AccessToken != null)
            {
                ConnectedForm form = new ConnectedForm(tokenInfo);
                form.Show();
            }
            else
            {
                this.Show();
            }
        }

        #endregion

        #region Private Functions

        private bool CanLogin(ForLogin p)
        {
            try
            {
                string baseAddress = p.Url;

                var client = new HttpClient();

                var form = new Dictionary<string, string>
               {
                   {"grant_type", "password"},
                   {"username", p.UserName},
                   {"password", p.Password},
                   {"company", p.CompanyCode},
               };

                var tokenResponse = client.PostAsync(baseAddress + "token", new FormUrlEncodedContent(form)).Result;
                tokenInfo = tokenResponse.Content.ReadAsAsync<Token>(new[] { new JsonMediaTypeFormatter() }).Result;

                if (tokenInfo.AccessToken != null)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                return false;
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
