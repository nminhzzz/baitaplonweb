function loadProducts() {
  fetch("quanli.aspx?action=get_products")
    .then((res) => res.json())
    .then((products) => {
      const table = document.querySelector(".product-table tbody");
      if (!table) return;
      table.innerHTML = "";
      products.forEach((product) => {
        const tr = document.createElement("tr");
        tr.innerHTML = `
                    <td>${product.Id}</td>
                    <td><img src="${product.Image}" alt="" class="product-img"/></td>
                    <td>${product.Name}</td>
                    <td>${product.Price}</td>
                    <td>
                        <button type="button" class="action-btn edit-btn"><i class="fa fa-edit"></i> Sửa</button>
                        <button type="button" class="action-btn delete-btn"><i class="fa fa-trash"></i> Xóa</button>
                    </td>
                `;
        // Gán sự kiện xóa
        tr.querySelector(".delete-btn").onclick = function () {
          if (confirm("Bạn có chắc muốn xóa sản phẩm này?")) {
            fetch("quanli.aspx?action=delete_product", {
              method: "POST",
              headers: { "Content-Type": "application/x-www-form-urlencoded" },
              body: "id=" + encodeURIComponent(product.Id),
            })
              .then((res) => res.json())
              .then((data) => {
                if (data.success) {
                  showToast("Đã xóa thành công!", "success");
                  loadProducts();
                } else {
                  showToast(data.error || "Xóa thất bại!", "error");
                }
              });
          }
        };
        // Gán sự kiện sửa
        tr.querySelector(".edit-btn").onclick = function () {
          showEditPopup(product);
        };
        table.appendChild(tr);
      });
    });
}

// --- USER MANAGEMENT ---
let allUsers = [];
function loadUsers() {
  fetch("quanli.aspx?action=get_users")
    .then((res) => res.json())
    .then((users) => {
      allUsers = users;
      const tbody = document.querySelector(".user-table tbody");
      if (!tbody) return;
      tbody.innerHTML = "";
      users.forEach((user, idx) => {
        const tr = document.createElement("tr");
        tr.innerHTML = `
          <td>${idx + 1}</td>
          <td>${user.Phone}</td>
          <td>${user.Role}</td>
          <td>
            <button type="button" class="action-btn edit-user-btn"><i class="fa fa-edit"></i> Sửa</button>
            <button type="button" class="action-btn delete-user-btn"><i class="fa fa-trash"></i> Xóa</button>
          </td>
        `;
        tr.querySelector(".edit-user-btn").onclick = function () {
          showEditUserPopup(user);
        };
        tr.querySelector(".delete-user-btn").onclick = function () {
          if (confirm("Bạn có chắc muốn xóa user này?")) {
            fetch("quanli.aspx?action=delete_user", {
              method: "POST",
              headers: { "Content-Type": "application/x-www-form-urlencoded" },
              body: "phone=" + encodeURIComponent(user.Phone),
            })
              .then((res) => res.json())
              .then((data) => {
                if (data.success) {
                  showToast("Đã xóa user!", "success");
                  loadUsers();
                } else {
                  showToast(data.error || "Xóa user thất bại!", "error");
                }
              });
          }
        };
        tbody.appendChild(tr);
      });
    });
}

function showEditUserPopup(user) {
  const popup = document.getElementById("editUserPopup");
  const form = document.getElementById("editUserForm");
  form.editUserPhone.value = user.Phone;
  form.editUserPassword.value = user.Password;
  form.editUserRole.value = user.Role;
  popup.style.display = "block";
  document.getElementById("cancelEditUserBtn").onclick = function () {
    popup.style.display = "none";
  };
  form.onsubmit = function (e) {
    e.preventDefault();
    const fd = new FormData(form);
    fetch("quanli.aspx?action=edit_user", {
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: Array.from(fd.entries())
        .map(([k, v]) => k + "=" + encodeURIComponent(v))
        .join("&"),
    })
      .then((res) => res.json())
      .then((data) => {
        if (data.success) {
          showToast("Đã cập nhật user!", "success");
          popup.style.display = "none";
          loadUsers();
        } else {
          showToast(data.error || "Cập nhật user thất bại!", "error");
        }
      });
  };
}

