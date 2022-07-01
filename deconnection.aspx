<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deconnection.aspx.cs" Inherits="Questionnaire.deconnection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <%
       Session.RemoveAll();
       Session.Clear();

       Response.Redirect("login.aspx");

       %>
</body>
</html>
