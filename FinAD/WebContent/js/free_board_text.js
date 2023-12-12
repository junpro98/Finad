$(document).ready(function() {
	var view;
	
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

function like(boardId) {
    // 클릭한 게시물의 ID를 서버로 전송하여 추천수 증가 요청을 보냅니다.
    $.ajax({
        type: "POST",
        url: "update_like.jsp", // 현재 페이지로 요청을 보냅니다.
        data: { boardId: boardId },
        success: function (response) {
        	var result = response.trim();
            if (result === "success") {
                // 조회수 증가에 성공한 경우, 화면에도 증가된 추천수를 반영합니다.
                view++;
                $("#viewCount").text(view);
            } else if(result === "fail"){
                alert("추천수 증가에 실패했습니다.");
            }
        },
        error: function () {
            alert(boardId);
        }
    });
}

function reLike(boardId) {
    // 클릭한 게시물의 ID를 서버로 전송하여 추천수 감소 요청을 보냅니다.
    $.ajax({
        type: "POST",
        url: "update_relike.jsp", // 현재 페이지로 요청을 보냅니다.
        data: { boardId: boardId },
        success: function (response) {
        	var result = response.trim();
            if (result === "success") {
                // 추천수 감소에 성공한 경우, 화면에도 증가된 추천수를 반영합니다.
                view++;
                $("#viewCount").text(view);
            } else if(result === "fail"){
                alert("추천수 감소에 실패했습니다.");
            }
        },
        error: function () {
            alert(boardId);
        }
    });
}


function likeButton(boardId) {
    let likeImg = document.getElementById('like_img');
    if (likeImg.src.endsWith('img/d.png')) {
        likeImg.src = 'img/d_clicked.png?timestamp=' + new Date().getTime();
        likeImg.alt = '추천됨';
        like(boardId);
        window.location.href = "free_board_like.jsp?number=" + boardId;
    }
}
function relikeButton(boardId){
	let likeImg = document.getElementById('like_img');
	if (likeImg.src.endsWith('img/d_clicked.png')) {
	    likeImg.src = 'img/d.png';
	    likeImg.alt = '추천';
	   	reLike(boardId);
	   	window.location.href = "free_board_relike.jsp?number="+boardId; 
	    
	}
}

function checkComment() {
    var inputComment = document.getElementById('input_comment').value.trim();
    
    if(inputComment === "") {
        alert("댓글을 작성해 주세요.");
        return false; // 폼 제출을 막습니다.
    }
    
    return true; // 폼 제출을 계속합니다.
}

function check() {
	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
	    return true;
	 }else{   //취소
	     return false;

	 }
}

