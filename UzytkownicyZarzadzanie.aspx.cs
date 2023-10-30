using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BibliotekaWebAppNoAuth
{
    public partial class UzytkownicyZarzadzanie : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != "admin") //jeśli użytkownik nie jest adminem, zostanie przekierowany na stronę domową
            {
                //Response.Write("<script>alert('Zaloguj się jako admin, by uzyskać dostęp do tej strony.');</script>");
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                GridView1.DataBind();
            }
        }

        //szukaj
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            znajdzIDUzytkownika();
        }


        // aktywny
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            aktualizujUzytkownika("aktywny");
        }

        // wstrzymany
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            aktualizujUzytkownika("wstrzymany");
        }

        // usuniety
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            aktualizujUzytkownika("nieaktywny");
        }

        // czerwony guzik "usuń użytkownika"
        protected void Button5_Click(object sender, EventArgs e)
        {
            if (czyUzytkownikMaNieoddaneKsiazki() == true)
            {
                Response.Write("<script>alert('UWAGA! UŻYTKOWNIK NIE ZWRÓCIŁ WSZYSTKICH KSIĄŻEK!');</script>");
            }
            else if (czyKsiazkiOczekujaNaOddanie() == true)
            {
                Response.Write("<script>alert('W zakładce <Książki do zwrotu> są pozycje zwrócone przez użytkownika o zadanym ID, które czekają na zatwierdzenie. ');</script>");
            }
            else
            {
                usunUsera();
            }
        }

        bool czyUserIstnieje()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM UserTab WHERE id_user='" + TextBox1.Text.Trim() + "';", con);
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
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }



        bool czyUzytkownikMaNieoddaneKsiazki()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM WypozyczenieTab WHERE ID_user='" + TextBox1.Text.Trim() + "'", con);
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

        bool czyKsiazkiOczekujaNaOddanie()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT FROM KsDoZwrotuTab WHERE ID_user='" + TextBox1.Text.Trim() + "'", con);
    
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

        void usunUsera()
        {
            if (czyUserIstnieje())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }


                    SqlCommand cmd = new SqlCommand("DELETE FROM UserTab WHERE id_user='" + TextBox1.Text.Trim() + "'", con);
                    //SqlCommand cmd = new SqlCommand("SELECT FROM KsDoZwrotuTab WHERE ID_user='" + TextBox1.Text.Trim() + "'", con);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    //if (dt.Rows.Count >= 1)
                    //{
                    //    Response.Write("<script>alert('W zakładce <Książki do zwrotu> są pozycje zwrócone przez użytkownika o zadanym ID, które czekają na zatwierdzenie. ');</script>");
                    //}
                    //else if (dt.Rows.Count == 0 )
                    //{
                    //    cmd = new SqlCommand("DELETE FROM UserTab WHERE id_user='" + TextBox1.Text.Trim() + "'", con);
                    //    cmd.ExecuteNonQuery();
                    //    con.Close();
                    //    Response.Write("<script>alert('Użytkownik usunięty pomyślnie');</script>");
                    //    czystyFormularz();
                    //    GridView1.DataBind();
                    //}
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Użytkownik usunięty pomyślnie');</script>");
                    czystyFormularz();
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Błędne ID');</script>");
            }
        }

        void znajdzIDUzytkownika()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM UserTab WHERE id_user='" + TextBox1.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox2.Text = dr.GetValue(0).ToString();  // imie
                        TextBox10.Text = dr.GetValue(1).ToString(); // nazwisko
                        TextBox1.Text = dr.GetValue(8).ToString();  // id
                        TextBox4.Text = dr.GetValue(2).ToString();  // data urodzenia
                        TextBox3.Text = dr.GetValue(10).ToString(); // status konta
                        TextBox5.Text = dr.GetValue(3).ToString();  // numer telefonu
                        TextBox6.Text = dr.GetValue(4).ToString();  // email
                        TextBox7.Text = dr.GetValue(5).ToString();  // adres
                        TextBox8.Text = dr.GetValue(6).ToString();  // kod pocztowy
                        TextBox9.Text = dr.GetValue(7).ToString();  // miasto
                    }

                }
                else
                {
                    Response.Write("<script>alert('Błędne dane');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void aktualizujUzytkownika(string status)
        {
            if (czyUserIstnieje())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }
                    SqlCommand cmd = new SqlCommand("UPDATE UserTab SET status_konta='" + status + "' WHERE id_user='" + TextBox1.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Status edytowany');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Błędne ID');</script>");
            }

        }

        void czystyFormularz()
        {
            TextBox2.Text = "";  // imie
            TextBox10.Text = ""; // nazwisko
            TextBox1.Text = "";  // id
            TextBox3.Text = "";  // status konta 
            TextBox4.Text = "";  // data urodzenia
            TextBox6.Text = "";  // email
            TextBox5.Text = "";  // telefon
            TextBox7.Text = "";  // adres
            TextBox8.Text = "";  // kod pocztowy
            TextBox9.Text = "";  // miasto
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            czystyFormularz();
        }
    }
}