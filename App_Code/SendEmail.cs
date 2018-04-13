using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Net.Mail;

/// <summary>
/// Summary description for SendEmail
/// </summary>
public class SendEmail
{
	public SendEmail()
	{
	}

    public static void SendToCustomer(String toAddress, String userName, String password) 
    {
        string title = "Quantity Shoes Registration Confirm Message";
        StringBuilder sb = new StringBuilder();
        sb.Append("Welcome to our Web Stroe! Dear " + userName + ":" + Environment.NewLine);
        sb.Append("Congratulations! You have registered out website successfully! The following are your user information:" + Environment.NewLine);
        sb.Append("Your Username : " + userName + Environment.NewLine);
        sb.Append("Your Password : " + password + Environment.NewLine);
        sb.Append("Please remember your information, hope you have a pleasant trip in our web store!Thank you!");
        MailMessage msg = new MailMessage("fuf02@unitec.co.nz", toAddress);
        msg.Body = sb.ToString();
        msg.Subject = title;
        SmtpClient mailClient = new SmtpClient("localhost");
        try
        {
            mailClient.Send(msg);
        }
        catch(Exception ex){
            Log.WriteToLog(ex);
        }
    }

    public static void SendToAdmin() 
    {
        MailMessage msg = new MailMessage("fuf02@unitec.co.nz", "ffp_2124@163.com");
        msg.Subject = "Error Report";
        msg.Body = "An error has happend, please check the error log.";
        SmtpClient client = new SmtpClient("loaclhost");
        try
        {
            client.Send(msg);
        }
        catch (Exception e)
        {
            Log.WriteToLog(e);
        }
    }
}