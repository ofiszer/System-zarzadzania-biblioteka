<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminprofil.aspx.cs" Inherits="BibliotekaWebAppNoAuth.adminprofil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });
    </script>
    <link rel="stylesheet" href="css/AdminProfilStyle.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                
                <div class="card">
                    
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="Images/profile-icon-login-head-icon-vector.jpg" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Twój profil</h3>
                                    <span>Status konta - </span>
                                    <asp:Label ID="Label1" class="badge badge-warning" runat="server" Text="Administrator"></asp:Label>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Imię</label>
                                   <div class="form-group">
                                       <asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="Imię"></asp:TextBox>
                                   </div>
                            </div>
                            <div class="col-md-6">
                                <label>Nazwisko</label>
                                   <div class="form-group">
                                       <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="Nazwisko"></asp:TextBox>
                                   </div>
                            </div>
                        </div>
                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <center>
                                                    <span class="badge badge-pill badge-info">Dane logowania</span>
                                                </center>
                                            </div>
                                        </div>

                                <div class="row">
                                    
                                    <div class="col-md-6">
                                        
                                        <label>ID</label>
                                            <div class="form-group">
                                                <asp:TextBox class="form-control" ID="TextBox3" runat="server" placeholder="ID" ReadOnly="True"></asp:TextBox>
                                            </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Bieżące hasło</label>
                                            <div class="form-group">
                                                <asp:TextBox class="form-control" ID="TextBox4" runat="server" placeholder="Bieżące hasło" ReadOnly="True"></asp:TextBox>
                                            </div>
                                    </div> 
                                </div>
                                
                            <center><div class="row">    
                                    <div class="col-md-6">
                                        <center><label>Nowe hasło</label></center>
                                            <div class="form-group">
                                                <asp:TextBox class="form-control" ID="TextBox5" runat="server" placeholder="Nowe hasło" TextMode="Password"></asp:TextBox>
                                            </div>
                                    
                                        <center><label>Powtórz nowe hasło</label></center>
                                            <div class="form-group">
                                                <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="Nowe hasło" TextMode="Password"></asp:TextBox>
                                            </div>
                                    </div>
                            </div></center>
                       
                        <div class="row">
                            
                            <div class="col-8 mx-auto">
                               <center>
                                    <div class="form-group">
                                        <asp:Button ID="Button1" class="btn btn-primary btn-lg btn-block" runat="server" Text="Aktualizuj" OnClick="Button1_Click"/>
                                    </div>
                                </center>

                                <div class="row">
                            <div class="col">
                         </div>
                        </div>               
                     </div>
                   </div>
                </div>
                <a href="HomePage.aspx">Powrót do strony głównej</a><br /><br />
            </div>
        </div>
    </div>
</asp:Content>