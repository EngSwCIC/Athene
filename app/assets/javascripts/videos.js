if("#videos"){
function Form_Start(){
var form = document.getElementById("form_up");
var show = document.getElementById("showprogress");
var subm = document.getElementById("submit_up");
var changer = document.getElementById('upload');
var file = " ";

if(changer != null){
  changer.onchange = function(){
    var filename = this.value;
    var lastIndex = filename.lastIndexOf("\\");
    if (lastIndex >= 0) {
      filename = filename.substring(lastIndex + 1);
    }
    file = filename;
  };
}

if(subm != null){
  subm.addEventListener("click", function(){
    show.innerHTML = "<div id='progresso'> \
                         <div id='barra'> </div>\
                       ";
    carregar(file);
  });
}

function carregar(value){
  var elem = document.getElementById("barra");   
  var width = 10;
  var id = setInterval(frame, 10);
  function frame() {
    if (width >= 100) {
      clearInterval(id);
    } else {
      width++; 
      elem.style.width = width + '%'; 
      elem.innerHTML = value + " " + width * 1  + '%';
    }
  }
};
}
}