<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DoZwrotu.aspx.cs" Inherits="BibliotekaWebAppNoAuth.DoZwrotu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">
           $(document).ready(function () {
               $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
           });
        </script>
    <link rel="stylesheet" href="css/RezerwacjaAdminStyle.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<center><h1>Oczekujące na zatwierdzenie zwrotu</h1></center>--%>
         <div class="container-fluid">
         <div class="row">
            <div class="col-md-5">
            <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="Images/wracamy.png" width="300" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <%--<h3>Zatwierdź zwrot</h3>--%>
                                    <h3>Oczekujące na zatwierdzenie zwrotu</h3>
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
                                   <%--<div class="input-group">--%>
                                            <asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="użytkownik"></asp:TextBox>
                                            <%--<asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="szukaj" OnClick="Button1_Click" />--%>
                                   <%--</div>--%>
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
                            
                            <%--<div class="col-md-6">
                                <label>Status konta</label>
                                   <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="status" ReadOnly="true"></asp:TextBox>
                                   </div>
                            </div>--%>
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
                                <div class="row">
                                    <div class="col-md-6">
                                          <asp:Button class="btn btn-lg btn-block btn-success" ID="Button5" runat="server" Text="Zatwierdź" OnClick="Button5_Click"></asp:Button>
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
                                    <h3>Oczekujące na powrót</h3>
                                    </center>
                            </div>
                        </div>
    <div class="row">
              <div class="col">
                    <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="ID_user" HeaderText="Użytkownik" SortExpression="ID_user" />
                            <asp:BoundField DataField="imie" HeaderText="Imię" SortExpression="imie" />
                            <asp:BoundField DataField="nazwisko" HeaderText="Nazwisko" SortExpression="nazwisko" />
                            <asp:BoundField DataField="ID_ksiazka" HeaderText="Książka" SortExpression="ID_ksiazka" />
                            <asp:BoundField DataField="tytul" HeaderText="Tytuł" SortExpression="tytul" />
                            <asp:BoundField DataField="zwrocono" HeaderText="Zwrócono" SortExpression="zwrocono" />
                            <asp:BoundField DataField="data_zwrotu" HeaderText="Termin" SortExpression="data_zwrotu" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotekaWebNoAuthConnectionStringOK %>" SelectCommand="SELECT * FROM [KsDoZwrotuTab]"></asp:SqlDataSource>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
 </div>
</asp:Content>