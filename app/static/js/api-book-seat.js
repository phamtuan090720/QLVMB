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
function select_seat(id){
    getEle(id).classList.toggle("bg-danger");
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
               content +=  `<td><img id=myDIV${list[i][j].id} src="/static/images/icon-seat.png" alt="" class="img-fluid seat m-3" onclick=select_seat('myDIV${list[i][j].id}')></td>`;
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