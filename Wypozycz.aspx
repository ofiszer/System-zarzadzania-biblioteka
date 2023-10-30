<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Wypozycz.aspx.cs" Inherits="BibliotekaWebAppNoAuth.Wypozycz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

           $(document).ready(function () {
               $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
           });

    </script>
    <link rel="stylesheet" href="css/WypozyczStyle.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                
                <div class="card"><center>
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="Images/ksiazki.jpg" height="150" />
                                    <img src="Images/strzalki.png" height="100" />
                                    <img src="Images/ksiazki.jpg" height="150"/>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Wypożyczanie książek</h3>
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
                                            <asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="użytkownik" ReadOnly="True"></asp:TextBox>
                                   </div>
                            </div>
                            <div class="col-md-6">
                                <label>ID książki</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="książka"></asp:TextBox>
                                            <asp:Button class="btn btn-primary" ID="Button2" runat="server" Text="szukaj" OnClick="Button2_Click" />
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
                            
                            <div class="col-md-6">
                                <label>Status konta</label>
                                   <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="status" ReadOnly="true"></asp:TextBox>
                                   </div>
                            </div>
                            <div class="col-md-8">
                                <label>Tytuł książki</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox5" runat="server" placeholder="książka" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                        </div> 


                        <div class="row">

                            <div class="col-md-6">
                                <label>Data wypożyczenia</label>
                                   <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox6" runat="server" TextMode="Date" ReadOnly="true"></asp:TextBox>
                                   </div>
                            </div>
                            <div class="col-md-6">
                                <label>Data zwrotu</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox7" runat="server" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                        </div> 

                        <center>
                                <div class="row">
                                    <div class="col-md-8">
                                        
                                          <asp:Button class="btn btn-lg btn-block btn-primary" ID="Button3" runat="server" Text="Wypożycz" OnClick="Button3_Click"></asp:Button>
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
                                
                            </div>
                        </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Miłej lektury! Tylko nie zapomnij zwrócić książki, gdy już ją przeczytasz ;-)</h3>
                                    </center>
                                <center>
                                    <img src="Images/man.png" height="300"/>
                                </center>
                                <br />

                            </div>
                        </div>


                        <%--<div class="row">
                            <div class="col">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:BibliotekaWebNoAuthConnectionStringOK %>' SelectCommand="SELECT * FROM [WypozyczenieTab]"></asp:SqlDataSource>
                                <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" Visible="True">
                                    <Columns>
                                        <asp:BoundField DataField="ID_user" HeaderText="ID użytkownika" SortExpression="ID_user"></asp:BoundField>
                                        <asp:BoundField DataField="Imie" HeaderText="Imię" SortExpression="Imie"></asp:BoundField>
                                        <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko"></asp:BoundField>
                                        <asp:BoundField DataField="Ksiazka_ID" HeaderText="ID książki" SortExpression="Ksiazka_ID"></asp:BoundField>
                                        <asp:BoundField DataField="Tytul_ksiazki" HeaderText="Tytuł" SortExpression="Tytul_ksiazki"></asp:BoundField>
                                        <asp:BoundField DataField="Data_wypozyczenia" HeaderText="Data wypożyczenia" SortExpression="Data_wypozyczenia" />
                                        <asp:BoundField DataField="Data_zwrotu" HeaderText="Data zwrotu" SortExpression="Data_zwrotu" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>--%>
                    </div>

                </div>

            </div>
        </div>

</asp:Content>