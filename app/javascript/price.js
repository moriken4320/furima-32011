const price = () => {
  const item_price = document.getElementById("item-price");
  const add_tax_price = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  item_price.addEventListener("keyup",()=>{
    const price_value = parseInt(item_price.value);
    let tax = 0;
    if(price_value != ""){
      tax = Math.floor(price_value * 0.1);
    }else{
      tax = 0;
    }
    add_tax_price.textContent = tax.toLocaleString();
    profit.textContent = price_value - tax;
  });
};

window.addEventListener("load",price);