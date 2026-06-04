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

$(function(){
    $(".main>li").mouseover(function(){
        $(this).find(".sub").stop().fadeIn();
    });
    $(".main>li").mouseout(function(){
        $(this).find(".sub").stop().fadeOut();
    });
});
    
$(function(){
    setInterval(function(){
        $('.pan>li:first-child').fadeOut(1000).next().fadeIn(1000).end().appendTo('.pan');
    }, 1750);
});