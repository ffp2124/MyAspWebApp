using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;

/// <summary>
/// Summary description for Log
/// </summary>
public class Log
{

    public static void WriteToLog(Exception e)
    {
        try
        {
            String path = HttpContext.Current.Server.MapPath("~/Log/ErrorLog.txt");
            if (File.Exists(path))
            {
                StreamWriter sw = new StreamWriter(path, true);
                StringBuilder sb = new StringBuilder();

                sb.Append("Error time: " + DateTime.Now.ToString() + Environment.NewLine);
                sb.Append("Exception Type" + Environment.NewLine);
                sb.Append(e.GetType().Name);
                sb.Append(Environment.NewLine + Environment.NewLine);
                sb.Append("Message" + Environment.NewLine);
                sb.Append(e.Message + Environment.NewLine + Environment.NewLine);
                sb.Append("Stack Trace" + Environment.NewLine);
                sb.Append(e.StackTrace + Environment.NewLine + Environment.NewLine);

                e = e.InnerException;
                sw.WriteLine(sb.ToString());
                sw.Flush();
                sw.Close();
            }
        }
        catch (Exception ex)
        {

        }
    }

    
}