<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="KsiazkaSzukaDomu.aspx.cs" Inherits="BibliotekaWebAppNoAuth.KsiazkaSzukaDomu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/KSDStyle.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">
           $(document).ready(function () {
               $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
           });
    </script>
    
    <link rel="stylesheet" href="css/AdminListaKsiazekStyle.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                        <h2>Książki dla naszych odwiedzających.</h2>
                    </center>
                </div>
            </div>

        <h3><center>Wybierz książkę do przekazania na listę pozycji wycofanych ze zbiorów biblioteki.</center></h3>
     </div>

   <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                
                <div class="card" id="card1">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3 id="header3">Do oddania</h3>
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img id="imgview" height="150" width="100" src="Images/ksiazki-podreczniki-nauka-biblioteka.jpg"/>
                                </center>
                                <hr />
                            </div>
                        </div>
                        
                        
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>


                        <div class="row">

                            <div class="col-md-4" id="div1">
                                <label id="lab1">ID książki</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                            <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Szukaj" OnClick="Button1_Click" />
                                         </div>
                                    </div>
                                </div>

                            <div class="col-md-8">
                                <label>Tytuł</label>
                                   <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="tytuł" ReadOnly="true"></asp:TextBox>
                                   </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Autor</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox5" runat="server" placeholder="autor" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                            

                           <div class="col-md-4">
                                <label>Język</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox3" runat="server" placeholder="jezyk" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>

                            <div class="col-md-4">
                                <label>Wydawnictwo</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox4" runat="server" placeholder="wydawnictwo" ReadOnly="true"></asp:TextBox>     
                                    </div>
                             </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Data wydania</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="data" TextMode="Date" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                            


                           <div class="col-md-4">
                                <label>Gatunek</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox7" runat="server" placeholder="gatunek" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
        
                            <div class="col-md-4">
                                <label>Strony</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox9" runat="server" placeholder="strony" TextMode="Number" ReadOnly="true"></asp:TextBox>     
                                    </div>
                             </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-4">
                                <label>Wydanie</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="wydanie" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>


                           <div class="col-md-4">
                                <label>Oprawa</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox10" runat="server" placeholder="oprawa" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                            <div class="col-md-4">
                                <label>Ile sztuk</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox11" runat="server" placeholder="ile" TextMode="Number"></asp:TextBox>     
                                    </div>
                             </div>
                        </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <label>Opis</label>
                                      <div class="form-group">
                                         <asp:TextBox class="form-control" ID="TextBox12" runat="server" placeholder="opis" TextMode="Multiline" Rows="3" ReadOnly="true"></asp:TextBox>
                                      </div>
                                 </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                        <asp:Button class="btn btn-lg btn-block btn-success" ID="Button5" runat="server" Text="Dodaj" OnClick="Button5_Click"></asp:Button>
                                    </div>
                                <div class="col-md-4">
                                          <asp:Button class="btn btn-lg btn-block btn-primary" ID="Button6" runat="server" Text="Edytuj" OnClick="Button6_Click"></asp:Button>
                                    </div>
                                    <div class="col-md-4">
                                          <asp:Button class="btn btn-lg btn-block btn-danger" ID="Button7" runat="server" Text="Cofnij" OnClick="Button7_Click"></asp:Button>
                                    </div>
                                    
                            </div>

                </div>

                <a href="HomePage.aspx">Powrót do strony głównej</a><br /><br />
            </div>
            </div>

            <div class="col-md-6">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="Images/books_and_tablet.png" width="100"/>
                                </center>
                            </div>
                        </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Czekające na nowy dom</h3>
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotekaWebNoAuthConnectionStringOK %>" SelectCommand="SELECT * FROM [KSD]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView ID="GridView1" class="table" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="ID_ksiazka" HeaderText="ID" SortExpression="ID_ksiazka" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-10">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Tytul") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Autor -
                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("Autor") %>'></asp:Label>
                                                                    &nbsp;Gatunek -
                                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("Gatunek") %>'></asp:Label>
                                                                    &nbsp;Język -
                                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("Jezyk") %>'></asp:Label>

                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Wydawnictwo -
                                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("Wydawnictwo") %>'></asp:Label>
                                                                    &nbsp;Data wydania -
                                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("Data_wydania") %>'></asp:Label>
                                                                    &nbsp;Strony -
                                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("Strony") %>'></asp:Label>
                                                                    &nbsp;Oprawa -
                                                                    <asp:Label ID="Label13" runat="server" Font-Bold="True" Text='<%# Eval("Oprawa") %>'></asp:Label>
                                                                    &nbsp;Wydanie -
                                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("Wydanie") %>'></asp:Label>

                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">
                                                                    &nbsp;Dostępne -
                                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("Ile_sztuk") %>'></asp:Label>
                                                                    <%--&nbsp;Dostępne -
                                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("Aktualna_liczba_sztuk") %>'></asp:Label>--%>

                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Opis -
                                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("Opis") %>'></asp:Label>

                                                                </div>
                                                            </div>

                                                        </div>
                                                        <%--<div class="col-lg-2">
                                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Obrazek") %>' Height="150" Width="100" />

                                                        </div>--%>
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
        </div>
       </div>
</asp:Content>