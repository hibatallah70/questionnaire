<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Questionnaire.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>login</title>
    <style>
        body {
            font-family: "Roboto", sans-serif;
        }

        .signup-box {
            width: 360px;
            height: 620px;
            margin: auto;
            background-color: white;
            border-radius: 3px;
        }

        .login-box {
            width: 360px;
            height: 280px;
            margin: auto;
            border-radius: 3px;
            background-color: white;
        }

        h1 {
            text-align: center;
            padding-top: 15px;
        }

        h4 {
            text-align: center;
        }

        form {
            width: 300px;
            margin-left: 20px;
        }

            form label {
                display: flex;
                margin-top: 20px;
                font-size: 18px;
            }

            form input {
                width: 100%;
                padding: 7px;
                border: none;
                border: 1px solid gray;
                border-radius: 6px;
                outline: none;
            }

        #Button1 {
            width: 320px;
            height: 35px;
            margin-top: 20px;
            border: none;
            background-color: #343e48;
            color: white;
            font-size: 18px;
        }

        p {
            text-align: center;
            padding-top: 20px;
            font-size: 15px;
        }

        .para-2 {
            text-align: center;
            color: #000000;
            font-size: 15px;
            margin-top: -10px;
        }

            .para-2 a {
                color: #343e48;
            }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>

</head>
<body>

    <div class="container">
        <form runat="server">
            <h1>Login</h1>

            <label>Email</label>
            <input type="email" required="" name="username" placeholder="Entrer votre login" />
            <label>Password</label>
            <input type="password" required="" name="password" placeholder="Entrer votre mot de passe" />

            <asp:Button ID="Button1" type="submit" runat="server" Text="Login" OnClick="Button1_Click" />

            <p class="para-2">
                Vous n'avez pas de compte ? <a href="registre.aspx">Inscrivez-vous ici</a>
            </p>


        </form>
    </div>
</body>
</html>
