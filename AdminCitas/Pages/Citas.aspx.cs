using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminCitas.Pages
{
    public partial class Citas : System.Web.UI.Page
    {
        readonly SqlConnection _context = new SqlConnection(ConfigurationManager.ConnectionStrings["DbCitasMedicas"].ConnectionString);

        // ========================================== MÉTODOS ====================================================
        private void CargaInicial()
        {
            var cmd = new SqlCommand("GetAllCitas", _context)
            {
                CommandType = CommandType.StoredProcedure
            };
            _context.Open();

            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            DataTable citasDt = new DataTable();
            dataAdapter.Fill(citasDt);

            GvCitas.DataSource = citasDt;
            GvCitas.DataBind();

            _context.Close();
        }


        // ========================================== EVENTOS ====================================================
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargaInicial();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/FormCita.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }
    }
}