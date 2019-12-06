<%@ Page Title="" Language="C#" MasterPageFile="~/PDCAField.Master" AutoEventWireup="true" CodeBehind="DepartmentList.aspx.cs" Inherits="PDCA_ASPX.DepartmentList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BorderWidth="2px"
        BorderStyle="Solid" BorderColor="Black" CellPadding="3" runat="server"
        ID="gvDepartmentList" DataKeyNames="Departmentid"
        OnRowDataBound="OnRowDataBound"
        OnPageIndexChanging="grdData_PageIndexChanging"
        OnSelectedIndexChanged="gvDepartmentList_SelectedIndexChanged"
        OnDataBound="DepartmentGridView_DataBound"
        OnSorting="DepartmentGridView_Sorting"
        Width="100%">
        <HeaderStyle BackColor="Maroon" ForeColor="White" BorderColor="Black" Font-Bold="true" Font-Size="Larger" BorderWidth="2" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="Black" BorderColor="Black" BorderWidth="1" HorizontalAlign="Left" Font-Size="Medium" />
        <AlternatingRowStyle BackColor="lightgrey" ForeColor="Black" BorderColor="Black" BorderWidth="1" HorizontalAlign="Left" Font-Size="Medium"></AlternatingRowStyle>
        <Columns>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server"
                        NavigateUrl='<%# Eval("DepartmentID", @"~/DepartmentEdit.aspx?Departmentid={0}") %>'
                        Text='<%# Eval("Name")%>'>
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
           
            <asp:BoundField DataField="EntityName" HeaderText="Entity Name">
                <ItemStyle Width="400px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Description" HeaderText="Description">
                <ItemStyle Width="400px"></ItemStyle>
            </asp:BoundField>
        </Columns>
    </asp:GridView>
</asp:Content>