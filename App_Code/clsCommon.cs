using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Data;
using System.Web.UI.WebControls;


/// <summary>
/// Summary description for clsCommon
/// </summary>
public class clsCommon
{
    public clsCommon()
    {
    }
    public static bool GetInfo4Dropdown(string strPath)
    {
        if (!Directory.Exists(strPath))
        {
            return false;
        }
        else
        {
            if (!File.Exists(strPath + "\\BindRD.xml"))
                return false;
            else if (!File.Exists(strPath + "\\BindEPEB.xml"))
                return false;
            //else if (!File.Exists(strPath + "\\TransactionStatus.xml"))
            //    return false;
            else
                return true;
        }
    }
    public static bool GetInfo4XML(string strPath, string fileName)
    {
        if (!Directory.Exists(strPath))
        {
            return false;
        }
        else
        {
            if (!File.Exists(strPath + "\\" + fileName))
                return false;
            //"\\TransactionStatus.xml"
            else
            {
                StreamReader strmrdr = new StreamReader(strPath + "\\" + fileName);
                string enStr = strmrdr.ReadLine();
                strmrdr.Close();
                string NewPath = strPath + "\\" + enStr;
                if (!Directory.Exists(NewPath))
                {
                    return false;
                }
                else
                {
                    AddNewPath(HttpContext.Current, NewPath);
                    if (!File.Exists(NewPath + "\\" + "TransactionStatus.xml"))
                        return false;
                }
                return true;
            }
        }
    }
    public static bool GetInfo4XML(string strPath, string fileName, string RodId)
    {
        if (!Directory.Exists(strPath))
        {
            return false;
        }
        else
        {
            if (!File.Exists(strPath + "\\" + fileName))
                return false;
            //"\\TransactionStatus.xml"
            else
            {
                StreamReader strmrdr = new StreamReader(strPath + "\\" + fileName);
                string enStr = strmrdr.ReadLine();
                strmrdr.Close();
                string NewPath = strPath + "\\" + enStr;
                if (!Directory.Exists(NewPath))
                {
                    return false;
                }
                else
                {
                    AddNewPath(HttpContext.Current, NewPath);
                    if (!File.Exists(NewPath + "\\" + RodId + ".xml"))
                        return false;
                }
                return true;
            }
        }
    }
    public static void BindDropDown(ref DropDownList ddl, string strPath, string xmlName, string DataTextField, string DataValueField)
    {
        DataSet ds = new DataSet();
        ds.ReadXml(strPath + xmlName);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataView dvOptions = new DataView(ds.Tables[0]);
            dvOptions.Sort = DataTextField;
            //ddl.DataSource = ds.Tables[0];
            ddl.DataSource = dvOptions;
            ddl.DataTextField = DataTextField;
            ddl.DataValueField = DataValueField;
            ddl.DataBind();
            ListItem lst = new ListItem("--Select--", "0");
            ddl.Items.Insert(0, lst);
        }
    }

    public static void AddNewPath(HttpContext hc, string NewPath)
    {
        hc.Session["NewPath"] = NewPath;
    }

    public string GetNewPath(HttpContext hc)
    {
        if (hc.Session["NewPath"] != null)
            return hc.Session["NewPath"].ToString();
        else
            return String.Empty;
    }

    public static void AddToSession(HttpContext hc, string RodName, string RodId, string EpebType, string EpebNo)
    {
        hc.Session["RodName"] = RodName;
        hc.Session["RodId"] = RodId;
        hc.Session["EpebType"] = EpebType;
        hc.Session["EpebNo"] = EpebNo;
    }
    public string GetRodName(HttpContext hc)
    {
        if (hc.Session["RodName"] != null)
            return hc.Session["RodName"].ToString();
        else
            return String.Empty;
    }
    public string GetRodId(HttpContext hc)
    {
        if (hc.Session["RodId"] != null)
            return hc.Session["RodId"].ToString();
        else
            return String.Empty;
    }
    public string GetEpebType(HttpContext hc)
    {
        if (hc.Session["EpebType"] != null)
            return hc.Session["EpebType"].ToString();
        else
            return String.Empty;
    }
    public string GetEpebNo(HttpContext hc)
    {
        if (hc.Session["EpebNo"] != null)
            return hc.Session["EpebNo"].ToString();
        else
            return String.Empty;
    }
}
