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
    public partial class AdminPublisherManagement : System.Web.UI.Page
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

        // dodaj wydawcę
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (czyWydawcaIstnieje())
            {
                Response.Write("<script>alert('Wydawca z podanym ID już istnieje.');</script>");
            }
            else
            {
                dodajWydawce();
            }
        }

        // edytuj wydawcę
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (czyWydawcaIstnieje())
            {
                edytujWydawce();
            }
            else
            {
                Response.Write("<script>alert('Wydawca o podanym ID nie istnieje.');</script>");
            }
        }

        // usuń wydawcę
        protected void Button5_Click(object sender, EventArgs e)
        {
            if (czyWydawcaIstnieje())
            {
                usunWydawce();
            }
            else
            {
                Response.Write("<script>alert('Wydawca o tym ID nie istnieje.');</script>");
            }
        }

        // szukaj
        protected void Button2_Click(object sender, EventArgs e)
        {
            znajdzWydawceID();
        }


        // funkcje
        void znajdzWydawceID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM WydTab WHERE Wydawca_ID='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox3.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wydawca o tym ID nie istnieje.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }



        bool czyWydawcaIstnieje()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM WydTab WHERE Wydawca_id='" + TextBox1.Text.Trim() + "';", con);
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


        void dodajWydawce()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO WydTab(Wydawca_ID,Wydawca_nazwa) values(@Wydawca_ID,@Wydawca_nazwa)", con);

                cmd.Parameters.AddWithValue("@Wydawca_ID", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Wydawca_nazwa", TextBox3.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Wydawca dodany pomyślnie.');</script>");
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        public void edytujWydawce()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE WydTab SET Wydawca_nazwa=@Wydawca_nazwa WHERE Wydawca_ID='" + TextBox1.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@Wydawca_nazwa", TextBox3.Text.Trim());
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    Response.Write("<script>alert('Wydawca edytowany pomyślnie');</script>");
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Wydawca o podanym ID nie istnieje');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        public void usunWydawce()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM WydTab WHERE Wydawca_ID='" + TextBox1.Text.Trim() + "'", con);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    Response.Write("<script>alert('Wydawca usunięty pomyślnie');</script>");
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Wydawca o podanym ID nie istnieje');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}