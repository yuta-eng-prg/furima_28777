function tax() {
  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  price.addEventListener("input", updateValue);
  function updateValue(e) {
    tax.textContent = Math.floor(e.target.value * 0.1);
    profit.textContent = Math.floor(e.target.value - tax.textContent);
  };
};

setInterval(tax, 1000);