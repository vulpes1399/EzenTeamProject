<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE-edge" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>OVERWATCH</title>
<link rel="stylesheet" href="assets/css/common.css" />
<link rel="stylesheet" href="assets/css/basket.css" />
<link rel="stylesheet" href="assets/css/navi.css">
<link rel="stylesheet" href="assets/css/modal.css">
<link rel="stylesheet"
	href="assets/plugins/sweetalert/sweetalert2.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

</head>

<body>
	<%@ include file="inc/top_navi.jsp"%>
	<div id="container">
		<div id="header">
			<h1>장바구니</h1>
		</div>

		<!-- 장바구니 상품 목록 -->
		<div id="basket_list">
			<hr />

			<div class="basket_item">
				<c:choose>
					<%-- 조회결과가 없는 경우 --%>
					<c:when test="${output == null || fn:length(output) == 0}">

						<div id="bsk_null-notice">장바구니가 비어있습니다</div>

					</c:when>
					<%-- 조회결과가 있는  경우 --%>
					<c:otherwise>
						<%-- 조회 결과에 따른 반복 처리 --%>
						<c:forEach var="item" items="${output}" varStatus="status">
							<form name="orderform" class="orderform" method="get"
								class="orderform_cls"
								action="${pageContext.request.contextPath}/basket_del_ok.do">
								<input type="text" name="product_prod_no"
									value="${item.prod_no}" style="display: none;" /> <input
									type="text" name="cart_no" value="${item.cart_no}"
									style="display: none;" />

								<div class="row data">
									<div class="item_info clear"><%-- 상세페이지로 이동하기 위한 URL --%> <c:url value="/item_details.do"
									var="viewUrl">
									<c:param name="prod_no" value="${item.prod_no}" />
								</c:url><a href="${viewUrl}"><img
									src="${pageContext.request.contextPath}/assets/img/${item.origin_name}"></a>
										<div class="item_detail">
										
											<p class="title">${item.prod_name}</p>
											<p class="sum">
												가격 :<input type='text' class="prc" name='price'
													value="${item.prod_price}" readonly />원
											</p>
											<p class="opt">
												선택옵션 : <span id="sopt">${item.prod_opt}</span>
											</p>
											<p class="optp">
												옵션 가격 : <span>${item.opt_price}</span>
											</p>

											<p class="num_amount">
												수량 : <input type="text" class="num" value='${item.prod_qty}'
													name="num" readonly />
											</p>
											<input type="text" class="optPrc" name="opt_price"
												value="${item.opt_price}" style="display: none;" />
											<div class="item_count"></div>
											
											<p class="sum">
												합계 : <input type="text" name="total" value='0' class="total"
													readonly />원
											</p>

										</div>
										<div class="delete_item">
											<button type="submit" class="select_cancel">삭제</button>

										</div>
									</div>
									<hr />
								</div>


							</form>
						</c:forEach>
					</c:otherwise>
				</c:choose>

			</div>
		</div>

		<!-- 총 결제 금액 -->
		<div id="total_sum">
			<span id="total_text">총 결제 금액 : </span><input type="text"
				id="all_total" name="all_total" value="0" readonly /><span id="won">원</span>
		</div>

		<!-- 주문하기 -->
		<div class="select_buy">
			<button type="button" id="order_buy">
				<span id="slct">담은 상품 주문하기</span>
			</button>
		</div>

	</div>
	<!-- container 태그 끝 -->
	<%@ include file="inc/footer.jsp"%>

	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="assets/plugins/sweetalert/sweetalert2.min.js"></script>
	<script src="assets/js/common.js"></script>
	<script src="assets/js/sum.js"></script>
</body>
</html>