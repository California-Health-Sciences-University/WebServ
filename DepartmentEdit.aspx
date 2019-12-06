<%@ Page Title="" Language="C#" MasterPageFile="~/PDCAField.Master" AutoEventWireup="true" CodeBehind="DepartmentEdit.aspx.cs" Inherits="PDCA_ASPX.DepartmentEdit" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Table ID="Table1" runat="server" CellPadding="10" CellSpacing="5" Width="100%">
        <asp:TableRow>
            <asp:TableCell runat="server" HorizontalAlign="Center">
                <asp:Label ID="Label3" runat="server" Font-Bold="true" Text="Editing Department"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:Table ID="Table3" runat="server" CellPadding="10" CellSpacing="5">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label4" runat="server" Text="Department ID:  " Font-Bold="true"></asp:Label>
                <asp:Label ID="lblDepartmentID" runat="server" Text="DepartmentID"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label5" runat="server" Text="Entity:  " Font-Bold="true"></asp:Label>
                <asp:DropDownList ID="ddEntity" runat="server"></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label1" runat="server" Text="Name:  " Font-Bold="true"></asp:Label>
                <asp:TextBox ID="txtName" runat="server" Width="300px"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label7" runat="server" Text="Description:  " Font-Bold="true"></asp:Label>
                <asp:TextBox ID="txtDescription" runat="server" Width="500px"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>