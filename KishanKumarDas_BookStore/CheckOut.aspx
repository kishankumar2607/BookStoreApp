<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="KishanKumarDas_BookStore.CheckOut" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="formCheckout">
        <div class="checkout-container">
            <h2 class="checkout-container-h2">Checkout Page</h2>

            <div class="checkout-summary">
                <h2>Order Summary</h2>
                <div class="form-group">
                    <strong class="totalItems">Total Items:</strong>
                    <asp:Label ID="lblTotalItems" runat="server" CssClass="lblTotalItems" />
                </div>
                <div class="form-group">
                    <strong class="totalPrice">Total Price:</strong>
                    <asp:Label ID="lblTotalPrice" runat="server" CssClass="lblTotalPrice" />
                </div>
            </div>

            <div class="checkout-main-container">
                <div class="checkout-section">
                    <div class="display-validation-error">
                        <asp:RegularExpressionValidator ID="revEmail" runat="server"
                            ControlToValidate="txtEmail" ValidationExpression="^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$"
                            ErrorMessage="Invalid email format." ForeColor="Red" Display="Dynamic" />

                        <asp:CompareValidator ID="cvEmail" runat="server" ControlToValidate="txtEmailAgain"
                            ControlToCompare="txtEmail" ErrorMessage="Email addresses do not match."
                            ForeColor="Red" Display="Dynamic" />

                        <asp:RegularExpressionValidator ID="revPhone" runat="server"
                            ControlToValidate="txtPhone"
                            ErrorMessage="Invalid phone format. Use 123-456-7890."
                            ValidationExpression="^\d{3}-\d{3}-\d{4}$"
                            ForeColor="Red"
                            Display="Dynamic" />

                        <asp:RegularExpressionValidator ID="revZipCode" runat="server"
                            ControlToValidate="txtzipCode"
                            ErrorMessage="Invalid Postal Code format. Use 6 alphanumeric characters (e.g., A1B2C3)."
                            ValidationExpression="^[A-Za-z0-9]{6}$"
                            ForeColor="Red"
                            Display="Dynamic" />

                        <asp:RegularExpressionValidator ID="revCardNumber" runat="server"
                            ControlToValidate="txtCardNumber" ValidationExpression="^\d{16}$"
                            ErrorMessage="Card number must be 16 digits."
                            ForeColor="Red" Display="Dynamic" />

                        <asp:RegularExpressionValidator ID="revExpiryDate" runat="server"
                            ControlToValidate="txtExpiryDate"
                            ValidationExpression="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$"
                            ErrorMessage="Enter a valid date in DD/MM/YYYY format."
                            ForeColor="Red" Display="Dynamic" />

                        <asp:RegularExpressionValidator ID="revCVV" runat="server"
                            ControlToValidate="txtCVV" ValidationExpression="^\d{3}$"
                            ErrorMessage="CVV must be 3 digits." ForeColor="Red" Display="Dynamic" />
                    </div>

                    <h2>Contact Information</h2>
                    <div class="form-group">
                        <label for="txtEmail">Email Address:</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Required="true" />
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label for="txtEmailAgain">Re-Type Email Address:</label>
                        <asp:TextBox ID="txtEmailAgain" runat="server" CssClass="form-control" Required="true" />
                        <asp:RequiredFieldValidator ID="rfvEmailAgain" runat="server" ControlToValidate="txtEmailAgain"
                            ErrorMessage="Please re-type your email address." ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label for="txtFirstName">First Name:</label>
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" Required="true" />
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName"
                            ErrorMessage="First Name is required." ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label for="txtLastName">Last Name:</label>
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" Required="true" />
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName"
                            ErrorMessage="Last Name is required." ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label for="txtPhone">Phone Number:</label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Required="true" />
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone"
                            ErrorMessage="Phone number is required." ForeColor="Red" Display="Dynamic" />
                    </div>
                </div>

                <div class="checkout-section">
                    <h2>Billing Address</h2>

                    <div class="form-group">
                        <label for="txtAddress">Address:</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Required="true" />
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress"
                            ErrorMessage="Address is required." ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label for="txtCity">City:</label>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" Required="true" />
                        <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity"
                            ErrorMessage="City is required." ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label for="txtzipCode">Zip Code:</label>
                        <asp:TextBox ID="txtzipCode" runat="server" CssClass="form-control" Required="true" />
                        <asp:RequiredFieldValidator ID="rfvzipCode" runat="server" ControlToValidate="txtzipCode"
                            ErrorMessage="Zip Code is required." ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label for="txtState">State:</label>
                        <asp:TextBox ID="txtState" runat="server" CssClass="form-control" Text="Ontario" Required="true" ReadOnly="true" />
                        <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="txtState"
                            ErrorMessage="State is required." ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label for="txtCountry">Country:</label>
                        <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control" Text="Canada" Required="true" ReadOnly="true" />
                        <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ControlToValidate="txtCountry"
                            ErrorMessage="Country is required." ForeColor="Red" Display="Dynamic" />
                    </div>
                </div>

                <div class="checkout-section">
                    <h2>Payment Information</h2>
                    <div class="form-group">
                        <label for="ddlPaymentMethod">Payment Method:</label>
                        <asp:DropDownList ID="ddlPaymentMethod" runat="server" CssClass="form-control" Required="true">
                            <asp:ListItem Text="Credit Card" Value="CreditCard" />
                            <asp:ListItem Text="Debit Card" Value="DebitCard" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvPaymentMethod" runat="server" ControlToValidate="ddlPaymentMethod"
                            ErrorMessage="Payment method is required." ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label for="txtCardNumber">Card Number:</label>
                        <asp:TextBox ID="txtCardNumber" runat="server" CssClass="form-control" Required="true" />
                        <asp:RequiredFieldValidator ID="rfvCardNumber" runat="server" ControlToValidate="txtCardNumber"
                            ErrorMessage="Card number is required." ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label for="txtExpiryDate">Expiry Date (DD/MM/YYYY):</label>
                        <asp:TextBox ID="txtExpiryDate" runat="server" CssClass="form-control" Required="true" />
                        <asp:RequiredFieldValidator ID="rfvExpiryDate" runat="server"
                            ControlToValidate="txtExpiryDate"
                            ErrorMessage="Expiry date is required."
                            ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label for="txtCVV">CVV:</label>
                        <asp:TextBox ID="txtCVV" runat="server" CssClass="form-control" Required="true" />
                        <asp:RequiredFieldValidator ID="rfvCVV" runat="server" ControlToValidate="txtCVV"
                            ErrorMessage="CVV is required." ForeColor="Red" Display="Dynamic" />
                    </div>
                </div>

                <div class="checkout-section">
                    <h2>Optional Data</h2>
                    <div class="form-group">
                        <label class="optional-label">Please let me know about:</label>
                        <div class="checkbox-group">
                            <asp:CheckBox ID="chkNewProducts" runat="server" Text="New Products" CssClass="checkbox-item" />
                            <asp:CheckBox ID="chkNewEditions" runat="server" Text="New Editions" CssClass="checkbox-item" />
                            <asp:CheckBox ID="chkSpecialOffers" runat="server" Text="Special Offers" CssClass="checkbox-item" />
                            <asp:CheckBox ID="chkLocalEvents" runat="server" Text="Local Events" CssClass="checkbox-item" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="optional-label">Please contact me via:</label>
                        <div class="radio-group">
                            <asp:RadioButton ID="rbTwitter" runat="server" GroupName="ContactMethod" Text="Twitter" CssClass="radio-item" />
                            <asp:RadioButton ID="rbFacebook" runat="server" GroupName="ContactMethod" Text="Facebook" CssClass="radio-item" />
                            <asp:RadioButton ID="rbTextMessage" runat="server" GroupName="ContactMethod" Text="Text Message" CssClass="radio-item" />
                            <asp:RadioButton ID="rbEmail" runat="server" GroupName="ContactMethod" Text="Email" CssClass="radio-item" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="checkout-buttons">
                <asp:Button ID="btnSubmitOrder" runat="server" Text="Check Out" CssClass="button" OnClick="btnSubmitOrder_Click" />
            </div>
        </div>
    </div>
</asp:Content>
