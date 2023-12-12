$(document).ready(function () {
    $(".gnb").hide();
    $(".gnbbox").hide();
    $(".img_info02").hide();
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

setInterval(function () {
    $(".pra_ul").delay(4000);
    $(".pra_ul").animate({ marginLeft: "-1300px" });
    $(".pra_ul").delay(4000);
    $(".pra_ul").animate({ marginLeft: "-2600px" });
    $(".pra_ul").delay(4000);
    $(".pra_ul").animate({ marginLeft: "0px" });
});