document.addEventListener("DOMContentLoaded", function () {
  // Gọi API backend để lấy danh sách sản phẩm trong giỏ hàng từ Session
  fetch("giohang.aspx?action=get_cart")
    .then((res) => res.json())
    .then((cart) => {
      console.log("Cart data:", cart); // Debug dữ liệu trả về
      const container = document.querySelector(".cart-list");
      if (!container) return;
      if (!cart || cart.length === 0) {
        container.innerHTML =
          '<div style="padding:24px;text-align:center;color:#e94e4e;">Giỏ hàng trống.</div>';
        return;
      }
      container.innerHTML = cart
        .map(
          (item) => `
        <div class="cart-item" data-id="${item.id}">
          <img src="${item.image}" class="cart-item-img" alt="${item.name}" />
          <div class="cart-item-info">
            <div class="cart-item-name">${item.name}</div>
          </div>
          <div class="cart-item-qty"><span>1</span></div>
          <div class="cart-item-price">${item.price}</div>
          <div class="cart-item-remove" style="cursor:pointer;">&#128465;</div>
        </div>
      `
        )
        .join("");
      // Thêm sự kiện xoá
      container.querySelectorAll(".cart-item-remove").forEach(function (btn) {
        btn.addEventListener("click", function () {
          var id = btn.closest(".cart-item").dataset.id;
          fetch("giohang.aspx", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: `action=remove_item&id=${encodeURIComponent(id)}`,
          })
            .then((res) => res.json())
            .then((data) => {
              if (data.success) {
                // Reload lại danh sách giỏ hàng
                window.location.reload();
              }
            });
        });
      });
    });
});

// Thêm sự kiện thanh toán và validate
const checkoutBtn = document.querySelector(".checkout-btn");
if (checkoutBtn) {
  // Thêm/thay thế thông báo trên giao diện
  function showCheckoutMessage(msg, isSuccess) {
    let msgBox = document.getElementById("checkout-message");
    if (!msgBox) {
      msgBox = document.createElement("div");
      msgBox.id = "checkout-message";
      msgBox.style.margin = "10px 0";
      msgBox.style.fontWeight = "bold";
      msgBox.style.color = isSuccess ? "green" : "red";
      checkoutBtn.parentNode.insertBefore(msgBox, checkoutBtn);
    }
    msgBox.textContent = msg;
    msgBox.style.color = isSuccess ? "green" : "red";
  }
  checkoutBtn.addEventListener("click", function (e) {
    e.preventDefault();
    const name = document.querySelector(
      '.checkout-form input[placeholder="Name"]'
    );
    const phone = document.querySelector(
      '.checkout-form input[placeholder*="1111"]'
    );
    const date = document.querySelector(
      '.checkout-form input[placeholder="mm/yy"]'
    );
    const address = document.querySelector(
      '.checkout-form input[placeholder="HaNoi"]'
    );
    let valid = true;
    let msg = "";
    if (!name.value.trim()) {
      valid = false;
      msg += "Vui lòng nhập tên. ";
    }
    if (!phone.value.trim() || !/^\d{10,}$/.test(phone.value.trim())) {
      valid = false;
      msg += "SĐT không hợp lệ. ";
    }
    if (!date.value.trim()) {
      valid = false;
      msg += "Vui lòng nhập ngày hết hạn. ";
    }
    if (!address.value.trim()) {
      valid = false;
      msg += "Vui lòng nhập địa chỉ. ";
    }
    if (!valid) {
      showCheckoutMessage(msg, false);
      return;
    }
    // Gửi request mua hàng
    fetch("giohang.aspx", {
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: `action=checkout&name=${encodeURIComponent(
        name.value
      )}&phone=${encodeURIComponent(phone.value)}&date=${encodeURIComponent(
        date.value
      )}&address=${encodeURIComponent(address.value)}`,
    })
      .then((res) => res.json())
      .then((data) => {
        if (data.success) {
          showCheckoutMessage(
            "Đặt hàng thành công! Đang chuyển hướng...",
            true
          );
          setTimeout(() => {
            window.location.href = "info.aspx";
          }, 1200);
        } else {
          showCheckoutMessage(data.msg || "Có lỗi khi đặt hàng!", false);
        }
      });
  });
}
