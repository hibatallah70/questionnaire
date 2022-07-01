<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="questionnaireReponse.aspx.cs" Inherits="Questionnaire.questionnaireReponse" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reponse de questionnaire</title>
    <style>
        #form1 {
            margin-left: 5vw;
            width: 90vw;
        }

        .heading-page, .heading-info {
            background-color: grey;
        }

        .heading-info {
            padding: 2px 0;
        }

        .heading-page h1, h2 {
            color: white;
        }

        .heading-text {
            font-size: 20px;
        }

        input[type=text] {
            border: none;
            width: 250px;
            outline: none;
        }

        .checkbox-label {
            display: inline-block;
            margin-left: 30vw;
        }

        .notice {
            margin-right: 5%;
        }

        .btn-send {
            padding: 5px 10px;
            font-size: 20px;
            margin-bottom: 30px;
        }

        @import url('https://fonts.googleapis.com/css?family=Roboto');

        body,
        html {
            display: grid;
            height: 100%;
            width: 100%;
            background-color: white;
            font-family: 'Roboto', sans-serif;
            color: #37383b;
            font-weight: 700;
            padding: 0;
            margin: 0;
        }

        a:link,
        a:visited,
        a:hover,
        a:active {
            color: rgba(0, 0, 16, 0.8);
            text-decoration: none;
        }

        a:hover,
        a:active {
            border-bottom: 0.1em solid rgba(0, 0, 16, 0.8);
            color: rgba(0, 0, 16, 0.8);
            text-decoration: none;
        }

        .notice {
            color: #808080;
            font-size: 90%;
        }

        header {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            margin: auto;
            width: 34.6rem;
        }

            header h1 {
                font-size: 2.8em;
            }

        .card {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            margin: auto;
            -webkit-box-shadow: 0 0.5rem 1rem rgba(0, 0, 16, 0.19), 0 0.3rem 0.3rem rgba(0, 0, 16, 0.23);
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 16, 0.19), 0 0.3rem 0.3rem rgba(0, 0, 16, 0.23);
            background-color: rgb(255, 255, 255);
            padding: 0.8rem;
            width: 33rem;
        }

        .rating-container {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-pack: justify;
            -ms-flex-pack: justify;
            justify-content: space-between;
            padding: 0.4rem 0.8rem;
            width: 100%;
        }

        .rating-text p {
            color: rgba(0, 0, 16, 0.8);
            font-size: 1.3rem;
            padding: 0.3rem;
        }

        .rating {
            background-color: rgba(0, 0, 16, 0.8);
            padding: 0.4rem 0.4rem 0.1rem 0.4rem;
            border-radius: 2.2rem;
        }

        #Button1 {
            padding: 10px;
            background: whitesmoke;
            color: #343e48;
            border: none;
            border-radius: 10px;
        }

        label {
            font-family: 'Times New Roman', Times, serif;
            font-weight: normal;
            font-size: larger;
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <%if (Session["nom"] == null) { Response.Redirect("login.aspx"); }


    %>
    <form runat="server" method="post" id="form1">
        <div align="center" class="heading-page">
            <h1>Questionnaire d'écoute client</h1>
        </div>
        <h3>Votre avis nous intéresse</h3>
        <p class="heading-text">
            Dans le but d'améliorer nos prestations et notre qualité de service,
			nous vous remercions de bien vouloir consacrer quelques instants à 
			compléter et à nous retourner ce formulaire
        </p>

        <h2 class="heading-info">Vous</h2>

        Votre nom :
        <input type="text" readonly="" value="<%=Request["clientname"]%>" name="nom" />
        Votre entreprise :
        <input readonly="" type="text" value="<%=Request["entreprise"]%>" name="entreprise" />

        Votre fonction :
        <input readonly="" type="text" value="<%=Request["function"]%>" name="fonction" />



        <h2 class="heading-info">Vos relations avec ECS INFORMATIQUE</h2>
        <table>

            <tr>
                <td>La qualité de l'accueil dans nos locaux</td>
                <td>
                    <label><%=Request["rating"]%></label></td>
            </tr>
            <tr>
                <td>La qualité de notre accueil téléphonique</td>
                <td>
                    <label><%=Request["rating_1"]%></label></td>
            </tr>
            <tr>
                <td>Qualité du conseil</td>

                <td>
                    <label><%=Request["rating_2"]%></label></td>
            </tr>
        </table>


        <h2 class="heading-info">Qui votre interlocuteur chez ECS INFORMATIQUE</h2>
        <label><%=Request["interlocuteur"]%></label>
        <h2 class="heading-info">Les contacts avec les services suivants sont-ils satisfaisants ?</h2>
        <table>

            <tr>
                <td>Service livraison et instalation</td>
                <td>
                    <label><%=Request["rating_3"]%></label></td>
            </tr>
            <tr>
                <td>Service aprés-vente</td>
                <td>
                    <label><%=Request["rating_4"]%></label></td>
            </tr>
            <tr>
                <td>Service gestion des commandes et facturation</td>
                <td>
                    <label><%=Request["rating_5"]%></label></td>
            </tr>
            <tr>
                <td>Service consulting et formation</td>
                <td>
                    <label><%=Request["rating_6"]%></label></td>
            </tr>

        </table>



        <h2 class="heading-info">Comment jugez-vous le service Commercial d'ECS INFORMATIQUE ?</h2>
        <table>

            <tr>
                <td>Communication</td>
                <td>
                    <label><%=Request["rating_7"]%></label></td>
            </tr>
            <tr>
                <td>Réactivité/flexibilité</td>
                <td>
                    <label><%=Request["rating_8"]%></label></td>
            </tr>
            <tr>
                <td>Connaissance Techniques</td>
                <td>
                    <label><%=Request["rating_9"]%></label></td>
            </tr>
            <tr>
                <td>Consiel et Assistance</td>
                <td>
                    <label><%=Request["rating_10"]%></label></td>
            </tr>
            <tr>
                <td>Suivi de consultation et de projet</td>
                <td>
                    <label><%=Request["rating_11"]%></label></td>
            </tr>
        </table>

        <h2 class="heading-info">En cas de réclamation par quel meyen la signalez-vous à ECS INFORMATIQUE ?</h2>

        <table>
            <tr>

                <td>
                    <label><%=Request["rating_12"]%></label></td>
            </tr>
        </table>
        <h2 class="heading-info">Appréciation globale</h2>
        <table>

            <tr>
                <td>Votre Appréciation Globale</td>
                <td>
                    <label><%=Request["rating_13"]%></label></td>
            </tr>
        </table>

        <br />
        <table>
            <tr>
                <td>Recommanderiez-vous ECS informatique à vos relations professionnelles ?</td>
                <td>
                    <label><%=Request["rating_14"]%></label></td>

            </tr>
            <tr>
                <td>Comptez-vous faire appel à nous dans l'année à venir ?</td>
                <td>
                    <label><%=Request["rating_15"]%></label></td>
            </tr>
        </table>

        <h2 class="heading-info">Vos commentaires et suggestions</h2>

        <textarea name="comment" style="resize: none; width: 45vw; height: 15vh;"><%=Request["cmnt"]%></textarea>

        <p>Toute l'équipe ECS informatique vous remercie du temps que vous avez bien voulu lui consacrer.A trés bientôt </p>
        <br />
        <br />

        <br />
        <br />
        <br />
    </form>
    <script src="script/script.js"></script>

</body>
</html>
