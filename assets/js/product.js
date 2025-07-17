// Render sản phẩm từ Application
// Thêm chức năng tìm kiếm sản phẩm theo tên
(function () {
  let allProducts = [];
  // Render sản phẩm
  function renderProducts(products) {
    const container = document.getElementById("productList");
    if (!container) return;
    if (products.length === 0) {
      container.innerHTML =
        '<div style="padding:24px;text-align:center;color:#e94e4e;">Không tìm thấy sản phẩm nào.</div>';
      return;
    }
    container.innerHTML = products
      .map(
        (product) => `
      <div class="section20__item" data-id="${product.Id}">
        <img src="${product.Image}" alt="" />
        <div class="section20__info">
          <div class="section20__name">${product.Name}</div>
          <div class="section20__price">${product.Price}</div>
        </div>
      </div>
    `
      )
      .join("");
    // Thêm sự kiện click cho từng sản phẩm
    const items = container.querySelectorAll(".section20__item");
    items.forEach((item) => {
      const id = item.getAttribute("data-id");
      item.addEventListener("click", function () {
        window.location.href = `chitiethang1.aspx?id=${id}`;
      });
    });
  }

  // Fetch sản phẩm ban đầu
  fetch("couchproduct.aspx?action=get_products")
    .then((res) => res.json())
    .then((products) => {
      allProducts = products;
      renderProducts(allProducts);
    });

  // Sử dụng ô tìm kiếm ở header
  const searchInput = document.querySelector(".header__search input");
  if (searchInput) {
    searchInput.addEventListener("input", function () {
      const keyword = this.value.trim().toLowerCase();
      if (!keyword) {
        renderProducts(allProducts);
        return;
      }
      const filtered = allProducts.filter((p) =>
        p.Name.toLowerCase().includes(keyword)
      );
      renderProducts(filtered);
    });
  }
})();
