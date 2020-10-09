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
<link rel="stylesheet" href="assets/css/withdraw.css" />
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
			<h1>회원탈퇴</h1>
		</div>
		<form class="form-horizontal" name="withdraw" id="withdraw"
			action="${pageContext.request.contextPath}/withdraw_ok.do">
			<div id="withdraw_info">
				<div class="new_box">
					<input type="text" name="user_id" id="user_id" class="form-control"
						placeholder="아이디" /><br />
				</div>

				<div class="new_box">
					<input type="password" name="user_pw" id="user_pw"
						class="form-control" placeholder="비밀번호" />

				</div>
				<button type="submit" id="withdraw_button" value="회원탈퇴">회원탈퇴</button>

			</div>
		</form>

	</div>
	<!-- container 태그 끝 -->
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
	<script type=text/javascript>
	$(function() {
		$("#withdraw_button").click(function() {

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
						

					}else if(('${user_id}' != $('#user_id').val())||('${user_pw}' != $('#user_pw').val())){
						alert("아이디나 비밀번호를 확인하세요.");
						return false;
					} else {
						alert("회원탈퇴 완료");

					}
				}
			});

			$("#withdraw").validate({

				rules: {
					// [비밀번호] 필수 + 글자수 길이 제한
					user_id: {
						required: true
					},
					user_pw: {
						required: true,
					}
				},

				messages: {
					user_id: {
						required: "아이디를 입력하세요.",

					},
					user_pw: {
						required: "비밀번호를 입력하세요.",
					}
				}
			}); // end validate()
		});
	});
	</script>

</body>

</html>