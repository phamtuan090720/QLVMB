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