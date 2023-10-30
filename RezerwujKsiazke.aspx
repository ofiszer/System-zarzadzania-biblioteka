<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RezerwujKsiazke.aspx.cs" Inherits="BibliotekaWebAppNoAuth.RezerwujKsiazke" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        } );
    </script>
    <link href="css/UserProfilStyle.css" rel="stylesheet" type="text/css"/>
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
                                    <img src="Images/ksiazka1.png" height="150" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Rezerwacja książek do zabrania na stałe</h3>
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
                                            <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="szukaj" OnClick="Button1_Click" />
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
                                            <asp:TextBox class="form-control" ID="TextBox5" runat="server" placeholder="status" ReadOnly="true"></asp:TextBox>
                                   </div>
                            </div>
                            <div class="col-md-8">
                                <label>Tytuł książki</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="książka" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                        </div>

                        <center>
                                <div class="row">
                                    <div class="col-md-6">
                                        
                                          <asp:Button class="btn btn-lg btn-block btn-primary" ID="Button2" runat="server" Text="Rezerwuj" OnClick="Button2_Click"></asp:Button>
                                    </div>
                                   
                                    <div class="col-md-6">
                                          <asp:Button class="btn btn-lg btn-block btn-danger" ID="Button3" runat="server" Text="Rezygnuj" OnClick="Button3_Click"></asp:Button>
                                    </div>

                                </div></center>
                                
                    </div>
                    </center>
                </div>

                <a href="HomePage.aspx">Powrót do strony głównej</a><br /><br />
            </div>

            <div class="col-md-6">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="Images/lista_ksiazek.png" width="150"/>
                                </center>
                            </div>
                        </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Twoje książki</h3>
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
