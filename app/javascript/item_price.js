window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
  //  console.log(inputValue);

   const addTaxDom = document.getElementById("add-tax-price");
    //  console.log(Math.floor(inputValue * 0.1))
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)

  const addProfitDom = document.getElementById("profit");
    // console.log =(Math.floor(inputValue * 0.9))
  addProfitDom.innerHTML = Math.floor(inputValue * 0.9)
 })
});