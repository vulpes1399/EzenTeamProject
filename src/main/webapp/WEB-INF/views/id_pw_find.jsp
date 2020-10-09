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
<link rel="stylesheet" href="assets/css/id_pw_find.css" />
<link rel="stylesheet" href="assets/css/navi.css">
<link rel="stylesheet" href="assets/css/modal.css">
<link rel="stylesheet"
	href="assets/plugins/sweetalert/sweetalert2.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">


</head>

<body>

	<%@ include file="inc/top_navi.jsp"%>

		<iframe src="#" name="iframe"
		style="width: 1px; height: 1px; border: 0; visibility: hidden;"></iframe>
	<div id="container">

		<div id="header">
			<h1>${result}</h1>
		</div>

		<form id="id-tap" method="post">

			<h2>아이디 찾기</h2>
			<div class="find_box">
				<div class="new_box">
					<input type="text" name="user_name" id="user_name"
						class="form-control" placeholder="이름" />
				</div>
				<div class="new_box">
					<input type="email" name="email" id="email" class="form-control"
						placeholder="이메일" />
				</div>
				<button id="button_id" class="confirm_button">아이디찾기</button>
			</div>
		</form>



		<form id="pw-tap">
			<h2>비밀번호 찾기</h2>
			<div class="find_box">

				<div class="new_box">
					<input type="text" name="user_id" id="user_id" class="form-control"
						placeholder="아이디" />
				</div>
				<div class="new_box">
					<input type="text" name="email2" id="email2"
						class="form-control" placeholder="이메일" />
				</div>
				<button id="button_pw" class="confirm_button">비밀번호
					찾기</button>


			</div>
		</form>
	</div>
	

	<!-- container 끝-->
<script src="assets/plugins/sweetalert/sweetalert2.min.js"></script>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
	<script src="assets/js/common.js"></script>
	<script type="text/javascript">
		$("#button_id").click(function() {
			var fid = "";
			if($('#user_name').val()==''){
				alert("이름을 입혁하세요.")
					location.reload();
				return false;
			}
			if($('#email').val()==''){
				alert("이메일을 입혁하세요.")
					location.reload();
				return false;
			}
			
			$.ajax({
				type : "post",
				url : "id_find_ok.do",
				data : {
					"user_name" : $("#user_name").val(),
					"email" : $("#email").val()
				}
			}).then(function(req) {
				fid=req;
				if(fid==false){
					alert("입력한 값을 확인하세요.");
					location.reload();
				}else{
				alert("아이디는 "+fid+" 입니다.");
				location.reload();
				}
			});

		});

		$("#button_pw").click(function() {
			var fpw = "";
			if($('#user_id').val()==''){
				alert("아이디를 입혁하세요.")
					location.reload();
				return false;
			}
			if($('#email2').val()==''){
				alert("이메일을 입혁하세요.")
					location.reload();
				return false;
			}
			
			$.ajax({
				type : "post",
				url : "pw_find_ok.do",
				data : {
					"user_id" : $("#user_id").val(),
					"email2" : $("#email2").val()
				}
			}).then(function(req) {
				fpw=req;
				if(fpw==false){
					alert("입력한 값을 확인하세요.");
					location.reload();
				}else{
				alert("비밀번호는는 "+fpw+" 입니다.");
				location.reload();
				}
			});

		});
	</script>
	<%@ include file="inc/footer.jsp"%>
</body>

</html>