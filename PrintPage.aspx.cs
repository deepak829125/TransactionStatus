using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
public partial class PrintPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            btnprintout_Click(this, null);
            DataTable dt = (DataTable)Session["tableF"];
            if(dt!=null)
            if (dt.Rows.Count > 0)
            {
             
                GridView1.DataSource = dt;//ds.Tables[0].Select("RoD_Name = '" + ddlRODName.SelectedItem.Text + "' and EPEB_Type_Desc = '" + ddlEPEBType.SelectedItem.Text + "' and EPEB_ENO = '" + txtEPEBNo.Text + "'");
                GridView1.DataBind();

                #region Added Riyaz
                /* This Code Added in 04/07/2011 because of CRF_OTM_02_01  */
                if (dt.Rows[0]["Activity_ID"].ToString().ToUpper() == "CLOSED")
                {
                    GridView1.HeaderRow.Cells[5].Text = "Closed Date";

                }
                else if (dt.Rows[0]["Activity_ID"].ToString().ToUpper() == "WITHDRAWN")
                {
                    GridView1.HeaderRow.Cells[5].Text = "Withdrawn Date";
                }
                else if (dt.Rows[0]["Activity_ID"].ToString().ToUpper() == "VOIDED")
                {
                    GridView1.HeaderRow.Cells[5].Text = "Voided Date";
                }
                else
                {
                    GridView1.Columns[5].Visible = false;

                }

                #endregion

                GridView1.Visible = true;
                PnlGrid.Visible = true;
                clsCommon cl = new clsCommon();
                string fileLocation = cl.GetNewPath(HttpContext.Current);
                //FileAttributes fileAttributes = File.GetAttributes(fileLocation + "\\TransactionStatus.xml");
                //FileInfo f = new FileInfo(fileLocation + "\\TransactionStatus.xml");
                //Lbldate.Text = f.LastWriteTime.ToLongDateString().Trim();
                //LblTime.Text = f.LastWriteTime.ToLongTimeString().Trim();

                DataSet ds1 = new DataSet();
                ds1.ReadXml(fileLocation + "\\ExtractTime.xml");
                Lbldate.Text = ds1.Tables[0].Rows[0][0].ToString().Trim();

                Lbldate.Visible = true;
                LblTime.Visible = true;
                Lblcreatedate.Visible = true;
                Label1.Visible = true;
            }
           else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
                Lbldate.Visible = false;
                LblTime.Visible = false;
                Lblcreatedate.Visible = false;
                Label1.Visible = false;
            }
        }
        catch (Exception ex)
        { }
    }
    protected void btnprintout_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Write("<script> window.print(); </script>");
        }
        catch(Exception ex)
        {}
    }
}
