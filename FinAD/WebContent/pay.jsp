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
<title>pay</title>
<link rel="stylesheet" href="css/pay.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/pay.js" type="text/javascript"></script>

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


    <div class="orderform" id="orderform" name="orderform" action="">
        <form name="orderform" id="orderform" method="post" class="orderform" action="/Page" onsubmit="return false;">

            <input type="hidden" name="cmd" value="order">
            <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="check">선택</div>
                        <div class="img">이미지</div>
                        <div class="pname">상품명</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">가격</div>
                        <div class="num">수량</div>
                        <div class="sum">합계</div>
                    </div>
                    <div class="subdiv">

                        <div class="basketcmd">삭제</div>
                    </div>
                    <div class="split"></div>
                </div>

                <div class="row data">
                    <div class="subdiv">
                        <div class="check"><input type="checkbox" name="buy" value="260" checked=""
                                onclick="javascript:basket.checkItem();">&nbsp;</div>
                        <div class="img"><img src="img/sunglass.png" width="48" sizes="48"></div>
                        <div class="pname">
                            <span>LED선글라스</span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price1" class="p_price"
                                value="20000">20,000원</div>
                        <div class="num">
                            <div class="updown">
                                <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num"
                                    value="2" onkeyup="javascript:basket.changePNum(1);">
                                <span onclick="javascript:basket.changePNum(1);"><i
                                        class="fas fa-arrow-alt-circle-up up"></i></span>
                                <span onclick="javascript:basket.changePNum(1);"><i
                                        class="fas fa-arrow-alt-circle-down down"></i></span>
                            </div>
                        </div>
                        <div class="sum">20,000원</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd"><a href="javascript:void(0)" class="abutton"
                                onclick="javascript:basket.delItem();">삭제</a></div>
                    </div>
                </div>
                <div class="row data">
                    <div class="subdiv">
                        <div class="check"><input type="checkbox" name="buy" value="261" checked=""
                                onclick="javascript:basket.checkItem();">&nbsp;</div>
                        <div class="img"><img src="img/graycap.png" width="48"></div>
                        <div class="pname">
                            <span>남성 그레이 캡</span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price2" class="p_price"
                                value="19000">19,000원</div>
                        <div class="num">
                            <div class="updown">
                                <input type="text" name="p_num2" id="p_num2" size="2" maxlength="4" class="p_num"
                                    value="1" onkeyup="javascript:basket.changePNum(2);">
                                <span onclick="javascript:basket.changePNum(2);"><i
                                        class="fas fa-arrow-alt-circle-up up"></i></span>
                                <span onclick="javascript:basket.changePNum(2);"><i
                                        class="fas fa-arrow-alt-circle-down down"></i></span>
                            </div>
                        </div>
                        <div class="sum">9,900원</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd"><a href="javascript:void(0)" class="abutton"
                                onclick="javascript:basket.delItem();">삭제</a></div>
                    </div>
                </div>
                <div class="row data">
                    <div class="subdiv">
                        <div class="check"><input type="checkbox" name="buy" value="262" checked=""
                                onclick="javascript:basket.checkItem();">&nbsp;</div>
                        <div class="img"><img src="img/belt.png" width="48" sizes="48"></div>
                        <div class="pname">
                            <span>소가죽 벨트(남성용)</span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price3" class="p_price"
                                value="15200">15,200원</div>
                        <div class="num">
                            <div class="updown">
                                <input type="text" name="p_num3" id="p_num3" size="2" maxlength="4" class="p_num"
                                    value="1" onkeyup="javascript:basket.changePNum(3);">
                                <span onclick="javascript:basket.changePNum(3);"><i
                                        class="fas fa-arrow-alt-circle-up up"></i></span>
                                <span onclick="javascript:basket.changePNum(3);"><i
                                        class="fas fa-arrow-alt-circle-down down"></i></span>
                            </div>
                        </div>
                        <div class="sum">10,200원</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd"><a href="javascript:void(0)" class="abutton"
                                onclick="javascript:basket.delItem();">삭제</a></div>
                    </div>
                </div>

            </div>
            <div class="final_dc">
            <div class="right-align basketrowcmd">
                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delCheckedItem();">선택상품삭제</a>
                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
            </div>

            <div class="bigtext right-align sumcount" id="sum_p_num">총 상품: 4개</div>
            <div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액: 74,200원</div>
            <div class="bigtext right-align box blue summoney"><input type="submit" id="confirm" value="결제하기"></div>

            <!-- <div id="goorder" class="" >
                        <div class="clear"></div>
                        <div class="buttongroup center-align cmd"> -->

            <!-- <a href="pay.html">선택한 상품 주문</a> -->
    </div>
    </div>
    </div>
</div>

    </form>
    <div id="wrapper">
        <main id="product">
            <section class="order">
                <form action="#">
            <!-- 배송정보 -->
            <article class="delivery">
                <h1>배송정보</h1>
                <table>
                    <tr>
                        <td>주문자</td>
                        <td><input type="text" name="orderer"></td>
                    </tr>
                    <tr>
                        <td>휴대폰</td>
                        <td>
                            <input type="text" name="hp">
                            <span></span>
                        </td>
                    </tr>
                    <tr>
                        <td>우편번호</td>
                        <td>
                            <input type="text" name="zip">
                            <input type="button" value="검색">
                        </td>
                    </tr>
                    <tr>
                        <td>기본주소</td>
                        <td>
                            <input type="text" name="addr1">
                        </td>
                    </tr>
                    <tr>
                        <td>상세주소</td>
                        <td><input type="text" name="addr2"></td>
                    </tr>
                </table>
            </article>


            <!-- 결제방법 -->
            <article class="payment">
                <h1>결제방법</h1>
                <div>
                    <span>신용카드</span>
                    <p>
                        <label>
                            <input type="radio" name="payment" value="type1">신용카드 결제
                        </label>
                        <label>
                            <input type="radio" name="payment" value="type2">체크카드 결제
                        </label>
                    </p>
                </div>
                <div>
                    <span>계좌이체</span>
                    <p>
                        <label>
                            <input type="radio" name="payment" value="type3">실시간 계좌이체
                        </label>
                        <label>
                            <input type="radio" name="payment" value="type4">무통장 입금
                        </label>
                    </p>
                </div>
                <div>
                    <span>기타</span>
                    <p>
                        <label>
                            <input type="radio" name="payment" value="type4">휴대폰 결제
                        </label>
                        <label>
                            <input type="radio" name="payment" value="type5">카카오페이
                            <img src="img/kakao.png" alt="">
                        </label>
                    </p>
                </div>
            </article>
            <!-- 경고 -->
            <article class="alert">
                <ul>
                    <li><span>ADstore의 모든 판매자는 안전거래를 위해 구매금액, 결제수단에 상관없이 모든거래에 대하여 ADstore 유한책임회사의
                            구매안전서비스(에스크로)를 제공하고 있습니다.
                        </span></li>
                    <li><span>ADstore 유한책임회사의 전자금융거래법에 의해 결제대금예치업 등록번호는 02-006-00008 입니다.
                        </span></li>
                    <li><span>등록여부는 금융감독원 홈페이지(www.fss.or.kr)의 업무자료>인허가업무안내>전자금융업등록현황에서 확인하실수 있습니다.
                        </span></li>
                </ul>
            </article>
        </form>
    </section>
</main>
		<div class="cart_div">
				<a href="cart.jsp"><img src="img/cart.png" alt=""></a>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>