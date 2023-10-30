<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="BibliotekaWebAppNoAuth.adminlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
<link rel="stylesheet" href="css/AdminLoginStyle.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="Images/admin.jpg" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Zaloguj się jako admin</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            
                            <div class="col">
                                   <label>ID admina</label>
                                        <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                        </div>
                               

                                <label>Hasło</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="hasło" TextMode="Password"></asp:TextBox>
                                    </div>
                                <br />

                                    <div class="form-group">
                                        <asp:Button ID="Button1" CssClass="btn btn-success btn-block btn-lg" runat="server" Text="Zaloguj się" OnClick="Button1_Click" />
                                    </div>

                            </div>
                        </div>
                    </div>
                

                <a href="HomePage.aspx">Powrót do strony głównej</a><br /><br />
                    </div>
            </div>
        </div><br />
    </div>

</asp:Content>
