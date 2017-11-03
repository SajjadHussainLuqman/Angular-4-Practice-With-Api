using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CommerceBit
{
    public partial class CommerceBitForm : Form
    {
        Token tokenInfo;
        ForLogin p;
        public CommerceBitForm(Token t)
        {
            tokenInfo = t;
            InitializeComponent();
            p = new ForLogin();
            MenuItemsShowHide(false);
        }

        #region Event Handlers
        private void CommerceBitForm_Load(object sender, EventArgs e)
        {

        }
        private async void btnLogin_Click(object sender, EventArgs e)
        {
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

            Loader popUp = new Loader();
            popUp.Show(this);
            this.Enabled = false;

            Task<bool> IsCan = CanLogin();
            bool CanLoginUser = await IsCan;
            if (CanLoginUser)
            {
                niMessage.Icon = ProjectResource.Connected;
                niMessage.Text = "CommerceBit Suite: Connected";
                niMessage.ShowBalloonTip(1000, "Important Notification", "CommerceBit Suite: Connected", ToolTipIcon.Info);

                ConnectedForm form = new ConnectedForm(tokenInfo);
                form.Show();

                this.Hide();
                ClearAll();
                MenuItemsShowHide(true);

            }
            else
            {
                MenuItemsShowHide(false);
                niMessage.Icon = ProjectResource.Disconnected;
                niMessage.Text = "CommerceBit Suite: Disconnected";
                MessageBox.Show("Invalid User Information.", "CommerceBit Suite", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            popUp.Close();
            this.Enabled = true;
        }
        private async void btnTestCredentials_Click(object sender, EventArgs e)
        {
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

            Loader popUp = new Loader();
            popUp.Show(this);
            this.Enabled = false;

            Task<bool> IsCan = CanLogin();
            bool CanLoginUser = await IsCan;
            if (CanLoginUser)
            {
                MessageBox.Show("Valid User Credentials.", "CommerceBit Suite", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Invalid User Credentials.", "CommerceBit Suite", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            popUp.Close();
            this.Enabled = true;
        }
        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        private void CommerceBitForm_SizeChanged(object sender, EventArgs e)
        {
            if (this.WindowState == FormWindowState.Minimized)
            {
                //niMessage.ShowBalloonTip(1000, "Important Notification", "Minimized Successfully", ToolTipIcon.Info);
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

        private async Task<bool> CanLogin()
        {
            try
            {
                p.Url = Regex.Replace(p.Url, @"\s+", string.Empty);
                p.UserName = Regex.Replace(p.UserName, @"\s+", string.Empty);
                p.Password = Regex.Replace(p.Password, @"\s+", string.Empty);
                p.CompanyCode = Regex.Replace(p.CompanyCode, @"\s+", string.Empty);

                string baseAddress = p.Url;

                var client = new HttpClient();

                var form = new Dictionary<string, string>
               {
                   {"grant_type", "password"},
                   {"username", p.UserName},
                   {"password", p.Password},
                   {"company", p.CompanyCode},
               };
                
                HttpResponseMessage tokenResponse = await client.PostAsync(baseAddress + "token", new FormUrlEncodedContent(form)).ConfigureAwait(false);
                tokenInfo = await tokenResponse.Content.ReadAsAsync<Token>(new[] { new JsonMediaTypeFormatter() });
                
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

        private void logInToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MenuItemsShowHide(false);

            niMessage.Icon = ProjectResource.Disconnected;
            niMessage.Text = "CommerceBit Suite: Disconnected";
            

            niMessage.ShowBalloonTip(1000, "Important Notification", "Logout Successfully", ToolTipIcon.Info);
            ConnectedForm form = new ConnectedForm(new Token());
            form.Show();
        }

        private void printTestLabelToolStripMenuItem_Click(object sender, EventArgs e)
        {
            PrintTestLabel form = new PrintTestLabel(tokenInfo);
            form.Show(this);
        }

        

        private void MenuItemsShowHide(bool IsDisplay)
        {
            logInToolStripMenuItem.Visible = IsDisplay;
            showPrintJobsToolStripMenuItem.Visible = IsDisplay;
            showLogsToolStripMenuItem.Visible = IsDisplay;
            openSavedLabelsFolderToolStripMenuItem.Visible = IsDisplay;
            printTestLabelToolStripMenuItem.Visible = IsDisplay;
        }
    }
}
