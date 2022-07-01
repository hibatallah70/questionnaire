<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="Questionnaire.menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        nav {
            display: flex;
            height: 80px;
            width: 100%;
            background: #343e48;
            align-items: center;
            justify-content: space-between;
            padding: 0 50px 0 100px;
            flex-wrap: wrap;
        }

            nav .logo {
                color: #fff;
                font-size: 35px;
                font-weight: 600;
            }

            nav ul {
                display: flex;
                flex-wrap: wrap;
                list-style: none;
            }

                nav ul li {
                    margin: 0 100px;
                }

                    nav ul li a {
                        color: #f2f2f2;
                        text-decoration: none;
                        font-size: 18px;
                        font-weight: 500;
                        padding: 8px 15px;
                        border-radius: 5px;
                        letter-spacing: 1px;
                        transition: all 0.3s ease;
                    }

                        nav ul li a.active,
                        nav ul li a:hover {
                            color: #111;
                            background: #fff;
                        }

            nav .menu-btn i {
                color: #fff;
                font-size: 22px;
                cursor: pointer;
                display: none;
            }

        .nav {
            position: relative;
            top: -50px;
        }
        h6{
            color:white;
            display:inline-block;
            position:relative;
            top:-120px;
        }
    </style>
</head>
<body>
    <nav>
        <div class="logo">
            <img src="logo.png" />
            <h6>Bienvenue <%=Session["nom"]%></h6>
        </div>

        <ul class="nav">
            <li><a class="active" href="questionnaireListe.aspx">Questionnaire</a></li>

            <li><a href="deconnection.aspx">Déconection</a></li>
        </ul>
    </nav>

</body>
</html>
