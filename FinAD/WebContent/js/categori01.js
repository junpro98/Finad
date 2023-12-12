$(document).ready(function () {
    $(".gnb").hide();
    $(".gnbbox").hide();
    $(".category_text").mouseenter(function () {
        $(".gnb").stop().slideDown();
        $(".gnbbox").stop().slideDown();
    });
    $(".category_div").mouseleave(function () {
        $(".gnb").stop().slideUp();
        $(".gnbbox").stop().slideUp();
    });
    $(".check_sub").on("click",function() {
    	
        var shorts = document.querySelector(".shorts").value;
        var sub = document.querySelector(".sub").value;
        var price = document.querySelector(".price_select").value;
        var avg = document.querySelector(".avg_select").value;
        var offer = document.querySelector(".offer").value;

        var urlParams = new URLSearchParams(window.location.search);
        var category = urlParams.get("url");
      $.ajax({
      type: "POST",
      url: "category.finad?url=" + category + "&cat=" + category + "&filter=true",
      data: {
          shorts: shorts,
          sub: sub,
          price: price,
          avg: avg,
          offer: offer
      },
      success: function(response) {
    	  $(".list_01.asdf").remove();
    	  var res = $(response).find(".list_01");
    	  $("#list_01_wrapper").append(res);
    	  $(".rank_li02").remove();

      },
      error: function(error) {
      	console.log("실패");
      }
    });
   });
   $("#star_btn").on("click",function() {
 var nickname = document.querySelector(".hidden_name").value;
 var id = document.querySelector(".hidden_id").value;
	  $.ajax({
		  type:"POST",
		  url:"creatorLike.finad23",
		  data: {
			  id: id,
			  nickname: nickname
		  },
		  success: function(response) {
			  $("#star01").remove();
			  var like = $(response).find(".list_01_div01");
			  $("#star_btn").append(response);
			  console.log("성공");
		  },
		  error: function(error) {
			  console.log("실패");
		  }
	  });
   });
   
});

window.onload = function all_check() {
    let che_all = document.querySelector("#check");
    let all01 = document.querySelectorAll(".list_check");
    che_all.onclick = function() {
        if (che_all.checked == true) {
            for (let che_all of all01) {
                che_all.checked = true;
            }
        } else {
            for (let che_all of all01) {
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
