// Lấy id sản phẩm từ URL
function getProductIdFromUrl() {
  const params = new URLSearchParams(window.location.search);
  return params.get("id");
}
// Hiển thị id sản phẩm (ví dụ: trong tiêu đề)
document.addEventListener("DOMContentLoaded", function () {
  var id = getProductIdFromUrl();
  if (id) {
    var title = document.querySelector(".product-title");
    if (title) {
      title.textContent += " (ID: " + id + ")";
    }
  }
  var btn = document.querySelector(".add-to-cart-btn");
  var msg = document.getElementById("cart-message");
  if (btn) {
    btn.addEventListener("click", function () {
      fetch(window.location.pathname, {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: `action=add_to_cart&id=${
          btn.dataset.id
        }&name=${encodeURIComponent(
          btn.dataset.name
        )}&price=${encodeURIComponent(
          btn.dataset.price
        )}&image=${encodeURIComponent(btn.dataset.image)}`,
      })
        .then((res) => res.json())
        .then((data) => {
          if (data.success) {
            msg.textContent = "Đã thêm vào giỏ hàng!";
            setTimeout(() => {
              msg.textContent = "";
            }, 2000);
          }
        });
    });
  }
});
