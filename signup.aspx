<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="baitaplon.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Signup</title>
    <link rel="stylesheet" href="assets/css/style.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="signup">
  <div class="signup__container">
    <div class="signup__title">SIGN UP</div>

    <div class="signup__form" action="#" method="post">
      <label for="phone">Phone:<br />
        <input class="signup__input1" type="tel" id="phone" name="phone" placeholder="Nhập số điện thoại" />
      </label>
      <p class="signup__error--phone"></p>

      <label for="password1">Password:<br />
        <input class="signup__input2" type="password" id="password1" name="password1" 
          placeholder="Nhập mật khẩu của bạn" />
      </label>
      <p class="signup__error--password1"></p>

      <label for="password2">Confirm Password:<br />
        <input class="signup__input3" type="password" id="password2" name="password2"
          placeholder="Nhập lại mật khẩu của bạn" />
      </label>
      <p class="signup__error--password2"></p>

      <button type="submit" class="signup__signup">SIGN UP</button>
    </div>
  </div>
</div>

    </form>
</body>
</html>
