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
	$("#input_info02").blur(function() {
		var id = $("#input_info02").val();
		var idvalue = $('input[name="id"]').val();
		if (id.trim() === "") {
			$("#result").html("아이디를 입력해주세요.");
			$("#result").css("color", "#FF4343");
			$("#result").css("font-size", "15px");
			$("#result").css("text-align", "right");
			$("#result").css("margin-left", "250px");
			$('input[name="id"]').css('border', '5px solid #FF4343');
			$('input[name="id"]').css('margin-bottom', '10px');
		} else if (id.length < 6 || id.length > 16) {
			$("#result").html("아이디는 6글자에서 16글자 사이로 입력해주세요.");
			$("#result").css("color", "#FF4343");
			$("#result").css("font-size", "15px");
			$("#result").css("text-align", "right");
			$("#result").css("margin-left", "250px");
			$('input[name="id"]').css('border', '5px solid #FF4343');
			$('input[name="id"]').css('margin-bottom', '10px');
		} else if (!/^[a-zA-Z0-9]+$/.test(id)) {
			$("#result").html("아이디는 영문 대소문자와 숫자만 입력 가능합니다.");
			$("#result").css("color", "#FF4343");
			$("#result").css("font-size", "15px");
			$("#result").css("text-align", "right");
			$("#result").css("margin-left", "250px");
			$('input[name="id"]').css('border', '5px solid #FF4343');
			$('input[name="id"]').css('margin-bottom', '10px');
		} else {
			$.ajax({
				type : "POST",
				url : "./company_check.jsp",
				data : {
					id : id
				},
				success : function(jj) {
					var data = jj.trim();
					console.log(data);
					if (data === "true") {
						$("#result").html("사용가능한 아이디입니다.");
						$("#result").css("color", "#1E6CFF");
						$("#result").css("font-size", "15px");
						$("#result").css("text-align", "right");
						$("#result").css("margin-left", "250px");
						$('input[name="id"]').css('border', '5px solid #1E6CFF');
						$('input[name="id"]').css('margin-bottom', '10px');
					} else if (data === "false") {
						$("#result").html("중복된 아이디입니다. 다시 수정해주세요");
						$("#result").css("color", "#FF4343");
						$("#result").css("font-size", "15px");
						$("#result").css("text-align", "right");
						$("#result").css("margin-left", "250px");
						$('input[name="id"]').css('border', '5px solid #FF4343');
						$('input[name="id"]').css('margin-bottom', '10px');
					}
				}
			});
		}
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

function checkPW() {
	var pw = document.forms["form"]["pw"].value;
	var pwcheck = document.forms["form"]["pwcheck"].value; // === 연산자는 값 뿐만 아니라
															// 데이터 형식까지
	var check_pw = document.getElementById('check_pw');
	var text_pw = document.getElementsByName('pw');
	var text_pw2 = document.getElementsByName('pwcheck');
	if (pw.length < 8 || pw.length > 32) {
		check_pw.innerHTML = '비밀번호는 8글자 이상, 32글자 이하만 이용 가능합니다.';
		check_pw.style.color = '#FF4343';
		check_pw.style.fontSize = '15px';
		check_pw.style.textAlign = 'right';
		text_pw[0].style.border = '5px solid #FF4343';
		text_pw2[0].style.border = '5px solid #FF4343';
		
		return;
	}
	if (pw === pwcheck) { // 엄격하게 비교하므로 예기치 않은 형변환을 방지하고 정확한 비교를 수행합니다.
		check_pw.innerHTML = '비밀번호가 일치합니다.';
		check_pw.style.color = '#1E6CFF';
		check_pw.style.fontSize = '15px';
		check_pw.style.textAlign = 'right';
		text_pw[0].style.border = '5px solid #1E6CFF';
		text_pw2[0].style.border = '5px solid #1E6CFF';

	} else {
		check_pw.innerHTML = '비밀번호가 일치하지 않습니다.';
		check_pw.style.color = '#FF4343';
		check_pw.style.fontSize = '15px';
		check_pw.style.textAlign = 'right';
		text_pw[0].style.border = '5px solid #FF4343';
		text_pw2[0].style.border = '5px solid #FF4343';
		
		return;
	}
	if(pw.length < 1 && pwcheck.length < 1) {
		check_pw.innerHTML = '비밀번호 또는 비밀번호 확인을 입력해주세요.';
		check_pw.style.color = '#FF4343';
		check_pw.style.fontSize = '15px';
		check_pw.style.textAlign = 'right';
		text_pw[0].style.border = '5px solid #FF4343';
		text_pw2[0].style.border = '5px solid #FF4343';
		return;
	
	}
}
function checkComName() {
	var name = document.forms["form"]["company_name"].value;
	var check_comname = document.getElementById('check_comname');
	var text_comname = document.getElementsByName('company_name');
	if (name.length < 1) {
		check_comname.innerHTML = '회사명을 입력해주세요.';
		check_comname.style.color = '#FF4343';
		check_comname.style.fontSize = '15px';
		check_comname.style.textAlign = 'right';
		text_comname[0].style.border = '5px solid #FF4343';
		return;
	} else {
		check_comname.innerHTML = '';
		text_comname[0].style.border = '5px solid #1E6CFF';
	}
	console.log(name);
	console.log(check_name);
}
function checkName() {
	var name = document.forms["form"]["company_person"].value;
	var check_name = document.getElementById('check_name');
	var text_name = document.getElementsByName('company_person');
	if (name.length < 1) {
		check_name.innerHTML = '담당자 이름을 입력해주세요.';
		check_name.style.color = '#FF4343';
		check_name.style.fontSize = '15px';
		check_name.style.textAlign = 'right';
		text_name[0].style.border = '5px solid #FF4343';
		return;
	} else {
		check_name.innerHTML = '';
		text_name[0].style.border = '5px solid #1E6CFF';
	}
	console.log(name);
	console.log(check_name);
}
function checkPhone() {
	var phone = document.getElementsByName('company_phone')[0].value;
	var check_phone = document.getElementById('check_phone');
	var text_phone = document.getElementsByName('company_phone');
	if (phone.length < 1) {
		check_phone.innerHTML = '담당자 전화번호를 입력해주세요.';
		check_phone.style.color = '#FF4343';
		check_phone.style.fontSize = '15px';
		check_phone.style.textAlign = 'right';
		text_phone[0].style.border = '5px solid #FF4343';
		return;
	} else {
		check_phone.innerHTML = '';
		text_phone[0].style.border = '5px solid #1E6CFF';
	}
}
function checkEmail() {
	var email = document.getElementsByName('company_email')[0].value;
	var check_email = document.getElementById('check_email');
	var text_email = document.getElementsByName('company_email');
	if (email.length < 1) {
		check_email.innerHTML = '이메일을 입력해주세요.';
		check_email.style.color = '#FF4343';
		check_email.style.fontSize = '15px';
		check_email.style.textAlign = 'right';
		text_email[0].style.border = '5px solid #FF4343';
		return;
	} else {
		check_email.innerHTML = '';
		text_email[0].style.border = '5px solid #1E6CFF';
	}
}
function checkNumber() {
	var number = document.getElementsByName('company_number')[0].value;
	var check_number = document.getElementById('check_number');
	var text_number = document.getElementsByName('company_number');
	if (number.length < 1) {
		check_number.innerHTML = '사업자/법인번호를 입력해주세요.';
		check_number.style.color = '#FF4343';
		check_number.style.fontSize = '15px';
		check_number.style.textAlign = 'right';
		text_number[0].style.border = '5px solid #FF4343';
		return;
	} else {
		check_number.innerHTML = '';
		text_number[0].style.border = '5px solid #1E6CFF';
	}
}
function checkForm() {
	var id = document.forms["form"]["id"].value;
	var pw = document.forms["form"]["pw"].value;
	var pwcheck = document.forms["form"]["pwcheck"].value;
	var comname = document.forms["form"]["company_name"].value;
	var name = document.forms["form"]["company_person"].value;
	var phone = document.forms["form"]["company_phone"].value;
	var email = document.forms["form"]["company_email"].value;
	var number = document.forms["form"]["company_number"].value;

	if (id === "") {
		alert("아이디를 입력해주세요.");
		return false;
	}
	if (pw === "") {
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	if (pwcheck === "") {
		alert("비밀번호 확인을 입력해주세요.");
		return false;
	}
	if (comname === "") {
		alert("회사명을 입력해주세요.")
		return false;
	}
	if (name === "") {
		alert("담당자 이름을 입력해주세요.");
		return false;
	}
	if (phone === "") {
		alert("담당자 번호 입력해주세요.");
		return false;
	}
	if (email === "") {
		alert("담당자 이메일을 입력해주세요.");
		return false;
	}
	if (number === "") {
		alert("사업자/법인번호를 입력해주세요.");
		return false;
	}
	// 모든 조건을 통과하면 폼을 제출
	return true;
}