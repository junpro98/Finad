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
    ClassicEditor.create(document.querySelector('#editor'), {
        // CKEditor 구성 옵션 설정
    	
    })
    .then(editor => {
        // CKEditor가 생성되면 할당된 편집기 인스턴스에 대한 작업을 수행할 수 있습니다.
        console.log('CKEditor가 성공적으로 생성되었습니다.');
    })
    .catch(error => {
        console.error('CKEditor 생성 중 오류가 발생했습니다:', error);
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

function check_name() {
    var name = document.getElementById("input_name").value.trim();
    var text = document.getElementById("editor").value.trim();
    if (name === "") {
        alert("제목을 입력해주세요.");
        return false;
    }
    if (text === "") {
        alert("내용을 입력해주세요.");
        return false;
    }
    return true;
}
