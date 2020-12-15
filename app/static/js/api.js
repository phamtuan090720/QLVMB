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
        var price = document.getElementById("price");
        price.innerText = `${data.total_quantity}`;
        console.info(data);
        var amount = document.getElementById("amount");
        amount.innerText = `${data.total_amount} VND`;
        var list_ticket= document.getElementById("listTicket")
        list_ticket.innerText =`${data.list_ticket}`;
    }).catch(err => {
        console.log(err);
    });
}
