// Đăng nhập: validate JS, gửi POST lên server, nhận JSON

document.addEventListener("DOMContentLoaded", function () {
  const form = document.getElementById("form1");
  const phoneInput = document.getElementById("phone");
  const passwordInput = document.getElementById("password1");
  const errorPhone = document.querySelector(".signin__error--phone");
  const errorPassword = document.querySelector(".signin__error--password1");
  // Thêm vùng hiển thị thông báo thành công
  let successMsg = document.querySelector(".signin__success");
  if (!successMsg) {
    successMsg = document.createElement("p");
    successMsg.className = "signin__success";
    successMsg.style.color = "green";
    form.parentNode.insertBefore(successMsg, form);
  }
  successMsg.textContent = "";

  form.addEventListener("submit", function (e) {
    e.preventDefault();
    errorPhone.textContent = "";
    errorPassword.textContent = "";
    successMsg.textContent = "";
    let valid = true;
    const phoneValue = phoneInput.value.trim();
    if (!phoneValue) {
      errorPhone.textContent = "Vui lòng nhập số điện thoại";
      valid = false;
    } else if (!/^0\d{9}$/.test(phoneValue)) {
      errorPhone.textContent = "Số điện thoại phải có 10 số và bắt đầu bằng 0";
      valid = false;
    }
    if (!passwordInput.value.trim()) {
      errorPassword.textContent = "Vui lòng nhập mật khẩu";
      valid = false;
    }
    if (!valid) return;
    // Gửi AJAX lên server kiểm tra đăng nhập
    fetch("signin.aspx", {
      method: "POST",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "X-Requested-With": "XMLHttpRequest",
      },
      body: `phone=${encodeURIComponent(
        phoneValue
      )}&password=${encodeURIComponent(passwordInput.value)}`,
    })
      .then((res) => res.json().catch(() => null))
      .then((data) => {
        if (data && data.success) {
          successMsg.textContent = "Đăng nhập thành công! Đang chuyển trang...";
          setTimeout(() => {
            // Xử lý phân trang phía client dựa vào userRole trả về từ server
            if (
              data.userRole &&
              data.userRole.trim().toLowerCase() === "admin"
            ) {
              window.location = "quanli.aspx";
            } else {
              window.location = "index.aspx";
            }
          }, 1500);
        } else if (data && data.errors) {
          errorPhone.textContent = data.errors.phone || "";
          errorPassword.textContent = data.errors.password || "";
        } else {
          showToast("Có lỗi xảy ra, vui lòng thử lại!", "error");
        }
      })
      .catch(() => {
        showToast("Có lỗi xảy ra, vui lòng thử lại!", "error");
      });
  });
});

// Đảm bảo có hàm showToast nếu chưa có
if (typeof showToast !== "function") {
  function showToast(message, type) {
    let toast = document.createElement("div");
    toast.className = "custom-toast " + (type || "");
    toast.textContent = message;
    toast.style.position = "fixed";
    toast.style.top = "32px";
    toast.style.right = "32px";
    toast.style.background = type === "success" ? "#4caf50" : "#e94e4e";
    toast.style.color = "#fff";
    toast.style.padding = "12px 24px";
    toast.style.borderRadius = "8px";
    toast.style.fontSize = "16px";
    toast.style.boxShadow = "0 2px 8px #0002";
    toast.style.zIndex = 99999;
    toast.style.opacity = 1;
    toast.style.transition = "opacity 0.5s";
    document.body.appendChild(toast);
    setTimeout(() => {
      toast.style.opacity = 0;
    }, 1800);
    setTimeout(() => {
      if (toast.parentNode) toast.parentNode.removeChild(toast);
    }, 2300);
  }
}
