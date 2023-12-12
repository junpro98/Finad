<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.finad23.DTO.AdstoreDTO"%>
<%@ page import="com.finad23.jjj.*"%>

<!DOCTYPE html>
<html lang="ko">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ADstore</title>
<link rel="stylesheet" href="css/adstore.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/adstore.js" type="text/javascript"></script>

</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		String password = (String) session.getAttribute("password");
		String type = (String) session.getAttribute("type");
		if (id == null && password == null) {
	%>
	<jsp:include page="adheader_login.jsp"></jsp:include>
	<%
		} else {
	%>
	<jsp:include page="adheader_logout.jsp"></jsp:include>
	<%
		}
	%>
	<%
		AdstoreDTO aa = new AdstoreDTO();
		Adstore adstorelist = new Adstore();
		ArrayList<AdstoreDTO> jjj = adstorelist.getAdstoreList();
	%>
	<div id="contain">
		<span class="slideshow-container">
			<div id="hhh">
				<div class="Slidesbackground">
					<div class="mySlides fade">
						<a href="sellpage.jsp"><img src="img/fashionban.jpg"
							class="slideshow-image"></a>
					</div>
					<div class="mySlides fade">
						<a href="sellpage.jsp"><img src="img/campban.jpg"
							class="slideshow-image"></a>
					</div>
					<div class="mySlides fade">
						<a href="sellpage.jsp"><img src="img/electroban.jpg"
							class="slideshow-image"></a>
					</div>
					<div class="mySlides fade">
						<a href="sellpage.jsp"><img src="img/beautyban.jpg"
							class="slideshow-image"></a>
					</div>
					<div class="mySlides fade">
						<a href="sellpage.jsp"><img src="img/foodban.jpg"
							class="slideshow-image"></a>
					</div>
					<div class="mySlides fade">
						<a href="sellpage.jsp"><img src="img/petban.jpg"
							class="slideshow-image"></a>
					</div>
					<div class="mySlides fade">
						<a href="sellpage.jsp"><img src="img/kidban.jpg"
							class="slideshow-image"></a>
					</div>
					<div class="mySlides fade">
						<a href="sellpage.jsp"><img src="img/healthban.jpg"
							class="slideshow-image"></a>
					</div>
				</div>
			</div>
		</span>

		<div class="advertising_type">
			<p class="advertising_type_p"></p>
			<ul class="advertising_ul">
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
					href="adcategory.finad?url=adbeauty"><img src="img/beautyicon.png" alt="뷰티">
						<p class="lil_p">뷰티</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
					href="adcategory.finad?url=adtravel"><img src="img/campicon.png" alt="여행">
						<p class="lil_p">여행</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)">
					<a href="adcategory.finad?url=adelectronic"> <img src="img/electroicon.png" alt="가전">
						<p class="lil_p">가전</p>
				</a>
				</li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
					href="adcategory.finad?url=adfashion"><img src="img/fashionicon.png" alt="패션">
						<p class="lil_p">패션</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
					href="adcategory.finad?url=adfood"><img src="img/foodicon.png" alt="식품">
						<p class="lil_p">식품</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
					href="adcategory.finad?url=adhealth"><img src="img/healthicon.png" alt="건강">
						<p class="lil_p">건강</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
					href="adcategory.finad?url=adkids"><img src="img/kidicon.png" alt="키즈">
						<p class="lil_p">키즈</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
					href="adcategory.finad?url=adpet"><img src="img/peticon.png" alt="애견">
						<p class="lil_p">애견</p> </a></li>
			</ul>
		</div>
<section>
		<h1 class="h1">오늘의 쇼핑 제안</h1>
		<div id="product-list">
			<%
            for (int i = 0; i < jjj.size(); i++) {
                AdstoreDTO product = jjj.get(i);
            %>
			<a href="adstore.finad?url=<%=product.getItemNumber() %>" target="_blank">
				<div class="product-card">
					<div>
						<img class="product-img" src="img/<%= product.getItemImage() %>"
							alt="">
					</div>
					<div class="product-contents">
						<span class="product-name"><%= product.getItemName() %></span> <span
							class="product-price"><%= product.getItemPrice() %>원</span>
						<div class="product-seller">
							<img class="product-avatar" 
								src="img/<%= product.getItemSeller() %>" /> <span><%= product.getItemInfo() %></span>
						</div>
					</div>
				</div>
			</a>
			<%
            }
            %>
		</div>
		</section>
		<div class="mm">
			<div class="right_div">
				<h1 id="ele">ADStore 가전관</h1>
				<div class="right_div_div">
					<ul>
						<li><a href=""><img src="img/zflip.png" alt=""></a></li>
						<li><a href=""><img src="img/lg_go.png" alt=""></a></li>
						<li><a href=""><img src="img/macbook.png" alt=""></a></li>
					</ul>
				</div>
			</div>


			<div class="left_div">
				<h1 id="fash">ADStore 패션관</h1>
				<div class="m_div">
					<div class="left_div_div01">
						<a href=""><img src="img/coat.png" alt="옷"
							onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)">
						</a>
					</div>
					<div class="left_div_div02">
						<ul>
							<li><a href="sellpage.jsp">
									<div id="product-bt">
										<div class="product-cardbt">
											<div>
												<%
							out.println("<img id='product-img' src='img/" + jjj.get(9).getItemImage() + "' + alt='' + onmouseenter='zoomIn(event)' onmouseleave='zoomOut(event)' >");
						%>
											</div>
										</div>
									</div>
									<li><a href="sellpage.jsp">
											<div id="product-bt">
												<div class="product-cardbt">
													<div>
														<%
							out.println("<img id='product-img' src='img/" + jjj.get(0).getItemImage() + "' + alt='' + onmouseenter='zoomIn(event)' onmouseleave='zoomOut(event)' >");
						%>
													</div>
												</div>
											</div>
									</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="cart_div">
			<a href="cart.jsp"><img src="img/cart.png" alt=""></a>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>
