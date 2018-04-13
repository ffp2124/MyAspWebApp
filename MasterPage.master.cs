using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            setImageUrl();
        }

    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        setImageUrl();
    }

    private void setImageUrl()
    {
        Random random = new Random();
        int i = random.Next(1, 5);
        Image1.ImageUrl = "~/Images/SlideShow/" + i.ToString() + ".jpg";
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}
