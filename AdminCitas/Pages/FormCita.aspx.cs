using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminCitas.Pages
{
    public partial class FormCita : System.Web.UI.Page
    {
        readonly SqlConnection _context = new SqlConnection(ConfigurationManager.ConnectionStrings["DbCitasMedicas"].ConnectionString);

        // ========================================== MÉTODOS ================================
        private void CargarEspecialidades()
        {
            SqlCommand cmd = new SqlCommand("GetAllEspecialidades", _context)
            {
                CommandType = CommandType.StoredProcedure
            };

            _context.Open();

            SqlDataAdapter dataAdapterEspecialidades = new SqlDataAdapter(cmd);
            DataTable dataTable = new DataTable();
            dataAdapterEspecialidades.Fill(dataTable);

            ddlEspecialidad.DataSource = dataTable;
            ddlEspecialidad.DataTextField = "Nombre";
            ddlEspecialidad.DataValueField = "Id";
            ddlEspecialidad.DataBind();

            ddlEspecialidad.Items.Insert(0, new ListItem("SELECCIONA UNA OPCIÓN", "0"));

            _context.Close();
        }

        private void CargarMedicos(int idEspecialidad)
        {
            SqlCommand cmd = new SqlCommand("GetMedicoByIdEspecialidad", _context)
            {
                CommandType = CommandType.StoredProcedure,
                Parameters = { new SqlParameter("@IdEspecialidad", idEspecialidad) }
            };

            _context.Open();

            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            if (dataTable.Rows.Count > 0)
            {
                dataTable.Columns.Add("NombreCompleto", typeof(string));

                foreach(DataRow row in dataTable.Rows) // Manejo de nulos en la columna ApellidoMaterno
                {
                    string nombre = row["Nombre"].ToString();
                    string apellidoPaterno = row["ApellidoPaterno"].ToString();
                    string apellidoMaterno = row["ApellidoMaterno"] == DBNull.Value ? "" : row["ApellidoMaterno"].ToString();

                    row["NombreCompleto"] = $"{nombre} {apellidoPaterno} {apellidoMaterno}";
                }

                ddlMedicos.DataSource = dataTable;
                ddlMedicos.DataTextField = "NombreCompleto";
                ddlMedicos.DataValueField = "Id";
                ddlMedicos.DataBind();
            }

            ddlMedicos.Items.Insert(0, new ListItem("SELECCIONA UNA OPCIÓN", "0"));
            ddlMedicos.Enabled = true;


            _context.Close();
        }

        // ========================================== EVENTOS ================================
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarEspecialidades();
            }
        }

        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEspecialidad.SelectedValue != "0")
            {
                CargarMedicos(int.Parse(ddlEspecialidad.SelectedValue));
            }
            else
            {
                ddlMedicos.Items.Clear();
                ddlMedicos.Items.Insert(0, new ListItem("SELECCIONA UNA OPCIÓN", "0"));
                ddlMedicos.Enabled = false;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/Citas.aspx");
        }
    }
}