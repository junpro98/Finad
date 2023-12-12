$(document).ready(function() {
    $(".gnb").hide();
    $(".gnbbox").hide();
    $(".category_text").mouseenter(function() {
        $(".gnb").stop().slideDown();
        $(".gnbbox").stop().slideDown();
    });
    $(".category_div").mouseleave(function() {
        $(".gnb").stop().slideUp();
        $(".gnbbox").stop().slideUp();
    });
    $('.data_count').each(function() { 
  	  var $this = $(this),
  	      countTo = $this.attr('data-count');
  	  $({ countNum: $this.text()}).animate({
  	    countNum: countTo 
  	  },
  	  {
  	    duration: 500, 
  	    easing:'linear',
  	    step: function() {
  	      $this.text(Math.floor(this.countNum));
  	    },
  	    complete: function() { 
  	    	$this.text(this.countNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
  	    }
  	  });  
  });
    $('.avg_look_p2').each(function() { 
    	  var $this = $(this),
    	      countTo = $this.attr('data-count');
    	  $({ countNum: $this.text()}).animate({
    	    countNum: countTo 
    	  },
    	  {
    	    duration: 500, 
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