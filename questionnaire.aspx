<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="questionnaire.aspx.cs" Inherits="Questionnaire.questionnaire" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Questionnaire d'écoute client</title>
    <%--   <link href="style/style.css" rel="stylesheet" />--%>
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
            width: 250px;
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
            background-color: whitesmoke;
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
            background: #808080;
            color: white;
            font-weight: bold;
            cursor: pointer;
            border: none;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <%if (Session["nom"] == null) { Response.Redirect("login.aspx"); } %>

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
        <input required="" type="text" value="<%=Session["nom"].ToString()%>" name="nom" />
        Votre entreprise :
        <input required="" type="text" name="entreprise" />

        Votre fonction :
        <input required="" type="text" name="fonction" />



        <h2 class="heading-info">Vos relations avec ECS INFORMATIQUE</h2>
        <table>
            <tr style="text-align: center;">
                <td></td>
                <td>TS</td>
                <td>S</td>
                <td>I</td>
                <td>TI</td>
            </tr>
            <tr>
                <td>La qualité de l'accueil dans nos locaux</td>
                <td>
                    <input
                        required=""
                        type="radio"
                        name="rating"
                        class="super-happy"
                        id="super-happy"
                        value="trés satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating"
                        class="happy"
                        id="happy"
                        value="satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating"
                        class="sad"
                        id="sad"
                        value="insatisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating"
                        class="super-sad"
                        id="super-sad"
                        value="trés insatisfaisant" />
                </td>
            </tr>
            <tr>
                <td>La qualité de notre accueil téléphonique</td>
                <td>
                    <input
                        required=""
                        type="radio"
                        name="rating-1"
                        class="super-happy"
                        id="super-happy-1"
                        value="trés satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-1"
                        class="happy"
                        id="happy-1"
                        value="satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-1"
                        class="sad"
                        id="sad-1"
                        value="insatisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-1"
                        class="super-sad"
                        id="super-sad-1"
                        value="trés insatisfaisant" />
                </td>
            </tr>
            <tr>
                <td>Qualité du conseil</td>
                <td>
                    <input
                        required=""
                        type="radio"
                        name="rating-2"
                        class="super-happy"
                        id="super-happy-2"
                        value="trés satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-2"
                        class="happy"
                        id="happy-2"
                        value="satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-2"
                        class="sad"
                        id="sad-2"
                        value="insatisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-2"
                        class="super-sad"
                        id="super-sad-2"
                        value="trés insatisfaisant" />
                </td>
            </tr>
        </table>

        <p style="margin-left: 20%"><span class="notice">TS:trés satisfaisant</span>  <span class="notice">S:satisfaisant </span><span class="notice">I:insatisfaisant </span><span class="notice">TI:trés insatisfaisant</span></p>

        <h2 class="heading-info">Qui votre interlocuteur chez ECS INFORMATIQUE</h2>
        <select required="" onchange="sh();" name="interlocuteur" id="inter-select">
            <option selected="" disabled="">sélectionner...</option>
            <%
                SqlConnection cnx0 = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\questionnaire.mdf;Integrated Security=True");
                SqlCommand com0 = new SqlCommand();
                SqlDataReader dr0;
                cnx0.Open();
                com0.Connection = cnx0;
                com0.CommandText = "select fullName from interlocuteur";
                dr0 = com0.ExecuteReader();
                while (dr0.Read())
                {%>
            <option><%Response.Write(dr0.GetString(0));%></option>
            <%  }
            %>
        </select>
        <input type="text" hidden="" id="inter" name="interlocuteur" placeholder="..........................." /><br />
        <br />
        <%-- <label>Je ne sais pas </label>
        <input onclick="hide_show();" type="checkbox" id="inter-undefined" value="inconnu" name="interlocuteur" />--%>

        <h2 class="heading-info">Les contacts avec les services suivants sont-ils satisfaisants ?</h2>
        <table>
            <tr style="text-align: center;">
                <td></td>
                <td>TS</td>
                <td>S</td>
                <td>I</td>
                <td>TI</td>
            </tr>
            <tr>
                <td>Service livraison et instalation</td>
                <td>
                    <input
                        required=""
                        type="radio"
                        name="rating-3"
                        class="super-happy"
                        id="super-happy-3"
                        value="trés satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-3"
                        class="happy"
                        id="happy-3"
                        value="satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-3"
                        class="sad"
                        id="sad-3"
                        value="insatisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-3"
                        class="super-sad"
                        id="super-sad-3"
                        value="trés insatisfaisant" />
                </td>
            </tr>
            <tr>
                <td>Service aprés-vente</td>
                <td>

                    <input
                        required=""
                        type="radio"
                        name="rating-4"
                        class="super-happy"
                        id="super-happy-4"
                        value="trés satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-4"
                        class="happy"
                        id="happy-4"
                        value="satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-4"
                        class="sad"
                        id="sad-4"
                        value="insatisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-4"
                        class="super-sad"
                        id="super-sad-4"
                        value="trés insatisfaisant" />
                </td>
            </tr>
            <tr>
                <td>Service gestion des commandes et facturation</td>
                <td>
                    <input
                        required=""
                        type="radio"
                        name="rating-5"
                        class="super-happy"
                        id="super-happy-5"
                        value="trés satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-5"
                        class="happy"
                        id="happy-5"
                        value="satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-5"
                        class="sad"
                        id="sad-5"
                        value="insatisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-5"
                        class="super-sad"
                        id="super-sad-5"
                        value="trés insatisfaisant" />
                </td>
            </tr>
            <tr>
                <td>Service consulting et formation</td>
                <td>
                    <input
                        required=""
                        type="radio"
                        name="rating-6"
                        class="super-happy"
                        id="super-happy-6"
                        value="trés satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-6"
                        class="happy"
                        id="happy-6"
                        value="satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-6"
                        class="sad"
                        id="sad-6"
                        value="insatisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-6"
                        class="super-sad"
                        id="super-sad-6"
                        value="trés insatisfaisant" />
                </td>
            </tr>

        </table>

        <p style="margin-left: 20%"><span class="notice">TS:trés satisfaisant</span>  <span class="notice">S:satisfaisant </span><span class="notice">I:insatisfaisant </span><span class="notice">TI:trés insatisfaisant</span></p>


        <h2 class="heading-info">Comment jugez-vous le service Commercial d'ECS INFORMATIQUE ?</h2>
        <table>
            <tr style="text-align: center;">
                <td></td>
                <td>TS</td>
                <td>S</td>
                <td>I</td>
                <td>TI</td>
            </tr>
            <tr>
                <td>Communication</td>
                <td>
                    <input
                        required=""
                        type="radio"
                        name="rating-7"
                        class="super-happy"
                        id="super-happy-7"
                        value="trés satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-7"
                        class="happy"
                        id="happy-7"
                        value="satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-7"
                        class="sad"
                        id="sad-7"
                        value="insatisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-7"
                        class="super-sad"
                        id="super-sad-7"
                        value="trés insatisfaisant" />
                </td>
            </tr>
            <tr>
                <td>Réactivité/flexibilité</td>
                <td>
                    <input
                        required=""
                        type="radio"
                        name="rating-8"
                        class="super-happy"
                        id="super-happy-8"
                        value="trés satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-8"
                        class="happy"
                        id="happy-8"
                        value="satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-8"
                        class="sad"
                        id="sad-8"
                        value="insatisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-8"
                        class="super-sad"
                        id="super-sad-8"
                        value="trés insatisfaisant" />
                </td>
            </tr>
            <tr>
                <td>Connaissance Techniques</td>
                <td>
                    <input
                        required=""
                        type="radio"
                        name="rating-9"
                        class="super-happy"
                        id="super-happy-9"
                        value="trés satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-9"
                        class="happy"
                        id="happy-9"
                        value="satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-9"
                        class="sad"
                        id="sad-9"
                        value="insatisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-9"
                        class="super-sad"
                        id="super-sad-9"
                        value="trés insatisfaisant" />
                </td>
            </tr>
            <tr>
                <td>Consiel et Assistance</td>
                <td>
                    <input
                        required=""
                        type="radio"
                        name="rating-10"
                        class="super-happy"
                        id="super-happy-10"
                        value="trés satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-10"
                        class="happy"
                        id="happy-10"
                        value="satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-10"
                        class="sad"
                        id="sad-10"
                        value="insatisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-10"
                        class="super-sad"
                        id="super-sad-10"
                        value="trés insatisfaisant" />
                </td>
            </tr>
            <tr>
                <td>Suivi de consultation et de projet</td>
                <td>
                    <input
                        required=""
                        type="radio"
                        name="rating-11"
                        class="super-happy"
                        id="super-happy-11"
                        value="trés satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-11"
                        class="happy"
                        id="happy-11"
                        value="satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-11"
                        class="sad"
                        id="sad-11"
                        value="insatisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-11"
                        class="super-sad"
                        id="super-sad-11"
                        value="trés insatisfaisant" />
                </td>
            </tr>
        </table>
        <p style="margin-left: 20%"><span class="notice">TS:trés satisfaisant</span>  <span class="notice">S:satisfaisant </span><span class="notice">I:insatisfaisant </span><span class="notice">TI:trés insatisfaisant</span></p>

        <h2 class="heading-info">En cas de réclamation par quel meyen la signalez-vous à ECS INFORMATIQUE ?</h2>

        <table>
            <tr>
                <td>Téléphone</td>
                <td>
                    <input
                        required=""
                        type="radio"
                        name="rating-12"
                        class="super-happy"
                        id="tel"
                        value="Téléphone" />
                </td>
            </tr>
            <tr>
                <td>Fax</td>
                <td>
                    <input
                        type="radio"
                        name="rating-12"
                        class="super-happy"
                        id="super-12"
                        value="Fax" />
                </td>
            </tr>
            <tr>
                <td>Email</td>
                <td>
                    <input
                        type="radio"
                        name="rating-12"
                        class="super-happy"
                        id="happy-b"
                        value="Email" />
                </td>
            </tr>
        </table>
        <h2 class="heading-info">Appréciation globale</h2>
        <table>
            <tr style="text-align: center;">
                <td></td>
                <td>TS</td>
                <td>S</td>
                <td>I</td>
                <td>TI</td>
            </tr>
            <tr>
                <td>Votre Appréciation Globale</td>
                <td>
                    <input
                        required=""
                        type="radio"
                        name="rating-13"
                        class="super-happy"
                        id="super-happy-13"
                        value="trés satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-13"
                        class="happy"
                        id="happy-13"
                        value="satisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-13"
                        class="sad"
                        id="sad-13"
                        value="insatisfaisant" />
                </td>
                <td>
                    <input
                        type="radio"
                        name="rating-13"
                        class="super-sad"
                        id="super-sad-13"
                        value="trés insatisfaisant" />
                </td>
            </tr>
        </table>

        <br />
        <table>
            <tr>
                <td>Recommanderiez-vous ECS informatique à vos relations professionnelles ?</td>
                <td>
                    <input required="" type="radio" name="rating-14" class="super-happy" id="super-happy-14" value="Oui" />
                    Oui</td>
                <td>
                    <input type="radio" name="rating-14" class="super-sad" id="super-sad-14" value="Non" />
                    Non</td>
                <td>
                    <input type="radio" name="rating-14" class="neutral" id="neutral-14" value="Peut-être" />
                    Peut-être </td>
            </tr>
            <tr>
                <td>Comptez-vous faire appel à nous dans l'année à venir ?</td>
                <td>
                    <input required="" type="radio" name="rating-15" class="super-happy" id="super-happy-15" value="Oui" />
                    Oui</td>
                <td>
                    <input type="radio" name="rating-15" class="super-sad" id="super-sad-15" value="Non" />
                    Non</td>
                <td>
                    <input type="radio" name="rating-15" class="neutral" id="neutral-15" value="Peut-être" />
                    Peut-être</td>
            </tr>
        </table>

        <h2 class="heading-info">Vos commentaires et suggestions</h2>

        <textarea name="comment" style="resize: none; width: 45vw; height: 15vh;" placeholder=".........................................................................................................."></textarea>

        <p>Toute l'équipe ECS informatique vous remercie du temps que vous avez bien voulu lui consacrer.A trés bientôt </p>
        <br />
        <br />
        <%--<input type="submit"  id="send"  class="btn-send" value="envoyer" />--%>

        <asp:Button ID="Button1" runat="server" Text="Envoyer" value="envoyer" OnClick="Button1_Click" />
        <br />
        <br />
        <br />
    </form>
    <script src="script/script.js"></script>

</body>
</html>
