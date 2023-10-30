<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Rejestracja.aspx.cs" Inherits="BibliotekaWebAppNoAuth.Rejestracja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
    <%--<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--%>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'UA-23581568-13');
</script>
<script defer src="https://static.cloudflareinsights.com/beacon.min.js/v52afc6f149f6479b8c77fa569edb01181681764108816" integrity="sha512-jGCTpDpBAYDGNYR5ztKt4BQPGef1P0giN6ZGVUi835kFF88FOmmn8jBQWNgrNd8g/Yu421NdgWhwQoaOPFflDw==" data-cf-beacon='{"rayId":"7c172f559da635ab","token":"cd0b4b3a733644fc843ef0b185f98241","version":"2023.4.0","si":100}' crossorigin="anonymous"></script>
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

<link rel="stylesheet" href="css/RejestracjaStyle.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="main">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-img">
                            <h2>Witaj, Molu Książkowy!</h2>
                                <img src="Images/mol-ksiazkowy-i-ksiazki.jpg" alt="Witaj, Molu Książkowy!"/>
                        </div>
               
                        <div class="signup-form">
                            <form method="POST" class="register-form" id="register-form">
                                <center><h2>Rejestracja</h2></center>
                            
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="name">Imię :</label>
                                        <asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="Imię"></asp:TextBox>
                                    </div>
                                
                                    <div class="form-group">
                                        <label for="last_name">Nazwisko :</label>
                                        <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="Nazwisko"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="address">Data urodzenia :</label>
                                    <asp:TextBox class="form-control" ID="TextBox3" textmode="Date" runat="server" placeholder="Adres"></asp:TextBox>
                                </div>

          
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="tel">Numer telefonu :</label>
                                        <asp:TextBox class="form-control" ID="TextBox4" runat="server" TextMode="Number" placeholder="Numer telefonu"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Email :</label>
                                        <asp:TextBox class="form-control" ID="TextBox5" runat="server"  TextMode="Email" placeholder="Email"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="adres">Adres :</label>
                                    <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="Adres"></asp:TextBox> 
                                </div>
                                <div class="form-group">
                                    <label for="kod">Kod pocztowy :</label>
                                    <asp:TextBox class="form-control" ID="TextBox7" runat="server" placeholder="Kod pocztowy"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="miasto">Miasto :</label>
                                    <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="Miasto"></asp:TextBox>
                                </div>
                                <div class="row">
                                    <div class="col">
                                            <center>
                                                <span class="badge badge-pill badge-info">Dane logowania</span>
                                            </center>
                                        </div>
                                    </div>
                                <div class="form-group">
                                    <label for="ID">ID :</label>
                                    <asp:TextBox class="form-control" ID="TextBox9" runat="server" placeholder="ID"></asp:TextBox>
                                    <div class="form-group">
                                        <label for="haslo">Hasło :</label>
                            
                                        <asp:TextBox class="form-control" ID="TextBox10" runat="server" placeholder="Hasło"></asp:TextBox>
                           
                                        <asp:TextBox class="form-control" ID="TextBox11" runat="server" placeholder="Powtórz hasło"></asp:TextBox>
                                        </div>
                                    </div>
                                <div class="form-submit">
                                    <asp:Button ID="Button1" class="btn btn-success btn-block btn-lg" runat="server" Text="Zarejestruj się" OnClick="Button1_Click1" />
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>       
            </div>
</asp:Content>