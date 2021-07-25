window.addEventListener('load', () => {

 const itemPrice = document.getElementById("item-price")
 itemPrice.addEventListener('input', () => {
  const inputValue = itemPrice.value
  console.log(inputValue)
  

 const addTaxPrice = document.getElementById("add-tax-price")
 addTaxPrice.innerHTML = (Math.floor(inputValue * 0.1))
 console.log(addTaxPrice)

 const profit = document.getElementById("profit")
 const price_result = inputValue * 0.1
 console.log(price_result)
 profit.innerHTML = (Math.floor(inputValue - price_result))
 console.log(profit)
 }) 
})