<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registre.aspx.cs" Inherits="Questionnaire.registre" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <link href="style/stylesheet.css" rel="stylesheet" />
</head>
<body>
    <div class="container">

        <form runat="server">
            <h1>Registration</h1>


            <label>nom</label>
            <input name="nom" type="text" placeholder="" required="" />
            <label>Secteur</label>
            <select style="width: 310px; height: 30px;" required="" name="secteur">
                <option>Privé</option>
                <option>public</option>
            </select>
            <label>Address</label>
            <input name="address" required="" type="text" placeholder="" />
            <label>telephone</label>
            <input name="tel" type="tel" required="" placeholder="" />
            <label>Email</label>
            <input name="email" required="" type="email" placeholder="" />
            <label>Password</label>
            <input name="password" required="" type="password" placeholder="" />


            <asp:Button ID="Button1" runat="server" Text="S'inscrire" OnClick="Button1_Click" />


        </form>
    </div>
</body>
</html>
