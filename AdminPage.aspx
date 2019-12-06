<%@ Page Title="" Language="C#" MasterPageFile="~/PDCAField.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="PDCA_ASPX.AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Table ID="Table1" runat="server" Width="80%">
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"  HorizontalAlign="Center">
                <asp:HyperLink ID="hlDepartments" runat="server" NavigateUrl="~/DepartmentList.aspx">Maintain Departments</asp:HyperLink>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"  HorizontalAlign="Center">
                <asp:HyperLink ID="hlEntities" runat="server" NavigateUrl="~/EntityList.aspx">Maintain Entities</asp:HyperLink>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"  HorizontalAlign="Center">
                <asp:HyperLink ID="hlPDCAUsers" runat="server" NavigateUrl="~/PDCAUserList.aspx">Maintain PDCA Users</asp:HyperLink>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"  HorizontalAlign="Center">
                <asp:HyperLink ID="hlFieldDescriptions" runat="server" NavigateUrl="~/PDCAFieldList.aspx">Maintain PDCA Field Descriptions</asp:HyperLink>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"  HorizontalAlign="Center">
                <asp:HyperLink ID="hlPDCATypes" runat="server" NavigateUrl="~/PDCATypeList.aspx">Maintain PDCA Types</asp:HyperLink>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"  HorizontalAlign="Center">
                <asp:HyperLink ID="hlEndPoints" runat="server" NavigateUrl="~/EndPointList.aspx">Maintain Endpoints</asp:HyperLink>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"  HorizontalAlign="Center">
                <asp:HyperLink ID="hlPDCAUserTypes" runat="server" NavigateUrl="~/PDCAUserTypeList.aspx">Maintain PDCA UserTypes</asp:HyperLink>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>