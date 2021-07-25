window.addEventListener('load', () => {

 const itemPrice = document.getElementById("item-price")
 itemPrice.addEventListener('input', () => {
  const inputValue = itemPrice.value  

 const addTaxPrice = document.getElementById("add-tax-price")
 addTaxPrice.innerHTML = (Math.floor(inputValue * 0.1))

 const profit = document.getElementById("profit")
 const price_result = (Math.floor(inputValue * 0.1))
 profit.innerHTML = (Math.floor(inputValue - price_result))
 }) 
})