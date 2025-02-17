<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="KishanKumarDas_BookStore.Products" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="content-wrapper">
        <div class="lblWelcomMessage mb-4">
            <asp:Label ID="lblWelcomMessage" runat="server" CssClass="fw-bold text-black"></asp:Label>
        </div>

        <section class="product-selection">
            <h2>Select Your Favorite Books</h2>

            <div class="dropdown-section">
                <div class="dropdown-container">
                    <asp:Label ID="lblGenre" runat="server" Text="Please Select the Genre:" CssClass="lblGenre"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server"
                        DataSourceID="SqlDataSourceGenre" DataTextField="GenreName"
                        DataValueField="GenreId" AutoPostBack="True" CssClass="dropdown"
                        OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceGenre"
                        ConnectionString='<%$ ConnectionStrings:ConnectionString %>'
                        SelectCommand="SELECT * FROM [Genre]"></asp:SqlDataSource>
                </div>

                <div class="dropdown-container">
                    <asp:Label ID="lblBook" runat="server" Text="Please Select the Book:" CssClass="lblBook"></asp:Label>
                    <asp:DropDownList ID="DropDownListBook" runat="server"
                        DataSourceID="SqlDataSourceBook" DataTextField="BookName"
                        DataValueField="BookId" AutoPostBack="True" CssClass="dropdown"
                        OnSelectedIndexChanged="DropDownListBook_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceBook"
                        ConnectionString='<%$ ConnectionStrings:ConnectionString %>'
                        SelectCommand="SELECT [BookId], [BookName], [ShortDescription], [LongDescription], [UnitPrice], [GenreId] FROM [Books] WHERE ([GenreId] = @GenreId)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="GenreId" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </section>

        <section class="book-details">
            <div class="book-card">
                <h3>
                    <asp:Label ID="lblBookName" runat="server"></asp:Label></h3>
                <p class="short-description">
                    <asp:Label ID="lblShortDesc" runat="server"></asp:Label>
                </p>
                <p class="long-description">
                    <asp:Label ID="lblLongDesc" runat="server"></asp:Label>
                </p>
                <p class="price">
                    Price:
                    <asp:Label ID="lblUnitPrice" runat="server"></asp:Label>
                </p>
            </div>
        </section>

        <section class="quantity-container">
            <asp:Label ID="lblQuantity" runat="server" Text="Quantity: " CssClass="lblQuantity"></asp:Label>
            <div class="quantity-wrapper">
                <asp:Button ID="btnMinus" runat="server" Text="−" CssClass="quantity-btn" OnClick="btnMinus_Click" />
                <asp:TextBox ID="txtQuantity" runat="server" CssClass="quantity-input" Text="1" ReadOnly="false"></asp:TextBox>
                <asp:Button ID="btnPlus" runat="server" Text="+" CssClass="quantity-btn" OnClick="btnPlus_Click" />
            </div>
            <asp:Label ID="lblMessage" runat="server" CssClass="message-label" ForeColor="Red"></asp:Label>
        </section>

        <section class="cart-button">
            <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CssClass="button" OnClick="btnAddToCart_Click" />
            <asp:Button ID="btnGoToCart" runat="server" Text="Go To Cart" CssClass="button" OnClick="btnGoToCart_Click" />
        </section>
    </div>
</asp:Content>