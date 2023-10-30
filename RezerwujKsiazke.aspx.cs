using System;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


namespace BibliotekaWebAppNoAuth
{
    public partial class RezerwujKsiazke : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"].ToString() == "" || Session["username"] == null)
            {
                Response.Write("<script>alert('Sesja wygasła. Zaloguj się ponownie.');</script>");
                Response.Redirect("Logowanie.aspx");
            }
        }

        // szukaj
        protected void Button1_Click(object sender, EventArgs e)
        {
            wpiszNazwy();
        }


        bool sprawdzLimit()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                // sprawdzanie ile uzytkownik o podanym id ma wypozyczonych ksiazek 
                SqlCommand cmd = new SqlCommand("SELECT * FROM RezerwujTab WHERE ID_user = '" + TextBox1.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 3)
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


        void rezerwuj()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                if (TextBox5.Text.Trim() == "aktywny")
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO RezerwujTab (ID_user, imie, nazwisko, ID_ksiazki, tytul) VALUES (@ID_user, @imie, @nazwisko, @ID_ksiazki, @tytul)", con);

                    cmd.Parameters.AddWithValue("@ID_user", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@imie", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@nazwisko", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@ID_ksiazki", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@tytul", TextBox6.Text.Trim());

                    cmd.ExecuteNonQuery();

                    // odejmowanie książki z listy dostępnych
                    cmd = new SqlCommand("UPDATE KSD SET Ile_sztuk = Ile_sztuk-1 WHERE ID_ksiazka = '" + TextBox2.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Write("<script>alert('Zarezerwowano książkę.');</script>");
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Twoje konto nie ma uprawnień do rezerwacji książek.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        

        bool czyRezerwacjaIstnieje()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM RezerwujTab WHERE ID_user='" + TextBox1.Text.Trim() + "' AND Ksiazka_ID='" + TextBox2.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
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


        bool czyKsiazkaIstnieje()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT Tytul FROM KSD WHERE ID_ksiazka='" + TextBox2.Text.Trim() + "'AND Ile_sztuk > 0", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
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


        bool czyUzytkownikIstnieje()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT imie, nazwisko FROM UserTab WHERE id_user='" + TextBox1.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
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

            }
            return false;
        }


        void wpiszNazwy()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT Tytul FROM KSD WHERE ID_ksiazka='" + TextBox2.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox6.Text = dt.Rows[0]["Tytul"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Błędne ID książki!');</script>");
                }

                cmd = new SqlCommand("SELECT imie, nazwisko, status_konta FROM UserTab WHERE id_user='" + /*TextBox1.Text.Trim()*/Session["username"] + "'", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox1.Text = Session["username"].ToString();
                    TextBox3.Text = dt.Rows[0]["imie"].ToString();
                    TextBox4.Text = dt.Rows[0]["nazwisko"].ToString();
                    TextBox5.Text = dt.Rows[0]["status_konta"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Błędne ID użytkownika');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //rezerwuj
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (czyKsiazkaIstnieje() && czyUzytkownikIstnieje())
            {
                if (czyRezerwacjaIstnieje())
                {
                    Response.Write("<script>alert('Już masz tę książkę.');</script>");
                }
                else
                {
                    if (sprawdzLimit() == false)
                    {
                        rezerwuj();
                    }
                    else
                    {
                        Response.Write("<script>alert('Limit zarezerwowanych książek osiągnięty. Odbierz jedną, jeśli chcesz zarezerwować następną.');</script>");
                    }
                    //rezerwuj();
                }
            }
            else
            {
                Response.Write("<script>alert('Błędne ID książki lub książka chwilowo niedostępna.');</script>");
            }
        }

        // zrezygnuj
        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM RezerwujTab WHERE ID_ksiazki='" + TextBox2.Text.Trim() + "' AND id_user='" + TextBox1.Text.Trim() + "'", con);
                int result = cmd.ExecuteNonQuery();

                //if (result > 0)
                //{
                    cmd = new SqlCommand("UPDATE KSD SET Ile_sztuk=Ile_sztuk+1 WHERE ID_ksiazka='" + TextBox2.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();


                    Response.Write("<script>alert('Pomyślnie zwrócono książkę do tabeli KSD.');</script>");
                    GridView1.DataBind();
                    con.Close();

                //}
                /*else
                {
                    Response.Write("<script>alert('Błędne dane!');</script>");
                }*/

            }
            catch (Exception ex)
            {
                //Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

    }
}