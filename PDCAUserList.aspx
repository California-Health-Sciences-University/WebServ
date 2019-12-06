<%@ Page Title="" Language="C#" MasterPageFile="~/PDCAField.Master" AutoEventWireup="true" CodeBehind="PDCAUserList.aspx.cs" Inherits="PDCA_ASPX.PDCAUserList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BorderWidth="2px"
        BorderStyle="Solid" BorderColor="Black" CellPadding="3" runat="server"
        ID="gvPDCAUserList" DataKeyNames="PDCAUserid"
        OnRowDataBound="OnRowDataBound"
        OnPageIndexChanging="grdData_PageIndexChanging"
        OnSelectedIndexChanged="gvPDCAUserList_SelectedIndexChanged"
        OnDataBound="PDCAUserGridView_DataBound"
        OnSorting="PDCAUserGridView_Sorting"
        Width="100%">
        <HeaderStyle BackColor="Maroon" ForeColor="White" BorderColor="Black" Font-Bold="true" Font-Size="Larger" BorderWidth="2" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="Black" BorderColor="Black" BorderWidth="1" HorizontalAlign="Left" Font-Size="Medium" />
        <AlternatingRowStyle BackColor="lightgrey" ForeColor="Black" BorderColor="Black" BorderWidth="1" HorizontalAlign="Left" Font-Size="Medium"></AlternatingRowStyle>
        <Columns>
            <asp:TemplateField HeaderText="FirstName">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server"
                        NavigateUrl='<%# Eval("PDCAUserID", @"~/PDCAUserEdit.aspx?PDCAUserid={0}") %>'
                        Text='<%# Eval("FirstName")%>'>
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField DataField="LastName" HeaderText="Last Name">
                <ItemStyle Width="300px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="NetworkUserID" HeaderText="Network ID">
                <ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="UserRole" HeaderText="User Role">
                <ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
        </Columns>
    </asp:GridView>
</asp:Content>