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
    public partial class DoZwrotu : System.Web.UI.Page
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

        //szukaj ksiazki
        protected void Button2_Click(object sender, EventArgs e)
        {
           wpiszNazwy();
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

                SqlCommand cmd = new SqlCommand("SELECT k.ID_user, k.ID_ksiazka, k.imie, k.nazwisko, k.tytul, k.zwrocono, k.data_zwrotu " +
                                                 "FROM KsDoZwrotuTab k " +
                                                 "WHERE k.ID_user = '" + TextBox1.Text.Trim() + "' AND k.ID_ksiazka = '" + TextBox2.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox3.Text = dt.Rows[0]["imie"].ToString();
                    TextBox4.Text = dt.Rows[0]["nazwisko"].ToString();
                    TextBox5.Text = dt.Rows[0]["tytul"].ToString();
                    TextBox6.Text = dt.Rows[0]["zwrocono"].ToString();
                    TextBox7.Text = dt.Rows[0]["data_zwrotu"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Błędne ID użytkownika lub ID książki!');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //zatwierdź
        protected void Button5_Click(object sender, EventArgs e)
        {
            zwroc();
        }


        void zwroc()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                
                SqlCommand cmd = new SqlCommand("UPDATE KsiazkaTab SET Aktualna_liczba_sztuk = Aktualna_liczba_sztuk+1 WHERE Ksiazka_ID = '" + TextBox2.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();

                // odejmowanie książki z listy wypozyczonych
                cmd = new SqlCommand("DELETE FROM KsDoZwrotuTab WHERE ID_ksiazka = '" + TextBox2.Text.Trim() + "' AND ID_user='" + TextBox1.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Książka zwrócona. Lista dostępnych pozycji zaktualizowana.');</script>");
                wyczyscPola();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                //Response.Write("<script>alert('" + ex.Message + "');</script>");
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