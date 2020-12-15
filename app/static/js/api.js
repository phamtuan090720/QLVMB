function addToCart(id, name, price) {
    fetch('/api/cart', {
        method: 'post',
        body: JSON.stringify({
            "id": id,
            "name": name,
            "price": price
        }),
        headers: {
            'Context-Type': 'application/json'
        }
    }).then(res => res.json()).then(data => {
        var cart = document.getElementById("price");
        cart.innerText = `${data.total_quantity} - ${data.total_amount} VND`;
        console.info(data);
    }).catch(err => {
        console.log(err);
    });
}
