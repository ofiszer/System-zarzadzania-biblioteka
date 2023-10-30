<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProfilUzytkownika.aspx.cs" Inherits="BibliotekaWebAppNoAuth.ProfilUzytkownika" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });
    </script>
    <link href="css/UserProfilStyle.css" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5" id="col1">
                
                <div class="card1">
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
                                    <asp:Label ID="Label1" class="badge badge-info" runat="server" Text="Twój status"></asp:Label>
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
                                       <asp:TextBox class="form-control" ID="TextBox11" runat="server" placeholder="Nazwisko"></asp:TextBox>
                                   </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Data urodzenia</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox3" runat="server" placeholder="Data urodzenia" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                        
                            <div class="col-md-6">
                                <label>Numer telefonu</label>
                                   <div class="form-group">
                                       <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="Numer telefonu" TextMode="Number"></asp:TextBox>
                                   </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Email</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox4" runat="server" placeholder="Email"></asp:TextBox>
                                    </div>
                                </div>
    
                            <div class="col-md-6">
                                <label>Adres</label>
                                   <div class="form-group">
                                       <asp:TextBox class="form-control" ID="TextBox5" runat="server" placeholder="Adres"></asp:TextBox>
                                   </div>
                            </div>
                       </div>


                       <div class="row">
                            <div class="col-md-4">
                                <label>Kod pocztowy</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="Kod pocztowy" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                <label>Miasto</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox7" runat="server" placeholder="Miasto"></asp:TextBox>
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
                                    <div class="col-md-5">
                                        <center><label>ID/Login</label></center>
                                            <div class="form-group">
                                                <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="ID/Login" ReadOnly="True"></asp:TextBox>
                                            </div>
                                    </div>
                                    <div class="col-md-6">
                                        <center><label>Bieżące hasło</label></center>
                                            <div class="form-group">
                                                <asp:TextBox class="form-control" ID="TextBox9" runat="server" placeholder="Bieżące hasło" ReadOnly="True"></asp:TextBox>
                                            </div>
                                    </div>
                                </div>

                                    <div class="col-md-6">
                                        <center><label>Nowe hasło</label></center>
                                            <div class="form-group">
                                                <asp:TextBox class="form-control" ID="TextBox10" runat="server" placeholder="Nowe hasło" TextMode="Password"></asp:TextBox>
                                            </div>

                                        <center><label>Powtórz nowe hasło</label></center>
                                            <div class="form-group">
                                                <asp:TextBox class="form-control" ID="TextBox12" runat="server" placeholder="Nowe hasło" TextMode="Password"></asp:TextBox>
                                            </div>
                                    </div>
                                
                                </div>
                                
                        <div class="row">
                            
                            <div class="col-8 mx-auto">
                               <center>
                                    <div class="form-group">
                                        <asp:Button ID="Button1" class="btn btn-primary btn-lg btn-block" runat="server" Text="Aktualizuj" OnClick="Button1_Click" />
                                    </div>
                                </center>
                                    
                            </div>
                        </div>
                   
                </div>

                <a href="HomePage.aspx">Powrót do strony głównej</a><br /><br />
            </div>

            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="Images/ksiazki.jpg" width="150" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Twoje książki</h3>
                                        <asp:Label ID="Label2" class="badge badge-pill badge-info" runat="server" Text="Aktualnie wypożyczone"></asp:Label>
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotekaWebNoAuthConnectionStringOK %>" SelectCommand="SELECT * FROM [WypozyczenieTab]"></asp:SqlDataSource>
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                                        <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                                        <asp:BoundField DataField="Ksiazka_ID" HeaderText="ID książki" SortExpression="Ksiazka_ID" />
                                        <asp:BoundField DataField="Tytul_ksiazki" HeaderText="Tytuł" SortExpression="Tytul_ksiazki" />
                                        <asp:BoundField DataField="Data_wypozyczenia" HeaderText="Data wypożyczenia" SortExpression="Data_wypozyczenia" />
                                        <asp:BoundField DataField="Data_zwrotu" HeaderText="Termin zwrotu" SortExpression="Data_zwrotu" />
                                    </Columns>
                                </asp:GridView>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>