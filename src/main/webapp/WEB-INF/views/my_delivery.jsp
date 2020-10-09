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
<link rel="stylesheet" href="assets/css/my_delivery.css">
<link rel="stylesheet" href="assets/css/modal.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet"
	href="assets/plugins/sweetalert/sweetalert2.min.css" />
</head>

<body>
	<%@ include file="inc/top_navi.jsp"%>
	<iframe src="#" name="iframe"
		style="width: 1px; height: 1px; border: 0; visibility: hidden;"></iframe>
	<div id="container">
		<div id="item-header">
			<h2>배송조회</h2>
		</div>
		<div class="delivery clear">
			<ul class="item_box">
				<c:choose>
					<%-- 조회결과가 없는 경우 --%>
					<c:when test="${output == null || fn:length(output) == 0}">
						<div id="bsk_null-notice">배송 내역이 없습니다.</div>
					</c:when>
					<%-- 조회결과가 있는  경우 --%>
					<c:otherwise>
						<%-- 조회 결과에 따른 반복 처리 --%>
						<c:forEach var="item" items="${output}" begin="0" end="9"
							varStatus="status">
							<%--<input type="text" class="orders_order_no" name="orders_order_no"
								value="${item.orders_order_no}" style="display: none;" />
							<input type="text" name="order_cancel"
								value="${item.order_cancel}" style="display: none;" /> --%>

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
								<a
									href="https://m.search.naver.com/search.naver?sm=mtp_hty.top&where=m&query=%ED%83%9D%EB%B0%B0%EC%A1%B0%ED%9A%8C"
									target="_blank"><button type="button" class="df">배송조회</button></a>
								<input type="text" class="yn" value="${item.order_cancel}" style="display:none"/> 
								<button type="button" class="cd" value="${item.orders_order_no}">주문취소</button>
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
	<script src="assets/js/my_delivery.js"></script>
	<script>
		$('.cd').click(function() {
			var cb = $(this).val();
			
			swal({
				html : "<b>배송을 취소하시겠습니까?</b>", // 내용
				type : "question", // 종류
				showCancelButton : true, // 취소버튼 표시 여부
				cancelButtonText : "취소",
				confirmButtonText : "확인",
				confirmButtonColor : "#db7f41",
			}).then(function(req) {
				if (req.value) {
					$.ajax({
						type : "POST",
						url : "deliveryCancelOk.do",
						data : {
							"orders_order_no" : cb
						}
					})
					swal("배송취소", "배송 취소 요청이 접수되었습니다.", "success").then(function(){
						location.reload();
						
					});
				}
			})

		})
	</script>
</body>

</html>