using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BibliotekaWebAppNoAuth
{
    public partial class Rejestracja : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

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
                SqlCommand cmd = new SqlCommand("SELECT * FROM UserTab WHERE id_user='" + TextBox8.Text.Trim() + "';", con);
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

        void zapiszUsera()
        {
            string password = TextBox10.Text.Trim();
            if (TextBox11.Text.Trim() != password)
            {
                Response.Write("<script>alert('Hasła nie są jednakowe.');</script>");
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
                    SqlCommand cmd = new SqlCommand("INSERT INTO UserTab(imie,nazwisko,data_ur,telefon,email,adres,kod_pocztowy,miasto,id_user,haslo,status_konta) values(@imie,@nazwisko,@data_ur,@telefon,@email,@adres,@kod_pocztowy,@miasto,@id_user,@haslo,@status_konta)", con);

                    cmd.Parameters.AddWithValue("@imie", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@nazwisko", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@data_ur", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@telefon", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@adres", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@kod_pocztowy", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@miasto", TextBox8.Text.Trim());
                    cmd.Parameters.AddWithValue("@id_user", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@haslo", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@status_konta", "oczekujący");

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Pomyślnie zarejestrowano użytkownika. Idź do strony logowania.');</script>");

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }



        // pole 'rejestracja' jest tu
        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (czyUzytkownikIstnieje())
            {
                Response.Write("<script>alert('Użytkownik o podanym numerze już istnieje! Wybierz inny numer ID');</script>");
            }
            else if(TextBox9.Text.Trim() == "" || TextBox9.Text.Trim() == null)
            {
                Response.Write("<script>alert('Numer ID nie może być pusty!');</script>");
            }
            else
            {
                zapiszUsera();
            }
        }
    }
}