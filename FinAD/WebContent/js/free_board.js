$(document).ready(function() {
	var view=0;
	
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

function views(boardId) {
    // 클릭한 게시물의 ID를 서버로 전송하여 조회수 증가 요청을 보냅니다.
    $.ajax({
        type: "POST",
        url: "update_views.jsp", // 현재 페이지로 요청을 보냅니다.
        data: { boardId: boardId },
        success: function (response) {
        	var result = response.trim();
            if (result === "success") {
                // 조회수 증가에 성공한 경우, 화면에도 증가된 조회수를 반영합니다.
                view++;
                $("#viewCount").text(view);
            } else if(result === "fail"){
                alert("조회수 증가에 실패했습니다.");
            }
        },
        error: function () {
            alert(boardId);
        }
    });
}

