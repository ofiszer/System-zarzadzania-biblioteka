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
    public partial class AdminBookInventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_obrazek;
        static int global_aktualna_liczba_sztuk, global_ile_sztuk, global_wypozyczone;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != "admin")//jeśli użytkownik nie jest adminem, zostanie przekierowany na stronę domową
            {
                Response.Redirect("HomePage.aspx");
            }
            else if (!IsPostBack)
            {
                wpiszAutoraiWydawce();
            }

            GridView1.DataBind();
        }


        // szukaj
        protected void Button1_Click(object sender, EventArgs e)
        {
            szukajID();
        }

        //dodaj
        protected void Button5_Click(object sender, EventArgs e)
        {
            if (czyKsiazkaIstnieje())
            {
                Response.Write("<script>alert('Książka o podanym ID istnieje! Wypróbuj inne ID.');</script>");
            }
            else
            {
                dodajKsiazke();
            }
        }

        // edytuj
        protected void Button6_Click(object sender, EventArgs e)
        {
            edytujKsiazke();
        }

        // usun
        protected void Button7_Click(object sender, EventArgs e)
        {
            usunKsiazke();
        }


        // własne funkcje

        void edytujKsiazke()
        {
            if (czyKsiazkaIstnieje())
            {
                try
                {
                    int actual_stock = Convert.ToInt32(TextBox4.Text.Trim());
                    int current_stock = Convert.ToInt32(TextBox5.Text.Trim());

                    if (global_ile_sztuk == actual_stock)
                    {

                    }
                    else
                    {
                        if (actual_stock < global_wypozyczone)
                        {
                            Response.Write("<script>alert('Dostępnych książek nie może być mniej niż wypożyczonych!');</script>");
                            return;
                        }
                        else
                        {
                            current_stock = actual_stock - global_wypozyczone;
                            TextBox5.Text = "" + current_stock;
                        }
                    }

                    string genres = "";
                    foreach (int i in ListBox1.GetSelectedIndices())
                    {
                        genres = genres + ListBox1.Items[i] + "/";
                    }
                    genres = genres.Remove(genres.Length - 1);

                    string filepath = "~/book_inventory/books1";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_obrazek;
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                        filepath = "~/book_inventory/" + filename;
                    }

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    
                    SqlCommand cmd = new SqlCommand("UPDATE KsiazkaTab SET Tytul=@Tytul, Gatunek=@Gatunek, Autor_imie=@Autor_imie, Wydawnictwo=@Wydawnictwo, Data_wydania=@Data_wydania, Jezyk=@Jezyk, Wydanie=@Wydanie, Strony=@Strony, Oprawa=@Oprawa, Opis=@Opis, Ile_sztuk=@Ile_sztuk, Aktualna_liczba_sztuk=@Aktualna_liczba_sztuk, Obrazek=@Obrazek WHERE Ksiazka_ID='" + TextBox1.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@Ksiazka_ID", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Tytul", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@Gatunek", genres);
                    cmd.Parameters.AddWithValue("@Autor_imie", DropDownList3.Text.Trim());
                    cmd.Parameters.AddWithValue("@Wydawnictwo", DropDownList2.Text.Trim());
                    cmd.Parameters.AddWithValue("@Data_wydania", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@Jezyk", DropDownList1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Wydanie", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@Strony", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@Oprawa", DropDownList4.Text.Trim());
                    cmd.Parameters.AddWithValue("@Opis", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@Ile_sztuk", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@Aktualna_liczba_sztuk", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@Obrazek", filepath);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Edytowano książkę.');</script>");
                    wyczyscPola();
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
                    TextBox3.Text = dt.Rows[0]["Data_wydania"].ToString().Trim();
                    TextBox7.Text = dt.Rows[0]["Wydanie"].ToString();
                    TextBox9.Text = dt.Rows[0]["Strony"].ToString().Trim();
                    TextBox4.Text = dt.Rows[0]["Ile_sztuk"].ToString().Trim();
                    TextBox5.Text = dt.Rows[0]["Aktualna_liczba_sztuk"].ToString().Trim();
                    TextBox6.Text = "" + (Convert.ToInt32(dt.Rows[0]["Ile_sztuk"].ToString()) - Convert.ToInt32(dt.Rows[0]["Aktualna_liczba_sztuk"].ToString()));
                    TextBox10.Text = dt.Rows[0]["Opis"].ToString();

                    DropDownList1.SelectedValue = dt.Rows[0]["Jezyk"].ToString().Trim();
                    DropDownList2.SelectedValue = dt.Rows[0]["Wydawnictwo"].ToString().Trim();
                    DropDownList3.SelectedValue = dt.Rows[0]["Autor_imie"].ToString().Trim();
                    DropDownList4.SelectedValue = dt.Rows[0]["Oprawa"].ToString().Trim();

                    ListBox1.ClearSelection();
                    string[] genre = dt.Rows[0]["Gatunek"].ToString().Trim().Split('/');
                    for(int i = 0; i < genre.Length; i++)
                    {
                        for(int j = 0; j < ListBox1.Items.Count; j++)
                        {
                            if(ListBox1.Items[j].ToString() == genre[i])
                            {
                                ListBox1.Items[j].Selected = true;
                            }
                            else
                            {
                                ListBox1.Items[j].Selected = false;
                            }
                        }
                    }
                    
                    global_ile_sztuk = Convert.ToInt32(dt.Rows[0]["Ile_sztuk"].ToString().Trim());
                    global_aktualna_liczba_sztuk = Convert.ToInt32(dt.Rows[0]["Aktualna_liczba_sztuk"].ToString().Trim());
                    global_wypozyczone = global_ile_sztuk - global_aktualna_liczba_sztuk;
                    global_obrazek = dt.Rows[0]["Obrazek"].ToString();
                }
            }
            catch (Exception ex)
            {

            }
        }


        void wpiszAutoraiWydawce()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT Autor_imie_naz FROM AutorTab;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "Autor_imie_naz";
                DropDownList3.DataBind();
           
                cmd = new SqlCommand("SELECT Wydawca_nazwa FROM WydTab;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "Wydawca_nazwa";
                DropDownList2.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        void dodajKsiazke()
        {
            try
            {
                // wybór kilku gatunków do książki
                string genres = "";
                foreach(int i in ListBox1.GetSelectedIndices())
                {
                    genres = genres + ListBox1.Items[i] + "/";
                }
                genres = genres.Remove(genres.Length - 1);  // usunięcie znaku / z listy gatunków danej książki

                string filepath = "~/book_inventory/dziedzic-imperium.jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                filepath = "~/book_inventory/" + filename;

                if(TextBox1.Text.Trim() == "" || TextBox1.Text.Trim() == null)
                {
                    Response.Write("<script>alert('Książka musi mieć ID!');</script>");
                }
                else
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("INSERT INTO KsiazkaTab(Ksiazka_ID,Tytul,Gatunek,Autor_imie,Wydawnictwo,Data_wydania,Jezyk,Wydanie,Strony,Oprawa,Opis,Ile_sztuk,Aktualna_liczba_sztuk,Obrazek) VALUES (@Ksiazka_ID,@Tytul,@Gatunek,@Autor_imie,@Wydawnictwo,@Data_wydania,@Jezyk,@Wydanie,@Strony,@Oprawa,@Opis,@Ile_sztuk,@Aktualna_liczba_sztuk,@Obrazek)", con);
                        
                    cmd.Parameters.AddWithValue("@Ksiazka_ID", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Tytul", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@Gatunek", genres);
                    cmd.Parameters.AddWithValue("@Autor_imie", DropDownList3.Text.Trim());
                    cmd.Parameters.AddWithValue("@Wydawnictwo", DropDownList2.Text.Trim());
                    cmd.Parameters.AddWithValue("@Data_wydania", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@Jezyk", DropDownList1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Wydanie", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@Strony", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@Oprawa", DropDownList4.Text.Trim());
                    cmd.Parameters.AddWithValue("@Opis", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@Ile_sztuk", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@Aktualna_liczba_sztuk", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@Obrazek", filepath);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Zapisano nową książkę.');</script>");
                    wyczyscPola();
                    GridView1.DataBind();
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
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

                    SqlCommand cmd = new SqlCommand("DELETE FROM KsiazkaTab WHERE Ksiazka_ID='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Usunięto książkę');</script>");
                    wyczyscPola();
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


        bool czyKsiazkaIstnieje()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM KsiazkaTab WHERE Ksiazka_ID='" + TextBox1.Text.Trim() + "' AND Tytul='" + TextBox2.Text.Trim() + "';", con);
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

        //dodaj do ksd
        //protected void Button4_Click(object sender, EventArgs e)
        //{
        //    if (czyKsiazkaIstnieje())
        //    {
        //        if (czyKSDIstnieje() == true)
        //        {
        //            Response.Write("<script>alert('Ta książka już jest w KSD.');</script>");
        //        }
        //        else
        //        {
        //            /*if (czyKSDIstnieje() == false)
        //            {*/
        //                dodajDoKSD();
        //            //}
        //            /*else
        //            {
        //                Response.Write("<script>alert('Taka książka już jest w tej tabeli.');</script>");
        //            }*/
        //        }
        //    }
        //    else
        //    {
        //        Response.Write("<script>alert('Błędne ID książki lub książka chwilowo niedostępna.');</script>");
        //    }
        //}

        //szukaj do KSD
        //protected void Button3_Click(object sender, EventArgs e)
        //{
        //    szukajIDdoKSD();
        //}

        //bool czyKSDIstnieje()
        //{
        //    try
        //    {
        //        using (SqlConnection con = new SqlConnection(strcon))
        //        {
        //            con.Open();
        //            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM KSD WHERE ID_ksiazka=@ID", con);
        //            cmd.Parameters.AddWithValue("@ID", TextBox8.Text.Trim());
        //            int count = (int)cmd.ExecuteScalar();
        //            return count > 0;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return false;
        //    }
        //}

        //void dodajDoKSD()
        //{
        //    try
        //    {
        //        SqlConnection con = new SqlConnection(strcon);
        //        if (con.State == ConnectionState.Closed)
        //        {
        //            con.Open();
        //        }
        //        if (czyKsiazkaIstnieje())
        //        {
        //            if (TextBox8.Text.Trim() == "" || TextBox8.Text.Trim() == null)
        //            {
        //                Response.Write("<script>alert('Numer ID nie może być pusty!');</script>");
        //            }
        //            else if (TextBox20.Text.Trim() == "" || TextBox20.Text.Trim() == null)
        //            {
        //                Response.Write("<script>alert('Liczba sztuk nie może być 0!');</script>");
        //            }
        //            else
        //            {
        //                if (czyKSDIstnieje() == true)
        //                {
        //                    Response.Write("<script>alert('Ta książka już jest w KSD!');</script>");
        //                }
        //                else
        //                {
        //                    SqlCommand cmd = new SqlCommand("INSERT INTO KSD(ID_ksiazka, Tytul, Gatunek, Autor, Wydawnictwo, Data_wydania, Jezyk, Wydanie, Strony, Oprawa, Ile_sztuk, Opis) VALUES (@ID_ksiazka, @Tytul, @Gatunek, @Autor, @Wydawnictwo, @Data_Wydania, @Jezyk, @Wydanie, @Strony, @Oprawa, @Ile_sztuk, @Opis)", con);

        //                    cmd.Parameters.AddWithValue("@ID_ksiazka", TextBox8.Text.Trim());
        //                    cmd.Parameters.AddWithValue("@Tytul", TextBox11.Text.Trim());
        //                    cmd.Parameters.AddWithValue("@Jezyk", TextBox13.Text.Trim());
        //                    cmd.Parameters.AddWithValue("@Wydawnictwo", TextBox14.Text.Trim());
        //                    cmd.Parameters.AddWithValue("@Autor", TextBox12.Text.Trim());
        //                    cmd.Parameters.AddWithValue("@Data_wydania", TextBox15.Text.Trim());
        //                    cmd.Parameters.AddWithValue("@Gatunek", TextBox16.Text.Trim());
        //                    cmd.Parameters.AddWithValue("@Wydanie", TextBox18.Text.Trim());
        //                    cmd.Parameters.AddWithValue("@Strony", TextBox17.Text.Trim());
        //                    cmd.Parameters.AddWithValue("@Oprawa", TextBox19.Text.Trim());
        //                    cmd.Parameters.AddWithValue("@Ile_sztuk", TextBox20.Text.Trim());
        //                    cmd.Parameters.AddWithValue("@Opis", TextBox21.Text.Trim());

        //                    cmd.ExecuteNonQuery();

        //                    // odejmowanie książki z listy dostępnych
        //                    //cmd = new SqlCommand("UPDATE KsiazkaTab SET Aktualna_liczba_sztuk = Aktualna_liczba_sztuk-1 WHERE Ksiazka_ID = '" + TextBox1.Text.Trim() + "'", con);
        //                    cmd = new SqlCommand("UPDATE KsiazkaTab SET Ile_sztuk = Ile_sztuk-1, Aktualna_liczba_sztuk = Aktualna_liczba_sztuk-1 WHERE Ksiazka_ID = '" + TextBox1.Text.Trim() + "'", con);
        //                    cmd.ExecuteNonQuery();
        //                    con.Close();

        //                    Response.Write("<script>alert('Dodano książkę do listy KSD.');</script>");
        //                    GridView1.DataBind();
        //                }
        //            }
        //        }
        //        else
        //        {
        //            Response.Write("<script>alert('Coś nie tak.');</script>");
        //       }
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("<script>alert('Nie udało się dodać książki do KSD.');</script>");
        //    }
        //}

        //void szukajIDdoKSD()
        //{
        //    try
        //    {
        //        SqlConnection con = new SqlConnection(strcon);
        //        if (con.State == ConnectionState.Closed)
        //        {
        //            con.Open();
        //        }

        //        SqlCommand cmd = new SqlCommand("SELECT * FROM KsiazkaTab WHERE Ksiazka_ID ='" + TextBox8.Text.Trim() + "';", con);
        //        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //        DataTable dt = new DataTable();
        //        da.Fill(dt);
        //        if (dt.Rows.Count >= 1)
        //        {
        //            TextBox11.Text = dt.Rows[0]["Tytul"].ToString();
        //            TextBox13.Text = dt.Rows[0]["Jezyk"].ToString().Trim();
        //            TextBox14.Text = dt.Rows[0]["Wydawnictwo"].ToString().Trim();
        //            TextBox12.Text = dt.Rows[0]["Autor_imie"].ToString();
        //            TextBox15.Text = dt.Rows[0]["Data_wydania"].ToString().Trim();
        //            TextBox16.Text = dt.Rows[0]["Gatunek"].ToString();
        //            TextBox18.Text = dt.Rows[0]["Wydanie"].ToString().Trim();
        //            TextBox17.Text = dt.Rows[0]["Strony"].ToString().Trim();
        //            TextBox19.Text = dt.Rows[0]["Oprawa"].ToString();
        //            TextBox21.Text = dt.Rows[0]["Opis"].ToString();


        //            //cmd.Parameters.AddWithValue("@Tytul", TextBox11.Text.Trim());
        //            //cmd.Parameters.AddWithValue("@Jezyk", TextBox13.Text.Trim());
        //            //cmd.Parameters.AddWithValue("@Wydawnictwo", TextBox14.Text.Trim());
        //            //cmd.Parameters.AddWithValue("@Autor", TextBox12.Text.Trim());
        //            //cmd.Parameters.AddWithValue("@Data_wydania", TextBox15.Text.Trim());
        //            //cmd.Parameters.AddWithValue("@Gatunek", TextBox16.Text.Trim());
        //            //cmd.Parameters.AddWithValue("@Wydanie", TextBox18.Text.Trim());
        //            //cmd.Parameters.AddWithValue("@Strony", TextBox17.Text.Trim());
        //            //cmd.Parameters.AddWithValue("@Oprawa", TextBox19.Text.Trim());
        //            //cmd.Parameters.AddWithValue("@Ile_sztuk", TextBox20.Text.Trim());
        //            //cmd.Parameters.AddWithValue("@Opis", TextBox21.Text.Trim());

        //            //global_ile_sztuk = Convert.ToInt32(dt.Rows[0]["Ile_sztuk"].ToString().Trim());
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("<script>alert('Nie znaleziono książki lub książka niedostępna.');</script>");
        //    }
        //}
    }
}