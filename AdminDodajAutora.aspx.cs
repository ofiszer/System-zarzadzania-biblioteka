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
    public partial class AdminAutorManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["role"] != "admin") //jeśli użytkownik nie jest adminem, zostanie przekierowany na stronę domową
            {
                //Response.Write("<script>alert('Zaloguj się jako admin, by uzyskać dostęp do tej strony.');</script>");
                Response.Redirect("HomePage.aspx");
            }

        }

        // dodaj
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (czyAutorIstnieje()) 
            { 
                Response.Write("<script>alert('Autor o podanym ID już istnieje! Wybierz inne ID.');</script>");
            }
            else
            {
                dodajAutora();
            }
        }

        // edytuj
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (czyAutorIstnieje())
            {
                edytujAutora();
            }
            else
            {
                Response.Write("<script>alert('Autor o podanym ID nie istnieje.');</script>");
            }
        }

        // usuń
        protected void Button5_Click(object sender, EventArgs e)
        {
            if (czyAutorIstnieje())
            {
                usunAutora();
            }
            else
            {
                Response.Write("<script>alert('Autor o podanym ID nie istnieje.');</script>");
            }
        }

        // szukaj
        protected void Button2_Click(object sender, EventArgs e)
        {
            szukajAutoraPoID();
        }


        void szukajAutoraPoID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM AutorTab WHERE Autor_ID='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Błędne ID Autora');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void dodajAutora()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO AutorTab(Autor_ID, Autor_imie_naz) VALUES(@aut_id,@aut_im_naz)", con);

                cmd.Parameters.AddWithValue("@aut_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@aut_im_naz", TextBox2.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Pomyślnie zapisano nowego autora.');</script>");
                wyczyscPola();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void edytujAutora()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE AutorTab SET Autor_imie_naz=@Autor_imie_naz WHERE Autor_ID='" + TextBox1.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@Autor_imie_naz", TextBox2.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Pomyślnie zaktualizowano autora.');</script>");
                wyczyscPola();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void usunAutora()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM AutorTab WHERE Autor_ID='" + TextBox1.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Pomyślnie usunięto autora.');</script>");
                wyczyscPola();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool czyAutorIstnieje()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM AutorTab WHERE Autor_ID='" + TextBox1.Text.Trim() + "';", con);
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
        }
    }
}