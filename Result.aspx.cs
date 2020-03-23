using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Xml;
using System.Xml.XPath;
using System.Text;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;

public partial class Result : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            clsCommon cl = new clsCommon();
            string RodName = cl.GetRodName(HttpContext.Current);
            string EpebType = cl.GetEpebType(HttpContext.Current);
            string EpebNo = cl.GetEpebNo(HttpContext.Current);
            if (RodName == "" || EpebType == "" || EpebNo == "")
            {
                LblNoData.Text = "Your session has expired, please try again!";
                LblNoData.Visible = true;
                imgProcess.Visible = false;
                lblPrint.Visible = false;
                btnprint.Visible = false;
                return;
            }
            if (RodName == null || EpebType == null || EpebNo == null)
            {
                LblNoData.Text = "Your session has expired, please try again!";
                LblNoData.Visible = true;
                imgProcess.Visible = false;
                lblPrint.Visible = false;
                btnprint.Visible = false;
                return;
            }

            string path = Server.MapPath(System.Configuration.ConfigurationManager.AppSettings["Path"].ToString());
            string strTextFile = System.Configuration.ConfigurationManager.AppSettings["txtFileName"].ToString();
            string RodId = cl.GetRodId(HttpContext.Current);
            if (clsCommon.GetInfo4XML(path, strTextFile,RodId) == true)
            {
            }
            else
            {
                LblNoData.Text = "Data for selected Registry of deeds is not available, please try later!";
                LblNoData.Visible = true;
                imgProcess.Visible = false;
                lblPrint.Visible = false;
                btnprint.Visible = false;
                return;
            }
            switch (EpebType)
            {
                case "CCV":
                    imgProcess.ImageUrl = "~/LRA_Images/CCV.JPG";
                    //imgProcess.Height = 100;
                    break;
                case "Chattel Mortgage":
                    imgProcess.ImageUrl = "~/LRA_Images/CM.JPG";
                    break;
                case "Personal Properties":
                    imgProcess.ImageUrl = "~/LRA_Images/PP.JPG";
                    break;
                case "Provisional Registration":
                    imgProcess.ImageUrl = "~/LRA_Images/RL.JPG";
                    break;
                case "Registered Land":
                    imgProcess.ImageUrl = "~/LRA_Images/RL.JPG";
                    break;
                case "Unregistered Land":
                    imgProcess.ImageUrl = "~/LRA_Images/UL.JPG";
                    break;
                case "CARP Book":
                    imgProcess.ImageUrl = "~/LRA_Images/RL_CARP.JPG";
                    break;
            }
            
            try
            {
                DataSet ds = new DataSet();//this dataset to read XML to datagrid
                string fileLocation = cl.GetNewPath(HttpContext.Current);
                Session["tableF"] = null;
                if (fileLocation == "" || fileLocation == null)
                {
                    LblNoData.Text = "Unable to get information, please try after sometime!";
                    LblNoData.Visible = true;
                    btnprint.Visible = false;
                    imgProcess.Visible = false;
                    lblPrint.Visible = false;
                    btnprint.Visible = false;
                    return;
                }

                //string fileName = fileLocation + "\\TransactionStatus.xml";
                string fileName = fileLocation + "\\" + RodId + ".xml";
                XPathDocument doc = new XPathDocument(fileName);
                XPathNavigator nav = doc.CreateNavigator();

                // Compile a standard XPath expression

                XPathExpression expr;
                expr = nav.Compile("/NewDataSet/Table[RoD_Name='" + RodName + "']|/NewDataSet/Table[EPEB_Type_Desc='" + EpebType + "']|/NewDataSet/Table[EPEB_ENO='" + EpebNo + "']");
                
                XPathNodeIterator iterator = nav.Select(expr);

                try
                {
                    if (iterator.Count > 0)
                    {
                        while (iterator.MoveNext())
                        {
                            XPathNavigator nav2 = iterator.Current.Clone();
                            nav2.MoveToFirstChild();
                            string a = nav2.Value;
                            nav2.MoveToNext();
                            string b = nav2.Value;
                            nav2.MoveToNext();
                            string c = nav2.Value;
                            nav2.MoveToNext();
                            string d = nav2.Value;
                            if (a == RodName && b == EpebType && c == EpebNo)
                            {
                                IFormatter formatter = new BinaryFormatter();

                                DataTable table = new DataTable();
                                //byte[] bt = Encoding.ASCII.GetBytes(iterator.Current.OuterXml);
                                //MemoryStream ms = new MemoryStream();
                                //formatter.Serialize(ms, iterator.Current.OuterXml);

                                StringReader stream = new StringReader(iterator.Current.OuterXml);
                                XmlTextReader reader = new XmlTextReader(stream);
                                ds.ReadXml(reader);
                                //ds.ReadXml(ms);

                                GridView1.DataSource = ds;
                                Session["tableF"] = ds.Tables[0];
                               
                                GridView1.DataBind();
                                #region Added Riyaz
                                /* This Code Added in 04/07/2011 because of CRF_OTM_02_01  */
                                if (ds.Tables[0].Rows[0]["Activity_ID"].ToString().ToUpper() == "CLOSED")
                                {
                                    GridView1.HeaderRow.Cells[5].Text = "Closed Date";
                                }
                                else if (ds.Tables[0].Rows[0]["Activity_ID"].ToString().ToUpper() == "WITHDRAWN")
                                {
                                    GridView1.HeaderRow.Cells[5].Text = "Withdrawn Date";
                                }
                                else if (ds.Tables[0].Rows[0]["Activity_ID"].ToString().ToUpper() == "VOIDED")
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
                                
                                //FileAttributes fileAttributes = File.GetAttributes(fileLocation + "\\TransactionStatus.xml");
                                //FileInfo f = new FileInfo(fileLocation + "\\TransactionStatus.xml");
                                //FileAttributes fileAttributes = File.GetAttributes(fileLocation + "\\" + RodId + ".xml");
                                //FileInfo f = new FileInfo(fileLocation + "\\" + RodId + ".xml");
                                //Lbldate.Text = f.LastWriteTime.ToLongDateString().Trim();
                                //LblTime.Text = f.LastWriteTime.ToShortTimeString().Trim();

                                DataSet ds1 = new DataSet();
                                ds1.ReadXml(fileLocation + "\\ExtractTime.xml");
                                Lbldate.Text = ds1.Tables[0].Rows[0][0].ToString().Trim();

                                Lbldate.Visible = true;
                                LblTime.Visible = false;
                                Lblcreatedate.Visible = true;
                                //Label1.Visible = true;
                                btnprint.Visible = true;
                                LblNoData.Visible = false;
                                imgProcess.Visible = true;
                                lblPrint.Visible = true;
                                break;
                            }
                            else
                            {
                                GridView1.DataSource = null;
                                GridView1.DataBind();
                                LblNoData.Text = "Data Not Available. Please Check your entry!";
                                LblNoData.Visible = true;
                                imgProcess.Visible = false;
                                Lbldate.Visible = false;
                                LblTime.Visible = false;
                                Lblcreatedate.Visible = false;
                                //Label1.Visible = false;
                                btnprint.Visible = false;
                                lblPrint.Visible = false;
                            }
                        }
                    }
                    else
                    {
                        GridView1.DataSource = null;
                        GridView1.DataBind();
                        LblNoData.Text = "Data Not Available. Please Check your entry!";
                        LblNoData.Visible = true;
                        imgProcess.Visible = false;
                        Lbldate.Visible = false;
                        LblTime.Visible = false;
                        Lblcreatedate.Visible = false;
                        //Label1.Visible = false;
                        btnprint.Visible = false;
                        lblPrint.Visible = false;
                    }
                }
                catch
                {
                    LblNoData.Text = "Unable to show data, please try after sometime!";
                    btnprint.Visible = false;
                    imgProcess.Visible = false;
                    LblNoData.Visible = true;
                    imgProcess.Visible = false;
                    lblPrint.Visible = false;
                }

                #region reading xml file by ReadXML --- not in use due to performance issue
                //ds.ReadXml(Server.MapPath("~\\XML\\TransactionStatus.xml"));
                //ds.ReadXml(fileLocation + "\\TransactionStatus.xml");

                //try
                //{
                //    DataRow[] rows = ds.Tables[0].Select("RoD_Name = '" + RodName + "' and EPEB_Type_Desc = '" + EpebType + "' and EPEB_ENO = '" + EpebNo + "'");
                //    if (rows.Length > 0)
                //    {
                //        imgProcess.Visible = true;
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
                //            table.Rows.Add(row);
                //        }
                //        GridView1.DataSource = table;
                //        Session["tableF"]=table;
                //        GridView1.DataBind();
                //        GridView1.Visible = true;
                //        PnlGrid.Visible = true;
                //        FileAttributes fileAttributes = File.GetAttributes(fileLocation + "\\TransactionStatus.xml");
                //        FileInfo f = new FileInfo(fileLocation + "\\TransactionStatus.xml");
                //        Lbldate.Text = f.LastWriteTime.ToLongDateString().Trim();
                //        LblTime.Text = f.LastWriteTime.ToLongTimeString().Trim();
                //        Lbldate.Visible = true;
                //        LblTime.Visible = true;
                //        Lblcreatedate.Visible = true;
                //        Label1.Visible = true;
                //    }
                //    else
                //    {
                //        GridView1.DataSource = null;
                //        GridView1.DataBind();
                //        LblNoData.Text = "Data Not Available. Please Check your entry!";
                //        LblNoData.Visible = true;
                //        imgProcess.Visible = false;
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
                //    imgProcess.Visible = false;
                //}
                #endregion
            }
            catch
            {
                LblNoData.Text = "Unable to retrive data, please try after sometime!";
                btnprint.Visible = false;
                imgProcess.Visible = false;
                LblNoData.Visible = true;
                imgProcess.Visible = false;
            }
        }
    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {
        clsCommon.AddToSession(HttpContext.Current, string.Empty, string.Empty, string.Empty, string.Empty);
        clsCommon.AddNewPath(HttpContext.Current, string.Empty);
        Response.Redirect("Search.aspx");
    }
    protected void print_Click(object sender, EventArgs e)
    {
        Response.Write("<script> window.open( 'PrintPage.aspx','','toolbar=no,location=no-directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=620,height=640' ); </script>");
    }
}
