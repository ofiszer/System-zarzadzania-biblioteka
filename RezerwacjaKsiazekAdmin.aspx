<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RezerwacjaKsiazekAdmin.aspx.cs" Inherits="BibliotekaWebAppNoAuth.RezerwacjaKsiazekAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">
        $(document).ready(function () {
            $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        } );
        </script>
    <link rel="stylesheet" href="css/RezerwacjaAdminStyle.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                
                <div class="card">
                    <center>
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="Images/ksiazka_w_rece.png" width="200"/>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Zarezerwowane</h3>
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
                                <label>ID użytkownika</label>
                                   <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="użytkownik"></asp:TextBox>
                                   </div>
                            </div>
                            <div class="col-md-6">
                                <label>ID książki</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="książka"></asp:TextBox>
                                            <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="szukaj" OnClick="Button1_Click1" />
                                        </div>
                                    </div>
                                </div>
                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <label>Imię</label>
                                   <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox3" runat="server" placeholder="imię" ReadOnly="true"></asp:TextBox>
                                   </div>
                            </div>
                            
                            <div class="col-md-6">
                                <label>Nazwisko</label>
                                   <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox4" runat="server" placeholder="nazwisko" ReadOnly="true"></asp:TextBox>
                                   </div>
                            </div>
                            
                            <%--<div class="col-md-6">
                                <label>Status konta</label>
                                   <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox5" runat="server" placeholder="status" ReadOnly="true"></asp:TextBox>
                                   </div>
                            </div>--%>
                            <div class="col-md-8">
                                <label>Tytuł książki</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox5" runat="server" placeholder="książka" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                        </div>

                        <center>
                                <div class="row">
                                    <div class="col-md-6">
                                          <asp:Button class="btn btn-lg btn-block btn-primary" ID="Button2" runat="server" Text="Wyczyść" OnClick="Button2_Click1"></asp:Button>
                                    </div>
                                   
                                    <div class="col-md-6">
                                          <asp:Button class="btn btn-lg btn-block btn-danger" ID="Button3" runat="server" Text="Usuń" OnClick="Button3_Click1"></asp:Button>
                                    </div>

                                </div></center>
                                
                    </div>
                    </center>
                    <br />
                    <a href="HomePage.aspx">Powrót do strony głównej</a><br />
                </div>

                
            </div>

            <div class="col-md-6">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="Images/ksiazka1.png" width="100"/>
                                </center>
                            </div>
                        </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Użytkownicy, którzy zarezerwowali książki</h3>
                                    </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:BibliotekaWebNoAuthConnectionStringOK %>' SelectCommand="SELECT * FROM [RezerwujTab]"></asp:SqlDataSource>
                                <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="ID_user" HeaderText="ID uzytkownika" SortExpression="ID_user"></asp:BoundField>
                                        <asp:BoundField DataField="imie" HeaderText="Imię" SortExpression="imie"></asp:BoundField>
                                        <asp:BoundField DataField="nazwisko" HeaderText="Nazwisko" SortExpression="nazwisko"></asp:BoundField>
                                        <asp:BoundField DataField="ID_ksiazki" HeaderText="ID książki" SortExpression="ID_ksiazki"></asp:BoundField>
                                        <asp:BoundField DataField="tytul" HeaderText="Tytuł" SortExpression="tytul"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
</asp:Content>
