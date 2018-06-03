if("#videos"){
  function Form_Start(){
    var form = document.getElementById("form_up");
    var show = document.getElementById("showprogress");
    var subm = document.getElementById("submit_up");
    var changer = document.getElementById('upload');
    var title = document.getElementById('titulo');
    var file;

    changer.onchange = function(){
      var filename = this.value;
      var lastIndex = filename.lastIndexOf("\\");
      var extensions = /(\.mp4|\.mkv|\.mpeg|\.avi|\.wmv|\.mpg|\.webm|\.flv)$/i;
      if (lastIndex >= 0) {
        filename = filename.substring(lastIndex + 1);
      }
      if(extensions.exec(filename)){
        file = filename;
      }
    };

    
    subm.addEventListener("click", function(){
      if((file != null)&&(title.value != '')){
        show.innerHTML = "<div id='progresso'> \
                            <div id='barra'> </div>\
                           </div>";
        carregar(file);
      }
    });

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
    }
  }
}