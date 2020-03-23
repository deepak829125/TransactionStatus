using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Schema;
using System.Xml.Xsl;
using System.Xml.Serialization;
using System.Data.SqlClient;
using System.Data.OleDb;


public partial class TransactionStatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //PnlGrid.Visible = false;
        
        if (!IsPostBack)
        {
            try
            {
                LblNoData.Visible = false;
                txtEPEBNo.Text = string.Empty;

                GetInfo();
                
                DataSet ds = new DataSet();//this dataset to read XML to datagrid
                ds.ReadXml(Server.MapPath("~\\XML\\BindRD.xml"));

                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddlRODName.DataSource = ds.Tables[0];
                    ddlRODName.DataTextField = "RoD_Name";
                    ddlRODName.DataValueField = "RoD_ID";
                    ddlRODName.DataBind();
                    ListItem lst = new ListItem("--Select ROD Name--", "0");
                    ddlRODName.Items.Insert(0, lst);
                }
                else
                {
                    ddlRODName.DataSource = ds.Tables[0];
                    ddlRODName.DataBind();
                    ListItem lst = new ListItem("--Select ROD Name--", "0");
                }

                DataSet dset = new DataSet();//this dataset to read XML to datagrid
                dset.ReadXml(Server.MapPath("~\\XML\\BindEPEB.xml"));
                if (dset.Tables[0].Rows.Count > 0)
                {
                    ddlEPEBType.DataSource = dset.Tables[0];
                    ddlEPEBType.DataTextField = "EPEB_Type_Desc";
                    ddlEPEBType.DataValueField = "EPEB_Type";
                    ddlEPEBType.DataBind();
                    ListItem lst = new ListItem("--Select EPEB Type--", "0");
                    ddlEPEBType.Items.Insert(0, lst);


                }
                else
                {
                    ddlEPEBType.DataSource = ds.Tables[0];
                    ddlEPEBType.DataBind();
                    ListItem lst = new ListItem("-- Select Status--", "0");
                    ddlEPEBType.Items.Insert(0, lst);

                }
            }
            catch
            {

            }
        }
    }

    private bool GetInfo()
    {
        if (!File.Exists(Server.MapPath("~\\XML\\BindRD.xml")))
        {
            LblNoData.Text = "Unable to connect Server, please try after sometime!";
            LblNoData.Visible = true;
            tr1.Visible = false;
            tr2.Visible = false;
            tr3.Visible = false;
            tr4.Visible = false;
            return false;
        }
        else if (!File.Exists(Server.MapPath("~\\XML\\BindEPEB.xml")))
        {
            LblNoData.Text = "Unable to connect Server, please try after sometime!";
            LblNoData.Visible = true;
            tr1.Visible = false;
            tr2.Visible = false;
            tr3.Visible = false;
            tr4.Visible = false;
            return false;
        }
        else if (!File.Exists(Server.MapPath("~\\XML\\TransactionStatus.xml")))
        {
            LblNoData.Text = "Unable to connect Server, please try after sometime!";
            LblNoData.Visible = true;
            tr1.Visible = false;
            tr2.Visible = false;
            tr3.Visible = false;
            tr4.Visible = false;
            return false;
        }
        tr1.Visible = true;
        tr2.Visible = true;
        tr3.Visible = true;
        tr4.Visible = true;
        return true;
    }

    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();//this dataset to read XML to datagrid
            ds.ReadXml(Server.MapPath("~\\XML\\TransactionStatus.xml"));

            try
            {
                DataRow[] rows = ds.Tables[0].Select("RoD_Name = '" + ddlRODName.SelectedItem.Text + "' and EPEB_Type_Desc = '" + ddlEPEBType.SelectedItem.Text + "' and EPEB_ENO = '" + txtEPEBNo.Text + "'");
                if (rows.Length > 0)
                {
                    LblNoData.Visible = false;
                    DataTable table = new DataTable();
                    table = ds.Tables[0].Clone();
                    DataRow row = table.NewRow();
                    foreach (DataRow r in rows)
                    {
                        row["RoD_Name"] = r["RoD_Name"];
                        row["EPEB_Type_Desc"] = r["EPEB_Type_Desc"];
                        row["EPEB_ENO"] = r["EPEB_ENO"];
                        row["Activity_ID"] = r["Activity_ID"];
                        //row["Presenter_Name"] = r["Presenter_Name"];
                        table.Rows.Add(row);
                    }
                    GridView1.DataSource = table;//ds.Tables[0].Select("RoD_Name = '" + ddlRODName.SelectedItem.Text + "' and EPEB_Type_Desc = '" + ddlEPEBType.SelectedItem.Text + "' and EPEB_ENO = '" + txtEPEBNo.Text + "'");
                    GridView1.DataBind();
                    GridView1.Visible = true;
                    PnlGrid.Visible = true;

                    FileAttributes fileAttributes = File.GetAttributes(Server.MapPath("~\\XML\\TransactionStatus.xml"));
                    FileInfo f = new FileInfo(Server.MapPath("~\\XML\\TransactionStatus.xml"));
                    Lbldate.Text = f.LastWriteTime.ToLongDateString();
                    LblTime.Text = f.LastWriteTime.ToLongTimeString();
                    Lbldate.Visible = true;
                    LblTime.Visible = true;
                    Lblcreatedate.Visible = true;
                    Label1.Visible = true;
                    //string strServer = Server.MapPath("~\\XML\\TransactionStatus.xml");

                }
                else
                {
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                    LblNoData.Text = "No data Available!";
                    LblNoData.Visible = true;
                    Lbldate.Visible = false;
                    LblTime.Visible = false;
                    Lblcreatedate.Visible = false;
                    Label1.Visible = false;
                }
            }
            catch
            {
                LblNoData.Text = "Unable to show data, please try after sometime!";
                LblNoData.Visible = true;
            }
        }
        catch
        {
            LblNoData.Text = "Unable to retrive data, please try after sometime!";
            LblNoData.Visible = true;
        }
    }
}
