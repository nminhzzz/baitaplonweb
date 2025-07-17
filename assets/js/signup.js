// Đăng ký: validate JS, gửi POST lên server, nhận JSON

document.addEventListener("DOMContentLoaded", function () {
  const form = document.getElementById("form1");
  const phoneInput = document.getElementById("phone");
  const password1Input = document.getElementById("password1");
  const password2Input = document.getElementById("password2");
  const errorPhone = document.querySelector(".signup__error--phone");
  const errorPassword1 = document.querySelector(".signup__error--password1");
  const errorPassword2 = document.querySelector(".signup__error--password2");
  // Thêm vùng hiển thị thông báo thành công
  let successMsg = document.querySelector(".signup__success");
  if (!successMsg) {
    successMsg = document.createElement("p");
    successMsg.className = "signup__success";
    successMsg.style.color = "green";
    form.parentNode.insertBefore(successMsg, form);
  }
  successMsg.textContent = "";

  form.addEventListener("submit", function (e) {
    e.preventDefault();
    errorPhone.textContent = "";
    errorPassword1.textContent = "";
    errorPassword2.textContent = "";
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
    if (!password1Input.value.trim()) {
      errorPassword1.textContent = "Vui lòng nhập mật khẩu";
      errorPassword2.textContent = "Vui lòng nhập mật khẩu";
      valid = false;
    }
    if (password1Input.value !== password2Input.value) {
      errorPassword2.textContent = "Mật khẩu xác nhận không khớp";
      valid = false;
    }
    if (!valid) return;
    // Gửi AJAX lên server kiểm tra trùng sđt
    fetch("signup.aspx", {
      method: "POST",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "X-Requested-With": "XMLHttpRequest",
      },
      body: `phone=${encodeURIComponent(
        phoneValue
      )}&password=${encodeURIComponent(password1Input.value)}`,
    })
      .then((res) => res.json().catch(() => null))
      .then((data) => {
        if (data && data.success) {
          successMsg.textContent =
            "Đăng ký thành công! Bạn sẽ được chuyển sang trang đăng nhập...";
          setTimeout(() => {
            window.location = "signin.aspx";
          }, 1500);
        } else if (data && data.errors) {
          errorPhone.textContent = data.errors.phone || "";
          errorPassword1.textContent = data.errors.password || "";
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
