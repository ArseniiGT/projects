function addItem() {
    const table = document.getElementById("goods").getElementsByTagName("TBODY")[0];
    const name = document.getElementById("name").value;
    const price = document.getElementById("price").value;
    const id = table.children.length;
    const rows = document.getElementById("goods").getElementsByTagName("TBODY")[0];
 
    if ((isNaN(price)) || (!price) || (!name) || (price[0] == " ") || (name[0] == " ")) {
        alert("Введите корректные данные");
        return false;
    }
 
    for (let i = 1; i < rows.children.length; i++) {
        if (rows.children[i].children[1].textContent == name){
            rows.children[i].children[2].textContent = price;
            return true;
        }
    }
        
    let newRow = document.createElement("tr");
    let numCell = document.createElement("td");
    let nameCell = document.createElement("td");
    let priceCell = document.createElement("td");
    newRow.appendChild(numCell);
    newRow.appendChild(nameCell);
    newRow.appendChild(priceCell);
    numCell.textContent = id;
    nameCell.textContent = name;
    priceCell.textContent = price;
    priceCell.onmouseover = function () {
        mouseOver(priceCell);
    };
    priceCell.onmouseout = function () {
        mouseOut(priceCell);
    };
    newRow.onclick = function () {
        addToCart(newRow);
    };
    table.appendChild(newRow);
}
function mouseOver(el) {
    el.style.backgroundColor = "#7095FF";
}

function mouseOut(el) {
    el.style.backgroundColor = "transparent";
}

function addToCart(el) {
    const cartRows = document.getElementById("cart");
    console.log(cartRows);
    for (let i = 1; i < cartRows.children.length; i++) {
        if ((cartRows.children[i].children[1].textContent == el.children[1].textContent) && (cartRows.children[i].children[2].textContent == el.children[2].textContent)) {
            let count = parseInt(cartRows.children[i].children[3].textContent) + 1;
            cartRows.children[i].children[3].textContent = count;
            return;
        }
    }
    
    let newRow = document.createElement("tr");
    let numCell = document.createElement("td");
    let nameCell = document.createElement("td");
    let priceCell = document.createElement("td");
    let amountCell = document.createElement("td");
    numCell.textContent = cartRows.children.length;
    nameCell.textContent = el.children[1].textContent;
    priceCell.textContent = el.children[2].textContent;
    amountCell.textContent = 1;
    newRow.appendChild(numCell);
    newRow.appendChild(nameCell);
    newRow.appendChild(priceCell);
    newRow.appendChild(amountCell);
    cart.appendChild(newRow);
}

function calculate(){
    const cartRows = document.getElementById("cart");
    let summ = 0;
    for (let i = 1; i < cart.children.length;i++){
         summ = summ + parseInt(cart.children[i].children[3].textContent) * parseInt(cart.children[i].children[2].textContent);
    }
    const total = document.getElementById("total");
    total.textContent = "Итого: " + summ + "руб";  
}
