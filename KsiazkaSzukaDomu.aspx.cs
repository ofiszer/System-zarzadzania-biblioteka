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
    public partial class KsiazkaSzukaDomu : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static int global_ile_sztuk;

        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (Session["role"] != "admin")//jeśli użytkownik nie jest adminem, zostanie przekierowany na stronę domową
            {
                Response.Redirect("HomePage.aspx");
            }
            */
            
        }


        //szukaj
        protected void Button1_Click(object sender, EventArgs e)
        {
            szukajID();
        }


        //dodaj
        protected void Button5_Click(object sender, EventArgs e)
        {
            if (czyKsiazkaIstnieje())
            {
                if (czyKSDIstnieje() == true)
                {
                    Response.Write("<script>alert('Ta książka już jest w KSD.');</script>");
                }
                else
                {
                    if (czyKSDIstnieje() == false)
                    {
                        dodajDoKSD();
                    }
                    else
                    {
                        Response.Write("<script>alert('Taka książka już jest w tej tabeli.');</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Błędne ID książki lub książka chwilowo niedostępna.');</script>");
            }
        }

        //edytuj
        protected void Button6_Click(object sender, EventArgs e)
        {
            edytuj();
        }

        //usun
        protected void Button7_Click(object sender, EventArgs e)
        {
            usunKsiazke();
        }


        void szukajID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM KsiazkaTab WHERE Ksiazka_ID ='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0]["Tytul"].ToString();
                    TextBox3.Text = dt.Rows[0]["Jezyk"].ToString().Trim();
                    TextBox4.Text = dt.Rows[0]["Wydawnictwo"].ToString().Trim();
                    TextBox5.Text = dt.Rows[0]["Autor_imie"].ToString();
                    TextBox6.Text = dt.Rows[0]["Data_wydania"].ToString().Trim();
                    TextBox7.Text = dt.Rows[0]["Gatunek"].ToString();
                    TextBox8.Text = dt.Rows[0]["Wydanie"].ToString().Trim();
                    TextBox9.Text = dt.Rows[0]["Strony"].ToString().Trim();
                    TextBox10.Text = dt.Rows[0]["Oprawa"].ToString();
                    TextBox12.Text = dt.Rows[0]["Opis"].ToString();

                    global_ile_sztuk = Convert.ToInt32(dt.Rows[0]["Ile_sztuk"].ToString().Trim());
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Nie znaleziono książki lub książka niedostępna.');</script>");
            }
        }

        bool czyKSDIstnieje()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM KSD WHERE ID_ksiazka=@ID", con);
                    cmd.Parameters.AddWithValue("@ID", TextBox1.Text.Trim());
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
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
                SqlCommand cmd = new SqlCommand("SELECT Tytul FROM KsiazkaTab WHERE Ksiazka_ID='" + TextBox1.Text.Trim() + "'AND Aktualna_liczba_sztuk > 0", con);
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
                Response.Write("<script>alert('Książka już jest w KSD, wybierz inną.');</script>");
                return false;
            }
        }


        void dodajDoKSD()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                if (czyKsiazkaIstnieje())
                {
                    if (TextBox1.Text.Trim() == "" || TextBox1.Text.Trim() == null)
                    {
                        Response.Write("<script>alert('Numer ID nie może być pusty!');</script>");
                    }
                    else if (TextBox11.Text.Trim() == "" || TextBox11.Text.Trim() == null)
                    {
                        Response.Write("<script>alert('Liczba sztuk nie może być 0!');</script>");
                    }
                    else
                    {
                        if (czyKSDIstnieje() == true)
                        {
                            Response.Write("<script>alert('Ta książka już jest w KSD!');</script>");
                        }
                        else
                        {
                            SqlCommand cmd = new SqlCommand("INSERT INTO KSD(ID_ksiazka, Tytul, Gatunek, Autor, Wydawnictwo, Data_wydania, Jezyk, Wydanie, Strony, Oprawa, Ile_sztuk, Opis) VALUES (@ID_ksiazka, @Tytul, @Gatunek, @Autor, @Wydawnictwo, @Data_Wydania, @Jezyk, @Wydanie, @Strony, @Oprawa, @Ile_sztuk, @Opis)", con);

                            cmd.Parameters.AddWithValue("@ID_ksiazka", TextBox1.Text.Trim());
                            cmd.Parameters.AddWithValue("@Tytul", TextBox2.Text.Trim());
                            cmd.Parameters.AddWithValue("@Jezyk", TextBox3.Text.Trim());
                            cmd.Parameters.AddWithValue("@Wydawnictwo", TextBox4.Text.Trim());
                            cmd.Parameters.AddWithValue("@Autor", TextBox5.Text.Trim());
                            cmd.Parameters.AddWithValue("@Data_wydania", TextBox6.Text.Trim());
                            cmd.Parameters.AddWithValue("@Gatunek", TextBox7.Text.Trim());
                            cmd.Parameters.AddWithValue("@Wydanie", TextBox8.Text.Trim());
                            cmd.Parameters.AddWithValue("@Strony", TextBox9.Text.Trim());
                            cmd.Parameters.AddWithValue("@Oprawa", TextBox10.Text.Trim());
                            cmd.Parameters.AddWithValue("@Ile_sztuk", TextBox11.Text.Trim());
                            cmd.Parameters.AddWithValue("@Opis", TextBox12.Text.Trim());

                            cmd.ExecuteNonQuery();

                            // odejmowanie książki z listy dostępnych
                            //cmd = new SqlCommand("UPDATE KsiazkaTab SET Aktualna_liczba_sztuk = Aktualna_liczba_sztuk-1 WHERE Ksiazka_ID = '" + TextBox1.Text.Trim() + "'", con);
                            cmd = new SqlCommand("UPDATE KsiazkaTab SET Ile_sztuk = Ile_sztuk-1, Aktualna_liczba_sztuk = Aktualna_liczba_sztuk-1 WHERE Ksiazka_ID = '" + TextBox1.Text.Trim() + "'", con);
                            cmd.ExecuteNonQuery();
                            con.Close();

                            Response.Write("<script>alert('Dodano książkę do listy KSD.');</script>");
                            GridView1.DataBind();
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('Coś nie tak.');</script>");
               }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Nie udało się dodać książki do KSD.');</script>");
            }
        }

        void edytuj()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                if (czyKsiazkaIstnieje())
                {
                    if (TextBox1.Text.Trim() == "" || TextBox1.Text.Trim() == null)
                    {
                        Response.Write("<script>alert('Numer ID nie może być pusty!');</script>");
                    }
                    else if (TextBox11.Text.Trim() == "" || TextBox11.Text.Trim() == null)
                    {
                        Response.Write("<script>alert('Liczba sztuk nie może być 0!');</script>");
                    }
                    else
                    {
                        if (czyKSDIstnieje() == true)
                        {
                            //SqlCommand cmd = new SqlCommand("INSERT INTO KSD(ID_ksiazka, Tytul, Gatunek, Autor, Wydawnictwo, Data_wydania, Jezyk, Wydanie, Strony, Oprawa, Ile_sztuk, Opis) VALUES (@ID_ksiazka, @Tytul, @Gatunek, @Autor, @Wydawnictwo, @Data_Wydania, @Jezyk, @Wydanie, @Strony, @Oprawa, @Ile_sztuk, @Opis)", con);
                            SqlCommand cmd = new SqlCommand("UPDATE KSD SET Ile_sztuk=@Ile_sztuk WHERE ID_ksiazka='" + TextBox1.Text.Trim() + "'", con);

                            cmd.Parameters.AddWithValue("@Ile_sztuk", TextBox11.Text.Trim());

                            //cmd.ExecuteNonQuery();

                            // odejmowanie książki z listy dostępnych
                            //cmd = new SqlCommand("UPDATE KsiazkaTab SET Aktualna_liczba_sztuk = Aktualna_liczba_sztuk-1 WHERE Ksiazka_ID = '" + TextBox1.Text.Trim() + "'", con);
                            //cmd = new SqlCommand("UPDATE KsiazkaTab SET Ile_sztuk = Ile_sztuk-1, Aktualna_liczba_sztuk = Aktualna_liczba_sztuk-1 WHERE Ksiazka_ID = '" + TextBox1.Text.Trim() + "'", con);

                            cmd.ExecuteNonQuery();
                            con.Close();

                            Response.Write("<script>alert('Edytowano książkę w KSD.');</script>");
                            GridView1.DataBind();
                        }
                        else
                        {
                            Response.Write("<script>alert('Książka o podanym numerze ID nie istnieje w KSD!');</script>");
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('Coś nie tak.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Nie udało się edytować książki w KSD.');</script>");
            }
        }

        void usunKsiazke()
        {
            if (czyKsiazkaIstnieje())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE FROM KSD WHERE ID_ksiazka='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Usunięto książkę');</script>");

                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Błędne ID książki');</script>");
            }
        }
    }
}