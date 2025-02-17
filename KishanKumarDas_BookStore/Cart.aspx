<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="KishanKumarDas_BookStore.Cart" EnableEventValidation="false" MasterPageFile="~/Site.Master"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="cart-container">
        <asp:Panel ID="pnlCart" runat="server">
            <h2>Your Shopping Cart</h2>

            <asp:GridView ID="GridViewCart" runat="server" AutoGenerateColumns="False" CssClass="cart-table">
                <Columns>
                    <asp:BoundField DataField="BookName" HeaderText="Book Name" SortExpression="BookName" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="Price" HeaderText="Price Each" SortExpression="Price" DataFormatString="{0:C}" />
                    <asp:TemplateField HeaderText="Total Price">
                        <ItemTemplate>
                            <%# Eval("Quantity") == null ? "0.00" : (Convert.ToInt32(Eval("Quantity")) * Convert.ToDecimal(Eval("Price"))).ToString("C") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button
                                runat="server"
                                class="remove-btn"
                                Text="Remove"
                                CommandName="RemoveItem"
                                CommandArgument='<%# Eval("BookId") %>'
                                OnClick="RemoveItem_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div class="cart-summary">
                <div class="cart-summary-item">
                    <strong>Total Books:</strong>
                    <asp:Label ID="totalBooksLabel" runat="server" Text="0"></asp:Label>
                </div>
                <div class="cart-summary-item">
                    <strong>Total Price After Tax:</strong>
                    <asp:Label ID="totalPriceWithTaxLabel" runat="server" Text="$0.00"></asp:Label>
                </div>
                <div class="cart-buttons">
                    <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Checkout" CssClass="button" OnClick="btnCheckout_Click" />
                </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlEmptyCart" runat="server" Visible="false" CssClass="empty-cart">
            <h2>Your Cart is Empty</h2>
            <p>Looks like you haven't added anything to your cart yet.</p>
            <a href="Products.aspx" class="button">Browse Products</a>
        </asp:Panel>
    </div>
</asp:Content>