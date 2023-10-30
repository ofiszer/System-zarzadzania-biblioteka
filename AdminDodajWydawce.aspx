<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminDodajWydawce.aspx.cs" Inherits="BibliotekaWebAppNoAuth.AdminPublisherManagement" %>
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
                                    <h3>Wydawca</h3>
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
                                <label>Wydawnictwo</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox3" runat="server" placeholder="Wydawnictwo"></asp:TextBox>
                                    </div>
                                </div>
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
                                    <h3>Lista wydawców</h3>
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotekaWebNoAuthConnectionStringOK %>" SelectCommand="SELECT * FROM [WydTab]"></asp:SqlDataSource>
                                <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="Wydawca_ID" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="Wydawca_ID" HeaderText="ID" ReadOnly="True" SortExpression="Wydawca_ID" />
                                        <asp:BoundField DataField="Wydawca_nazwa" HeaderText="Wydawnictwo" SortExpression="Wydawca_nazwa" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>


                </div>


            </div>
        </div>

</asp:Content>
