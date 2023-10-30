<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Logowanie.aspx.cs" Inherits="BibliotekaWebAppNoAuth.Logowanie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="vendor/jquery/jquery.min.js"></script>

<link rel="stylesheet" href="css/LogowanieStyle.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container">
        <div class="signup-content">
            <div class="signup-img">
                <h2>Witaj ponownie! Cieszymy się, że do nas wracasz!</h2>
                    <img src="Images/otwarta-ksiazka.jpg" height="400" width="400" alt="Witaj ponownie!"/>
                </div>
            
                <div class="signup-form">
                    <form method="POST" class="login-form" id="login-form">
                        <center><h2>Logowanie</h2></center>

                                <div class="form-group">
                                    <label for="ID">ID :</label>
                                        <asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                <div class="form-group">
                                    <label for="haslo">Hasło :</label>
                                        <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="Hasło" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
            
                            <div class="form-submit">
                                <asp:Button ID="Button1" class="btn btn-success btn-block btn-lg" runat="server" Text="Zaloguj się" OnClick="Button1_Click"/>        
                            </div>
                    </form>
                </div>
            </div>
        </div>
</asp:Content>
