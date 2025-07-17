<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signin.aspx.cs" Inherits="baitaplon.signin" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title>Sign In</title>
        <link rel="stylesheet" href="assets/css/style.css" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    </head>

    <body>
        <form id="form1" runat="server">
            <div class="signin">
                <div class="signin__container">
                    <div class="signin__title">SIGN IN</div>
                    <div class="signin__form" action="#">
                        <label for="phone">
                            phone:<br />
                            <input class="signin__input1" type="tel" id="phone" placeholder="Nhập số điện thoại" />
                        </label>
                        <p class="signin__error--phone"></p>
                        <label for="password1">
                            password:<br />
                            <input class="signin__input2" type="password" id="password1"
                                placeholder="nhập mật khẩu của bạn" />

                        </label>
                        <p class="signin__error--password1"></p>
                        <button class="signin__submit">SIGN IN</button>
                        <a href="signup.aspx" class="signin__signup">signup</a>
                    </div>
                </div>
            </div>
        </form>
        <script src="assets/js/signin.js"></script>
    </body>

    </html>