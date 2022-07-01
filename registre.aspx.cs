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
    public partial class registre : System.Web.UI.Page
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
            string nom = Request["nom"];
            string secteur = Request["secteur"];
            string address = Request["address"];
            string tel = Request["tel"];
            string email = Request["email"];
            string pass = Request["password"];


            SqlCommand cmd = cnx.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "insert into client values('"+nom+"','"+secteur+"','"+address+"','"+tel+"','"+email+"','"+pass+"')";
            cmd.ExecuteNonQuery();
            Response.Redirect("login.aspx");
        }

        
    }
}