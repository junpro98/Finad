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
				url : "./influ_check.jsp",
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

function addr_btn() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
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
function checkName() {
	var name = document.forms["form"]["name"].value;
	var check_name = document.getElementById('check_name');
	var text_name = document.getElementsByName('name');
	if (name.length < 1) {
		check_name.innerHTML = '이름을 입력해주세요.';
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
function checkSex() {
	var genderOptions = document.getElementsByName("gender");
	var genderSelected = false;
	var check_sex = document.getElementById('check_sex');

	for (var i = 0; i < genderOptions.length; i++) {
		if (genderOptions[i].checked) {
			genderSelected = true;
			break;
		}
	}

	if (!genderSelected) {
		check_sex.innerHTML = "성별을 선택해주세요.";
		check_sex.style.color = '#FF4343';
		check_sex.style.fontSize = '15px';
		check_sex.style.textAlign = 'right';
		return;
	} else {
		check_sex.innerHTML = "";
	}
}
function checkNickName() {
	var nickname = document.forms["form"]["nickname"].value;
	var check_nickname = document.getElementById('check_nickname');
	var text_nickname = document.getElementsByName('nickname');
	if (name.length < 1) {
		check_nickname.innerHTML = '활동명을 입력해주세요.';
		check_nickname.style.color = '#FF4343';
		check_nickname.style.fontSize = '15px';
		check_nickname.style.textAlign = 'right';
		text_nickname[0].style.border = '5px solid #FF4343';
		return;
	} else {
		check_name.innerHTML = '';
		text_nickname[0].style.border = '5px solid #1E6CFF';
	}
}
function checkAddr() {
	var addr1 = document.getElementsByName('post')[0].value;
	var addr2 = document.getElementsByName('addr')[0].value;
	var addr3 = document.getElementsByName('addr_more')[0].value;
	var check_addr = document.getElementById('check_addr');
	var text_addr1 = document.getElementsByName('post');
	var text_addr2 = document.getElementsByName('addr');
	var text_addr3 = document.getElementsByName('addr_more');
	var text_addr4= document.getElementsByName('reference');
	if (addr1.length < 1 || addr2.length < 1 || addr3.length < 1) {
		check_addr.innerHTML = '주소를 입력해주세요.';
		check_addr.style.color = '#FF4343';
		check_addr.style.fontSize = '15px';
		check_addr.style.textAlign = 'right';
		text_addr1[0].style.border = '5px solid #FF4343';
		text_addr2[0].style.border = '5px solid #FF4343';
		text_addr3[0].style.border = '5px solid #FF4343';
		text_addr4[0].style.border = '5px solid #FF4343';
		return;
	} else {
		check_addr.innerHTML = '';
		text_addr1[0].style.border = '5px solid #1E6CFF';
		text_addr2[0].style.border = '5px solid #1E6CFF';
		text_addr3[0].style.border = '5px solid #1E6CFF';
		text_addr4[0].style.border = '5px solid #1E6CFF';
	}
}
function checkPhone() {
	var input_phone = document.forms["form"]["input_phone"].value;
//	var input_phone = document.getElementsByName('input_phone').value;
	var check_phone = document.getElementById('check_phone');
	var text_phone = document.getElementsByName('input_phone');
	if (input_phone.length < 1) {
		check_phone.innerHTML = '전화번호를 입력해주세요.';
		check_phone.style.color = '#FF4343';
		check_phone.style.fontSize = '15px';
		check_phone.style.textAlign = 'right';
		text_phone.style.border = '5px solid #FF4343';
		return;
	} else {
		check_phone.innerHTML = '';
		text_phone.style.border = '5px solid #1E6CFF';
	}
}
function checkEmail() {
	var email = document.forms["form"]["email"].value;
	var check_email = document.getElementById('check_email');
	var text_email = document.getElementsByName('email');
	if (email.length < 1) {
		check_email.innerHTML = '이메일을 입력해주세요.';
		check_email.style.color = '#FF4343';
		check_email.style.fontSize = '15px';
		check_email.style.textAlign = 'right';
		check_email.style.width = '150px';
		text_email[0].style.border = '5px solid #FF4343';
		return;
	} else {
		check_email.innerHTML = '';
		text_email[0].style.border = '5px solid #1E6CFF';
	}
}
function checkForm() {
	var id = document.forms["form"]["id"].value;
	var pw = document.forms["form"]["pw"].value;
	var pwcheck = document.forms["form"]["pwcheck"].value;
	var name = document.forms["form"]["name"].value;
	var gender = document.forms["form"]["gender"].value;
	var nickname = document.forms["form"]["nickname"].value;
	var post = document.forms["form"]["post"].value;
	var addr = document.forms["form"]["addr"].value;
	var addr_more = document.forms["form"]["addr_more"].value;
	var reference = document.forms["form"]["reference"].value;
	var phone = document.forms["form"]["input_phone"].value;
	var email = document.forms["form"]["email"].value;
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
	if (name === "") {
		alert("이름을 입력해주세요.");
		return false;
	}
	if (gender === "") {
		alert("성별을 선택해주세요.");
		return false;
	}
	if (post === "" || addr === "" || addr_more === "" || reference === "") {
		alert("주소를 입력해주세요.");
		return false;
	}
	if (phone === "") {
		alert("휴대폰 번호를 입력해주세요.");
		return false;
	}
	if (email === "") {
		alert("이메일을 입력해주세요.");
		return false;
	}

	// 모든 조건을 통과하면 폼을 제출
	return true;
}