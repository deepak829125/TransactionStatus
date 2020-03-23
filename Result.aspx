<%@ Page Title="" Language="C#" MasterPageFile="~/LraMasterPage.master" AutoEventWireup="true"
    CodeFile="Result.aspx.cs" Inherits="Result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
    <div style="position: absolute; width: 820px">
        <table width="70%" border="0" cellpadding="0" cellspacing="0" align="left" class="jquerycssmenu">
            <tr>
                <td align="right">
                    <asp:ImageButton ID="btnprint" runat="server" ImageUrl="~/Images/print.jpg" ToolTip="Print Transaction"
                        OnClick="print_Click" Height="40px" /><br />
                    <asp:Label ID="lblPrint" runat="server" Text="Print"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <hr />
                    <h2 class="jquerycssmenu">
                        <asp:Label ID="lblHeader" runat="server" CssClass="SetFontSizeHdr" Text="Transaction Workflow"
                            Font-Bold="true"></asp:Label>
                    </h2>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Image ID="imgProcess" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Label ID="LblNoData" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Panel ID="pnlTime" runat="server" Width="100%" HorizontalAlign="Left">
                        <asp:Label ID="Lblcreatedate" runat="server" CssClass="" Text="The Transaction status provided as of "
                            Visible="false"></asp:Label>&nbsp
                        <asp:Label ID="Lbldate" runat="server" CssClass="" Text="" Visible="false"></asp:Label>
                        <%--<asp:Label ID="Label1" runat="server" Text=", " Visible="false"></asp:Label>--%>
                        <asp:Label ID="LblTime" runat="server" CssClass="" Text="" Visible="false"></asp:Label>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <hr />
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Panel ID="PnlGrid" runat="server" Width="100%">
                        <asp:GridView ID="GridView1" runat="server" Width="100%" AllowPaging="true" PageSize="10"
                            AutoGenerateColumns="false">
                            <FooterStyle BackColor="#4C8DD1" ForeColor="#003399" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#009999" Font-Bold="false" ForeColor="#CCFF99" />
                            <PagerStyle BackColor="#4C8DD1" ForeColor="#FFFFCC" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#507CD1" CssClass="Freezing" Font-Bold="True" ForeColor="White"
                                HorizontalAlign="Center" />
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="RD/Office">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRoD_Name" runat="server" Text='<%#Eval("RoD_Name")%>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Font-Bold="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EPEB Type">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEPEB_type_Desc" runat="server" Text='<%#Eval("EPEB_Type_Desc")%>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Font-Bold="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EPEB No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEPEB_ENO" runat="server" Text='<%#Eval("EPEB_ENO")%>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Font-Bold="false" />
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
                                    <ItemStyle HorizontalAlign="Center" Font-Bold="true" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEPEB_EXDate" runat="server" Text='<%#Eval("EXIT_DATE")%>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Font-Bold="false" />
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
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:ImageButton ID="btnBack" runat="server" ImageUrl="~/Images/btBack_1.gif" onmouseover="this.src='Images/btBack_2.gif'"
                        onmouseout="this.src='Images/btBack_1.gif'" ToolTip="Query again" OnClick="btnBack_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Label ID="Label2" Font-Bold="false" runat="server" Text="Note: Please check our website for regular updates on your transaction"
                        Visible="true"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
