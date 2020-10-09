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
<link rel="stylesheet" href="assets/css/item_deails1.css" />
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
			<!-- <h2>제품상세 페이지</h2> -->
		</div>

		<!-- 본문 영역 -->
		<div id="content">
			<div class="top">

				<img id="img01" src="assets/img/${output.origin_name}" alt="상품 이미지">

			</div>
			<iframe src="#" name="iframe"
				style="width: 1px; height: 1px; border: 0; visibility: hidden;"></iframe>


			<div class="abc">
				<h2 id="title">${output.prod_name}</h2>



			</div>


			<div id="item_normal_price">
				<span>가격 : </span><span id="item-price">${output.prod_price}원</span>
			</div>

			<button id='bBtn' class="addBtn">기본 상품 추가</button>
			<button id='oBtn' class="addBtn">옵션 상품 추가</button>

			<form method="GET" id="itde"
				action="${pageContext.request.contextPath}/add_basket.do"
				target="iframe">
				<div id="field"></div>

				<div id="total-price">
					총 금액 : <input type="text" id="all_total" value="-" readonly>
				</div>

				<div class="button">
					<div id="order">

						<input type="submit" name="button2" id="button2" value="장바구니에 담기">
					</div>
				</div>
			</form>

			<!-- 탭의 전체 박스 -->
			<div class="tab">
				<!-- 탭 버튼 영역 -->
				<ul class="tab-button clearfix">
					<li class="tab-button-item pull-left"><a
						class="tab-button-item-link selected" href="#tab-page-1">제 품 상
							세</a></li>
					<li class="tab-button-item pull-left"><a
						class="tab-button-item-link" id="link1" href="#tab-page-2">배 송
							안 내</a></li>
					<li class="tab-button-item pull-left"><a
						class="tab-button-item-link" id="link2" href="#tab-page-3">구 매
							후 기</a></li>
					<li class="tab-button-item pull-left"><a
						class="tab-button-item-link" id="link3" href="#tab-page-4">상 품
							문 의</a></li>
				</ul>
				<div class="tab-pannel">
					<div id="tab-page-1">
						<img
							src="${pageContext.request.contextPath}/assets/img/${output1.origin_name}"
							alt="이미지1" />
					</div>
					<div id="tab-page-2" class="hide">
						<img src="assets/img/transport.jpg" id="trans">
					</div>
					<div id="tab-page-3" class="hide">
						<%@include file="epil_list.jsp"%>
					</div>
					<div id="tab-page-4" class="hide">
						<%@include file="item_bbs_list.jsp"%>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- container 태그 끝 -->

	<%@ include file="inc/footer.jsp"%>
	<script src="assets/plugins/sweetalert/sweetalert2.min.js"></script>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
	<script src="assets/js/sum2.js"></script>
	<script src="assets/js/common.js"></script>



	<script type="text/javascript">
		$(function() {

			var pnopno = '<input type="text" name="product_prod_no" value="${output.prod_no}" style="display: none;" readonly/>';
			var updobtn = '<span class="item_count"><button type="button" class="count_plus count"><i class="far fa-plus-square"></i></button><button type="button" class="count_minus count"><i class="far fa-minus-square"></i></button></span><br/>';
			var sum = '합계 : <input type="text" class="total" name="total" value="0" class="total" readonly />원';
			var propro1 = '가격 : <input type="text" class="prc" name="prod_price" value="${output.prod_price}" readonly/><br/>';
			var optopt1 = '옵션 : <input type="text" class="prod_opt" name="prod_opt" value="${output.prod_opt}" readonly/>';
			var oppopp1 = '옵션가격 : <input type="text" class="optPrc" name="opt_price" value="${output.opt_price}" readonly/><br/>';
			var qtyqty1 = '수량: <input type="text" class="num" name="prod_qty" value="1" readonly/>';

			var propro2 = '가격 : <input type="text" class="prc" name="prod_price" value="${output.prod_price}" readonly/>';
			var optopt2 = '옵션 : <input type="text" class="prod_opt" name="prod_opt" value="기본옵션" readonly/><br/>';
			var oppopp2 = '<input type="text" class="optPrc" name="opt_price" value="0" style="display: none;" readonly/>';
			var qtyqty2 = '수량 : <input type="text" class="num" name="prod_qty" value="1" readonly/>';

			$("#bBtn").click(
					function() {
						$("#field").append(
								"<div class='inputProd'>" + pnopno + propro2
										+ optopt2 + oppopp2 + qtyqty2 + updobtn
										+ sum + "</div>");

						var arr1 = $('.total').length;

						for (var i = 0; i < arr1; i++) {

							var num = $(".num:eq(" + i + ")").val();
							num = $(".num:eq(" + i + ")").val(num * 1);
							var a = $(".num:eq(" + i + ")").val();

							var prc = $(".prc:eq(" + i + ")").val();
							var b = parseInt(prc);

							var optPrc = $(".optPrc:eq(" + i + ")").val();
							var c = parseInt(optPrc);

							var tot = $(".total:eq(" + i + ")").val();
							tot = $(".total:eq(" + i + ")").val(a * (b + c));
							$(".total:eq(" + i + ")").val(a * (b + c));
						}

						var arr = $('.total');
						var tot = 0;
						for (var i = 0; i < arr.length; i++) {
							if (parseInt(arr[i].value))
								tot += parseInt(arr[i].value);
						}
						document.getElementById('all_total').value = tot;
					})

			$("#oBtn").click(
					function() {
						$("#field").append(
								"<div class='inputProd'>" + pnopno + propro1
										+ optopt1 + oppopp1 + qtyqty1 + updobtn
										+ sum + "</div>");

						var arr1 = $('.total').length;

						for (var i = 0; i < arr1; i++) {

							var num = $(".num:eq(" + i + ")").val();
							num = $(".num:eq(" + i + ")").val(num * 1);
							var a = $(".num:eq(" + i + ")").val();

							var prc = $(".prc:eq(" + i + ")").val();
							var b = parseInt(prc);

							var optPrc = $(".optPrc:eq(" + i + ")").val();
							var c = parseInt(optPrc);

							var tot = $(".total:eq(" + i + ")").val();
							tot = $(".total:eq(" + i + ")").val(a * (b + c));
							$(".total:eq(" + i + ")").val(a * (b + c));
						}

						var arr = $('.total');
						var tot = 0;
						for (var i = 0; i < arr.length; i++) {
							if (parseInt(arr[i].value))
								tot += parseInt(arr[i].value);
						}
						document.getElementById('all_total').value = tot;
					})
		});
		/** 탭 버튼 기능구현 */
		$(function() {
			/** 탭 버튼의 클릭 처리 */
			$('.tab-button-item-link').click(function(e) {
				// 페이지 이동 방지
				e.preventDefault();

				// 클릭된 요소를 제외한 나머지에게 selected 클래스 제거 --> 배경색 원상복구
				$(".tab-button-item-link").not(this).removeClass("selected");

				// 클릭된 요소에게 selected 클래스 적용 --> 배경색 변경됨
				$(this).addClass("selected");

				var target = $(this).attr('href');
				$(target).removeClass('hide');
				$('.tab-pannel > div').not($(target)).addClass('hide');
			});
		});

		$('#button2').click(function() {
			var aa = "${user_no}";

			if (aa == "") {
				swal({
					html : "<b>로그인을 해야합니다. 로그인 페이지로 이동하시겠습니까?</b>", // 내용
					type : "question", // 종류
					showCancelButton : true, // 취소버튼 표시 여부
					cancelButtonText : "취소",
					confirmButtonText : "확인",
					confirmButtonColor : "#db7f41",
				}).then(function(req) {
					if (req.value) {
						$(location).attr('href', 'login_main.do');
					}
				});
				return false;
			}

			swal({
				html : "<b>장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?</b>", // 내용
				type : "question", // 종류
				showCancelButton : true, // 취소버튼 표시 여부
				cancelButtonText : "취소",
				confirmButtonText : "확인",
				confirmButtonColor : "#db7f41",
			}).then(function(req) {
				if (req.value) {
					$(location).attr('href', 'basket.do');
				}
			});
		});
	</script>

</body>

</html>