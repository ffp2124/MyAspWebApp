using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {
                MailMessage msg = new MailMessage();
                msg.From = new MailAddress("fuf02@unitec.ac.nz");
                msg.To.Add("ffp_2124@163.com");
                msg.Subject = txtSubject.Text;

                msg.Body = "<b>Sender Name :</b>" + txtName.Text + "<br/>"
                    + "<b>Sender Email :</b>" + txtEmail.Text + "<br/>"
                    + "<b>Comments :</b>" + txtComments.Text;
                msg.IsBodyHtml = true;

                SmtpClient client = new SmtpClient();
                client.Host = "localhost";
                client.Send(msg);

                Label1.ForeColor = System.Drawing.Color.Green;
                Label1.Text = "Thank you for contacting us";

                txtName.Enabled = false;
                txtEmail.Enabled = false;
                txtSubject.Enabled = false;
                txtComments.Enabled = false;
                Button1.Enabled = false;
            }
        }
        catch(Exception ex)
        {
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Text = "There is an unknown problem. Please try later";
            txtName.Enabled = true;
            txtEmail.Enabled = true;
            txtSubject.Enabled = true;
            txtComments.Enabled = true;
            Button1.Enabled = true;
            Log.WriteToLog(ex);
            SendEmail.SendToAdmin();
        }
    }
}