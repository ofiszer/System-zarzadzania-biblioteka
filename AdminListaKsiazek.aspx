<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminListaKsiazek.aspx.cs" Inherits="BibliotekaWebAppNoAuth.AdminBookInventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <script type="text/javascript">

           $(document).ready(function () {
               $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
           });

           function readURL(input) {
               if (input.files && input.files[0]) {
                   var reader = new FileReader();

                   reader.onload = function (e) {
                       $('#imgview').attr('src', e.target.result);
                   };

                   reader.readAsDataURL(input.files[0]);
               }
           }
       </script>
    <link rel="stylesheet" href="css/AdminListaKsiazekStyle.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Książki</h3>
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img id="imgview" height="150px" width="100px" src="Images/ksiazki-podreczniki-nauka-biblioteka.jpg"/>
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
                            <div class="col">       <%--onchange sprawia, że obrazek książki pojawia się w formularzu dodawania po wybraniu go z katalogu--%>
                                <asp:FileUpload class="form-control" onchange="readURL(this);"  ID="FileUpload1" runat="server" />
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-4">
                                <label>ID książki</label>
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
                                            <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="tytuł"></asp:TextBox>
                                   </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-4">
                                <label>Język</label>
                                    <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="polski" Value="polski"></asp:ListItem>
                                        <asp:ListItem Text="angielski" Value="angielski"></asp:ListItem>
                                        <asp:ListItem Text="niemiecki" Value="niemiecki"></asp:ListItem>

                                    </asp:DropDownList>        
                                    </div>

                                
                                <label>Wydawnictwo</label>
                                    <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server">
                                        <asp:ListItem Text="wydawca 1" Value="wydawca 1"></asp:ListItem>
                                        <asp:ListItem Text="wydawca 2" Value="wydawca 2"></asp:ListItem>
                                        <asp:ListItem Text="wydawca 3" Value="wydawca 3"></asp:ListItem>

                                    </asp:DropDownList>        
                                    </div>
                              </div>  

                            
                            <div class="col-md-4">
                                <label>Autor</label>
                                    <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList3" runat="server">
                                        <asp:ListItem Text="autor 1" Value="autor 1"></asp:ListItem>
                                        <asp:ListItem Text="autor 2" Value="autor 2"></asp:ListItem>
                                        <asp:ListItem Text="autor 3" Value="autor 3"></asp:ListItem>

                                    </asp:DropDownList>        
                                    </div>

                                
                                <label>Data wydania</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox3" runat="server" placeholder="data wyd." TextMode="Date"></asp:TextBox> 
                                    </div>
                              </div>

                        
                            <div class="col-md-4">
                                <label>Gatunek</label>
                                    <div class="form-group">
                                        <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="5">
                                            <asp:ListItem Text="Akcja" Value="Akcja"></asp:ListItem>
                                            <asp:ListItem Text="Dokument" Value="Dokument"></asp:ListItem>
                                            <asp:ListItem Text="Fantasy" Value="Fantasy"></asp:ListItem>
                                            <asp:ListItem Text="Sci-Fi" Value="Sci-Fi"></asp:ListItem>
                                            <asp:ListItem Text="Kryminał" Value="Kryminał"></asp:ListItem>
                                            <asp:ListItem Text="Romans" Value="Romans"></asp:ListItem>
                                            <asp:ListItem Text="Biografia" Value="Biografia"></asp:ListItem> 
                                            <asp:ListItem Text="Słownik" Value="Słownik"></asp:ListItem>
                                            <asp:ListItem Text="Przewodnik" Value="Przewodnik"></asp:ListItem>
                                            <asp:ListItem Text="Poezja" Value="Poezja"></asp:ListItem>
                                            <asp:ListItem Text="Młodzieżowa" Value="Młodzieżowa"></asp:ListItem>
                                            <asp:ListItem Text="Sztuka" Value="Sztuka"></asp:ListItem>
                                            <asp:ListItem Text="Historia" Value="Historia"></asp:ListItem>
                                            <asp:ListItem Text="Dramat" Value="Dramat"></asp:ListItem>
                                            <asp:ListItem Text="Komiks" Value="Komiks"></asp:ListItem>
                                            <asp:ListItem Text="Bajka" Value="Bajka"></asp:ListItem>
                                            <asp:ListItem Text="Thriller" Value="Thriller"></asp:ListItem>
                                            <asp:ListItem Text="Horror" Value="Horror"></asp:ListItem>
                                    </asp:ListBox>   
                                    </div>
                                </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-4">
                                <label>Wydanie</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox7" runat="server" placeholder="wydanie"></asp:TextBox>
                                    </div>
                                </div>
                            


                        
                           <div class="col-md-4">
                                <label>Strony</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox9" runat="server" placeholder="strony" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                        <%--</div> 

                        <div class="row">--%>
                            <div class="col-md-4">
                                <label>Oprawa</label>
                                    <div class="form-group">
                                        <asp:DropDownList CssClass="form-control" ID="DropDownList4" runat="server">
                                            <asp:ListItem Text="miękka" Value="miękka"></asp:ListItem>
                                            <asp:ListItem Text="twarda" Value="twarda"></asp:ListItem>
                                        </asp:DropDownList>        
                                    </div>
                             </div>
                        </div>
                        
                            
                        <div class="row">
                            <div class="col-md-4">
                                <label>Liczba sztuk</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox4" runat="server" placeholder="wszystkie" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>


                            <div class="col-md-4">
                                <label>Dostępne sztuki</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox5" runat="server" placeholder="dostępne" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>

                        
                            <div class="col-md-4">
                                <label>Wypożyczone</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="wypożyczone" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                        </div> 

                            <div class="row">


                                <div class="col-md-12">
                                    <label>Opis</label>
                                        <div class="form-group">
                                                <asp:TextBox class="form-control" ID="TextBox10" runat="server" placeholder="opis" TextMode="Multiline" Rows="3"></asp:TextBox>
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
                                          <asp:Button class="btn btn-lg btn-block btn-danger" ID="Button7" runat="server" Text="Usuń" OnClick="Button7_Click"></asp:Button>
                                    </div>
                            </div>      
                    </div>
                    <br />
                    <a href="HomePage.aspx">Powrót do strony głównej</a><br />
                </div>

                
            </div>

            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="Images/books_and_tablet.png" width="100px"/>
                                </center>
                            </div>
                        </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Lista książek</h3>
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotekaWebNoAuthConnectionStringOK %>" SelectCommand="SELECT * FROM [KsiazkaTab]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView ID="GridView1" class="table" runat="server" AutoGenerateColumns="False" DataKeyNames="Ksiazka_ID" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="Ksiazka_ID" HeaderText="ID" ReadOnly="True" SortExpression="Ksiazka_ID" />
                                        <%--<asp:BoundField DataField="Tytul" HeaderText="Tytul" SortExpression="Tytul" />
                                        <asp:BoundField DataField="Gatunek" HeaderText="Gatunek" SortExpression="Gatunek" />
                                        <asp:BoundField DataField="Autor_imie" HeaderText="Autor_imie" SortExpression="Autor_imie" />
                                        <asp:BoundField DataField="Wydawnictwo" HeaderText="Wydawnictwo" SortExpression="Wydawnictwo" />
                                        <asp:BoundField DataField="Data_wydania" HeaderText="Data_wydania" SortExpression="Data_wydania" />
                                        <asp:BoundField DataField="Jezyk" HeaderText="Jezyk" SortExpression="Jezyk" />
                                        <asp:BoundField DataField="Wydanie" HeaderText="Wydanie" SortExpression="Wydanie" />
                                        <asp:BoundField DataField="Cena" HeaderText="Cena" SortExpression="Cena" />
                                        <asp:BoundField DataField="Strony" HeaderText="Strony" SortExpression="Strony" />
                                        <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" />
                                        <asp:BoundField DataField="Ile_sztuk" HeaderText="Ile_sztuk" SortExpression="Ile_sztuk" />
                                        <asp:BoundField DataField="Aktualna_liczba_sztuk" HeaderText="Aktualna_liczba_sztuk" SortExpression="Aktualna_liczba_sztuk" />
                                        <asp:BoundField DataField="Obrazek" HeaderText="Obrazek" SortExpression="Obrazek" />--%>
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
                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("Autor_imie") %>'></asp:Label>
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
                                                                    &nbsp;Na stanie -
                                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("Ile_sztuk") %>'></asp:Label>
                                                                    &nbsp;Dostępne -
                                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("Aktualna_liczba_sztuk") %>'></asp:Label>

                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Opis -
                                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("Opis") %>'></asp:Label>

                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="col-lg-2">
                                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Obrazek") %>' Height="150" Width="100" />

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
        </div>
</asp:Content>