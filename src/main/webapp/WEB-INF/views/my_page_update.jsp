<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE-edge" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>OVERWATCH</title>
<link rel="stylesheet" href="assets/css/common.css" />
<link rel="stylesheet" href="assets/css/my_page_update.css" />
<link rel="stylesheet" href="assets/css/navi.css">
<link rel="stylesheet" href="assets/css/modal.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.css" />

</head>

<body>
	<%@ include file="inc/top_navi.jsp"%>
	<div id="container">
		<div id="header">
			<h1>회원정보 수정</h1>

		</div>

		<form class="form-horizontal" name="edit_pw" id="edit_pw"
			action="${pageContext.request.contextPath}/update_pw.do">
			<h2 class="title">비밀번호 변경</h2>
			<div class="form-group">
				<div class="col-md-10">
					<input type="password" name="user_pw" id="user_pw"
						class="form-control" placeholder="${user_pw}" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-10">
					<input type="password" name="user_pw_new" id="user_pw_new"
						class="form-control" placeholder="신규 비밀번호 입력" />
				</div>
				<div class="small_button">
					<input type="submit" id="pw_change" class="btn_action"
						value="비밀번호 변경">
				</div>
			</div>
		</form>


		<form class="form-horizontal" name="edit_email" id="edit_email"
			action="${pageContext.request.contextPath}/update_email.do">
			<h2 class="title">이메일 변경</h2>
			<div class="form-group">
				<div class="col-md-10">
					<input type="email" name="email" id="email" class="form-control"
						placeholder="기존 이메일 입력" />
				</div>

				<div class="col-md-10">
					<input type="email" name="email_new" id="email_new"
						class="form-control" placeholder="신규 이메일 입력" />
				</div>
				<div class="small_button">
					<input type="submit" id="email_change" class="btn_action"
						value="이메일 변경">
				</div>
			</div>

		</form>


		<form class="form-horizontal" name="edit_tel" id="edit_tel"
			action="${pageContext.request.contextPath}/update_tel.do">
			<h2 class="title">연락처 변경</h2>

			<div class="form-group">
				<div class="col-md-10">
					<input type="tel" name="tel" id="tel" class="form-control"
						placeholder="기존 연락처" />
				</div>
				<div class="col-md-10">
					<input type="tel" name="tel_new" id="tel_new" class="form-control"
						placeholder="신규 연락처 입력" />
				</div>
				<div class="small_button">
					<input type="submit" id="tel_change" class="btn_action"
						value="연락처 변경">
				</div>
			</div>
		</form>

		<form class="form-horizontal" name="edit_addr" id="edit_addr"
			action="${pageContext.request.contextPath}/update_addr.do">
			<h2 class="title">주소지 변경</h2>
			<div class="form-group">
				<div class="col-md-10">
					<input type="text" name="postcode_new" id="sample2_postcode"
						class="form-control" placeholder="우편번호" readonly>
				</div>
				<div class="small_button">
					<input type="button" onclick="sample2_execDaumPostcode()"
						id="search_post_code" class="btn_action" value="우편번호검색">
				</div>
			</div>
			<div id="input_address" class="form-group">

				<div class="col-md-10">
					<input type="text" name="addr1_new" id="sample2_address"
						class="form-control" placeholder="주소" readonly>
				</div>
			</div>



			<div class="form-group">
				<div class="col-md-10">
					<input type="text" name="addr2_new" id="sample2_detailAddress"
						class="form-control" placeholder="상세주소">
				</div>

				<div class="small_button">
					<input type="submit" id="addr_change" class="btn_action"
						value="주소지 변경">
				</div>

			</div>
		</form>

		<div id="layer"
			style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
			<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
				id="btnCloseLayer"
				style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
				onclick="closeDaumPostcode()" alt="닫기 버튼">
		</div>

		<div id="my_page_info_back">
			<a href="${pageContext.request.contextPath}/my_page_info.do">
				<button type="button" id="my_page_info_back_btn">Back</button>
			</a>
		</div>

	</div>
	<!-- container 끝 -->



	<%@ include file="inc/footer.jsp"%>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="assets/js/common.js"></script>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/plugins/validate/additional-methods.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.js"></script>
	<script type="text/javascript">
	
	$(function() {
		$("#pw_change").click(function() {

			jQuery.validator.setDefaults({
				onkeyup: false, // 키보드입력시 검사 안함
				onclick: false, // <input>태그 클릭시 검사 안함
				onfocusout: false, // 포커스가 빠져나올 때 검사 안함
				showErrors: function(errorMap, errorList) { // 에러 발생시 호출되는 함수 재정의
					// 에러가 있을 때만..
					if (this.numberOfInvalids()) {
						// 0번째 에러 메시지에 대한 javascript 기본 alert 함수 사용
						//alert(errorList[0].message);
						// 0번째 에러 발생 항목에 포커스 지정
						//$(errorList[0].element).focus();

						swal({
							title: "에러",
							text: errorList[0].message,
							type: "error"
						}).then(function(result) {
							// 창이 닫히는 애니메이션의 시간이 있으므로,
							// 0.1초의 딜레이 적용 후 포커스 이동
							setTimeout(function() {
								$(errorList[0].element).val('');
								$(errorList[0].element).focus();
							}, 100);
						});

					} else if ('${user_pw}' != $('#user_pw').val()) {
						alert("기존 비밀번호를 확인해주세요.");

					} else {
						alert("비밀번호 변경완료");

					}
				}
			});

			$("#edit_pw").validate({

				rules: {
					// [비밀번호] 필수 + 글자수 길이 제한
					user_pw: {
						required: true
					},
					user_pw_new: {
						required: true,
						minlength: 4,
						maxlength: 20
					}
				},

				messages: {
					user_pw: {
						required: "기존 비밀번호를 입력하세요.",

					},
					user_pw_new: {
						required: "변경하실 비밀번호를 입력하세요.",
						minlength: "비밀번호는 4글자 이상 입력하셔야 합니다.",
						maxlength: "비밀번호는 최대 20자까지 가능합니다."
					}
				}
			}); // end validate()
		});
		
		$("#email_change").click(function() {
			/** 플러그인의 기본 설정 옵션 추가 */
			jQuery.validator.setDefaults({
				onkeyup: false, // 키보드입력시 검사 안함
				onclick: false, // <input>태그 클릭시 검사 안함
				onfocusout: false, // 포커스가 빠져나올 때 검사 안함
				showErrors: function(errorMap, errorList) { // 에러 발생시 호출되는 함수 재정의
					// 에러가 있을 때만..
					if (this.numberOfInvalids()) {
						// 0번째 에러 메시지에 대한 javascript 기본 alert 함수 사용
						//alert(errorList[0].message);
						// 0번째 에러 발생 항목에 포커스 지정
						//$(errorList[0].element).focus();

						swal({
							title: "에러",
							text: errorList[0].message,
							type: "error"
						}).then(function(result) {
							// 창이 닫히는 애니메이션의 시간이 있으므로,
							// 0.1초의 딜레이 적용 후 포커스 이동
							setTimeout(function() {
								$(errorList[0].element).val('');
								$(errorList[0].element).focus();
							}, 100);
						});

					} else if ('${email}' != $('#email').val()) {
						alert("기존 이메일을 확인해주세요.");

					} else {
						alert("이메일 변경완료");

					}
				}
			});

			/** form태그에 부여한 id속성에 대한 유효성 검사 함수 호출 */
			$("#edit_email").validate({
				/** 입력검사 규칙 */
				rules: {
					// [비밀번호] 필수 + 글자수 길이 제한
					email: {
						required: true,
						email: true
					},
					email_new: {
						required: true,
						email: true
					}
				},
				/** 규칙이 맞지 않을 경우의 메시지 */
				messages: {
					email: {
						required: "기존 이메일을 입력하세요.",
						email: "이메일 형식이 잘못되었습니다."
					},
					email_new: {
						required: "변경하실 이메일을 입력하세요.",
						email: "이메일 형식이 잘못되었습니다."
					}
				}
			}); // end validate()
		}); // 변경 완료


		$.validator.addMethod("phone", function(value, element) {
			return this.optional(element)
					|| /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/i.test(value)
					|| /^\d{2,3}\d{3,4}\d{4}$/i.test(value);
		});
		
		$("#tel_change").click(function() {
			/** 플러그인의 기본 설정 옵션 추가 */
			jQuery.validator.setDefaults({
				onkeyup: false, // 키보드입력시 검사 안함
				onclick: false, // <input>태그 클릭시 검사 안함
				onfocusout: false, // 포커스가 빠져나올 때 검사 안함
				showErrors: function(errorMap, errorList) { // 에러 발생시 호출되는 함수 재정의
					// 에러가 있을 때만..
					if (this.numberOfInvalids()) {
						// 0번째 에러 메시지에 대한 javascript 기본 alert 함수 사용
						//alert(errorList[0].message);
						// 0번째 에러 발생 항목에 포커스 지정
						//$(errorList[0].element).focus();

						swal({
							title: "에러",
							text: errorList[0].message,
							type: "error"
						}).then(function(result) {
							// 창이 닫히는 애니메이션의 시간이 있으므로,
							// 0.1초의 딜레이 적용 후 포커스 이동
							setTimeout(function() {
								$(errorList[0].element).val('');
								$(errorList[0].element).focus();
							}, 100);
						});

					} else if ('${tel}' != $('#tel').val()) {
						alert("기존 연락처를 확인해주세요.");

					} else {
						alert("연락처 변경완료");

					}
				}
			});
			

	

			/** form태그에 부여한 id속성에 대한 유효성 검사 함수 호출 */
			$("#edit_tel").validate({
				/** 입력검사 규칙 */
				rules: {
					// [비밀번호] 필수 + 글자수 길이 제한
					tel: {
						required: true,
						phone: true
					},
					tel_new: {
						required: true,
						phone: true
					}
				},
				/** 규칙이 맞지 않을 경우의 메시지 */
				messages: {
					tel: {
						required: "기존 연락처를 입력하세요.",
						phone: "연락처 형식이 잘못되었습니다."
					},
					tel_new: {
						required: "변경하실 연락처를 입력하세요.",
						phone: "연락처 형식이 잘못되었습니다."
					}
				}
			}); // end validate()
		}); // 변경 완료

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
							var exulaAddr = ''; // 참고항목 변수

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
									exulaAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									exulaAddr += (exulaAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (exulaAddr !== '') {
									exulaAddr = ' (' + exulaAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
							} else {
								document.getElementById("sample2_exulaAddress").value = '';
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