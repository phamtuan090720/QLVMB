function findDataFlight(){
    id_from  = getEle("from").value
    id_to = getEle("to").value
    date = getEle("date").value
    api_flight(id_from,id_to,date)
}
function api_flight(id_from,id_to,date){
        fetch('/api/find-flight', {
        method: 'post',
        body: JSON.stringify({
            "id_from": id_from,
            "id_to": id_to,
            "date": date
        }),
        headers: {
            'Context-Type': 'application/json'
        }
    }).then(res => res.json()).then(data => {
        console.log(data)
        alert(data.mess);
        if(data.mess==="Tìm Thấy Chuyến Bay Phù Hợp"){
            renderChuyenBayOption(data.list_flight)
        }

    }).catch(err => {
        console.log(err);
    });
}
function renderChuyenBayOption(list){
    var content = ""
    getEle("chuyenBay").innerHTML="";
      list.forEach(function(item){
        content += `
           <option value=${item.id}>${item.detail}</option>
        `
    });
    getEle("chuyenBay").innerHTML = content;
}
function renderChuyenBayOption(list){
    var content = ""
    getEle("chuyenBay").innerHTML="";
      list.forEach(function(item){
        content += `
           <option value=${item.id}>${item.detail}</option>
        `
    });
    getEle("chuyenBay").innerHTML = content;
}
function api_list_ticket(id_flight,type){
        fetch('/api/list-seat', {
        method: 'post',
        body: JSON.stringify({
            "id_flight": id_flight,
            "type": type
        }),
        headers: {
            'Context-Type': 'application/json'
        }
    }).then(res => res.json()).then(data => {
        console.log(data)
        alert(data.mess);
        renderListGhe(mapTicket(data.list_ticket))
        readCart()
        var price = document.getElementById("price");
        price.innerText = `${data.list_ticket[0].gia} $`;
    }).catch(err => {
        console.log(err);
    });
}
function getListTicket(){
    id_flight = getEle("chuyenBay").value
    type = getEle("type").value
  api_list_ticket(id_flight,type)
}
function getEle(id) {
    return document.getElementById(id);
}
function select_seat(id,id_ghe,ten_ghe,gia){
    getEle(id).classList.toggle("bg-danger");
    addToCart(id_ghe,ten_ghe,gia);
}
function renderListGhe(list){
    var content = "";
    document.getElementById("listTicket").innerHTML="";
      for (var i = 0; i < row; i++) {
        content+= `<tr>`;
          content += `<td>${i+1}</td>`;
           for (var j = 0; j < col; j++) {
            if(list[i][j].trannThai==="Đã Đặt"){
               content +=  `<td><img id=myDIV${list[i][j].id} src="/static/images/icon-seat.png" alt="" class="img-fluid seat bg-secondary m-3"></td>`;
            }
            else{
               content +=  `<td><img id=myDIV${list[i][j].id} src="/static/images/icon-seat.png" alt="" class="img-fluid seat m-3" onclick=select_seat('myDIV${list[i][j].id}',${list[i][j].id},'${list[i][j].ten}',${list[i][j].gia})></td>`;
            }
        }
           content+= `</tr>`;
      }
     document.getElementById("listTicket").innerHTML = content;
}
function mapTicket(list) {

    len = list.length
    col = parseInt(len / 10)
    row = parseInt(len / col)
    var myArray = []
    var x = 0
    for (var i = 0; i < row; i++) {
        myArray.push([])
        for (var j = 0; j < col; j++) {
            myArray[i].push(list[x++])
        }
    }
    return myArray
}
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
    }).catch(err => {
        console.log(err);
    });
}
function call_api_customer_info(){
    cmnd = getEle("ic").value;
    ten = getEle("name").value;
    sdt = getEle("phone").value;
    bd = getEle("bd").value;
    customer_info(cmnd,ten,sdt,bd)
}
function customer_info(cmnd,ten,sdt,bd){
    fetch('/api/get-info-customer', {
        method: 'post',
        body: JSON.stringify({
            "cmnd": cmnd,
            "ten": ten,
            "sdt": sdt,
            "bd":bd,
        }),
        headers: {
            'Context-Type': 'application/json'
        }
    }).then(res => res.json()).then(data => {
        alert(data.mess)
        if (data.mess==="Đã Tìm Thấy Thông Tin Khách Hàng"){
            renderTableKh(data);
            getEle("book_ve").disabled = false;

        }

    }).catch(err => {
        console.log(err);
    });
}
function renderTableKh(kh){
    document.getElementById("customer").innerHTML="";
   var content = ` <tr>
                    <td><div id="kh">${kh.id}</div></td>
                    <td>${kh.ten}</td>
                    <td>${kh.cmnd}</td>
                       <td>${kh.sdt}</td>
                            <td>${kh.ngaySinh}</td>
                         <td>${kh.diaChi}</td>
                  </tr>`
     document.getElementById("customer").innerHTML=content

}
function api_book_seat(id_kh,id_nhanVien){
    fetch('/api/book-ticket', {
        method: 'post',
        body: JSON.stringify({
            "id_kh": id_kh,
            "id_nhanVien": id_nhanVien,
        }),
        headers: {
            'Context-Type': 'application/json'
        }
    }).then(res => res.json()).then(data => {
        alert(data.mess)
        if(data.mess==="Đặt Vé Thành Công"){
               reload();
        }

    }).catch(err => {
        console.log(err);
    });
}
function call_api_book_seat(id_nhanVien){
    console.log(id_nhanVien)
    id_kh = document.getElementById("kh").innerHTML
    console.log(id_kh)
     api_book_seat(id_kh,id_nhanVien)
}
function reload(){
    location.reload();
}
getEle("book_ve").disabled = true;