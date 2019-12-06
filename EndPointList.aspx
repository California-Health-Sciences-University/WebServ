<%@ Page Title="" Language="C#" MasterPageFile="~/PDCAField.Master" AutoEventWireup="true" CodeBehind="EndPointList.aspx.cs" Inherits="PDCA_ASPX.EndPointList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <asp:GridView AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BorderWidth="2px"
            BorderStyle="Solid" BorderColor="Black" CellPadding="3" runat="server"
            ID="gvEndPointList" DataKeyNames="Endpointid"
            OnRowDataBound="OnRowDataBound"
            OnPageIndexChanging="grdData_PageIndexChanging"

            OnDataBound="EndPointGridView_DataBound"
            OnSorting="EndPointGridView_Sorting"
            Width="100%">
            <HeaderStyle BackColor="Maroon" ForeColor="White" BorderColor="Black" Font-Bold="true" Font-Size="Larger" BorderWidth="2" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="Black" BorderColor="Black" BorderWidth="1" HorizontalAlign="Left" Font-Size="Medium" />
            <AlternatingRowStyle BackColor="lightgrey" ForeColor="Black" BorderColor="Black" BorderWidth="1" HorizontalAlign="Left" Font-Size="Medium"></AlternatingRowStyle>
            <Columns>
                <asp:TemplateField HeaderText="Name" >
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server"
                            NavigateUrl='<%# Eval("EndpointID", @"~/EndpointEdit.aspx?Endpointid={0}") %>'
                            Text='<%# Eval("EndPointName")%>'>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                                <asp:BoundField  DataField="EntityName" HeaderText="Entity Name">
                    <ItemStyle Width="200px"></ItemStyle>
                </asp:BoundField>
                                      <asp:BoundField  DataField="Description" HeaderText="Description">
                    <ItemStyle Width="500px"></ItemStyle>
                </asp:BoundField>
            </Columns>
        </asp:GridView>
</asp:Content>
