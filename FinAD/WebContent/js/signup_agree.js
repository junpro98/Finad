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

window.onload = function all_check() {
    let che_all = document.querySelector("#check");
    let all01 = document.querySelectorAll(".check_01");

    che_all.onclick = function() {
        if(che_all.checked == true) {
            for(let che_all of all01) {
                che_all.checked = true;
            }
        } else {
            for(let che_all of all01) {
                che_all.checked = false;
            }
        }
    }
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
function hideBtn1(){
	$('#check_agree_alert1').hide();
}
//
function agreeCheck1() {
    // 이용약관1, 이용약관2, 이용약관3 모두 동의한 경우에만 페이지 이동
    if ($("#check_agree1").is(":checked") && $("#check_agree2").is(":checked") && $("#check_agree3").is(":checked")) {
        window.location.href = 'sign_nomal.jsp';
    } else {
        alert("모든 필수 약관에 동의해 주세요.");
    }
}

function agreeCheck2() {
    if ($("#check_agree1").is(":checked") && $("#check_agree2").is(":checked") && $("#check_agree3").is(":checked")) {
        window.location.href = 'sign_influencer.jsp';
    } else {
        alert("모든 필수 약관에 동의해 주세요.");
    }
}

function agreeCheck3() {
    if ($("#check_agree1").is(":checked") && $("#check_agree2").is(":checked") && $("#check_agree3").is(":checked")) {
        window.location.href = 'sign_company.jsp';
    } else {
        alert("모든 필수 약관에 동의해 주세요.");
    }
}




