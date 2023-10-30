<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UzytkownicyZarzadzanie.aspx.cs" Inherits="BibliotekaWebAppNoAuth.UzytkownicyZarzadzanie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        } );
    </script>
    <link rel="stylesheet" href="css/UzytkownicyZarzadzanieStyle.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="Images/profile-icon-login-head-icon-vector.jpg" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Użytkownicy</h3>
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-3">
                                <label>ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                            <asp:LinkButton class="btn btn-primary" ID="LinkButton1" runat="server" OnClick="LinkButton5_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>

                            <div class="col-md-4">
                                <label>Imię</label>
                                   <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="imię" ReadOnly="true"></asp:TextBox>
                                   </div>
                            </div>
                            
                            <div class="col-md-4">
                                <label>Nazwisko</label>
                                   <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox10" runat="server" placeholder="nazwisko" ReadOnly="true"></asp:TextBox>
                                   </div>
                            </div>
                        </div>

                        <div class="row">
                            
                            <div class="col-md-5">
                                <label>Status konta</label>
                                   <div class="form-group">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <asp:TextBox class="form-control mr-1" ID="TextBox3" runat="server" placeholder="status" ReadOnly="true"></asp:TextBox>
                                                <asp:LinkButton class="btn btn-success mr-1" ID="LinkButton2" runat="server" Text="S" OnClick="LinkButton2_Click"><i class="fa-solid fa-check"></i></asp:LinkButton>
                                                <asp:LinkButton class="btn btn-warning mr-1" ID="LinkButton3" runat="server" Text="P" OnClick="LinkButton3_Click"><i class="fa-solid fa-pause"></i></asp:LinkButton>
                                                <asp:LinkButton class="btn btn-danger mr-1" ID="LinkButton4" runat="server" Text="D" OnClick="LinkButton4_Click"><i class="fa-regular fa-square-minus"></i></asp:LinkButton>
                                            </div>
                                        </div>
                                   </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Data urodzenia</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox4" runat="server" placeholder="data" ReadOnly="true" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>

                            <div class="col-md-4">
                                <label>Numer telefonu</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox5" runat="server" placeholder="numer" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>

                        
                            <div class="col-md-4">
                                <label>Email</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="email" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                        </div> 

                        <div class="row">
                            <div class="col-md-4">
                                <label>Adres</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox7" runat="server" placeholder="ulica" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>


                            <div class="col-md-4">
                                <label>Kod pocztowy</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="kod" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>

                        
                            <div class="col-md-4">
                                <label>Miasto</label>
                                    <div class="form-group">
                                            <asp:TextBox class="form-control" ID="TextBox9" runat="server" placeholder="miasto" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                        </div>

                                <div class="row">
                                    <div class="col-md-12">
                                          <asp:Button class="btn btn-lg btn-block btn-info" ID="Button1" runat="server" Text="Wyczyść dane" OnClick="Button6_Click"></asp:Button>
                                    </div>
                                </div>  
                                <div class="row">
                                    <div class="col-md-12">
                                          <asp:Button class="btn btn-lg btn-block btn-danger" ID="Button5" runat="server" Text="Usuń użytkownika" OnClick="Button5_Click"></asp:Button>
                                    </div>
                                </div>      
                    </div>
                </div>

                <a href="HomePage.aspx">Powrót do strony głównej</a><br /><br />
            </div>

            <div class="col-md-6">

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
                                    <h3>Nasi odwiedzający</h3>
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotekaWebNoAuthConnectionStringOK %>" SelectCommand="SELECT * FROM [UserTab]"></asp:SqlDataSource>
                                <asp:GridView ID="GridView1" class="table" runat="server" AutoGenerateColumns="False" DataKeyNames="id_user" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="id_user" HeaderText="ID" ReadOnly="True" SortExpression="id_user" />
                                        <asp:BoundField DataField="imie" HeaderText="Imię" SortExpression="imie" />
                                        <asp:BoundField DataField="nazwisko" HeaderText="Nazwisko" SortExpression="nazwisko" />
                                        <%--<asp:BoundField DataField="data_ur" HeaderText="Data ur." SortExpression="data_ur" />
                                        <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                                        <asp:BoundField DataField="miasto" HeaderText="Miasto" SortExpression="miasto" />
                                        --%><asp:BoundField DataField="status_konta" HeaderText="Status konta" SortExpression="status_konta" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>


                </div>


            </div>
        </div>



</asp:Content>
