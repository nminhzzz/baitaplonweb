window.addEventListener("DOMContentLoaded", function () {
  if (window.isLoggedIn) {
    var accountLink = document.querySelector('a[name="header__account"]');
    if (accountLink) {
      var icon = accountLink.querySelector("i.fa-user.header__avatar");
      if (icon) {
        var img = document.createElement("img");
        img.src = "assets/image/avatar.jpg";
        img.alt = "avatar";
        img.className = "header__avatar";
        img.style.width = "32px";
        img.style.height = "32px";
        img.style.borderRadius = "50%";
        icon.parentNode.replaceChild(img, icon);
      }
      // Đổi chữ Account thành Đăng xuất
      var nameText = accountLink.querySelector(".header__name");
      if (nameText) {
        nameText.textContent = "Đăng xuất";
        nameText.style.cursor = "pointer";
        nameText.addEventListener("click", function (e) {
          e.preventDefault();
          e.stopPropagation(); // Ngăn sự kiện lan lên thẻ <a>
          window.location.href = "index.aspx?action=logout";
        });
      }
      // Thêm sự kiện click cho avatar để sang trang info
      var avatarImg = accountLink.querySelector("img.header__avatar");
      if (avatarImg) {
        avatarImg.style.cursor = "pointer";
        avatarImg.addEventListener("click", function (e) {
          e.preventDefault();
          e.stopPropagation(); // Ngăn sự kiện lan lên thẻ <a>
          window.location.href = "info.aspx";
        });
      }
    }
  }
});
