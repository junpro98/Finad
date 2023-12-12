<%@page import="com.finad23.DTO.CompanyUserMypageDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.finad23.DTO.CompanyUserDTO" %>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>company_board_write.jsp</title>
<link rel="stylesheet" href="css/company_board_write.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script type="text/javascript"
	src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script type="text/javascript" src="js/company_board_write.js"></script>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		String password = (String) session.getAttribute("password");
		String type = (String) session.getAttribute("type");
		
		List<CompanyUserMypageDTO> list = (List<CompanyUserMypageDTO>) request.getAttribute("List");
		CompanyUserMypageDTO CUserDTO = null;
		for (CompanyUserMypageDTO selected : list) {
			if (selected.getCompanyId().equals(id)) {
				CUserDTO = selected;
				break;
			}
		}
		
		
		
		if (id == null && password == null) {
	%>
	<jsp:include page="header_login.jsp"></jsp:include>
	<%
		} else {
	%>
	<jsp:include page="header_logout.jsp"></jsp:include>
	<%
		}
	%>
<!-- 		기업 회원만 작성 가능 하게 하는 조건문 [테스트를 위해 주석 처리] -->
<!-- 		기업 회원만 작성 가능 하게 하는 조건문 [테스트를 위해 주석 처리] -->
			<%if(type==null || !type.equals("company")){%>
			<script>alert("권한이 없습니다")</script>
			<%return;
			}%> 

	<div id="write_container">
		<form action="company_board_write.finad?url=CBoardWrited" method="post" accept-charset="UTF-8">
			<table border="1">
				<tr>
					<td class="title">제목</td>
					<td class="content" colspan="3"><input type="text" name="title" id="content_title"></td>
				</tr>
				<tr>
					<td class="title">회사명</td>
					<td class="content" colspan="3"><%=CUserDTO.getCompanyName() %><input type="hidden" name="companyName" value="<%= CUserDTO.getCompanyName()%>"></td>
				</tr>
				<tr>
					<td class="title" rowspan="3">마케팅 담당자 정보</td>
					<td class="content" colspan="3"><%=CUserDTO.getName() %><input type="hidden" name="companyInfo1" value="<%=CUserDTO.getName()%>" ></td>
				</tr>
				<tr>
					<td class="content" colspan="3"><%=CUserDTO.geteMail() %><input type="hidden" name="companyInfo2" value="<%=CUserDTO.geteMail()%>" ></td>
				</tr>
				<tr>
					<td class="content" colspan="3"><%=CUserDTO.getTelephoneNumber() %><input type="hidden" name="companyInfo3" value="<%=CUserDTO.getTelephoneNumber()%>" ></td>
				</tr>
				<tr>
					<td class="title">모집 기간</td>
					<td class="content2" colspan="1">
						<input type="date" class="write_date" max="2100-12-31" min="2023-11-21" name="recruitmentDate1" value="2023-11-21"> ~ 
						<input type="date" class="write_date" max="2100-12-31" min="2023-11-21" name="recruitmentDate2" value="2023-11-21">
					</td>
					<td class="title">홍보 기간</td>
					<td class="content2" colspan="1"><input type="date" class="write_date" max="2100-12-31" min="2023-11-21" name="promotionDate1" value="2023-11-21"> ~ 
						<input type="date" class="write_date" max="2100-12-31" min="2023-11-21" name="promotionDate2" value="2023-11-21">
					</td>
				</tr>
				<tr>
					<td class="title">모집 인원</td>
					<td class="content3"><input type="text" name="recruitmentNum"><span> 명</span></td>
					<td class="title">성별</td>
					<td class="content2">
						<div class="write_text">
							<input type="radio" name="sex" value="남">남성 
							<input type="radio" name="sex" value="여">여성
							<input type="radio" name="sex" value="무관">무관
						</div>
					</td>
				</tr>
				<tr>
					<td class="title">평균 시청자</td>
					<td class="content3"><input type="text" name="avgViewers"><span> 명</span></td>
					<td class="title">구독자 수</td>
					<td class="content3"><input type="text" name="subscribers"><span> 만명</span></td>
				</tr>
				<tr>
					<td class="title">미달자 지원</td>
					<td class="content2">
						<input type="radio" name="underachiever" value="O">O 
						<input type="radio" name="underachiever" value="X">X
					</td>
					<td class="title">총 광고진행비</td>
					<td class="content3"><input type="text" name="promotionMoney"><span> 만원</span></td>
				</tr>
				<tr>
					<td class="title">광고 유형</td>
					<td class="content2" colspan="3">
						<input type="checkbox" name="promotionType" value="생방송"> 생방송 
						<input type="checkbox" name="promotionType" value="유튜브 리뷰"> 유튜브 리뷰 
						<input type="checkbox" name="promotionType" value="유튜브 컨텐츠"> 유튜브 콘텐츠 
						<input type="checkbox" name="promotionType" value="홍보모델"> 홍보모델 
						<input type="checkbox" name="promotionType" value="홍보배너"> 홍보배너 
						<input type="checkbox" name="promotionType" value="CF"> CF 
						<input type="checkbox" name="promotionType" value="기타"> 기타
					</td>
				</tr>
				<tr>
					<td class="title" rowspan="3">이전 광고 사례</td>
					<td class="content" colspan="3"><%=CUserDTO.getPreviousAdvertising1() %><input type="hidden" name="previousPromotion1" value="<%=CUserDTO.getPreviousAdvertising1()%>" ></td> 
				</tr>
				<tr>
					<td class="content" colspan="3"><%=CUserDTO.getPreviousAdvertising2() %><input type="hidden" name="previousPromotion2" value="<%=CUserDTO.getPreviousAdvertising2()%>" ></td>
				</tr>
				<tr>
					<td class="content" colspan="3"><%=CUserDTO.getPreviousAdvertising3() %><input type="hidden" name="previousPromotion3" value="<%=CUserDTO.getPreviousAdvertising3()%>" ></td>
				</tr>
				<tr>
					<td colspan="6"><textarea name="input_text" name="text" id="editor"></textarea></td>
				</tr>

			</table>
			<input type="hidden" name="companyId" value="<%= CUserDTO.getCompanyId() %>">
			<input type="submit" id="submit_btn" value="완료">
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>