using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace BibliotekaWebAppNoAuth
{
    public partial class ProfilUzytkownika : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString() == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Sesja wygasła. Zaloguj się ponownie.');</script>");
                    Response.Redirect("Logowanie.aspx");
                }
                else
                {
                    wczytajKsiazki();

                    if (!Page.IsPostBack)
                    {
                        wczytajDaneUsera();
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Sesja wygasła. Zaloguj się ponownie.');</script>");
                Response.Redirect("Logowanie.aspx");
            }
        }

        // aktualizuj
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["username"].ToString() == "" || Session["username"] == null)
            {
                Response.Write("<script>alert('Sesja wygasła. Zaloguj się ponownie.');</script>");
                Response.Redirect("Logowanie.aspx");
            }
            else
            {
                updateUserPersonalDetails();
            }
        }

        // własne funkcje


        void updateUserPersonalDetails()
        {
            string password = TextBox9.Text.Trim();
            if (TextBox10.Text.Trim() == "")
            {
                password = TextBox9.Text.Trim();    // jesli nie ustawiono nowego hasla, stare haslo bedzie nowym
            }
            else
            {
                password = TextBox10.Text.Trim();
            }
            if (TextBox10.Text.Trim() != "" && TextBox10.Text.Trim() != TextBox12.Text.Trim())
            {
                Response.Write("<script>alert('Nowe hasło jest błędne.');</script>");
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


                    SqlCommand cmd = new SqlCommand("UPDATE UserTab SET imie=@imie, nazwisko=@nazwisko, data_ur=@data_ur, telefon=@telefon, email=@email, adres=@adres, kod_pocztowy=@kod_pocztowy, miasto=@miasto, haslo=@haslo, status_konta=@status_konta WHERE id_user='" + Session["username"].ToString().Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@imie", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@nazwisko", TextBox11.Text.Trim());
                    cmd.Parameters.AddWithValue("@data_ur", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@telefon", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@adres", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@kod_pocztowy", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@miasto", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@haslo", password);
                    cmd.Parameters.AddWithValue("@status_konta", "oczekujący");


                    
                    int result = cmd.ExecuteNonQuery();
                    con.Close();
                    if (result > 0)     // jesli chociaz jednen rzad danych zostal edytowany, wyswietli sie ponizszy komunikat
                    {
                        con.Open();
                        cmd = new SqlCommand("UPDATE WypozyczenieTab SET Imie=@Imie, Nazwisko=@Nazwisko WHERE id_user='" + TextBox8.Text.Trim() + "'", con);
                        cmd.Parameters.AddWithValue("@Imie", TextBox1.Text.Trim());
                        cmd.Parameters.AddWithValue("@Nazwisko", TextBox11.Text.Trim());
                        cmd.ExecuteNonQuery();
                        con.Close();

                        GridView1.DataBind();
                        Response.Write("<script>alert('Twoje dane zostały edytowane.');</script>");
                        wczytajDaneUsera();
                        wczytajKsiazki();
                    }
                    else
                    {
                        Response.Write("<script>alert('Błędne dane.');</script>");
                    }

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Blad1.');</script>");
                }
            }
        }
        

        void wczytajDaneUsera()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("SELECT * FROM UserTab WHERE id_user='" + Session["username"].ToString().Trim() + "';", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    TextBox1.Text = dt.Rows[0]["imie"].ToString();
                    TextBox11.Text = dt.Rows[0]["nazwisko"].ToString();
                    TextBox3.Text = dt.Rows[0]["data_ur"].ToString();
                    TextBox2.Text = dt.Rows[0]["telefon"].ToString();
                    TextBox4.Text = dt.Rows[0]["email"].ToString();
                    TextBox5.Text = dt.Rows[0]["adres"].ToString();
                    TextBox6.Text = dt.Rows[0]["kod_pocztowy"].ToString();
                    TextBox7.Text = dt.Rows[0]["miasto"].ToString();
                    TextBox8.Text = dt.Rows[0]["id_user"].ToString();
                    TextBox9.Text = dt.Rows[0]["haslo"].ToString();

                    Label1.Text = dt.Rows[0]["status_konta"].ToString().Trim();

                if (dt.Rows[0]["status_konta"].ToString().Trim() == "aktywny")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-success");
                }
                else if (dt.Rows[0]["status_konta"].ToString().Trim() == "oczekujący")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-warning");
                }
                else if (dt.Rows[0]["status_konta"].ToString().Trim() == "nieaktywny")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-danger");
                }
                else
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-info");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void wczytajKsiazki()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                // Session["username"] jest w Logowanie.aspx.cs
                SqlCommand cmd = new SqlCommand("SELECT * FROM WypozyczenieTab WHERE ID_user='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSourceID = null;
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        /*
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
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }*/
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[6].Text);
                    DateTime today = DateTime.Today;

                    if (today.Date > dt.Date)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

    }
}