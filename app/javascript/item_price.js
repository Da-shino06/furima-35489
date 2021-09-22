window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addtax = Math.floor(inputValue * 0.1)
    addTaxDom.innerHTML = addtax
    const  ProfitDom = document.getElementById("profit");
    profitprice = Math.floor(inputValue - addtax)
    ProfitDom.innerHTML = profitprice
})
});