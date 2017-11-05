using System;
using System.Drawing;
using System.Drawing.Printing;
using System.IO;
using System.Windows.Forms;

namespace CommerceBit
{
    public partial class PrinterSettingsForm : Form
    {
        Token tokenDetail;
        public PrinterSettingsForm(Token t)
        {
            tokenDetail = t;
            InitializeComponent();
        }

        private void PrintTestLabel_Load(object sender, EventArgs e)
        {
            foreach (string printer in PrinterSettings.InstalledPrinters)
            {
                cmbPrinter.Items.Add(printer);
            }
        }

        private void PrintTestLabel_SizeChanged(object sender, EventArgs e)
        {
            if (this.WindowState == FormWindowState.Minimized)
            {
                this.Hide();
            }
        }

        private void PrintPage(object o, PrintPageEventArgs e)
        {
            //string image_outputDir = Path.GetDirectoryName(Application.ExecutablePath);
            //DirectoryInfo df = new DirectoryInfo(image_outputDir + @"\Images\labelImage.jpg");
            //string FilePath = df.FullName;

            string PicPath = Application.StartupPath + @"\Images\labelImage.jpg";
            Image img = Image.FromFile(PicPath);
            Size size = new Size(4, 6);
            Point loc = new Point(size);
            e.Graphics.DrawImage(img, loc);
        }

        public PageSettings GetPrinterPageInfo(string printerName)
        {
            PrinterSettings settings;

            // If printer name is not set, look for default printer
            if (String.IsNullOrEmpty(printerName))
            {
                foreach (var printer in PrinterSettings.InstalledPrinters)
                {
                    settings = new PrinterSettings();

                    settings.PrinterName = printer.ToString();

                    if (settings.IsDefaultPrinter)
                        return settings.DefaultPageSettings;
                }

                return null; // <- No default printer  
            }

            // printer by its name 
            settings = new PrinterSettings();

            settings.PrinterName = printerName;

            return settings.DefaultPageSettings;
        }

        // Default printer default page info
        public  PageSettings GetPrinterPageInfo()
        {
            return GetPrinterPageInfo(null);
        }

        private void btnPrintLabel_Click(object sender, EventArgs e)
        {
            if(cmbPrinter.SelectedIndex<0)
            {
                MessageBox.Show("Please Select Printer.", "CommerceBit Suite", MessageBoxButtons.OK, MessageBoxIcon.Stop);
                return;
            }

            // Default printer default page
            //PageSettings page = GetPrinterPageInfo();
            // Or default page of some other printer given by its name
            PageSettings page = GetPrinterPageInfo(cmbPrinter.SelectedItem.ToString()); 

            RectangleF area = page.PrintableArea;
            Rectangle bounds = page.Bounds;
            Margins margins = page.Margins;

            PrintDocument pd = new PrintDocument();
            pd.PrinterSettings.PrinterName = cmbPrinter.SelectedItem.ToString();
            pd.PrintPage += PrintPage;
            pd.DefaultPageSettings = page;
            pd.Print();
        }
    }
}
