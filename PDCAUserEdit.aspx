<%@ Page Title="" Language="C#" MasterPageFile="~/PDCAField.Master" AutoEventWireup="true" CodeBehind="PDCAUserEdit.aspx.cs" Inherits="PDCA_ASPX.PDCAUserEdit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <asp:Table ID="Table1" runat="server" CellPadding="10" CellSpacing="5" Width="100%">
        <asp:TableRow>
            <asp:TableCell runat="server" HorizontalAlign="Center">
                <asp:Label ID="Label3" runat="server" Font-Bold="true" Text="Editing PDCAUser"></asp:Label>
            </asp:TableCell>
                    </asp:TableRow>
               <asp:TableRow>
            <asp:TableCell runat="server" HorizontalAlign="Center">
                <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
            </asp:TableCell>
                    </asp:TableRow>
        </asp:Table>
        
<asp:Table ID="Table3" runat="server" CellPadding="10" CellSpacing="5">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label4" runat="server" Text="PDCAUser ID:  " Font-Bold="true"></asp:Label>
                <asp:Label ID="lblPDCAUserID" runat="server" Text="PDCAUserID"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="Label5" runat="server" Text="Network ID:  " Font-Bold="true"></asp:Label>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnVerifyName" runat="server" Text="Verify Name" OnClick="btnVerifyName_Click" />
            </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
               <asp:Label ID="Label1" runat="server" Text="User Type:  " Font-Bold="true"></asp:Label>
                <asp:DropDownList ID="ddUserType" runat="server">
                    <asp:ListItem Value="User" Text="User"></asp:ListItem>
                    <asp:ListItem Value="Approver" Text="Approver"></asp:ListItem>
                    <asp:ListItem Value="Reviewer" Text="Reviewer"></asp:ListItem>
                    <asp:ListItem Value="Administrator" Text="Administrator"></asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>

     
    </asp:Table>
    <div style="width: 1320px; background-color: lightgrey;">
        <asp:Panel runat="server" ID="panel20" HorizontalAlign="Center">
            <div style="font-weight: bold; background-color: maroon;">
                <asp:Table runat="server"
                    Width="100%">
                    <asp:TableRow runat="server">
                        <asp:TableCell align="left" runat="server" Font-Size="Larger"></asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center">
                            <asp:Label runat="server" ID="lblRoutingTitle" ForeColor="White" Text="Routing" />
                        </asp:TableCell>

                        <asp:TableCell align="right" Width="10px" runat="server">
                            <asp:Image ID="imgRouting" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlRouting" runat="server" BorderWidth="1px" BorderColor="Black" HorizontalAlign="Left">
            <asp:Table ID="Table42" runat="server" Width="100%">
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:Label ID="Label272" runat="server" Text="Entity" Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:CheckBox ID="ckCHSU" runat="server" Text="CHSU" />
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:CheckBox ID="ckCOP" runat="server" Text="COP" />
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:CheckBox ID="ckCOM" runat="server" Text="COM" />
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:CheckBox ID="ckUnsure" runat="server" Text="Unsure" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left">
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <div style="overflow-y: scroll; overflow-x: scroll; width: 300px; height: 150px">
                            <asp:CheckBoxList ID="ckblCHSU" runat="server">
                                <asp:ListItem Text="Curriculum Committee" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Landscape Committee" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Educational Resources Committee" Value="3"></asp:ListItem>
                                <asp:ListItem Text="ACPE Accreditation Standards Committee" Value="4"></asp:ListItem>
                                <asp:ListItem Text="Some Really Important Committee" Value="5"></asp:ListItem>
                            </asp:CheckBoxList>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <div style="overflow-y: scroll; overflow-x: scroll; width: 300px; height: 150px">
                            <asp:CheckBoxList ID="ckblCOP" runat="server">
                                <asp:ListItem Text="Curriculum Committee" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Landscape Committee" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Educational Resources Committee" Value="3"></asp:ListItem>
                                <asp:ListItem Text="ACPE Accreditation Standards Committee" Value="4"></asp:ListItem>
                                <asp:ListItem Text="Some Really Important Committee" Value="5"></asp:ListItem>
                            </asp:CheckBoxList>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <div style="overflow-y: scroll; overflow-x: scroll; width: 300px; height: 150px">
                            <asp:CheckBoxList ID="ckblCOM" runat="server">
                                <asp:ListItem Text="Curriculum Committee" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Landscape Committee" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Educational Resources Committee" Value="3"></asp:ListItem>
                                <asp:ListItem Text="ACPE Accreditation Standards Committee" Value="4"></asp:ListItem>
                                <asp:ListItem Text="Some Really Important Committee" Value="5"></asp:ListItem>
                            </asp:CheckBoxList>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <div style="overflow-y: scroll; overflow-x: scroll; width: 300px; height: 150px">
                            <asp:CheckBoxList ID="ckblOther" runat="server">
                                <asp:ListItem Text="Curriculum Committee" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Landscape Committee" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Educational Resources Committee" Value="3"></asp:ListItem>
                                <asp:ListItem Text="ACPE Accreditation Standards Committee" Value="4"></asp:ListItem>
                                <asp:ListItem Text="Some Really Important Committee" Value="5"></asp:ListItem>
                            </asp:CheckBoxList>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </asp:Panel>

        <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtenderRouting" runat="server" TargetControlID="pnlRouting"
            CollapsedSize="0" ExpandedSize="300"
            ExpandedText="Routing"
            CollapsedText="Routing" TextLabelID="lblRoutingTitle" ImageControlID="imgRouting"
            ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand_blue.jpg"
            ExpandControlID="imgRouting"
            CollapseControlID="imgRouting" Collapsed="False" BehaviorID="_content_ContentsCollapsiblePanelExtenderRouting" />

        <hr />
    </div>
    <asp:Table runat="server">
       <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
            </asp:TableCell>
        </asp:TableRow>
        </asp:Table>
</asp:Content>
