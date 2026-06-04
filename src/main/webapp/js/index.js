window.addEventListener("keydown", function (event) {
		if (event.defaultPrevented) {
			return;
		}

		var handled = false;
  
		if (event.keyCode == 123)
			handled = true;
    
		if (handled) {
			console.log(event.keyCode);
        
			event.preventDefault();
		}
	}, true);
document.onmousedown=disableclick; status="우클릭은 사용하실 수 없습니다."; function disableclick(event){ if (event.button==2) { alert(status); return false; } }

window.onload = function(){
    let oth = document.getElementById("other");
    let det = document.getElementById("detail");
    let bac = document.getElementById("back");

    oth.addEventListener('click', function(){
        oth.style.display="none";
        det.style.display="block";
    });

    bac.addEventListener('click', function(){
        oth.style.display="block";
        det.style.display="none";
    });
};

$("#menu").on("click", function() {
    $("#list").fadeIn(1000);
});
$("#back").on("click", function() {
    $("list").fadeOut(1000);
});

$(function(){
    setInterval(function(){
        $(".pan").animate({"top":"-200px"}, function(){
        $(".pan").css({"top":"0px"}).append($(".pan>li:first-child"));
        });
    }, 1750);
});

let color_arr = ["#F0EE5E", "#F0CF68", "#F0975A", "#F08B83", "#F08ED8", "#D6A1F0", "#A2ADF0", "#94C5F0", "#81EAF0", "#8AF0C0", "#76F08B", "#B1F07C"];
let index=0;
$(function(){
    setInterval(function(){
        if((index) > color_arr.length){index=0;}	
        $("#titlename").css("color",color_arr[index++])
        $("#bar").css("background-color",color_arr[index++])
    }, 1750);
});

window.onload = function(){
    let ru = document.getElementById("run");
    let emab = document.getElementById("email_back");
    let ema = document.getElementById("email");

    let sen = document.getElementById("send");

    ru.addEventListener('click', function(){
        emab.style.display="block";
        ema.style.display="block";
    });

    emab.addEventListener('click', function(){
        emab.style.display="none";
        ema.style.display="none";
    });

    sen.addEventListener('click', function(){
        alert("이메일이 전송되었습니다");
        emab.style.display="none";
        ema.style.display="none";
    });
};