<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderConfirmation.aspx.cs" Inherits="KishanKumarDas_BookStore.OrderConfirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Confirmation - My BookStore</title>
    <link rel="stylesheet" type="text/css" href="Content/Site.css" />
    <link rel="icon" href="favicon.ico" type="image/x-icon" />
</head>
<body>
    <form id="form1" runat="server" class="confirmation-container-main">
        <div class="confirmation-container">
            <h1>Your order has been successfully placed!</h1>
            <p>Thank you for shopping with us.</p>
             <asp:Button ID="btnReturnHome" runat="server" CssClass="button" 
            Text="Return to Home" OnClick="btnReturnHome_Click" />
        </div>
    </form>
</body>
</html>
