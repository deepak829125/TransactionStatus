<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TransactionStatus.aspx.cs"
    Inherits="TransactionStatus" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td align="center" colspan="2">
                    <table width="100%" background="Images/banner.jpg" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="vertical-align: bottom">
                                <img src="Images/PhilarisWebServices.jpg" align="left">
                            </td>
                            <td style="vertical-align: bottom">
                                <img src="Images/banner.jpg" align="left">
                            </td>
                            <td width="3%" align="right">
                            </td>
                            <td width="4%" align="center">
                            </td>
                            <td width="4%">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td width="100%" colspan="2">
                    <table width="100%" border="0" background="Images/New MasterPage images/tab.jpg"
                        cellpadding="0" cellspacing="0">
                        <tr height="25px" valign="top">
                            <td width="60%" style="padding-left: 5px;">
                            </td>
                            <td width="20%" align="center" style="padding-left: 5px;">
                            </td>
                            <td width="20%" align="left" style="padding-right: 5px;">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td colspan="4" align="center">
                    <h1 style="font-size: x-large; font-weight: normal; font-style: normal; text-transform: capitalize;
                        color: #7A9DFA">
                        <asp:Label ID="lblHeader" runat="server" Text="Transaction Monitoring" Font-Bold="true"></asp:Label></h1>
                </td>
            </tr>
            <tr id="tr1" runat="server">
                <td style="width: 15%">
                </td>
                <td style="width: 30%;" align="right">
                    <asp:Label ID="lblRODName" runat="server" Text="RoD Name :"></asp:Label>
                </td>
                <td style="width: 40%;" align="left">
                    <asp:DropDownList ID="ddlRODName" runat="server" Width="90%">
                    </asp:DropDownList>
                </td>
                <td style="width: 15%">
                </td>
            </tr>
            <tr id="tr2" runat="server">
                <td style="width: 15%">
                </td>
                <td style="width: 30%;" align="right">
                    <asp:Label ID="lblEPEBType" runat="server" Text="EPEB Type :"></asp:Label>
                </td>
                <td style="width: 40%;" align="left">
                    <asp:DropDownList ID="ddlEPEBType" runat="server" Width="90%">
                    </asp:DropDownList>
                </td>
                <td style="width: 15%">
                </td>
            </tr>
            <tr id="tr3" runat="server">
                <td style="width: 15%">
                </td>
                <td style="width: 30%;" align="right">
                    <asp:Label ID="lblEPEBNo" runat="server" Text="EPEB No :"></asp:Label>
                </td>
                <td style="width: 40%;" align="left">
                    <asp:TextBox ID="txtEPEBNo" runat="server" MaxLength="25" Style="text-transform: uppercase"
                        CssClass="uppertext"></asp:TextBox>
                </td>
                <td style="width: 15%">
                </td>
            </tr>
            <tr id="tr4" runat="server">
                <td colspan="4" align="center">
                    <asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/Images/btSearch_1.gif"
                        onmouseover="this.src='Images/btSearch_2.gif'" onmouseout="this.src='Images/btSearch_1.gif'"
                        ToolTip="Next" OnClick="btnSearch_Click" />
                </td>
            </tr>
            <tr>
                <td align="center" colspan="4">
                    <asp:Label ID="LblNoData" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="4" align="center">
                    <asp:Panel ID="pnlTime" runat="server" Width="80%" HorizontalAlign="Left">
                        <asp:Label ID="Lblcreatedate" runat="server" Text="As of " Visible="false"></asp:Label>&nbsp
                        <asp:Label ID="Lbldate" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="LblTime" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text=", your transaction..." Visible="false"></asp:Label>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="4" align="center">
                    <asp:Panel ID="PnlGrid" runat="server">
                        <asp:GridView ID="GridView1" runat="server" Width="80%" AllowPaging="true" PageSize="10"
                            AutoGenerateColumns="false">
                            <FooterStyle BackColor="#4C8DD1" ForeColor="#003399" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <PagerStyle BackColor="#4C8DD1" ForeColor="#FFFFCC" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#507CD1" CssClass="Freezing" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
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
                                <asp:TemplateField HeaderText="Current Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblActivity_ID" runat="server" Text='<%#Eval("Activity_ID")%>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <%--<asp:TemplateField HeaderText="Presenter Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPresenter_Name" runat="server" Text='<%#Eval("Presenter_Name")%>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>--%>
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
