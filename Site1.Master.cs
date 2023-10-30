using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BibliotekaWebAppNoAuth
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null)
                {
                    LinkButton1.Visible = true;       //logowanie
                    LinkButton5.Visible = false;      //wypożycz
                    LinkButton13.Visible = false;     //przygarnij książkę
                    LinkButton18.Visible = false;     //rezerwuj książkę
                    LinkButton15.Visible = false;     //oddaj
                    LinkButton2.Visible = true;       //rejestracja
                    LinkButton3.Visible = false;      //wylogowanie
                    LinkButton7.Visible = false;      //witaj

                    LinkButton6.Visible = true;       //logowanie admina
                    LinkButton11.Visible = false;     //autor
                    LinkButton12.Visible = false;     //wydawca
                    LinkButton8.Visible = false;      //dodaj książkę
                    LinkButton16.Visible = false;     //KSD
                    LinkButton9.Visible = false;      //wypożyczone
                    LinkButton17.Visible = false;     //zarezerwowane
                    LinkButton14.Visible = false;     //do zwrotu
                    LinkButton10.Visible = false;     //zarządzanie użytkownikami
                }
                else if (Session["role"].Equals("user"))
                {
                    LinkButton1.Visible = false;      //logowanie
                    LinkButton5.Visible = true;       //wypożycz
                    LinkButton13.Visible = true;      //przygarnij książkę
                    LinkButton18.Visible = true;      //rezerwuj książkę
                    LinkButton15.Visible = true;      //oddaj
                    LinkButton2.Visible = false;      //rejestracja
                    LinkButton3.Visible = true;       //wylogowanie
                    LinkButton7.Visible = true;       //witaj
                    LinkButton7.Text = "Witaj, " + Session["name"].ToString();

                    LinkButton6.Visible = false;      //logowanie admina
                    LinkButton11.Visible = false;     //autor
                    LinkButton12.Visible = false;     //wydawca
                    LinkButton8.Visible = false;      //dodaj książkę
                    LinkButton16.Visible = false;     //KSD
                    LinkButton9.Visible = false;      //wypożyczone
                    LinkButton17.Visible = false;     //zarezerwowane
                    LinkButton14.Visible = false;     //do zwrotu
                    LinkButton10.Visible = false;     //zarządzanie użytkownikami

                }
                else if (Session["role"].Equals("admin"))
                {
                    LinkButton1.Visible = false;     //logowanie
                    LinkButton13.Visible = false;    //przygarnij książkę
                    LinkButton18.Visible = false;    //rezerwuj książkę
                    LinkButton5.Visible = false;     //wypożycz
                    LinkButton2.Visible = false;     //rejestracja
                    LinkButton3.Visible = true;      //wylogowanie
                    LinkButton7.Visible = true;      //witaj
                    LinkButton7.Text = "Witaj, Adminie " + Session["fullname"].ToString();


                    LinkButton6.Visible = false;     //logowanie admina
                    LinkButton11.Visible = true;     //autor
                    LinkButton12.Visible = true;     //wydawca
                    LinkButton8.Visible = true;      //dodaj książkę
                    LinkButton16.Visible = true;     //KSD
                    LinkButton9.Visible = true;      //wypożyczone
                    LinkButton17.Visible = true;     //zarezerwowane
                    LinkButton14.Visible = true;     //do zwrotu
                    LinkButton10.Visible = true;     //zarządzanie użytkownikami
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDodajAutora.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDodajWydawce.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminListaKsiazek.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminWypozyczone.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("UzytkownicyZarzadzanie.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Logowanie.aspx");
        }

        // wylogowanie
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["name"] = "";
            Session["last_name"] = "";
            Session["role"] = "";
            Session["status"] = "";

            LinkButton1.Visible = true;     //logowanie
            LinkButton2.Visible = true;     //rejestracja
            LinkButton13.Visible = false;   //przygarnij książkę
            LinkButton18.Visible = false;   //rezerwuj książkę
            LinkButton3.Visible = false;    //wylogowanie
            LinkButton7.Visible = false;    //witaj

            LinkButton6.Visible = true;     //logowanie dla admina
            LinkButton11.Visible = false;   //dodaj autora
            LinkButton12.Visible = false;   //dodaj wydawcę
            LinkButton8.Visible = false;    //dodaj książkę
            LinkButton9.Visible = false;    //wypożycz książkę
            LinkButton10.Visible = false;   //zarządzanie użytkownikami

            Response.Write("<script>alert('Wylogowano');</script>");

            Response.Redirect("HomePage.aspx");
        }

        // zobacz profil
        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            if (Session["role"].Equals("user"))
            {
                Response.Redirect("ProfilUzytkownika.aspx");
            }
            else if (Session["role"].Equals("admin"))
            {
                Response.Redirect("adminprofil.aspx");
            }

        }

        // rejestracja
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Rejestracja.aspx");
        }

        // przeglądaj książki
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("PrzegladajKsiazki.aspx");
        }

        // wypożycz książki
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Wypozycz.aspx");
        }

        // oddaj książki
        protected void LinkButton15_Click(object sender, EventArgs e)
        {
            Response.Redirect("OddajKsiazke.aspx");
        }

        //przygarnij
        protected void LinkButton13_Click(object sender, EventArgs e)
        {
            Response.Redirect("PrzygarnijKsiazke.aspx");
        }

        //do zwrotu
        protected void LinkButton14_Click(object sender, EventArgs e)
        {
            Response.Redirect("DoZwrotu.aspx");
        }

        //Ksiazka Szuka Domu
        protected void LinkButton16_Click(object sender, EventArgs e)
        {
            Response.Redirect("KsiazkaSzukaDomu.aspx");
        }

        //sprawdź zarezerwowane
        protected void LinkButton17_Click(object sender, EventArgs e)
        {
            Response.Redirect("RezerwacjaKsiazekAdmin.aspx");
        }

        //rezerwuj
        protected void LinkButton18_Click(object sender, EventArgs e)
        {
            Response.Redirect("RezerwujKsiazke.aspx");
        }

        //oddaj książkę
        protected void LinkButton15_Click1(object sender, EventArgs e)
        {
            Response.Redirect("OddajKsiazke.aspx");
        }
    }
}