<%@ Page Title="" Language="C#" MasterPageFile="~/LraMasterPage.master" AutoEventWireup="true"
    CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .flyOutDiv
        {
            display: none;
            position: absolute;
            width: 360px;
            height: 205px;
            z-index: 1500;
            opacity: 0;
            filter: (progid:DXImageTransform.Microsoft.Alpha(opacity=0));
            font-size: 14px;
            border: solid 1px #CCCCCC;
            background-color: #FFFFFF;
            padding: 5px;
        }
        .flyOutDivCloseX
        {
            color: #FF0000;
            text-align: center;
            font-weight: bold;
            text-decoration: none;
            border: outset thin #FFFFFF;
            padding: 5px;
        }
        .SetFontSize
        {
            font-size: 10px;
            font-family: Arial;
        }
        .SetFontSizeHdr
        {
            font-size: 13.5px;
            font-family: Arial;
            font-weight: bold;
        }
    </style>

    <script language="javascript" type="text/javascript">

        function ChkNumeric(x)
        //  check for valid numeric strings	
        {

            var EnterValue = document.getElementById(x).value;
            if (IsNumeric(EnterValue) == false) {
                document.getElementById(x).value = "";
                document.getElementById(x).style.background = '#FFE0C0';

                alert("Please Enter numeric Values Only");

                return false;

            }
            else {
                document.getElementById(x).style.background = "white";
                return true;
            }
        }
        // Checking IsNumeric Value
        function IsNumeric(sText) {
            var ValidChars = "0123456789()";
            var IsNumber = true;
            var Char;


            for (i = 0; i < sText.length && IsNumber == true; i++) {
                Char = sText.charAt(i);
                if (ValidChars.indexOf(Char) == -1) {
                    IsNumber = false;
                }
            }
            return IsNumber;
        }
  
    </script>

    <div style="position: absolute; width: 800px">
        <ajaxToolkit:ScriptManager ID="SM" runat="server">
        </ajaxToolkit:ScriptManager>
        <table width="100%" border="0" cellpadding="0" cellspacing="4" align="center">
            <tr>
                <td colspan="3" align="left">
                    <%--  <h2 class="jquerycssmenu">--%>
                    <asp:Label ID="lblHeader" runat="server" CssClass="SetFontSizeHdr" Text="LRA On-line Tracking System"></asp:Label>
                    <hr style="width: 98.5%" />
                    <%--</h2>--%>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <br />
                </td>
            </tr>
            <tr id="tr1" runat="server">
                <td style="width: 20%;" align="left">
                    <%--<asp:Label ID="lblStar1" runat="server" Text="*" ForeColor="Red"></asp:Label>--%>
                    <span style="color: #ff0000">*</span>
                    <asp:Label ID="lblRODName" runat="server" CssClass="" Width="90%" Text="Registry of Deeds :  "></asp:Label>
                </td>
                <td style="width: 40%;" align="left">
                    <asp:DropDownList ID="ddlRODName" runat="server" Width="97%">
                    </asp:DropDownList>
                </td>
                <td style="width: 40%;" align="left">
                    <asp:ImageButton ID="ImgBtnRD" runat="server" ImageUrl="~/Images/help.gif" OnClientClick="return false" />
                    <%-- <asp:LinkButton ID="lnkBtnColHelp" runat="server" Text="Click Here" OnClientClick="return false;" />--%>
                    <div id="divRd" class="flyOutDiv">
                        <div style="float: right;">
                            <img id="ImgRd" runat="server" src="~/Images/RD.JPG" style="position: absolute; z-index: 1500;
                                top: 0px; height: 100%; left: 0px; width: 94%;" alt="" />
                            <asp:LinkButton ID="lkBtnCloseRd" runat="server" Text="X" OnClientClick="return false;"
                                CssClass="flyOutDivCloseX" />
                        </div>
                    </div>
                    <ajaxToolkit:AnimationExtender ID="AnimationExtenderRD" runat="server" TargetControlID="ImgBtnRD">
                        <Animations>
                <OnClick>
                    <Sequence>
                        <EnableAction Enabled="false"></EnableAction>
 
                        <StyleAction AnimationTarget="divRd" Attribute="display" Value="block"/>
                        <Parallel AnimationTarget="divRd" Duration=".5" Fps="20">
                            <Move Horizontal="0" Vertical="0"></Move>
                            <FadeIn Duration=".30"/>
                        </Parallel>
                        <Parallel AnimationTarget="divRd" Duration=".30">
                             <Color PropertyKey="color" StartValue="#666666" EndValue="#FF0000" />
                            <Color PropertyKey="borderColor" StartValue="#666666" EndValue="#FF0000" />
                        </Parallel>
                    </Sequence>
                </OnClick>
                        </Animations>
                    </ajaxToolkit:AnimationExtender>
                    <ajaxToolkit:AnimationExtender ID="AnimationExtenderRD2" runat="server" TargetControlID="lkBtnCloseRd">
                        <Animations>
                <OnClick>
                    <Sequence AnimationTarget="divRd">
                        <Parallel AnimationTarget="divRd" Duration=".7" Fps="20">
                            <Move Horizontal="0" Vertical="0"></Move>
                            <Scale ScaleFactor="0" FontUnit="px" />
                            <Color PropertyKey="color" StartValue="#FF0000" EndValue="#666666" />
                            <Color PropertyKey="borderColor" StartValue="#FF0000" EndValue="#666666" />
                            <FadeOut />
                        </Parallel>
                        <StyleAction Attribute="display" Value="none"/>
                        <StyleAction Attribute="height" Value="205px"/>
                        <StyleAction Attribute="width" Value="360px"/>
                        <StyleAction Attribute="fontSize" Value="14px"/>
                        <EnableAction AnimationTarget="ImgBtnRD" Enabled="true" />
                    </Sequence>
                </OnClick>
                        </Animations>
                    </ajaxToolkit:AnimationExtender>
                </td>
            </tr>
            <tr id="tr2" runat="server">
                <td style="width: 20%;" align="left">
                    <%--<asp:Label ID="lblStar2" runat="server" Text="*" ForeColor="Red"></asp:Label>--%>
                    <span style="color: #ff0000">*</span>
                    <asp:Label ID="lblEPEBType" runat="server" CssClass="" Width="90%" Text="EPEB Type :  "></asp:Label>
                </td>
                <td style="width: 40%;" align="left">
                    <asp:DropDownList ID="ddlEPEBType" runat="server" Width="97%">
                    </asp:DropDownList>
                </td>
                <td style="width: 40%;" align="left">
                    <asp:ImageButton ID="lnkBtnColHelp" runat="server" ImageUrl="~/Images/help.gif" OnClientClick="return false" />
                    <%-- <asp:LinkButton ID="lnkBtnColHelp" runat="server" Text="Click Here" OnClientClick="return false;" />--%>
                    <div id="moveMe" class="flyOutDiv">
                        <div style="float: right;">
                            <asp:LinkButton ID="lnkBtnCloseColHelp" runat="server" Text="X" OnClientClick="return false;"
                                CssClass="flyOutDivCloseX" />
                            <img id="Img1" runat="server" src="~/Images/EPEB_Type.JPG" style="position: absolute;
                                z-index: 1500; top: 0px; height: 97%; left: 0px; width: 94%;" alt="" />
                        </div>
                        <%--<br />
     <p>
        some content here for whatever text
     </p>      --%>
                    </div>
                    <ajaxToolkit:AnimationExtender ID="AnimationExtender1" runat="server" TargetControlID="lnkBtnColHelp">
                        <Animations>
                <OnClick>
                    <Sequence>
                        <EnableAction Enabled="false"></EnableAction>
 
                        <StyleAction AnimationTarget="moveMe" Attribute="display" Value="block"/>
                        <Parallel AnimationTarget="moveMe" Duration=".5" Fps="20">
                            <Move Horizontal="0" Vertical="0"></Move>
                            <FadeIn Duration=".30"/>
                        </Parallel>
                        <Parallel AnimationTarget="moveMe" Duration=".30">
                             <Color PropertyKey="color" StartValue="#666666" EndValue="#FF0000" />
                            <Color PropertyKey="borderColor" StartValue="#666666" EndValue="#FF0000" />
                        </Parallel>
                    </Sequence>
                </OnClick>
                        </Animations>
                    </ajaxToolkit:AnimationExtender>
                    <ajaxToolkit:AnimationExtender ID="AnimationExtender2" runat="server" TargetControlID="lnkBtnCloseColHelp">
                        <Animations>
                <OnClick>
                    <Sequence AnimationTarget="moveMe">
                        <Parallel AnimationTarget="moveMe" Duration=".7" Fps="20">
                            <Move Horizontal="0" Vertical="0"></Move>
                            <Scale ScaleFactor="0" FontUnit="px" />
                            <Color PropertyKey="color" StartValue="#FF0000" EndValue="#666666" />
                            <Color PropertyKey="borderColor" StartValue="#FF0000" EndValue="#666666" />
                            <FadeOut />
                        </Parallel>
                        <StyleAction Attribute="display" Value="none"/>
                        <StyleAction Attribute="height" Value="205px"/>
                        <StyleAction Attribute="width" Value="360px"/>
                        <StyleAction Attribute="fontSize" Value="14px"/>
                        <EnableAction AnimationTarget="lnkBtnColHelp" Enabled="true" />
                    </Sequence>
                </OnClick>
                        </Animations>
                    </ajaxToolkit:AnimationExtender>
                </td>
            </tr>
            <tr id="tr3" runat="server">
                <td style="width: 20%;" align="left">
                    <%-- <asp:Label ID="lblStar3" runat="server" Text="*" ForeColor="Red"></asp:Label>--%>
                    <span style="color: #ff0000">*</span>
                    <asp:Label ID="lblEPEBNo" runat="server" CssClass="" Width="90%" Text="EPEB No :  "></asp:Label>
                </td>
                <td style="width: 40%;" align="left">
                    <asp:TextBox ID="txtEPEBNo" runat="server" MaxLength="25" Style="text-transform: uppercase"
                        Width="95%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfV" runat="server" ErrorMessage="Enter EPEB No."
                        ControlToValidate="txtEPEBNo" ValidationGroup="v">&nbsp;</asp:RequiredFieldValidator>
                    <ajaxToolkit:FilteredTextBoxExtender ID="ft1" runat="server" FilterType="Custom"
                        TargetControlID="txtEPEBNo" ValidChars="0123456789-abcdefghijklmnopqrstuvwxyz()" />
                </td>
                <td style="width: 40%" align="left">
                    <asp:ImageButton ID="lnkbtnEPEBHelp" runat="server" ImageUrl="~/Images/help.gif"
                        OnClientClick="return false" />
                    <%-- <asp:LinkButton ID="lnkBtnColHelp" runat="server" Text="Click Here" OnClientClick="return false;" />--%>
                    <div id="DivEPEB" class="flyOutDiv">
                        <div style="float: right;">
                            <asp:LinkButton ID="lnkbtnEPEBClose" runat="server" Text="X" OnClientClick="return false;"
                                CssClass="flyOutDivCloseX" />
                            <img id="Img2" runat="server" src="~/Images/EPEB_No.JPG" style="position: absolute;
                                z-index: 1500; top: 0px; height: 97%; left: 0px; width: 94%;" alt="" />
                        </div>
                        <%--<br />
     <p>
        some content here for whatever text
     </p>      --%>
                    </div>
                    <ajaxToolkit:AnimationExtender ID="AnimationExtender3" runat="server" TargetControlID="lnkbtnEPEBHelp">
                        <Animations>
                <OnClick>
                    <Sequence>
                        <EnableAction Enabled="false"></EnableAction>
 
                        <StyleAction AnimationTarget="DivEPEB" Attribute="display" Value="block"/>
                        <Parallel AnimationTarget="DivEPEB" Duration=".5" Fps="20">
                            <Move Horizontal="0" Vertical="0"></Move>
                            <FadeIn Duration=".30"/>
                        </Parallel>
                        <Parallel AnimationTarget="DivEPEB" Duration=".30">
                             <Color PropertyKey="color" StartValue="#666666" EndValue="#FF0000" />
                            <Color PropertyKey="borderColor" StartValue="#666666" EndValue="#FF0000" />
                        </Parallel>
                    </Sequence>
                </OnClick>
                        </Animations>
                    </ajaxToolkit:AnimationExtender>
                    <ajaxToolkit:AnimationExtender ID="AnimationExtender4" runat="server" TargetControlID="lnkbtnEPEBClose">
                        <Animations>
                <OnClick>
                    <Sequence AnimationTarget="DivEPEB">
                        <Parallel AnimationTarget="DivEPEB" Duration=".7" Fps="20">
                            <Move Horizontal="0" Vertical="0"></Move>
                            <Scale ScaleFactor="0" FontUnit="px" />
                            <Color PropertyKey="color" StartValue="#FF0000" EndValue="#666666" />
                            <Color PropertyKey="borderColor" StartValue="#FF0000" EndValue="#666666" />
                            <FadeOut />
                        </Parallel>
                        <StyleAction Attribute="display" Value="none"/>
                        <StyleAction Attribute="height" Value="205px"/>
                        <StyleAction Attribute="width" Value="360px"/>
                        <StyleAction Attribute="fontSize" Value="14px"/>
                        <EnableAction AnimationTarget="lnkbtnEPEBHelp" Enabled="true" />
                    </Sequence>
                </OnClick>
                        </Animations>
                    </ajaxToolkit:AnimationExtender>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                </td>
                <td width="35%" align="left">
                    <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="v" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 20%;" align="right">
                </td>
                <td align="center" width="40%">
                    <asp:Label ID="LblNoData" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                </td>
                <td style="width: 40%">
                </td>
            </tr>
            <tr id="tr4" runat="server">
                <td style="width: 20%;" align="right">
                </td>
                <td style="width: 40%" align="center">
                    <asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/Images/btSearch_1.gif"
                        onmouseover="this.src='Images/btSearch_2.gif'" onmouseout="this.src='Images/btSearch_1.gif'"
                        ToolTip="Search" OnClick="btnSearch_Click" ValidationGroup="v" />
                </td>
                <td style="width: 40%">
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <br />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <p style="font-size: smaller;">
        Get instant, up-to-date status of you transaction online with the LRA Online Tracking
        System (LOTS). The LOTS provides fast and easy access to your transaction status
        with any Registry of Deeds by simply filling out the boxes with information which
        can be derived from the Official Receipt. Please ensure to fill out the boxes accurately.
        </p><p style="font-size: smaller;">
        For comments/suggestions, You may e-mail us at <a href="mailto:customerservice@lra.gov.ph" style="font-size: small"> customerservice@lra.gov.ph</a>
    </p>
    <%-- <asp:Label ID="Label3" Font-Bold="false" runat="server" Text=" You may e-mail us at" Font-Size="Smaller"></asp:Label>
    <a href="mailto:customerservice@lra.gov.ph">customerservice@lra.gov.ph</a>--%>
</asp:Content>
