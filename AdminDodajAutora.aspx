<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminDodajAutora.aspx.cs" Inherits="BibliotekaWebAppNoAuth.AdminAutorManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        } );
    </script>
    <link rel="stylesheet" href="css/AutorWydStyle.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container">
        <div class="row">
            <div class="col-md-6">
                
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="Images/lista.png" width="200" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Autor</h3>
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>ID</label>
                                   <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                            <asp:Button class="btn btn-primary" ID="Button2" runat="server" Text="szukaj" OnClick="Button2_Click" />
                                        </div>
                                   </div>
                            </div>
                            <div class="col-md-8">
                                <label>Imię i nazwisko</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="Imię i nazwisko"></asp:TextBox>
                                    </div>
                                </div>
                            <%--<div class="col-md-4">
                                <label>Nazwisko</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox3" runat="server" placeholder="Nazwisko"></asp:TextBox>
                                    </div>
                                </div>--%>
                        </div>

                                        



                                <div class="row">
                                    <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Button class="btn btn-lg btn-block btn-success" ID="Button3" runat="server" Text="Dodaj" OnClick="Button3_Click"></asp:Button>
                                            </div>
                                    </div>
                                    <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Button class="btn btn-lg btn-block btn-primary" ID="Button4" runat="server" Text="Edytuj" OnClick="Button4_Click"></asp:Button>
                                            </div>
                                    </div>
                                    <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Button class="btn btn-lg btn-block btn-danger" ID="Button5" runat="server" Text="Usuń" OnClick="Button5_Click"></asp:Button>
                                            </div>
                                    </div>
                                </div>
                                
                    </div>
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
                                    <img src="Images/ksiazki.jpg" width="100"/>
                                </center>
                            </div>
                        </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Lista autorów</h3>
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>


                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotekaWebNoAuthConnectionStringOK %>" SelectCommand="SELECT * FROM [AutorTab]"></asp:SqlDataSource>
                            <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-JJJ8PJO" SelectCommand="SELECT * FROM [AutorTab]"></asp:SqlDataSource>--%>
                            <div class="col">
                                <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="Autor_ID">
                                    <Columns>
                                        <asp:BoundField DataField="Autor_ID" HeaderText="ID Autora" ReadOnly="True" SortExpression="Autor_ID" />
                                        <asp:BoundField DataField="Autor_imie_naz" HeaderText="Imię i nazwisko" SortExpression="Autor_imie_naz" />
                                        <%--<asp:BoundField DataField="Autor_nazwisko" HeaderText="Autor_nazwisko" SortExpression="Autor_nazwisko" />--%>
                                    </Columns>
                                </asp:GridView>
                                <%--<asp:GridView class="table table-striped table-bordered" ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="author_id" DataSourceID="SqlDataSource1">--%>
                                <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>--%>
                            </div>
                        </div>
                    </div>


                </div>


            </div>
        </div>

</asp:Content>
