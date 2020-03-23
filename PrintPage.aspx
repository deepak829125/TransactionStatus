<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintPage.aspx.cs" Inherits="PrintPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="Stylesheet" href="CSS/Styles.css" type="text/css" />
    <title></title>
    <style type="text/css">
        .SetFontSize
        {
            font-size: 12px;
            font-family: Arial;
        }
        .SetFontSizeHdr
        {
            font-size: 13.5px;
            font-family: Arial;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="text-align: center">
    <br />
    <table border="0" style="background-image: url('Images/lra_2.JPG'); background-repeat: no-repeat;
        background-position: center center; width: 100%; height: 400px;" align="center"
        bgcolor="White">
        <tr>
            <td align="left">
                <asp:Label ID="lblHeader" runat="server" CssClass="SetFontSizeHdr" Text="Transaction Workflow"
                    Font-Bold="true"></asp:Label><hr />
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:Panel ID="pnlTime" runat="server" CssClass="" Width="100%" HorizontalAlign="Left">
                    <asp:Label ID="Lblcreatedate" runat="server" CssClass="" Text="As of" Visible="false"></asp:Label>&nbsp
                    <asp:Label ID="Lbldate" runat="server" Text="" CssClass="" Visible="false"></asp:Label>
                    <asp:Label ID="LblTime" runat="server" Text="" CssClass="" Visible="false"></asp:Label>
                    <asp:Label ID="Label1" runat="server" CssClass="" Text=", your transaction" Visible="false"></asp:Label>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:Panel ID="PnlGrid" runat="server" Width="100%">
                    <asp:GridView ID="GridView1" runat="server" Width="99%" AllowPaging="true" PageSize="10"
                        AutoGenerateColumns="false" BackColor="Transparent">
                        <Columns>
                            <asp:TemplateField HeaderText="RoD Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblRoD_Name" runat="server" Text='<%#Eval("RoD_Name")%>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="EPEB Type">
                                <ItemTemplate>
                                    <asp:Label ID="lblEPEB_type_Desc" runat="server" Text='<%#Eval("EPEB_Type_Desc")%>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="EPEB No">
                                <ItemTemplate>
                                    <asp:Label ID="lblEPEB_ENO" runat="server" Text='<%#Eval("EPEB_ENO")%>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Entry Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblEPEB_ENDate" runat="server" Text='<%#Eval("ENTRY_DATE")%>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Font-Bold="false" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblActivity_ID" runat="server" Text='<%#Eval("Activity_ID")%>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:Label ID="lblEPEB_EXDate" runat="server" Text='<%#Eval("EXIT_DATE")%>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Font-Bold="false" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:Label ID="Label2" runat="server" CssClass="" Text="Note: Please check our website for regular updates on your transaction"
                    Visible="true"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnprintout" runat="server" Visible="false" OnClick="btnprintout_Click" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
