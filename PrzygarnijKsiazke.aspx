<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PrzygarnijKsiazke.aspx.cs" Inherits="BibliotekaWebAppNoAuth.PrzygarnijKsiazke" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/PrzygarnijKsiazkeStyle.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    
                    <div class="row">

                        <div class="col-sm-12 col-md-12">
                            <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </asp:Panel>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="card-color1">
                            <div class="card-body">
                                <center>
                        <h3>Witaj, czytelniku. Poniżej znajdziesz książki wycofane ze zbiorów naszej biblioteki, które możesz zabrać ze sobą do domu!</h3>
                    </center>
                                <div class="row">
                                    <div class="row">
                        <div class="card-color2">
                            <div class="card-body">

                                <div class="row">

                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotekaWebNoAuthConnectionStringOK %>" SelectCommand="SELECT * FROM [KSD]"></asp:SqlDataSource>
                                    <div class="col">
                                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_ksiazka" DataSourceID="SqlDataSource1">

                                            <Columns>
                                                <asp:BoundField DataField="ID_ksiazka" HeaderText="ID" ReadOnly="True" SortExpression="ID_ksiazka">
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
                                                                    <div class="row book-info">
                                                                        <div class="col-12">
                                                                            <span>Autor - </span>
                                                                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("Autor") %>'></asp:Label>
                                                                            &nbsp;| <span><span>&nbsp;</span>Gatunek - </span>
                                                                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("Gatunek") %>'></asp:Label>
                                                                            &nbsp;|
                                                                            <span>
                                                      Język -<span>&nbsp;</span>
                                                                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("Jezyk") %>'></asp:Label>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row book-details">
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
                                                                    <div class="row book-description">
                                                                        <div class="col-12">
                                                                            Oprawa -
                                                                            <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("Oprawa") %>'></asp:Label>
                                                                            &nbsp;| Wszystkich -
                                                                            <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("Ile_sztuk") %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            Opis -
                                                                            <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("Opis") %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                                    <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotekaWebNoAuthConnectionStringOK %>" SelectCommand="SELECT * FROM [KSD]"></asp:SqlDataSource>
                                    <div class="col">
                                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                            <Columns>
                                                <asp:BoundField DataField="ID_ksiazka" HeaderText="ID" SortExpression="ID_ksiazka">
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Tytul" HeaderText="Tytuł" SortExpression="Tytul" />
                                                <asp:BoundField DataField="Gatunek" HeaderText="Gatunek" SortExpression="Gatunek" />
                                                <asp:BoundField DataField="Autor" HeaderText="Autor" SortExpression="Autor" />
                                                <asp:BoundField DataField="Wydawnictwo" HeaderText="Wydawnictwo" SortExpression="Wydawnictwo" />
                                                //<asp:BoundField DataField="Data_wydania" HeaderText="Data wydania" SortExpression="Data_wydania" />
                                                <asp:BoundField DataField="Jezyk" HeaderText="Język" SortExpression="Jezyk" />
                                                <asp:BoundField DataField="Wydanie" HeaderText="Wydanie" SortExpression="Wydanie" />
                                                <asp:BoundField DataField="Strony" HeaderText="Strony" SortExpression="Strony" />
                                                <asp:BoundField DataField="Oprawa" HeaderText="Oprawa" SortExpression="Oprawa" />
                                                <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" />
                                                <asp:BoundField DataField="Ile_sztuk" HeaderText="Ile dostępnych sztuk" SortExpression="Ile_sztuk" />
                                                <asp:BoundField DataField="Obrazek" HeaderText="Obrazek" SortExpression="Obrazek" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <center>
                    <a href="HomePage.aspx">
                        << Powrót do strony głównej</a><span class="clearfix"></span>
                            <br/>
                            <center>
            </div>
        </div>

</asp:Content>