using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Questionnaire
{
	public partial class questionnaire : System.Web.UI.Page
	{
		SqlConnection cnx = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\questionnaire.mdf;Integrated Security=True");
		protected void Page_Load(object sender, EventArgs e)
		{
			if (cnx.State == ConnectionState.Open)
			{
				cnx.Close();
			}
			cnx.Open();
		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			string idclient = Session["id"].ToString();
			string nom = Request["nom"];
			string entreprise = Request["entreprise"];
			string fonction = Request["fonction"];
			string rating = Request["rating"];
			string rating_1 = Request["rating-1"];
			string rating_2 = Request["rating-2"];
			string interlocuteur = Request["interlocuteur"];
			string rating_3 = Request["rating-3"];
			string rating_4 = Request["rating-4"];
			string rating_5 = Request["rating-5"];
			string rating_6 = Request["rating-6"];
			string rating_7 = Request["rating-7"];
			string rating_8 = Request["rating-8"];
			string rating_9 = Request["rating-9"];
			string rating_10 = Request["rating-10"];
			string rating_11 = Request["rating-11"];
			string rating_12 = Request["rating-12"];
			string rating_13 = Request["rating-13"];
			string rating_14 = Request["rating-14"];
			string rating_15 = Request["rating-15"];
			string comment = Request["comment"];

			SqlCommand cmd = cnx.CreateCommand();
			cmd.CommandType = CommandType.Text;
			cmd.CommandText = "insert into reponse values(GETDATE(),"+idclient+",'" + nom+"','"+entreprise+"','"+fonction+"','"+rating+"','"+rating_1+"','"+rating_2+"','"+interlocuteur+"','"+rating_3+"','"+rating_4+"','"+rating_5+"','"+rating_6+"','"+rating_7+"','"+rating_8+"','"+rating_9+"','"+rating_10+"','"+rating_11+"','"+rating_12+"','"+rating_13+"','"+rating_14+"','"+rating_15+"','"+comment+ "',1)";
			cmd.ExecuteNonQuery();
			Response.Redirect("questionnaireListe.aspx");
		}
	}
}