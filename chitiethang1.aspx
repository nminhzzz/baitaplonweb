<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chitiethang1.aspx.cs" Inherits="baitaplon.WebForm10" %>
    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title>Chi tiết sản phẩm</title>
        <link rel="stylesheet" href="assets/css/chitiethang1.css" />
    </head>

    <body>
        <form id="form1" runat="server">
            <div class="product-detail-container">
                <div class="product-detail-left">
                    <div class="product-main-img">
                        <img src="<%= ProductImage %>" alt="<%= ProductName %>" />
                    </div>
                    <div class="product-thumb-list">
                        <img src="<%= ProductImage %>" alt="thumb1" />
                        <img src="<%= ProductImage %>" alt="thumb2" />
                        <img src="<%= ProductImage %>" alt="thumb3" />
                        <img src="<%= ProductImage %>" alt="thumb4" />
                        <img src="<%= ProductImage %>" alt="thumb5" />
                    </div>
                </div>
                <div class="product-detail-right">
                    <div class="product-brand">
                        <span class="brand-logo">OHCO</span>
                        <span class="brand-tag">GHẾ TRỊ LIỆU</span>
                        <span class="brand-madein">MADE <span>IN</span> JAPAN</span>
                    </div>
                    <h1 class="product-title">
                        <%= ProductName %>
                    </h1>
                    <div class="product-rating">
                        <span class="stars">★★★★★</span>
                        <span class="review-count">0 đánh giá</span>
                    </div>
                    <ul class="product-features">
                        <li>Thương hiệu OHCO - Hãng ghế massage Luxury bậc nhất, thiết kế cánh mở bởi Ken-Okuyama.</li>
                        <li>Kiệt tác ghế massage trị liệu - tốt nhất thế giới Kiến tạo của sống khoẻ mạnh thượng lưu
                        </li>
                        <li>Bảo hành 6 năm phần máy toàn quốc, bảo hành 3 năm phần da</li>
                        <li>100% Từ da thật cao cấp và da lộn xạ xi được sử dụng trong xe thể thao đắt tiền</li>
                        <li>Thiết kế vô song, OHCO M.8 NEO được update từ OHCO M.8 với sự xuất sắc được nâng tầm - Sự
                            chính xác... được mài giũa. Sự thanh lịch... được tinh chỉnh.</li>
                        <li>Ghế của Nhật, làm thủ công tại Nhật Bản (Made in Japan)</li>
                        <li>Kiến tạo không gian, lọc không khí, xông tinh dầu, thuộc dòng cao cấp, đắt tiền, sang trọng
                            nhất thế giới dành riêng cho giới sành.</li>
                    </ul>
                    <div class="product-price">
                        <span class="price">
                            <%= ProductPrice %>
                        </span>
                    </div>
                    <div class="product-colors">
                        <span>Màu sắc:</span>
                        <span class="color color-brown"></span>
                        <span class="color color-red"></span>
                    </div>
                    <div class="product-gifts">
                        <span>Sản phẩm tặng kèm:</span>
                        <div class="gift-list">
                            <div class="gift-item">Tặng 01 bọc phủ bảo vệ ghế</div>
                            <div class="gift-item">Tặng 03 lọ tinh dầu</div>
                            <div class="gift-item">Tặng 01 máy nâng cơ</div>
                            <div class="gift-item">Tặng 01 khăn lau Cotton</div>
                            <div class="gift-item">Máy tăm nước cầm tay</div>
                            <div class="gift-item">Tặng 01 Cân phân tích cơ thể</div>
                        </div>
                    </div>
                    <div class="product-quantity">
                        <span>Số lượng</span>
                        <button type="button" class="qty-btn">-</button>
                        <input type="text" value="1" class="qty-input" />
                        <button type="button" class="qty-btn">+</button>
                    </div>
                    <div class="product-actions">
                        <button type="button" class="add-to-cart-btn" data-id="<%= ProductId %>"
                            data-name="<%= ProductName %>" data-price="<%= ProductPrice %>"
                            data-image="<%= ProductImage %>">Chọn vào giỏ</button>
                        <span id="cart-message" style="color:green;margin-left:10px;"></span>
                        <button type="button" class="buy-now-btn"><a href="giohang.aspx">Mua ngay</a></button>
                    </div>
                </div>
            </div>
        </form>
        <script src="assets/js/chitiethang1.js"></script>
    </body>

    </html>