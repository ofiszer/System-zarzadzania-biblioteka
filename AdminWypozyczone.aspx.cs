using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace BibliotekaWebAppNoAuth
{
    public partial class AdminWypozyczone : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != "admin") //jeśli użytkownik nie jest adminem, zostanie przekierowany na stronę domową
            {
                //Response.Write("<script>alert('Zaloguj się jako admin, by uzyskać dostęp do tej strony.');</script>");
                Response.Redirect("HomePage.aspx");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    // jeśli data zwrotu minęła, cały rząd z tą książką będzie czerwony
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[6].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception ex)
            {
                //Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}