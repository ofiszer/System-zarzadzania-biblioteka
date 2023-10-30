<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RejestracjaUzytkownika.aspx.cs" Inherits="BibliotekaWebAppNoAuth.RejestracjaUzytkownika" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

<link rel="stylesheet" href="css/RejUzStyle.css">
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'UA-23581568-13');
</script>
<script defer src="https://static.cloudflareinsights.com/beacon.min.js/v52afc6f149f6479b8c77fa569edb01181681764108816" integrity="sha512-jGCTpDpBAYDGNYR5ztKt4BQPGef1P0giN6ZGVUi835kFF88FOmmn8jBQWNgrNd8g/Yu421NdgWhwQoaOPFflDw==" data-cf-beacon='{"rayId":"7c172f752b7034e5","token":"cd0b4b3a733644fc843ef0b185f98241","version":"2023.4.0","si":100}' crossorigin="anonymous"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper" style="background-image: url('images/bg-registration-form-2.jpg');">
<div class="inner">
<form action="">
<h3>Registration Form</h3>
<div class="form-group">
<div class="form-wrapper">
<label for="">First Name</label>
<input type="text" class="form-control">
</div>
<div class="form-wrapper">
<label for="">Last Name</label>
<input type="text" class="form-control">
</div>
</div>
<div class="form-wrapper">
<label for="">Email</label>
<input type="text" class="form-control">
</div>
<div class="form-wrapper">
<label for="">Password</label>
<input type="password" class="form-control">
</div>
<div class="form-wrapper">
<label for="">Confirm Password</label>
<input type="password" class="form-control">
</div>
<div class="checkbox">
<label>
<input type="checkbox"> I caccept the Terms of Use & Privacy Policy.
<span class="checkmark"></span>
</label>
</div>
<button>Register Now</button>
    <asp:Button ID="Button1" class="btn btn-success btn-block btn-lg" runat="server" Text="Zarejestruj się" />
 
</form>
</div>
</div>
</asp:Content>
