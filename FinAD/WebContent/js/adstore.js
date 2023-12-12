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
});



//var slideIndex = 0;
//showSlides();

function showSlides() {
//    var i;
//    var slides = document.getElementsByClassName("mySlides");
//   
//    for (i = 0; i < slides.length; i++) {
//        slides[i].style.display = "none";
//    }
//    slideIndex++;
//    if (slideIndex > slides.length) {
//        slideIndex = 1
//    }
//    slides[slideIndex - 1].style.display = "block";
//
//    setTimeout(showSlides, 2000); // 2초마다 이미지가 체인지됩니다
}



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



setInterval(function(){
    $('.right_div_div > ul').delay(2500);
    $('.right_div_div > ul').animate({marginLeft: "-630px"})
    $('.right_div_div > ul').delay(2500);
    $('.right_div_div > ul').animate({marginLeft: "-1260px"})
    $('.right_div_div > ul').delay(2500);
    $('.right_div_div > ul').animate({marginLeft: "0px"})
});


setInterval(function() {
	$(".Slidesbackground").delay(4000);
	$(".Slidesbackground").animate({marginLeft:"-1300px"})
	$(".Slidesbackground").delay(4000);
	$(".Slidesbackground").animate({marginLeft:"-2600px"})
	$(".Slidesbackground").delay(4000);
	$(".Slidesbackground").animate({marginLeft:"-3900px"})
	$(".Slidesbackground").delay(4000);
	$(".Slidesbackground").animate({marginLeft:"-5200px"})
	$(".Slidesbackground").delay(4000);
	$(".Slidesbackground").animate({marginLeft:"-6500px"})
	$(".Slidesbackground").delay(4000);
	$(".Slidesbackground").animate({marginLeft:"-7800px"})
	$(".Slidesbackground").delay(4000);
	$(".Slidesbackground").animate({marginLeft:"-9100px"})
	$(".Slidesbackground").delay(4000);
	$(".Slidesbackground").animate({marginLeft:"0px"})
});




