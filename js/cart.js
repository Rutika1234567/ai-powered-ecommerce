function validateQty() {
    let qty = document.getElementById("qty").value;
    if (qty <= 0) {
        alert("Quantity must be at least 1");
        return false;
    }
    return true;
}
