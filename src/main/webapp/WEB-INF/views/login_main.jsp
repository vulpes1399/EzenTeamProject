<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE-edge" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>OVERWATCH</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navi.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login_main.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/modal.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<script src="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.js"></script>
</head>

<body>
 <%@ include file="inc/top_navi.jsp"%>
	<div id="container" class="clear">
		<div id="header">
			<h1>Login</h1>
		</div>
		<!-- login box -->
		<form name="login" id=login_f class="form_horizontal" action="home" method="post">
			<!-- ID text box -->
			<div class="new_box">
			<input type="text" id="user_id" name="user_id" class="form_control id_control"
				placeholder="아이디를 입력하세요"> <br>
				</div>
			<!-- PW text box -->
			<div class="new_box">
			<input type="password" id="user_pw" name="user_pw" class="form_control pw_control"
				placeholder="비밀번호를 입력하세요">
				</div>
			<!-- login button -->
			<input type="submit" name="to_submit" class="btn btn-primary" id="submit_btn" value="로그인">
		</form>
		<ul id="join_find_link" class="clear">
			<li id="sign_up_link" class="join_link"><a href="${pageContext.request.contextPath}/sign_up.do">회원가입</a></li>
			<li id="id_pw_link" class="join_link"><a
				href="${pageContext.request.contextPath}/id_pw_find.do">아이디/비밀번호 찾기</a></li>
		</ul>
	</div>
	<%@ include file="inc/footer.jsp"%>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="assets/js/common.js"></script>
	<script src="${pageContext.request.contextPath}/assets/plugins/validate/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/plugins/validate/additional-methods.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
	<script>
		$(function(){
			$("#submit_btn").click(function(e){
				e.preventDefault();
				var id_val = $("#user_id").val();
				var pw_val = $("#user_pw").val();

				if (!id_val || !pw_val) {
					swal({
	                    html: "<b>아이디 또는 비밀번호를 확인해주세요.</b>",    // 내용
	                    type: "error",  // 종류
	                    confirmButtonText: "확인", // 확인버튼 표시 문구
	                    confirmButtonColor: "#db7f41", // 확인버튼 색상
	                });
					return false;
				}

				$.post('login_main.do',{user_id:id_val, user_pw:pw_val},function(req){
				    if(req == '1'){
                    	$(location).attr('href','home');
                    }else{
                    	swal({
    	                    html: "<b>아이디 또는 비밀번호를 확인해주세요.</b>",    // 내용
    	                    type: "error",  // 종류
    	                    confirmButtonText: "확인", // 확인버튼 표시 문구
    	                    confirmButtonColor: "#db7f41", // 확인버튼 색상
    	                });
                    }
                })
			})
		})
	</script>
</body>
</html>