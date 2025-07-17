<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="info.aspx.cs" Inherits="baitaplon.WebForm8" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title>Thông tin người dùng</title>
        <link rel="stylesheet" href="assets/css/info.css" />
    </head>

    <body>
        <form id="form1" runat="server">
            <div class="user-info-container">
                <div class="user-profile">
                    <img src="assets/image/avatar.jpg" alt="Avatar" class="user-avatar" />
                    <div class="user-details">

                        <p class="user-phone"><strong>SĐT:</strong> <span id="user-phone"></span></p>

                    </div>
                </div>
                <div class="order-history">
                    <h3>Lịch sử đơn hàng</h3>
                    <% if (Orders !=null && Orders.Count> 0) { %>
                        <table class="order-table">
                            <thead>
                                <tr>
                                    <th>Mã đơn</th>
                                    <th>Ngày mua</th>
                                    <th>Sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th>Tổng tiền</th>
                                    <th>Trạng thái</th>
                                </tr>
                            </thead>
                            <tbody class="order-list"></tbody>
                        </table>
                        <% } else { %>
                            <div>Chưa có đơn hàng nào.</div>
                            <% } %>
                </div>
            </div>
        </form>
        <script src="assets/js/info.js"></script>
    </body>

    </html>