<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>review</title>
         <link rel="stylesheet" href="css/review.css" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script src="js/review.js" type="text/javascript"></script>
    </head>

    <body>
<%
	String id = (String) session.getAttribute("id");
	String password = (String) session.getAttribute("password");
	String type = (String) session.getAttribute("type");
	if (id == null && password == null) {
		response.sendRedirect("login.jsp");
	}
%>
	<jsp:include page="header_logout.jsp"></jsp:include>
        <section class="main_review">
            <div class="mainCon">
                <div class="writeTitle">리뷰 작성</div>
                <h1 class="h1">구매 하신 상품은 어떠셨나요?</h1>
                <div id="product-list">
                    <a href="">
                        <div class="product-card">
                            <div><img class="product-img" src="img/adidas.png" alt="" /></div>
                            <div class="product-contents">
                                <span class="product-name">아디다스 져지</span><span class="product-price">89,350원</span>
                                <div>
                                </div>
                            </div>
                        </div>
                    </a>
                    <div class="star-rating space-x-4 mx-auto">
                        <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings" />
                        <label for="5-stars" class="star pr-4">★</label>
                        <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings" />
                        <label for="4-stars" class="star">★</label>
                        <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings" />
                        <label for="3-stars" class="star">★</label>
                        <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings" />
                        <label for="2-stars" class="star">★</label>
                        <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
                        <label for="1-star" class="star">★</label>
                    </div>
                    <form class="writeForm" action="board_process.php?mode=write" method="post">
                        <input type="hidden" name="id" value="review">
                        <input type="hidden" name="userid" value="<?= $_SESSION['userid'] ?>">
                        <input type="hidden" name="name" value="<?= $_SESSION['name'] ?>">
                        <h2>리뷰 제목</h2>
                        <p><input class="writeTypeText" type="text" name="title" size="50" placeholder="제목을 입력해주세요."
                                required></p>
                        <h2>리뷰 내용</h2>
                        <textarea class="writeTextarea" name="story" placeholder="리뷰 내용을 작성해주세요." required></textarea>
                        <h2>상세 내용</h2>
                        <textarea class="writeTextarea02" name="story"
                            placeholder="다른 고객님에게 도움이 되도록 상품에 대한 솔직한 평가를 남겨주세요." required></textarea>
                        <h2>한줄평</h2>
                        <textarea class="writeTextarea03" name="story" placeholder="한 줄 요약을 입력해 주세요."
                            required></textarea>
                        <div class="writeBtn">
                            <input type="submit" value="작성">&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="취소"
                                onclick="history.back(1)">
                        </div>
                    </form>
                </div>
        </section>
        <div>
        </div>
         <jsp:include page="footer.jsp"></jsp:include>
    </body>

</html>