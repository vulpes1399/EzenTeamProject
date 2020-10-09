<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="assets/css/pay.css" />
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
			<h1>주문결제</h1>

		</div>
<iframe src="#" name="iframe"
				style="width: 1px; height: 1px; border: 0; visibility: hidden;"></iframe>
		<form class="form-horizontal" name="buy_form" id="buy_form"
			method="post" action="${pageContext.request.contextPath}/order_ok.do">
			<h3>주문자 정보</h3>
			<div class="form-group" id="jumun_name_tel">
				<div class="col-md-10">
					<input type="text" name="user_name" id="user_name"
						class="form-control" value="${user_name}" />
				</div>
				<div class="col-md-10">
					<input type="tel" name="tel" id="tel" class="form-control"
						value="${tel}" />
				</div>
			</div>

			<h3 id="sulyung">수령인 정보</h3>
			<div class="form-group">
				<div class="col-md-10">
					<input type="text" name="recive_name" id="recive_name"
						class="form-control" placeholder="이름" />
				</div>
				<div class="col-md-10">
					<input type="tel" name="recive_tel" id="recive_tel"
						class="form-control" placeholder="연락처" />
				</div>
			</div>

			<div class="form-group">
				<div class="col-md-10">
					<input type="text" name="recive_postcode" id="sample2_postcode"
						class="form-control" placeholder="우편번호" readonly>
				</div>
				<div class="small_button">
					<input type="button" onclick="sample2_execDaumPostcode()"
						id="search_post_code" class="btn_action" value="우편번호 찾기">
				</div>
			</div>
			<div id="input_address" class="form-group">

				<div class="col-md-10">
					<input type="text" name="recive_addr1" id="sample2_address"
						class="form-control" placeholder="주소" readonly>
				</div>
			</div>
			<div id="input_detail_address" class="form-group">

				<div class="col-md-10">
					<input type="text" name="recive_addr2" id="sample2_detailAddress"
						class="form-control" placeholder="상세주소">
				</div>

			</div>
			<div id="layer"
				style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
				<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
					id="btnCloseLayer"
					style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
					onclick="closeDaumPostcode()" alt="닫기 버튼">
			</div>

			<h3>주문상품</h3>

			<div id="basket_list" class="form-group clear">
				<hr />
				<div class="basket_item">

					<c:choose>
						<%-- 조회결과가 없는 경우 --%>
						<c:when test="${output == null}">
							<tr>
								<td colspan="3" align="center">장바구니가 비어있습니다.</td>
							</tr>
						</c:when>
						<%-- 조회결과가 있는  경우 --%>
						<c:otherwise>
							<%-- 조회 결과에 따른 반복 처리 --%>
							<c:forEach var="item" items="${output}" varStatus="status">
								<div class="row data">
								<input type="text" name="cnt" value="0" style="display: none;" />
									<div class="item_info clear">
										<img
											src="${pageContext.request.contextPath}/assets/img/${item.origin_name}">
										<div class="item_detail">
											<input type="text" name="prod_name" value="${item.prod_name}" style="display: none;" />
											<p class="title">${item.prod_name}</p>
											<p class="sum">
												가격 :<input type='text' class="prc" name='prod_price'
													value="${item.prod_price}" readonly />원
											</p>
											
											<p class="opt">
												선택옵션 : <span>${item.prod_opt}</span>
											</p>
											<p class="optp">
												옵션 가격 : <span>${item.opt_price}</span>
											</p>
											 <input
												type="text" class="optPrc" name="opt_price" value="${item.opt_price}"
												style="display: none;" />
											<input type="text" name="prod_opt" value="${item.prod_opt}" style="display: none;" />
											<p class="num_amount">
												수량 : <input type="text" class="num" value='${item.prod_qty}'
													name="prod_qty" readonly />
											</p>
											<input type="text" name="prod_no"
												value="${item.prod_no}" style="display: none;" />

											<p class="sum">
												합계 : <input type="text" name="total" value='0' class="total"
													readonly />원
											</p>

										</div>
									</div>
									<hr />
								</div>

							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
				<div id="total_sum">
					<span id="total_text">총 결제 금액 : </span><input type="text"
						id="all_total" name="all_total" value="0" readonly /><span
						id="won">원</span>
				</div>
			</div>
			<h3>결제수단</h3>
			<div class="form-group">
				<div id="order_method">
					<h4>무통장입금</h4>
					<div id="bank_select" class="clear">
						<div id="array">
							<label for="bank_drop">입금은행</label> <select id="bank_drop"
								name="bank" required>
								<option value="" selected>------------</option>
								<option value="우리은행">우리은행</option>
								<option value="국민은행">국민은행</option>
								<option value="하나은행">하나은행</option>
								<option value="신한은행">신한은행</option>
							</select>

						</div>
						<div id="order_name">
							<label for="ist_name">입금자명</label> <input type="text"
								id="ist_name" name="deposit_name" required>
						</div>

					</div>
				</div>

			</div>
			<div id="last_btn" class="clear">
				<button type="submit" id="submit" class="last_select">주문하기</button>
				<button type="reset" id="reset" class="last_select">다시작성</button>
			</div>
		</form>
	</div>
	<!-- container 태그 끝 -->

	<%@ include file="inc/footer.jsp"%>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="assets/js/common.js"></script>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="assets/plugins/validate/jquery.validate.min.js"></script>
	<script src="assets/plugins/validate/additional-methods.min.js"></script>
	<script src="assets/plugins/sweetalert/sweetalert2.min.js"></script>
	<script src="assets/js/sum.js"></script>
	<script type="text/javascript">
		$("#submit").click(
				function() {
					/** 플러그인의 기본 설정 옵션 추가 */
					jQuery.validator.setDefaults({
						onkeyup : false, // 키보드입력시 검사 안함
						onclick : false, // <input>태그 클릭시 검사 안함
						onfocusout : false, // 포커스가 빠져나올 때 검사 안함
						showErrors : function(errorMap, errorList) { // 에러 발생시 호출되는 함수 재정의
							// 에러가 있을 때만..
							if (this.numberOfInvalids()) {
								// 0번째 에러 메시지에 대한 javascript 기본 alert 함수 사용
								//alert(errorList[0].message);
								// 0번째 에러 발생 항목에 포커스 지정
								//$(errorList[0].element).focus();

								swal({
									title : "에러",
									text : errorList[0].message,
									type : "error"
								}).then(function(result) {
									// 창이 닫히는 애니메이션의 시간이 있으므로,
									// 0.1초의 딜레이 적용 후 포커스 이동
									setTimeout(function() {
										$(errorList[0].element).val('');
										$(errorList[0].element).focus();
									}, 100);
								});

							} else {
								swal("주문완료", "", "success").then(function(req) {
									if (req.value) {
										$(location).attr('href', 'buy_result.do');
									}
								});

							}
						}
					});

					/** 유효성 검사 추가 함수 */
					$.validator.addMethod("kor", function(value, element) {
						return this.optional(element)
								|| /^[ㄱ-ㅎ가-힣]*$/i.test(value);
					});

					$.validator.addMethod("phone", function(value, element) {
						return this.optional(element)
								|| /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/i
										.test(value)
								|| /^\d{2,3}\d{3,4}\d{4}$/i.test(value);
					});

					/** form태그에 부여한 id속성에 대한 유효성 검사 함수 호출 */
					$("#buy_form").validate({
						/** 입력검사 규칙 */
						rules : {

							// [이름] 필수
							user_name : {
								required : true,
								kor : true
							},
							recive_name : {
								required : true,
								kor : true
							},
							// [연락처] 필수
							tel : {
								required : true,
								phone : true
							},

							recive_tel : {
								required : true,
								phone : true
							},

							user_postcode : {
								required : true
							},
							order_method : {
								required : true
							},
							bank_drop : {
								required : true
							},
							ist_name : {
								required : true
							}

						},
						/** 규칙이 맞지 않을 경우의 메시지 */
						messages : {
							user_name : {
								required : "주문자의 이름을 입력하세요.",
								kor : "이름은 한글만 입력 가능합니다."
							},
							recive_name : {
								required : "수령인의 이름을 입력하세요.",
								kor : "이름은 한글만 입력 가능합니다."
							},
							tel : {
								required : "주문자의 연락처를 입력하세요.",
								phone : "연락처 형식이 잘못되었습니다."
							},
							recive_tel : {
								required : "수령인의 연락처를 입력하세요.",
								phone : "연락처 형식이 잘못되었습니다."
							},
							user_postcode : {
								required : "받으실 주소를 입력하세요."
							},
							order_method : {
								required : "결제방법을 선택해주세요."
							},
							bank_drop : {
								required : "은행을 선택해주세요."
							},
							ist_name : {
								required : "입금자명을 입력해주세요."
							}

						}

					}); // end validate()

				});

		// 우편번호 찾기 화면을 넣을 element
		var element_layer = document.getElementById('layer');

		function closeDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			element_layer.style.display = 'none';
		}

		function sample2_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
							} else {
								document.getElementById("sample2_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample2_postcode').value = data.zonecode;
							document.getElementById("sample2_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample2_detailAddress")
									.focus();

							// iframe을 넣은 element를 안보이게 한다.
							// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
							element_layer.style.display = 'none';
						},
						width : '100%',
						height : '100%',
						maxSuggestItems : 5
					}).embed(element_layer);

			// iframe을 넣은 element를 보이게 한다.
			element_layer.style.display = 'block';

			// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
			initLayerPosition();
		}

		// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
		// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
		// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
		function initLayerPosition() {
			var width = 300; //우편번호서비스가 들어갈 element의 width
			var height = 400; //우편번호서비스가 들어갈 element의 height
			var borderWidth = 5; //샘플에서 사용하는 border의 두께

			// 위에서 선언한 값들을 실제 element에 넣는다.
			element_layer.style.width = width + 'px';
			element_layer.style.height = height + 'px';
			element_layer.style.border = borderWidth + 'px solid';
			// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
			element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
					+ 'px';
			element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
					+ 'px';
		}
	</script>

</body>

</html>