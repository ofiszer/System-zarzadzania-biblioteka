<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PrzegladajKsiazki.aspx.cs" Inherits="BibliotekaWebAppNoAuth.ViewBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
     </script>
    <link rel="stylesheet" href="css/PrzegladajKsiazkiStyle.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
            <div class="row">

                <div class="col-sm-12-1">
                    <center>
                        <h3>Nasze zbiory</h3>
                    </center>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </asp:Panel>
                        </div>
                    </div>
                    <br />
                    <div class="row12">
                        <div class="card">
                            <div class="card-body">

                                <div class="row1">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotekaWebNoAuthConnectionStringOK %>" SelectCommand="SELECT * FROM [KsiazkaTab]"></asp:SqlDataSource>
                                    <div class="col1">
                                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Ksiazka_ID" DataSourceID="SqlDataSource1">
                                            <Columns>
                                                <asp:BoundField DataField="Ksiazka_ID" HeaderText="ID" ReadOnly="True" SortExpression="Ksiazka_ID">
                                                    <ControlStyle Font-Bold="True" />
                                                    <ItemStyle Font-Bold="True" />
                                                </asp:BoundField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-lg-10">
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Tytul") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            <span>Autor - </span>
                                                                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("Autor_imie") %>'></asp:Label>
                                                                            &nbsp;| <span><span>&nbsp;</span>Gatunek - </span>
                                                                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("Gatunek") %>'></asp:Label>
                                                                            &nbsp;|
                                                                            <span>
                                                      Język -<span>&nbsp;</span>
                                                                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("Jezyk") %>'></asp:Label>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            Wydawca -
                                                                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("Wydawnictwo") %>'></asp:Label>
                                                                            &nbsp;| Data wydania -
                                                                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("Data_wydania") %>'></asp:Label>
                                                                            &nbsp;| Strony -
                                                                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("Strony") %>'></asp:Label>
                                                                            &nbsp;| Wydanie -
                                                                            <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("Wydanie") %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            Oprawa -
                                                                            <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("Oprawa") %>'></asp:Label>
                                                                            &nbsp;| Wszystkie -
                                                                            <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("Ile_sztuk") %>'></asp:Label>
                                                                            &nbsp;| Dostępne -
                                                                            <asp:Label ID="Label12" runat="server" Font-Bold="True" Text='<%# Eval("Aktualna_liczba_sztuk") %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            Opis -
                                                                            <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("Opis") %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-2">
                                                                    <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("Obrazek") %>' />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        
                                    </div>
                                </div>
                            </div><a href="HomePage.aspx">
                        << Powrót do strony głównej</a><span class="clearfix"></span>
                            <br />
                        </div>
                    </div>
                </div>
                <%--<center>
                    <a href="HomePage.aspx">
                        << Powrót do strony głównej</a><span class="clearfix"></span>
                            <br />
                            <center>--%>
            </div>
        </div>

</asp:Content>