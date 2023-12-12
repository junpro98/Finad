$(document).ready(function () {
    $(".gnb").hide();
    $(".gnbbox").hide();
    $(".img_info02").hide();
    $(".info_ul").hide();
    $(".category_text").mouseenter(function () {
        $(".gnb").stop().slideDown();
        $(".gnbbox").stop().slideDown();
    });
    $(".category_div").mouseleave(function () {
        $(".gnb").stop().slideUp();
        $(".gnbbox").stop().slideUp();
    });
    $(".img_info_main").mouseenter(function () {
        $(".img_info02").stop().slideDown();
    });
    $("#showInfo").click(function() {
    	 $(".info_ul").show();
    	 $(this).hide();
	});
    $('.count-num').each(function() { 
    	  var $this = $(this),
    	      countTo = $this.attr('data-count');
    	  $({ countNum: $this.text()}).animate({
    	    countNum: countTo 
    	  },
    	  {
    	    duration: 2000, 
    	    easing:'linear',
    	    step: function() {
    	      $this.text(Math.floor(this.countNum));
    	    },
    	    complete: function() { 
    	    	$this.text(this.countNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
    	    }
    	  });  
    });
});


function zoomIn(event) {
    event.target.style.transform = "scale(1.2)";
    event.target.style.zIndex = "1";
    event.target.style.transition = "all 0.5s";
}

function zoomOut(event) {
    event.target.style.transform = "scale(1)";
    event.target.style.zIndex = 0;
    event.target.style.transition = "all 0.5s"
}


function showPopup() {
	var id = document.querySelector("#hidden_id").value;
	console.log(id);
	window.open("volunCompany.finad23?id=" + id + "", "광고진행사항","width=500, height=400, left=100, top=50");
}

