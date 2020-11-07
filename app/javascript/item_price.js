window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    console.log(addTaxDom);
    
    const profitNumber = document.getElementById("profit");
    const addTaxDom2 = inputValue * 0.1;
    console.log(addTaxDom);
    profitNumber.innerHTML = (Math.floor(inputValue - addTaxDom2));
    console.log(profitNumber);
  });
});