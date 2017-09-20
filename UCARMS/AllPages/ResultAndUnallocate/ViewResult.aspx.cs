using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using Org.BouncyCastle.Asn1.X509;
using ListItem = System.Web.UI.WebControls.ListItem;

namespace UCRMS
{
    public partial class ViewResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateNameAndCodeDropDownList();
            }
        }

        private void PopulateNameAndCodeDropDownList()
        {
            ddlStudentRegistration.DataSource = GetData("spGetAllstudentById", null);
            ddlStudentRegistration.DataBind();

            ListItem liRegNo = new ListItem("Select Reg. No", "-1");
            ddlStudentRegistration.Items.Insert(0, liRegNo);
        }

        private DataSet GetData(string SPName, SqlParameter SPParameter)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlDataAdapter da = new SqlDataAdapter(SPName, con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (SPParameter != null)
            {
                da.SelectCommand.Parameters.Add(SPParameter);
            }
            DataSet DS = new DataSet();
            da.Fill(DS);
            return DS;
        }

        protected void ddlStudentRegistration_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlStudentRegistration.SelectedIndex == 0)
            {
                txtName.Text = String.Empty;
                txtEmail.Text = String.Empty;
                txtDeparrtment.Text = String.Empty;
                //     ddlCourse.SelectedValue = "-1";
                //   txtDate.Text = String.Empty;
                //  ddlCourse.Enabled = false;
            }
            else
            {
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(CS);
                SqlDataAdapter da = new SqlDataAdapter("spGetNameEmailDepartmentByStudentId", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;

                da.SelectCommand.Parameters.AddWithValue("@Id", ddlStudentRegistration.SelectedValue);
                DataSet ds = new DataSet();

                da.Fill(ds, "Students");
                if (ds.Tables["Students"].Rows.Count > 0)
                {
                    DataRow dr = ds.Tables["Students"].Rows[0];
                    txtName.Text = dr["StudentName"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtDeparrtment.Text = dr["Name"].ToString();
                }

            }
        }

        protected void btnMakePDF_Click(object sender, EventArgs e)
        {
            //Connection and DataBind.....
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlDataAdapter da = new SqlDataAdapter("spGetStudentResultPDF", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@Reg", ddlStudentRegistration.SelectedValue);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView2.DataSource = ds;
            GridView2.DataBind();


            PdfPTable pTable = new PdfPTable(GridView2.HeaderRow.Cells.Count);

            //Header addded..........
            foreach (TableCell headerCell in GridView2.HeaderRow.Cells)
            {
                Font font = new Font();
                font.Color = new BaseColor(GridView2.HeaderStyle.ForeColor);
                PdfPCell pdfPCell = new PdfPCell(new Phrase(headerCell.Text, font));
                pdfPCell.BackgroundColor = new BaseColor(GridView2.HeaderStyle.BackColor);
                pTable.AddCell(pdfPCell);
            }

            //Row added.............

            foreach (GridViewRow gridViewRow in GridView2.Rows)
            {
                foreach (TableCell tableCell in gridViewRow.Cells)
                {
                    Font font = new Font();
                    font.Color = new BaseColor(GridView2.RowStyle.ForeColor);
                    PdfPCell pdfPCell = new PdfPCell(new Phrase(tableCell.Text, font));
                    pdfPCell.BackgroundColor = new BaseColor(GridView2.RowStyle.BackColor);
                    pTable.AddCell(pdfPCell);
                }
            }

            Document pdfDocument = new Document(PageSize.A4, 10f, 10f, 10f, 10f);
            // for landscape view...
            pdfDocument.SetPageSize(PageSize.A4.Rotate());

             PdfWriter.GetInstance(pdfDocument,new FileStream(Server.MapPath("~/PDFDocuments/Result.pdf"), FileMode.Create));    

            pdfDocument.Open();
            pdfDocument.Add(pTable);
            pdfDocument.Close();

           Response.Redirect("~/PDFDocuments//Result.pdf");

           // string str = "<script>window.open('~/PDFDocuments/Result.pdf')</script>";
         
        }
    }
}
