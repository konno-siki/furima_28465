function add_tax() {
  const input = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  
  input.addEventListener('input', () => {
    let num = input.value;
    let num1 = num * 0.1;
    let num2 = num * 0.9;
    tax.textContent = String(num1);
    profit.textContent = String(num2);
  });
}
setInterval(add_tax, 1000);