document.addEventListener("DOMContentLoaded", function () {
  loadProducts();
  // Gán sự kiện submit cho form sửa sản phẩm chỉ 1 lần
  const popup = document.getElementById("editProductPopup");
  const form = popup.querySelector("#editProductForm");
  form.addEventListener("submit", function (e) {
    e.preventDefault();
    const fd = new FormData(form);
    fetch("quanli.aspx?action=edit_product", {
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: Array.from(fd.entries())
        .map(([k, v]) => k + "=" + encodeURIComponent(v))
        .join("&"),
    })
      .then((res) => res.json())
      .then((data) => {
        if (data.success) {
          showToast("Đã cập nhật thành công!", "success");
          popup.style.display = "none";
          loadProducts();
        } else {
          showToast(data.error || "Cập nhật thất bại!", "error");
        }
      });
  });

  // Thêm sản phẩm
  const addBtn = document.querySelector(".add-product-btn");
  const addPopup = document.getElementById("addProductPopup");
  const addForm = document.getElementById("addProductForm");
  const cancelAddBtn = document.getElementById("cancelAddBtn");

  if (addBtn && addPopup && addForm && cancelAddBtn) {
    addBtn.onclick = function () {
      addForm.reset();
      addPopup.style.display = "block";
    };
    cancelAddBtn.onclick = function () {
      addPopup.style.display = "none";
    };
    addForm.onsubmit = function (e) {
      e.preventDefault();
      const fd = new FormData(addForm);
      // Log dữ liệu gửi đi để debug
      for (let [k, v] of fd.entries()) {
        console.log("Field:", k, "Value:", v);
      }
      fetch("quanli.aspx?action=add_product", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: Array.from(fd.entries())
          .map(([k, v]) => k + "=" + encodeURIComponent(v))
          .join("&"),
      })
        .then((res) => res.json())
        .then((data) => {
          console.log("Response từ server:", data);
          if (data.success) {
            showToast("Đã thêm sản phẩm mới!", "success");
            addPopup.style.display = "none";
            loadProducts();
          } else {
            showToast(data.error || "Thêm sản phẩm thất bại!", "error");
          }
        })
        .catch((err) => {
          showToast("Lỗi kết nối server!", "error");
          console.error(err);
        });
    };
  } else {
    console.error("Không tìm thấy một trong các phần tử modal thêm sản phẩm!");
  }

  // Tab chuyển Product/User
  const tabProduct = document.getElementById("tabProduct");
  const tabUser = document.getElementById("tabUser");
  const productSection = document.getElementById("productSection");
  const userSection = document.getElementById("userSection");
  const addProductBtn = document.querySelector(".add-product-btn");
  const addUserBtn = document.querySelector(".add-user-btn");
  tabProduct.onclick = function () {
    tabProduct.classList.add("menu-bar__tab--active");
    tabUser.classList.remove("menu-bar__tab--active");
    productSection.style.display = "";
    userSection.style.display = "none";
    addProductBtn.style.display = "";
    addUserBtn.style.display = "none";
  };
  tabUser.onclick = function () {
    tabUser.classList.add("menu-bar__tab--active");
    tabProduct.classList.remove("menu-bar__tab--active");
    productSection.style.display = "none";
    userSection.style.display = "";
    addProductBtn.style.display = "none";
    addUserBtn.style.display = "";
    loadUsers();
  };
  // Thêm user
  const addUserPopup = document.getElementById("addUserPopup");
  const addUserForm = document.getElementById("addUserForm");
  addUserBtn.onclick = function () {
    addUserForm.reset();
    addUserPopup.style.display = "block";
  };
  document.getElementById("cancelAddUserBtn").onclick = function () {
    addUserPopup.style.display = "none";
  };
  addUserForm.onsubmit = function (e) {
    e.preventDefault();
    const fd = new FormData(addUserForm);
    fetch("quanli.aspx?action=add_user", {
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: Array.from(fd.entries())
        .map(([k, v]) => k + "=" + encodeURIComponent(v))
        .join("&"),
    })
      .then((res) => res.json())
      .then((data) => {
        if (data.success) {
          showToast("Đã thêm user mới!", "success");
          addUserPopup.style.display = "none";
          loadUsers();
        } else {
          showToast(data.error || "Thêm user thất bại!", "error");
        }
      });
  };
});

window.showEditPopup = function (product) {
  const popup = document.getElementById("editProductPopup");
  const form = popup.querySelector("#editProductForm");
  form.id.value = product.Id;
  form.name.value = product.Name;
  form.price.value = product.Price;
  form.image.value = product.Image;
  popup.style.display = "block";
  // Hủy
  popup.querySelector("#cancelEditBtn").onclick = function () {
    popup.style.display = "none";
  };
};

// Toast notification
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
