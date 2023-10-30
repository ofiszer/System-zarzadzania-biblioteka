using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace BibliotekaWebAppNoAuth
{
    public partial class adminprofil : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //if (Session["role"].ToString() != "admin")
                //{
                //    Response.Write("<script>alert('Sesja wygasła. Zaloguj się ponownie.');</script>");
                //    Response.Redirect("adminlogin.aspx");
                //}
                //else
                //{
                //    //getUserBookData();

                //    if (!Page.IsPostBack)
                //    {
                //        getAdminPersonalDetails();
                //    }

                //}
                getAdminPersonalDetails();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Sesja wygasła. Zaloguj się ponownie.');</script>");
                Response.Redirect("adminlogin.aspx");
            }
        
        }

        // aktualizuj
        protected void Button1_Click(object sender, EventArgs e)
        {
            updateAdminPersonalDetails();
        }

        

        //własne

        void getAdminPersonalDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM AdminTab WHERE Admin_ID='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                TextBox1.Text = dt.Rows[0]["imie"].ToString();
                TextBox2.Text = dt.Rows[0]["nazwisko"].ToString();
                TextBox3.Text = dt.Rows[0]["Admin_ID"].ToString();
                TextBox4.Text = dt.Rows[0]["haslo"].ToString();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateAdminPersonalDetails()
        {
            string password = TextBox4.Text.Trim();
            if (TextBox5.Text.Trim() == "")
            {
                password = TextBox4.Text.Trim();    // jesli nie ustawiono nowego hasla, stare haslo bedzie nowym
            }
            else
            {
                password = TextBox5.Text.Trim();
            }
            if (TextBox5.Text.Trim() != "" && TextBox5.Text.Trim() != TextBox6.Text.Trim())
            {
                Response.Write("<script>alert('Nowe hasła nie są jednakowe.');</script>");
            }
            else
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("UPDATE AdminTab SET imie=@imie, nazwisko=@nazwisko, haslo=@haslo, WHERE Admin_ID='" + TextBox3.ToString().Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@imie", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@nazwisko", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@haslo", password);

                    int result = cmd.ExecuteNonQuery();
                    con.Close();
                    
                    if (result > 0)     // jesli chociaz jednen rzad danych zostal edytowany, wyswietli sie ponizszy komunikat
                    {
                        Response.Write("<script>alert('Twoje dane zostały edytowane.');</script>");
                        getAdminPersonalDetails();
                    }
                    else
                    {
                        Response.Write("<script>alert('Błędne dane.');</script>");
                    }

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }
    }
}