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
function resetSearch() {
        document.getElementById('search_input').value = '';
        
     // 체크된 카테고리 해제
        var categoryCheckboxes = document.getElementsByName("category");
        for (var i = 0; i < categoryCheckboxes.length; i++) {
            categoryCheckboxes[i].checked = false;
        }

        // 체크된 타입 해제
        var typeCheckboxes = document.getElementsByName("type");
        for (var i = 0; i < typeCheckboxes.length; i++) {
            typeCheckboxes[i].checked = false;
        }

        // 체크된 기간 해제
        var durationCheckboxes = document.getElementsByName("duration");
        for (var i = 0; i < durationCheckboxes.length; i++) {
            durationCheckboxes[i].checked = false;
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

//function search() {
//	var type = [];
//	var duration = [];
//	var category = [];
//	
//	 $('input:checkbox[name=type]').each(function () {
//	        if($(this).is(":checked")==true){
//	        	type.push(this.value);
//	        }
//	    });
//	 $('input:checkbox[name=duration]').each(function () {
//	        if($(this).is(":checked")==true){
//	        	duration.push(this.value);
//	        }
//	    });
//	 $('input:checkbox[name=category]').each(function () {
//	        if($(this).is(":checked")==true){
//	        	category.push(this.value);
//	        }
//	    });
//	 var search = document.getElementById("search_input").value;
//	 
//	 $.ajax({
//		    url: 'CBoardSearch',
//		    type: 'GET',
//		    data: {
//	            type: type,
//	            duration: duration,
//	            category: category,
//	            search: search
//	        },
//		    success: function(data) {
//		        // 서버로부터 받은 데이터를 이용하여 할 일
//		    	
//		        console.log(data);
//		    },
//		    error: function(error) {
//		        // 에러 처리
////		        console.error('Error:', error);
//		    	console.log(data);
//		    }
//		});
//
//	
//	
//}

//검색 버튼 클릭 시 호출되는 함수
//function search() {
// // 체크된 체크박스 값을 가져와서 검색 쿼리를 생성
// var selectedFilters = [];
// 
// // 홍보 종류 필터
// var promotionTypes = document.querySelectorAll('input[name="type"]:checked');
// for (var i = 0; i < promotionTypes.length; i++) {
//     selectedFilters.push(promotionTypes[i].value);
// }
// 
// // 홍보 기간 필터
// var promotionDurations = document.querySelectorAll('input[name="duration"]:checked');
// for (var i = 0; i < promotionDurations.length; i++) {
//     selectedFilters.push(promotionDurations[i].value);
// }
// 
// // 카테고리 필터
// var categories = document.querySelectorAll('input[name="category"]:checked');
// for (var i = 0; i < categories.length; i++) {
//     selectedFilters.push(categories[i].value);
// }
// 
// // 검색어 입력란 값 가져오기
// var query = document.getElementById("search_input").value;
// 
// // 서버로 검색 쿼리를 보냄
// sendSearchQuery(selectedFilters, query);
//}
// 
////검색 쿼리를 서버로 보내는 함수
//function sendSearchQuery(filters, query) {
// // AJAX를 사용하여 서버로 검색 쿼리를 전송
// // jQuery를 사용한 예시
// $.ajax({
//     type: "GET",
//     url: "company_board.jsp", // 검색 요청을 처리하는 서블릿 주소로 변경
//     data: {
//         filters: filters,
//         query: query
//     },
//     success: function (data) {
//         // 검색 결과를 받아와서 페이지에 표시
//         // 이 부분을 적절히 수정하여 검색 결과를 표시하도록 구현
//         console.log("검색 결과:", data);
//     },
//     error: function (error) {
//         console.error("검색 오류:", error);
//     }
// });
//}
