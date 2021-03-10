window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
      const TaxDom = Math.floor(priceInput.value * 0.1);
        addTaxDom.innerHTML = TaxDom.toLocaleString();
    const addProfitDom = document.getElementById("profit");
      const ProfitDom = Math.floor(priceInput.value - TaxDom);
        addProfitDom.innerHTML = ProfitDom.toLocaleString();
  })
});