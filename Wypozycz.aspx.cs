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
    public partial class Wypozycz : System.Web.UI.Page
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
        protected void Button2_Click(object sender, EventArgs e)
        {
            wpiszNazwy();
        }

        // wypożycz
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (czyKsiazkaIstnieje() && czyUzytkownikIstnieje())
            {
                if (czyWypozyczenieIstnieje())
                {
                    Response.Write("<script>alert('Już masz tę książkę.');</script>");
                }
                else
                {
                    if (sprawdzLimit()==false)
                    {
                        wypozycz();
                    }
                    else
                    {
                        Response.Write("<script>alert('Limit wypożyczonych książek osiągnięty. Zwróć jedną z już wypożyczonych, jeśli chcesz wypożyczyć nową.');</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Błędne ID książki lub książka chwilowo niedostępna.');</script>");
            }
        }

        // oddaj
        //protected void Button5_Click(object sender, EventArgs e)
        //{
        //    if (czyKsiazkaIstnieje() && czyUzytkownikIstnieje())
        //    {
        //        if (czyWypozyczenieIstnieje())
        //        {
        //            oddaj();
        //        }
        //        else
        //        {
        //            Response.Write("<script>alert('Użytkownik nie wypożyczył tej książki');</script>");
        //        }
        //    }
        //    else
        //    {
        //        Response.Write("<script>alert('Błędne ID użytkownika lub książki.');</script>");
        //    }
        //}


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
                SqlCommand cmd = new SqlCommand("SELECT * FROM WypozyczenieTab WHERE id_user = '" + TextBox1.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 5)
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


        void wypozycz() 
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                if (TextBox8.Text.Trim() == "aktywny")
                {
                    if (TextBox6.Text.Trim() == "" || TextBox6.Text.Trim() == null || TextBox7.Text.Trim() == "" || TextBox7.Text.Trim() == null)
                    {
                        Response.Write("<script>alert('Daty wypożyczenia i zwrotu nie mogą być puste!');</script>");
                    }
                    else { 

                    SqlCommand cmd = new SqlCommand("INSERT INTO WypozyczenieTab (id_user, Imie, Nazwisko, Ksiazka_ID, Tytul_ksiazki, Data_wypozyczenia, Data_zwrotu) VALUES (@id_user, @Imie, @Nazwisko, @Ksiazka_ID, @Tytul_ksiazki, @Data_wypozyczenia, @Data_zwrotu)", con);

                    cmd.Parameters.AddWithValue("@id_user", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Imie", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@Nazwisko", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@Ksiazka_ID", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@Tytul_ksiazki", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@Data_wypozyczenia", TextBox6.Text.ToString());
                    cmd.Parameters.AddWithValue("@Data_zwrotu", TextBox7.Text.Trim());

                    cmd.ExecuteNonQuery();

                    // odejmowanie książki z listy dostępnych
                    cmd = new SqlCommand("UPDATE KsiazkaTab SET Aktualna_liczba_sztuk = Aktualna_liczba_sztuk-1 WHERE Ksiazka_ID = '" + TextBox2.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Write("<script>alert('Wypożyczono książkę.');</script>");
                    wyczyscPola();
                    //GridView1.DataBind();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Twoje konto nie ma uprawnień do wypożyczania książek.');</script>");
                }
            }
            catch (Exception ex)
            {
                //Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //void oddaj()
        //{
        //    try
        //    {
        //        SqlConnection con = new SqlConnection(strcon);
        //        if (con.State == ConnectionState.Closed)
        //        {
        //            con.Open();
        //        }

        //        SqlCommand cmd = new SqlCommand("DELETE FROM WypozyczenieTab WHERE Ksiazka_ID='" + TextBox2.Text.Trim() + "' AND id_user='" + TextBox1.Text.Trim() + "'", con);
        //        int result = cmd.ExecuteNonQuery();

        //        if (result > 0)
        //        {
        //            cmd = new SqlCommand("INSERT INTO KsDoZwrotuTab(ID_user, imie, nazwisko, ID_ksiazka, tytul, zwrocono, data_zwrotu) VALUES (@ID_user, @imie, @nazwisko, @ID_ksiazka, @tytul, @zwrocono, @data_zwrotu)", con);

        //            cmd.Parameters.AddWithValue("@ID_user", TextBox1.Text.Trim());
        //            cmd.Parameters.AddWithValue("@imie", TextBox3.Text.Trim());
        //            cmd.Parameters.AddWithValue("@nazwisko", TextBox4.Text.Trim());
        //            cmd.Parameters.AddWithValue("@ID_ksiazka", TextBox2.Text.Trim());
        //            cmd.Parameters.AddWithValue("@tytul", TextBox5.Text.Trim());
        //            cmd.Parameters.AddWithValue("@zwrocono", TextBox6.Text.Trim());
        //            cmd.Parameters.AddWithValue("@data_zwrotu", TextBox7.Text.Trim());

        //            cmd.ExecuteNonQuery();
        //            con.Close();


        //            Response.Write("<script>alert('Pomyślnie zwrócono książkę.');</script>");
        //            //GridView1.DataBind();
        //            con.Close();

        //        }
        //        else
        //        {
        //            Response.Write("<script>alert('Błędne dane!');</script>");
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        //Response.Write("<script>alert('" + ex.Message + "');</script>");
        //    }
        //}

        bool czyWypozyczenieIstnieje()
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("SELECT * FROM WypozyczenieTab WHERE id_user='" + TextBox1.Text.Trim() + "' AND Ksiazka_ID='" + TextBox2.Text.Trim() + "'", con);
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
                    SqlCommand cmd = new SqlCommand("SELECT Tytul FROM KsiazkaTab WHERE Ksiazka_ID='" + TextBox2.Text.Trim() + "'AND Aktualna_liczba_sztuk > 0", con);
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
                SqlCommand cmd = new SqlCommand("SELECT Tytul FROM KsiazkaTab WHERE Ksiazka_ID='" + TextBox2.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                   TextBox5.Text = dt.Rows[0]["Tytul"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Błędne ID książki!');</script>");
                }

                cmd = new SqlCommand("SELECT imie, nazwisko, status_konta FROM UserTab WHERE id_user='" + Session["username"] + "'", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox1.Text = Session["username"].ToString();
                    TextBox3.Text = dt.Rows[0]["imie"].ToString();
                    TextBox4.Text = dt.Rows[0]["nazwisko"].ToString();
                    TextBox8.Text = dt.Rows[0]["status_konta"].ToString();
                    TextBox6.Text = DateTime.Today.ToString("yyyy-MM-dd");
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
        }

        void wyczyscPola()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
        }
    }
}