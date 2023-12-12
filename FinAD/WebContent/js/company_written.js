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

    let i = 1;
    let func1 = setInterval(function() {
        if(i < 73) {
            color1(i);
            i++
        } else if(i < 101) {
            color2(i);
            i++
        } else {
            clearInterval(func1);
        }
    },10);

    let j =1;
    let func2 = setInterval(function() {
        if(j < 11) {
            color3(j);
            j++
        } else if(j < 61) {
            color4(j);
            j++
        } else if(j < 90) {
            color5(j);
            j++
        } else if(j < 98) {
            color6(j);
            j++
        } else if(j < 101) {
            color7(j);
        } else {
            clearInterval(func2);
        }
    },10);
});

function color1(i) {
    $(".donut").css({
        "background":"conic-gradient(#FF766B 0% "+i+"%, #ffffff "+i+"% 100%)"
    });
}

function color2(i) {
    $(".donut").css({
        "background":"conic-gradient(#FF766B 0% 73%, #014D81 "+i+"% 100%)"
    })
}

function color3(j) {
    $(".donut01").css({
        "background":"conic-gradient(#FF766B 0% "+j+"%, #ffffff "+j+"% 100%)"
    });
}

function color4(j) {
    $(".donut01").css({
        "background":"conic-gradient(#FF766B 0% 10%, #014D81 10% "+j+"%, #ffffff "+j+"% 100%)"
    });
}

function color5(j) {
    $(".donut01").css({
        "background":"conic-gradient(#FF766B 0% 10%, #014D81 10% 60%, #cfca2b 60% "+j+"%, #ffffff "+j+"% 100%)"
    });
}

function color6(j) {
    $(".donut01").css({
        "background":"conic-gradient(#FF766B 0% 10%, #014D81 10% 60%, #cfca2b 60% 89%, #43b368 89% "+j+"% , #ffffff "+j+"% 100%)"
    });
}

function color7(j) {
    $(".donut01").css({
        "background":"conic-gradient(#FF766B 0% 10%, #014D81 10% 60%, #cfca2b 60% 89%, #43b368 89% 97% , #a351d3 "+j+"% 100%)"
    });
}
window.onload = function() {
    const ctx = document.querySelector(".line_canvas");
    const line_canvas = new Chart(ctx, {
        type: 'line',
        data: {
            labels:['30일전','25일전','20일전','15일전','10일전','1일전'],
            datasets: [{
                label: '최근 30일 조회수',
                data: [271300,348000,297000,317000,210000,379000],
                borderColor: ['#014D81'],
                borderWidth:1
            }]
        },
        options: {
            scales: {
                y:{
                    beginAtZero:true
                }
            }
        }
    });
    

    const ctx2 = document.querySelector(".line_canvas01");
    const line_canvas01 = new Chart(ctx2, {
        type: 'line',
        data: {
            labels:['30일전','25일전','20일전','15일전','10일전','1일전'],
            datasets: [{
                label: '최근 30일 구독자수',
                data: [2010000,2020000,2030000,2040000,2050000,2060000],
                borderColor: ['#FF766B'],
                borderWidth:1
            }]
        }
    })
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