<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminWypozyczone.aspx.cs" Inherits="BibliotekaWebAppNoAuth.AdminWypozyczone" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

           $(document).ready(function () {
               $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
           });

    </script>
    <link rel="stylesheet" href="css/WypozyczoneKsiazkiStyle.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-md-6">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="Images/lista.png" height="150"/>
                                </center>
                            </div>
                        </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Wypożyczone książki</h3>
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:BibliotekaWebNoAuthConnectionStringOK %>' SelectCommand="SELECT * FROM [WypozyczenieTab]"></asp:SqlDataSource>
                                <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" >
                                    <Columns>
                                        <asp:BoundField DataField="ID_user" HeaderText="ID" SortExpression="ID_user"></asp:BoundField>
                                        <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie"></asp:BoundField>
                                        <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko"></asp:BoundField>
                                        <asp:BoundField DataField="Ksiazka_ID" HeaderText="ID książki" SortExpression="Ksiazka_ID"></asp:BoundField>
                                        <asp:BoundField DataField="Tytul_ksiazki" HeaderText="Tytuł" SortExpression="Tytul_ksiazki"></asp:BoundField>
                                        <asp:BoundField DataField="Data_wypozyczenia" HeaderText="Data wypożyczenia" SortExpression="Data_wypozyczenia" />
                                        <asp:BoundField DataField="Data_zwrotu" HeaderText="Data zwrotu" SortExpression="Data_zwrotu" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div><br /><a href="HomePage.aspx">
                        << Powrót do strony głównej</a><span class="clearfix"></span><br />
                    </div>
                </div>

</asp:Content>
