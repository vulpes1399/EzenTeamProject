<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link rel="stylesheet" href="assets/css/buy_result.css" />
<link rel="stylesheet" href="assets/css/navi.css">
<link rel="stylesheet" href="assets/css/modal.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

</head>

<body>
<div class="basket_item" style="display: none;">
				<c:choose>
					<%-- 조회결과가 없는 경우 --%>
					<c:when test="${output == null}">
						-
					</c:when>
					<%-- 조회결과가 있는  경우 --%>
					<c:otherwise>
						<%-- 조회 결과에 따른 반복 처리 --%>
						<c:forEach var="item" items="${output1}" varStatus="status">
							<form name="orderform" class="orderform" method="get"
								class="orderform_cls"
								action="${pageContext.request.contextPath}/basket_del_ok.do">
								<input type="text" name="product_prod_no"
									value="${item.prod_no}" style="display: none;" />

								<div class="row data">
									<div class="item_info clear">
										<img
											src="${pageContext.request.contextPath}/assets/img/${item.origin_name}">
										<div class="item_detail">
											<p class="title">${item.prod_name}</p>
											<p class="opt">
												선택옵션 : <span>${item.prod_opt}</span>
											</p>
											<p class="num_amount">
												수량 : <input type="text" class="num" value='${item.prod_qty}'
													name="num" readonly />
											</p>
											<input type="text" class="optPrc" name="opt_price"
												value="${item.opt_price}" style="display: none;" />
											<div class="item_count">
											</div>
											<p class="sum">
												가격 :<input type='text' class="prc" name='price'
													value="${item.prod_price}" readonly />원
											</p>
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

	<%@ include file="inc/top_navi.jsp"%>
	<div id="container">
		<div id="header">
			<h1>결제완료</h1>
		</div>
			<div class="buy_result_info">
				<h3>결제 정보</h3>
				<div class="form-group">
					<div class="col-md-10">
						입금은행 : <input type="text" name="order_bank" id="order_bank"
							class="form-control" placeholder="${output.bank}" />
					</div>

					<div class="col-md-10">
						입금계좌 : <input type="text" name="order_acount" id="order_acount"
							class="form-control" placeholder="1002-545-495524" />
					</div>
					<div class="col-md-10">
						결제금액 : <input type="text"
						id="all_total" name="all_total" value="0" readonly />원
					</div>
				</div>

				<div>
					<p>24시간 내에 미입금 시 주문 취소
					<p>
				</div>
			</div>
			<div class="buy_result_info">
				<h3>주문자 정보</h3>
				<div class="form-group">
					<div class="col-md-10">
						주문자 : <input type="text" name="user_name" id="user_name"
							class="form-control" placeholder="${user_name}" readonly />
					</div>
					<div class="col-md-10">
						연락처 : <input type="tel" name="tel" id="tel" class="form-control"
							placeholder="${tel}" />
					</div>
				</div>
			</div>
			<div class="buy_result_info">
				<h3>수령인 정보</h3>
				<div class="form-group">
					<div class="col-md-10">
						수령인 : <input type="text" name="recive_name" id="recive_name"
							class="form-control" placeholder="${output.recive_name}" readonly />
					</div>
					<div class="col-md-10">
						연락처 : <input type="tel" name="recive_tel" id="recive_tel"
							class="form-control" placeholder="${output.recive_tel}" readonly />
					</div>
				</div>

				<div class="form-group">
					<div class="col-md-10">
						우편번호 : <input type="text" name="user_postcode"
							id="sample2_postcode" class="form-control"
							placeholder="${output.recive_postcode}" readonly>
					</div>
				</div>
				<div id="input_address" class="form-group">

					<div class="col-md-10">
						주소 : <input type="text" name="user_address" id="sample2_address"
							class="form-control" placeholder="${output.recive_addr1}" readonly>
					</div>
				</div>
				<div id="input_detail_address" class="form-group">

					<div class="col-md-10">
						상세주소 : <input type="text" name="user_detail_address"
							id="sample2_detailAddress" class="form-control"
							placeholder="${output.recive_addr2}" readonly>
					</div>

				</div>
			</div>

			</div>
			<div id="last_btn" class="clear">
				<a href="${pageContext.request.contextPath}/my_order">
					<button type="button" id="link_my_order" class="last_select">구매내역조회</button>
				</a> <a href="${pageContext.request.contextPath}">
					<button type="button" id="link_index" class="last_select">메인페이지</button>
				</a>
			</div>

	<!-- container 태그 끝 -->

	<%@ include file="inc/footer.jsp"%>
	<!-- top 버튼 -->
	<a id="move_top_btn" href="#"><i id="top_btn"
		class="far fa-caret-square-up fa-2x"></i></a>


	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="assets/js/common.js"></script>
	<script src="assets/js/sum.js"></script>

</body>

</html>