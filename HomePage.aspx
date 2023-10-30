<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="BibliotekaWebAppNoAuth.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style.css" rel="stylesheet" type="text/css" />
    <link href="css/GlownaStyle.css" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <div class="outer-container">
        <div class="container1">
            <div class="row">
                <div class="col-9">
                    <center>
                        <h2>Książki</h2>
                    </center>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <center>
                        <img src="Images/ksiazka1.png" class="book-image" width="100" height="100" />
                        <h4 class="section-title">Lista naszych woluminów</h4>
                        <p>Znajdź interesującą Cię pozycję.
                            <a class="nav-link" href="PrzegladajKsiazki.aspx">Przeglądaj</a>
                        </p>
                    </center>
                </div>

                <div class="col-md-3">
                    <center>
                        <img src="Images/man.png" class="book-image" width="100" height="100" />
                        <h4 class="section-title">Książka szuka domu</h4>
                        <p>Pozycje wycofane z naszych zbiorów, czekają na nowy dom.</p>
                        <a class="nav-link" href="PrzygarnijKsiazke.aspx">Sprawdź</a>
                    </center>
                </div>

            </div>
        </div>
        </div>
    </section>


    <section>
        <div class="outer-container">
        <div class="container2">
            <div class="row">
                <div class="col-9">
                    <center>
                        <h2>Użytkownicy</h2>
                    </center>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <center>
                        <img src="Images/zalogujsie.png" class="book-image" width="100" height="100" />
                        <h4>Logowanie</h4>
                        <p>Miło nam widzieć Cię ponownie!
                            <a class="nav-link" href="Logowanie.aspx">zaloguj się tutaj</a>
                        </p>
                    </center>
                </div>

                <div class="col-md-3">
                    <center>
                        <img src="Images/rejestracja.png" class="book-image" width="100" height="100" />
                        <h4>Rejestracja</h4>
                        <p>Witamy nowych moli książkowych!
                            <a class="nav-link" href="Rejestracja.aspx">załóż konto</a>
                        </p>
                    </center>
                </div>

                <div class="col-md-3">
                    <center>
                        <img src="Images/mapaikonka.png" class="book-image" width="100" height="100" />
                        <h4>Jak nas znaleźć</h4>
                        <p>Odwiedź nas osobiście!
                            <a class="nav-link" href="mapa.aspx">pokaż mapę</a>
                        </p>
                    </center>
                </div>
            </div>
        </div>
      </div>

    </section>

</asp:Content>