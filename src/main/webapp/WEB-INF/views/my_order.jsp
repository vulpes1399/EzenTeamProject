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
<link rel="stylesheet" href="assets/css/common.css">
<link rel="stylesheet" href="assets/css/navi.css">
<link rel="stylesheet" href="assets/css/my_order.css">
<link rel="stylesheet" href="assets/css/modal.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
		<link rel="stylesheet"
	href="assets/plugins/sweetalert/sweetalert2.min.css" />
</head>

<body>

	<%@ include file="inc/top_navi.jsp"%>
	<div id="container">
		<div id="item-header">
			<h2>구매내역</h2>
		</div>
		<div class="order clear">
			<ul class="item_box">
				<c:choose>
					<%-- 조회결과가 없는 경우 --%>
					<c:when test="${output == null || fn:length(output) == 0}">
						<div id="bsk_null-notice">구매 내역이 없습니다.</div>
					</c:when>
					<%-- 조회결과가 있는  경우 --%>
					<c:otherwise>
						<%-- 조회 결과에 따른 반복 처리 --%>
						<c:forEach var="item" items="${output}" begin="0" end="9"
							varStatus="status">

							<!-- 일자 단위 -->
							<span id="ord"> 구매일자 : ${item.reg_date}</span>
							<li class="item">
								<%-- 상세페이지로 이동하기 위한 URL --%> <c:url value="/item_details.do"
									var="viewUrl">
									<c:param name="prod_no" value="${item.prod_no}" />
								</c:url> <a href="${viewUrl}"><img
									src="${pageContext.request.contextPath}/assets/img/${item.origin_name}"></a>
								<div class="item_detail">
									<!-- 상품 내용 박스 -->

									<p class="over">
										<strong>${item.prod_name}</strong>
									</p>
									<p class="over">구매수량 : ${item.prod_qty}</p>
									<p class="over">구매금액 : ${item.prod_price}</p>
									<p class="over">옵션 : ${item.prod_opt}</p>
									<p class="over">옵션가격 : ${item.opt_price}</p>

								</div>
							</li>

							<div class="button">
								<!-- 버튼 박스 -->
								<button type="button" class="res" value="${item.orders_order_no}">구매확정</button>
								<input type="text" class="ok" value="${item.order_ok}" style="display:none"/> 
								<button type="button" class="ch" value="${item.orders_order_no}">교환요청</button>
									<input type="text" class="cq" value="${item.order_change}" style="display:none"/> 
								<button type="button" class="ref" value="${item.orders_order_no}">환불요청</button>
									<input type="text" class="rf" value="${item.order_refund}" style="display:none"/> 
							</div>
							<hr />
						</c:forEach>
					</c:otherwise>
				</c:choose>


			</ul>

		</div>
	</div>
	<!-- container 태그 끝 -->

	<%@ include file="inc/footer.jsp"%>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="assets/plugins/sweetalert/sweetalert2.min.js"></script>
	<script src="assets/js/common.js"></script>
	<script src="assets/js/my_order.js"></script>
	<script>
	$('.res').click(function() {
		var cb = $(this).val();
		var cdn = parseInt(cb);
		swal({
			html : "<b>구매확정 하시겠습니까?</b>", // 내용
			type : "question", // 종류
			showCancelButton : true, // 취소버튼 표시 여부
			cancelButtonText : "취소",
			confirmButtonText : "확인",
			confirmButtonColor : "#db7f41",
		}).then(function(req) {
			if (req.value) {
				$.ajax({
					type : "POST",
					url : "OrderDecideOk.do",
					data : {
						"orders_order_no" : cb
					}
				})
				swal("구매확정", "구매확정이 되었습니다.", "success").then(function(){
					location.reload();
					
				});
			}
		})

	})
	
	$('.ch').click(function() {
		var cb = $(this).val();
		var cdn = parseInt(cb);
		swal({
			html : "<b>교환을 요청하시겠습니까?</b>", // 내용
			type : "question", // 종류
			showCancelButton : true, // 취소버튼 표시 여부
			cancelButtonText : "취소",
			confirmButtonText : "확인",
			confirmButtonColor : "#db7f41",
		}).then(function(req) {
			if (req.value) {
				$.ajax({
					type : "POST",
					url : "OrderChangeOk.do",
					data : {
						"orders_order_no" : cb
					}
				})
				swal("교환접수", "교환 요청이 접수되었습니다.", "success").then(function(){
					location.reload();
					
				});
			}
		})

	})
	
	$('.ref').click(function() {
		var cb = $(this).val();
		var cdn = parseInt(cb);
		swal({
			html : "<b>환불 요청하시겠습니까?</b>", // 내용
			type : "question", // 종류
			showCancelButton : true, // 취소버튼 표시 여부
			cancelButtonText : "취소",
			confirmButtonText : "확인",
			confirmButtonColor : "#db7f41",
		}).then(function(req) {
			if (req.value) {
				$.ajax({
					type : "POST",
					url : "OrderRefundOk.do",
					data : {
						"orders_order_no" : cb
					}
				})
				swal("환불접수", "환불 요청이 접수되었습니다.", "success").then(function(){
					location.reload();
					
				});
			}
		})

	})
	</script>
</body>

</html>