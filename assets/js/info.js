document.addEventListener("DOMContentLoaded", function () {
  // Render số điện thoại
  fetch("info.aspx?action=get_phone")
    .then((res) => res.json())
    .then((data) => {
      document.getElementById("user-phone").textContent =
        data.phone || "Chưa đăng nhập";
    });

  // Render đơn hàng
  fetch("info.aspx?action=get_orders")
    .then((res) => res.json())
    .then((orders) => {
      const tbody = document.querySelector(".order-list");
      if (!tbody) return;
      if (!orders || orders.length === 0) {
        tbody.innerHTML =
          '<tr><td colspan="6" style="text-align:center;">Chưa có đơn hàng nào.</td></tr>';
        return;
      }
      tbody.innerHTML = orders
        .map((order, idx) => {
          let productNames = "";
          let totalQty = 0;
          let totalPrice = 0;
          order.products.forEach((p) => {
            productNames += p.name + "<br/>";
            totalQty += 1;
            let price =
              parseFloat((p.price || "").replace(/[^0-9.]/g, "")) || 0;
            totalPrice += price;
          });
          return `
          <tr>
            <td>#${1000 + idx + 1}</td>
            <td>${order.created}</td>
            <td>${productNames}</td>
            <td>${totalQty}</td>
            <td>${totalPrice.toLocaleString()}đ</td>
            <td>Đang xử lý</td>
          </tr>
        `;
        })
        .join("");
    });
});
