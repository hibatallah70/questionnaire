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
    public partial class login : System.Web.UI.Page
    {
        SqlConnection cnx = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\questionnaire.mdf;Integrated Security=True");
        SqlCommand com = new SqlCommand();
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //if (cnx.State == ConnectionState.Open)
            //{
            //    cnx.Close();
            //}
            //cnx.Open();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string login = Request["username"];
            string pass = Request["password"];

            cnx.Open();
            com.Connection = cnx;
            com.CommandText = "select * from client where email='"+login+"' and password ='"+pass+"'";
            dr = com.ExecuteReader();
            if (dr.Read())
            {
                Session["id"] = dr.GetInt32(0);
                Session["nom"] = dr.GetString(1);

                Response.Redirect("questionnaireListe.aspx");
            }
            else
            {
                Response.Redirect("login.aspx?error=Les données sont incorrectes");
            }
        }

        
    }
}