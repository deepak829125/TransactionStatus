using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LblNoData.Visible = false;
            txtEPEBNo.Text = string.Empty;

            //string path = Server.MapPath("~\\XML\\");
            string path = Server.MapPath(System.Configuration.ConfigurationManager.AppSettings["Path"].ToString());
            
            #region Bind Dropdown
            if (clsCommon.GetInfo4Dropdown(path) == true)
            {
                tr1.Visible = true;
                tr2.Visible = true;
                tr3.Visible = true;
                tr4.Visible = true;

                DataSet ds = new DataSet();
                clsCommon.BindDropDown(ref ddlRODName, path, "BindRD.xml", "RoD_Name", "RoD_ID");
                clsCommon.BindDropDown(ref ddlEPEBType, path, "BindEPEB.xml", "EPEB_Type_Desc", "EPEB_Type");
            }
            else
            {
                LblNoData.Text = "Unable to connect Server, please try after sometime!";
                LblNoData.Visible = true;
                tr1.Visible = false;
                tr2.Visible = false;
                tr3.Visible = false;
                tr4.Visible = false;
            }
            #endregion

            string strTextFile = System.Configuration.ConfigurationManager.AppSettings["txtFileName"].ToString();

            //if (clsCommon.GetInfo4XML(path, strTextFile) == true)
            //{
            //}
            //else
            //{
            //    LblNoData.Text = "Unable to connect Server, please try after sometime!";
            //    LblNoData.Visible = true;
            //    tr1.Visible = false;
            //    tr2.Visible = false;
            //    tr3.Visible = false;
            //    tr4.Visible = false;
            //}
        }
    }


   
    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        decimal dcEPEBNo = Convert.ToDecimal(txtEPEBNo.Text);
        try
        {
            if (ddlRODName.SelectedIndex == 0)
            {
                LblNoData.Text = "Select Registry of Deeds.";
                LblNoData.Visible = true;
                return;
            }
            if (ddlEPEBType.SelectedIndex == 0)
            {
                LblNoData.Text = "Select EPEB Type.";
                LblNoData.Visible = true;
                return;
            }
            if (Convert.ToString(dcEPEBNo).Length != 10)
            {
                LblNoData.Text = "Please enter correct EPEB No.";
                LblNoData.Visible = true;
                return;
            }
            clsCommon.AddToSession(HttpContext.Current, ddlRODName.SelectedItem.Text.Trim(), ddlRODName.SelectedValue.ToString(), ddlEPEBType.SelectedValue.ToString(), txtEPEBNo.Text.Trim());
            Response.Redirect("Result.aspx");
            //DataSet ds = new DataSet();//this dataset to read XML to datagrid
            //ds.ReadXml(Server.MapPath("~\\XML\\TransactionStatus.xml"));

            //try
            //{
            //    DataRow[] rows = ds.Tables[0].Select("RoD_Name = '" + ddlRODName.SelectedItem.Text + "' and EPEB_Type_Desc = '" + ddlEPEBType.SelectedItem.Text + "' and EPEB_ENO = '" + txtEPEBNo.Text + "'");
            //    if (rows.Length > 0)
            //    {
            //        LblNoData.Visible = false;
            //        DataTable table = new DataTable();
            //        table = ds.Tables[0].Clone();
            //        DataRow row = table.NewRow();
            //        foreach (DataRow r in rows)
            //        {
            //            row["RoD_Name"] = r["RoD_Name"];
            //            row["EPEB_Type_Desc"] = r["EPEB_Type_Desc"];
            //            row["EPEB_ENO"] = r["EPEB_ENO"];
            //            row["Activity_ID"] = r["Activity_ID"];
            //            //row["Presenter_Name"] = r["Presenter_Name"];
            //            table.Rows.Add(row);
            //        }
            //        GridView1.DataSource = table;//ds.Tables[0].Select("RoD_Name = '" + ddlRODName.SelectedItem.Text + "' and EPEB_Type_Desc = '" + ddlEPEBType.SelectedItem.Text + "' and EPEB_ENO = '" + txtEPEBNo.Text + "'");
            //        GridView1.DataBind();
            //        GridView1.Visible = true;
            //        PnlGrid.Visible = true;

            //        FileAttributes fileAttributes = File.GetAttributes(Server.MapPath("~\\XML\\TransactionStatus.xml"));
            //        FileInfo f = new FileInfo(Server.MapPath("~\\XML\\TransactionStatus.xml"));
            //        Lbldate.Text = f.LastWriteTime.ToLongDateString();
            //        LblTime.Text = f.LastWriteTime.ToLongTimeString();
            //        Lbldate.Visible = true;
            //        LblTime.Visible = true;
            //        Lblcreatedate.Visible = true;
            //        Label1.Visible = true;
            //        //string strServer = Server.MapPath("~\\XML\\TransactionStatus.xml");

            //    }
            //    else
            //    {
            //        GridView1.DataSource = null;
            //        GridView1.DataBind();
            //        LblNoData.Text = "No data Available!";
            //        LblNoData.Visible = true;
            //        Lbldate.Visible = false;
            //        LblTime.Visible = false;
            //        Lblcreatedate.Visible = false;
            //        Label1.Visible = false;
            //    }
            //}
            //catch
            //{
            //    LblNoData.Text = "Unable to show data, please try after sometime!";
            //    LblNoData.Visible = true;
            //}
        }
        catch
        {
            LblNoData.Text = "Unable to retrive data, please try after sometime!";
            LblNoData.Visible = true;
        }
    }
}
