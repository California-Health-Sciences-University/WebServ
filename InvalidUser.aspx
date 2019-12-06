<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvalidUser.aspx.cs" Inherits="PDCA_ASPX.InvalidUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:1500px">
                <tr>
                    <td style="align-content:center" >
                        <asp:Label ID="Label1" runat="server" Font-Bold="true" Font-Size="X-Large" Text="You have not been allowed access to this program."></asp:Label></td>
                </tr>
                <tr>
                     <td style="align-content:center" >
                        <asp:Label ID="Label2" runat="server" Font-Bold="true" Font-Size="X-Large"  Text="If you believe you need access to this program, please contact IT support."></asp:Label></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
