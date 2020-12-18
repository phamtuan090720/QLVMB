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
        list_ticket = []
          if (data.list_ticket && data.list_ticket.length)
           {
              data.list_ticket.forEach(function(item, index) {
            list_ticket[index] = item.Seat
            })
          }
        renderTable(data.list_ticket);
        document.getElementById("list_ticket").innerText = `${list_ticket}`
        console.info(data);
        var amount = document.getElementById("amount");
        amount.innerText = `${data.total_amount} $`;
    }).catch(err => {
        console.log(err);
    });
}

function readCart() {
    fetch('/api/get-cart', {
        method: 'get',
        headers: {
            'Context-Type': 'application/json'
        }
    }).then(res => res.json()).then(data => {
        list_ticket = []
          if (data.list_ticket && data.list_ticket.length)
           {
              data.list_ticket.forEach(function(item, index) {
                list_ticket[index] = item.Seat
                document.getElementById(`myDIV${item.id}`).classList.add("bg-danger");
            })
          }
        console.info(data);
        var amount = document.getElementById("amount");
        amount.innerText = `${data.total_amount} $`;
        document.getElementById("list_ticket").innerText = `${list_ticket}`
        renderTable(data.list_ticket);
    }).catch(err => {
        console.log(err);
    });
}
function renderTable(list)
{
   var content = "";
    document.getElementById("listTicket").innerHTML="";
    list.forEach(function(item,index){
        content += `
            <tr>
                <th scope="row">${index+1}</th>
                <td>${item.flight}</td>
                <td>${item.Seat}</td>
            </tr>
        `
    });
     document.getElementById("listTicket").innerHTML=content
}
readCart()
function pay(){
    name =  `${document.getElementById("last-name").value} ${document.getElementById("frist-name").value} `;
    phone =`${document.getElementById("phone").value}`
    ic = `${document.getElementById("identity-card").value}`
    address = `${document.getElementById("address").value}`
    brithday = `${document.getElementById("brithday").value}`
     fetch('/api/pay', {
        method: 'post',
        body: JSON.stringify({
            "name": name,
            "phone": phone,
            "ic":ic,
            "address":address,
            "brithday":brithday,
        }),
        headers: {
            'Context-Type': 'application/json'
        }
    }).then(res => res.json()).then(data => {
        alert(data.mess);
        if(data.mess==="Success")
        {
            location.reload();
        }
    }).catch(err => {
        console.log(err);
    });
}
function isNull(idInput,spanId,mess)
{
    if(getEle(idInput).value==="")
    {
        getEle(spanId).innerHTML = mess;
        getEle(spanId).style.display = "block";
         return false;
    }
    else
    {
            getEle(spanId).style.display = "none";
    }
    return false;

}
function book()
{
    var isValue = true;
    isValue &= isNull("last-name","noti","Please enter your full information")
    isValue &= isNull("frist-name","noti","Please enter your full information")
    isValue &= isNull("phone","noti","Please enter your full information")
    isValue &= isNull("identity-card","noti","Please enter your full information")
    isValue &= isNull("address","noti","Please enter your full information")
    isValue &= isNull("brithday","noti","Please enter your full information")
    if(isValue===0){
        readCart()
        pay()
    }
}
function getEle(id) {
    return document.getElementById(id);
}
function updateTK(id,user) {
    fetch('/api/ticket', {
        method: 'post',
        body: JSON.stringify({
            "id_ticket": id,
            "id_user":user
        }),
        headers: {
            'Context-Type': 'application/json'
        }
    }).then(res => res.json()).then(data => {
         alert(data.mess);
         location.reload();
    }).catch(err => {
        console.log(err);
    });
}