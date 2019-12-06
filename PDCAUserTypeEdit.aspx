<%@ Page Title="" Language="C#" MasterPageFile="~/PDCAField.Master" AutoEventWireup="true" CodeBehind="PDCAUserTypeEdit.aspx.cs" Inherits="PDCA_ASPX.PDCAUserTypeEdit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
       <asp:Table ID="Table1" runat="server" CellPadding="10" CellSpacing="5" Width="100%">
        <asp:TableRow>
            <asp:TableCell runat="server" HorizontalAlign="Center">
                <asp:Label ID="Label3" runat="server" Font-Bold="true" Text="Editing PDCAUserType"></asp:Label>
            </asp:TableCell>
                    </asp:TableRow>
        </asp:Table>
        
<asp:Table ID="Table3" runat="server" CellPadding="10" CellSpacing="5">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label4" runat="server" Text="PDCAUserType ID:  " Font-Bold="true"></asp:Label>
                <asp:Label ID="lblPDCAUserTypeID" runat="server" Text="PDCAUserTypeID"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="Label5" runat="server" Text="Name:  " Font-Bold="true"></asp:Label>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
           
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label2" runat="server" Text="Description" Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtDescription" runat="server" THeight="150" Width="1000"></asp:TextBox>
         
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

</asp:Content>
