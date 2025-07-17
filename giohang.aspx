<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm9.aspx.cs" Inherits="baitaplon.WebForm9" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title>Giỏ hàng</title>
        <link rel="stylesheet" href="assets/css/giohang.css" />
    </head>

    <body>
        <form id="form1" runat="server">
            <div class="cart-checkout-container">
                <div class="cart-section">
                    <div class="cart-header">
                        <span class="back-arrow">&#8592;</span>
                        <span class="cart-title">Shopping Continue</span>
                    </div>
                    <hr />
                    <div class="cart-subtitle">Shopping cart</div>
                    <div class="cart-desc">You have 3 item in your cart</div>
                    <div class="cart-list"></div>
                </div>
                <div class="checkout-section">
                    <div class="checkout-header">
                        <span>Card Details</span>
                        <img src="https://randomuser.me/api/portraits/men/32.jpg" class="checkout-avatar"
                            alt="avatar" />
                    </div>

                    <div class="checkout-form">
                        <label>Name on card</label>
                        <input type="text" placeholder="Name" />
                        <label>SĐT</label>
                        <input type="text" placeholder="1111 2222 3333 4444" />
                        <div class="checkout-form-row">
                            <div>
                                <label>Expiration date</label>
                                <input type="text" placeholder="mm/yy" />
                            </div>
                            <div>
                                <label>Địa chỉ</label>
                                <input type="text" placeholder="HaNoi" />
                            </div>
                        </div>
                    </div>
                    <div class="checkout-summary">
                        <div class="summary-row total"><span>Mua</span></div>
                    </div>
                    <button class="checkout-btn">Mua</button>
                </div>
            </div>
        </form>
        <script src="assets/js/giohang.js"></script>
    </body>

    </html>