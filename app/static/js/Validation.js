function Validation(){
 this.isNull = function(inputId, spanId, mess) {
        if (getEle(inputId).value === "") {
            getEle(spanId).innerHTML = mess;
            getEle(spanId).style.display = "block";
            return false;
        } else {
            getEle(spanId).style.display = "none";
        }
        return true;
    }
}
function getEle(id) {
    return document.getElementById(id);
}