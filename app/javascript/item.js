
window.addEventListener("load",() => {
  const priceId = document.getElementById("item-price");

  priceId.addEventListener("input", () => {
    //数字を入力されたら手数料と利益を出す処理を行う
    const price = document.getElementById("item-price").value;
    const tax = Math.ceil(price * 0.9);
    document.getElementById("add-tax-price").innerHTML = tax

    const profit = Math.floor(price * 0.1);
    document.getElementById("profit").innerHTML = profit
  })
});

