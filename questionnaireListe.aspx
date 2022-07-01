<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="questionnaireListe.aspx.cs" Inherits="Questionnaire.questionnaireListe" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Liste des questinnaires</title>
    <style>
        table {
            position: relative;
            top: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-collapse: collapse;
        }


        td, th {
            padding: 10px 20px;
            border: solid 2px;
        }

        .bg {
            background: #343e48;
            color: whitesmoke;
        }

        table a {
            color: blue;
        }
    </style>
</head>
<body>
    <%if (Session["nom"] == null) { Response.Redirect("login.aspx"); } %>
    <% Server.Execute("menu.aspx"); %>
    <br />
    <br />
    <br />
    <br />
    <br />
    <form method="post">
        <table>

            <tr class="bg">
                <th>Code Questionnaire</th>
                <th>Titre Questionnaire</th>
                <th>Date Questionnaire</th>
                <th>Etat Questionnaire</th>
                <th>Action</th>
                <th>Reponse</th>
            </tr>

            <%
                SqlConnection cnx0 = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\questionnaire.mdf;Integrated Security=True");
                SqlCommand com0 = new SqlCommand();
                SqlDataReader dr0;
                cnx0.Open();
                com0.Connection = cnx0;
                com0.CommandText = "select idQuest,titreQuest,convert(varchar,dateQuest, 103) ,etatQuest,urlQuest from questionnaire";
                dr0 = com0.ExecuteReader();
                while (dr0.Read())
                {%>
            <tr>
                <td><%=dr0.GetInt32(0) %></td>
                <td><%=dr0.GetString(1)%></td>
                <td><%=dr0.GetString(2)%></td>
                <td><%=dr0.GetString(3)%></td>
                <%
                    SqlConnection cnx1 = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\questionnaire.mdf;Integrated Security=True");
                    SqlCommand com1 = new SqlCommand();
                    SqlDataReader dr1;
                    cnx1.Open();
                    com1.Connection = cnx1;
                    com1.CommandText = "select * from reponse where idclient=" + Session["id"];
                    dr1 = com1.ExecuteReader();
                    if (dr1.Read())
                    {

                %>

                <td><a onclick=" return alert('Vous avez déjà rempli ce questionnaire');" href="#">Remplir questionnaire</a></td>

                <%}
                    else
                    {  %>
                <td><a href="<%=dr0.GetString(4)%>">Remplir questionnaire</a></td>


                <%} %>
                <%  string id = "";
                    string dateReponse = "";
                    string idclient = "";
                    string nom = "";
                    string entreprise = "";
                    string fonction = "";
                    string rating = "";
                    string rating_1 = "";
                    string rating_2 = "";
                    string interlocuteur = "";
                    string rating_3 = "";
                    string rating_4 = "";
                    string rating_5 = "";
                    string rating_6 = "";
                    string rating_7 = "";
                    string rating_8 = "";
                    string rating_9 = "";
                    string rating_10 = "";
                    string rating_11 = "";
                    string rating_12 = "";
                    string rating_13 = "";
                    string rating_14 = "";
                    string rating_15 = "";
                    string comment = "";

                    SqlConnection cnx = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\questionnaire.mdf;Integrated Security=True");
                    SqlCommand com = new SqlCommand();
                    SqlDataReader dr;
                    cnx.Open();
                    com.Connection = cnx;
                    com.CommandText = "select r.*, convert(varchar,dateReponse, 103) from reponse r  where idclient in(" + Session["id"] + ")";
                    dr = com.ExecuteReader();

                    if (dr.Read())
                    {
                        id = dr.GetInt32(0).ToString();
                        dateReponse = dr.GetString(25);
                        idclient = Session["id"].ToString();
                        nom = Session["nom"].ToString();
                        entreprise = dr.GetString(4);
                        fonction = dr.GetString(5);
                        rating = dr.GetString(6);
                        rating_1 = dr.GetString(7);
                        rating_2 = dr.GetString(8);
                        interlocuteur = dr.GetString(9);
                        rating_3 = dr.GetString(10);
                        rating_4 = dr.GetString(11);
                        rating_5 = dr.GetString(12);
                        rating_6 = dr.GetString(13);
                        rating_7 = dr.GetString(14);
                        rating_8 = dr.GetString(15);
                        rating_9 = dr.GetString(16);
                        rating_10 = dr.GetString(17);
                        rating_11 = dr.GetString(18);
                        rating_12 = dr.GetString(19);
                        rating_13 = dr.GetString(20);
                        rating_14 = dr.GetString(21);
                        rating_15 = dr.GetString(22);
                        comment = dr.GetString(23);%>
                <td><a href="questionnaireReponse.aspx?id=<%=id%>&date=<%=dateReponse%>&idclient=<%=idclient%>&clientname=<%=nom%>&entreprise=<%=entreprise%>&function=<%=fonction%>&rating=<%=rating%>&rating_1=<%=rating_1%>&rating_2=<%=rating_2%>&interlocuteur=<%=interlocuteur%>&rating_3=<%=rating_3%>&rating_4=<%=rating_4%>&rating_5=<%=rating_5%>&rating_6=<%=rating_6%>&rating_7=<%=rating_7%>&rating_8=<%=rating_8%>&rating_9=<%=rating_9%>&rating_10=<%=rating_10%>&rating_11=<%=rating_11%>&rating_12=<%=rating_12%>&rating_13=<%=rating_13%>&rating_14=<%=rating_14%>&rating_15=<%=rating_15%>&cmnt=<%=comment%>">view</a></td>

                <%

                    }
                    else
                    {%>
                <td><a onclick=" return alert('Vous avez pas rempli ce questionnaire');" href="#">view</a></td>
                <%
                    }
                    dr.Close();
                %>
            </tr>


            <%
                }
                dr0.Close();
            %>
        </table>
    </form>
</body>
</html>
