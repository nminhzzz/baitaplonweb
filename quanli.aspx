<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="quanli.aspx.cs" Inherits="baitaplon.WebForm4" %>

    <!DOCTYPE html>
    <html lang="vi">

    <head>
        <meta charset="UTF-8" />
        <title>Furniture Admin Panel</title>
        <link rel="stylesheet" href="assets/css/quanli.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    </head>

    <body>
        <form id="form1" runat="server">
            <div class="header">
                <div class="header__brand">Crusaders Logistics</div>
                <div class="header__userinfo">
                    <span>Nhân viên: <strong>Phan Văn Chương</strong></span><br />
                    <span>Chức vụ: <strong>Quản lý kho</strong></span>
                    <a href="#" class="header__link">HỖ TRỢ</a> |
                    <a href="#" class="header__link">ĐĂNG XUẤT</a>
                </div>
            </div>
            <div class="menu-bar">
                <div class="menu-bar__tab menu-bar__tab--active" id="tabProduct">Product</div>
                <div class="menu-bar__tab" id="tabUser">User <span class="menu-bar__icon">①</span></div>
                <input class="menu-bar__search" type="text" placeholder="Tìm kiếm" />
            </div>
            <div class="main-layout">
                <div class="content">
                    <div class="table-section" id="productSection">
                        <table class="product-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Ảnh</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Giá</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- JS sẽ render sản phẩm vào đây -->
                            </tbody>
                        </table>
                        <div class="pagination">
                            <span class="pagination__arrow">&#60;</span>
                            <span class="pagination__page">1</span>
                            <span class="pagination__page">...</span>
                            <span class="pagination__page">5</span>
                            <span class="pagination__page">6</span>
                            <span class="pagination__page">7</span>
                            <span class="pagination__page">8</span>
                            <span class="pagination__page">9</span>
                            <span class="pagination__page pagination__page--active">10</span>
                            <span class="pagination__arrow">&#62;</span>
                        </div>
                        <button class="create-shipment">Tạo chuyển</button>
                    </div>
                    <!-- Bảng user -->
                    <div class="table-section" id="userSection" style="display:none;">
                        <table class="user-table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Số điện thoại</th>
                                    <th>Role</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- JS sẽ render user vào đây -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </form>
        <button class="add-product-btn" type="button"
            style="margin: 24px 0 12px 32px; background:#4caf50;color:#fff;padding:10px 24px;border:none;border-radius:8px;font-size:16px;cursor:pointer;box-shadow:0 2px 8px #0001;">+
            Thêm sản phẩm</button>
        <button class="add-user-btn" type="button"
            style="margin: 24px 0 12px 12px; background:#007bff;color:#fff;padding:10px 24px;border:none;border-radius:8px;font-size:16px;cursor:pointer;box-shadow:0 2px 8px #0001;display:none;">+
            Thêm user</button>
        <!-- Modal thêm user -->
        <div id="addUserPopup"
            style="display:none;position:fixed;top:0;left:0;width:100vw;height:100vh;background:rgba(0,0,0,0.3);z-index:9999;">
            <div
                style="background:#fff;padding:24px 32px;border-radius:10px;max-width:400px;margin:100px auto;position:relative;box-shadow:0 2px 16px #0002;">
                <h3>Thêm user mới</h3>
                <form id="addUserForm" autocomplete="off" novalidate>
                    <div style="margin-bottom:12px;">
                        <label>Số điện thoại</label><br />
                        <input id="addUserPhone" type="text" name="phone" style="width:100%;padding:6px 8px;"
                            required />
                    </div>
                    <div style="margin-bottom:12px;">
                        <label>Mật khẩu</label><br />
                        <input id="addUserPassword" type="password" name="password" style="width:100%;padding:6px 8px;"
                            required />
                    </div>
                    <div style="margin-bottom:12px;">
                        <label>Role</label><br />
                        <select id="addUserRole" name="role" style="width:100%;padding:6px 8px;">
                            <option value="user">user</option>
                            <option value="admin">admin</option>
                        </select>
                    </div>
                    <div style="text-align:right;">
                        <button type="button" id="cancelAddUserBtn" style="margin-right:8px;">Hủy</button>
                        <button type="submit">Thêm</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- Modal sửa user -->
        <div id="editUserPopup"
            style="display:none;position:fixed;top:0;left:0;width:100vw;height:100vh;background:rgba(0,0,0,0.3);z-index:9999;">
            <div
                style="background:#fff;padding:24px 32px;border-radius:10px;max-width:400px;margin:100px auto;position:relative;box-shadow:0 2px 16px #0002;">
                <h3>Sửa user</h3>
                <form id="editUserForm" autocomplete="off" novalidate>
                    <input type="hidden" name="phone" id="editUserPhone" />
                    <div style="margin-bottom:12px;">
                        <label>Mật khẩu</label><br />
                        <input id="editUserPassword" type="password" name="password" style="width:100%;padding:6px 8px;"
                            required />
                    </div>
                    <div style="margin-bottom:12px;">
                        <label>Role</label><br />
                        <select id="editUserRole" name="role" style="width:100%;padding:6px 8px;">
                            <option value="user">user</option>
                            <option value="admin">admin</option>
                        </select>
                    </div>
                    <div style="text-align:right;">
                        <button type="button" id="cancelEditUserBtn" style="margin-right:8px;">Hủy</button>
                        <button type="submit">Lưu</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- Modal thêm sản phẩm đặt ngoài form1 -->
        <div id="addProductPopup"
            style="display:none;position:fixed;top:0;left:0;width:100vw;height:100vh;background:rgba(0,0,0,0.3);z-index:9999;">
            <div
                style="background:#fff;padding:24px 32px;border-radius:10px;max-width:400px;margin:100px auto;position:relative;box-shadow:0 2px 16px #0002;">
                <h3>Thêm sản phẩm mới</h3>
                <form id="addProductForm" autocomplete="off" novalidate>
                    <div style="margin-bottom:12px;">
                        <label>Tên sản phẩm</label><br />
                        <input id="addName" type="text" name="name" style="width:100%;padding:6px 8px;" required />
                    </div>
                    <div style="margin-bottom:12px;">
                        <label>Giá</label><br />
                        <input id="addPrice" type="text" name="price" style="width:100%;padding:6px 8px;" required />
                    </div>
                    <div style="margin-bottom:12px;">
                        <label>Ảnh (URL)</label><br />
                        <input id="addImage" type="text" name="image" style="width:100%;padding:6px 8px;" required />
                    </div>
                    <div style="text-align:right;">
                        <button type="button" id="cancelAddBtn" style="margin-right:8px;">Hủy</button>
                        <button type="submit">Thêm</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- Modal sửa sản phẩm đặt ngoài form1 -->
        <div id="editProductPopup"
            style="display:none;position:fixed;top:0;left:0;width:100vw;height:100vh;background:rgba(0,0,0,0.3);z-index:9999;">
            <div
                style="background:#fff;padding:24px 32px;border-radius:10px;max-width:400px;margin:100px auto;position:relative;box-shadow:0 2px 16px #0002;">
                <h3>Sửa sản phẩm</h3>
                <form id="editProductForm">
                    <input type="hidden" name="id" />
                    <div style="margin-bottom:12px;">
                        <label>Tên sản phẩm</label><br />
                        <input type="text" name="name" style="width:100%;padding:6px 8px;" required />
                    </div>
                    <div style="margin-bottom:12px;">
                        <label>Giá</label><br />
                        <input type="text" name="price" style="width:100%;padding:6px 8px;" required />
                    </div>
                    <div style="margin-bottom:12px;">
                        <label>Ảnh (URL)</label><br />
                        <input type="text" name="image" style="width:100%;padding:6px 8px;" required />
                    </div>
                    <div style="text-align:right;">
                        <button type="button" id="cancelEditBtn" style="margin-right:8px;">Hủy</button>
                        <button type="submit">Lưu</button>
                    </div>
                </form>
            </div>
        </div>
        <script src="assets/js/quanli.js"></script>
    </body>

    </html>