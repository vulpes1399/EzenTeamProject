<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE-edge" />
  <meta name="viewport"
    content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
  <title>OVERWATCH</title>

   <link href="${pageContext.request.contextPath}/assets/css/common.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/assets/css/detail.css" rel="stylesheet" />
   <link href="${pageContext.request.contextPath}/assets/css/navi.css" rel="stylesheet" >
   <link href="${pageContext.request.contextPath}/assets/css/modal.css" rel="stylesheet" >
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
  	<link rel="stylesheet"
	href="assets/plugins/sweetalert/sweetalert2.min.css" />
</head>
<body>
<%@ include file="inc/top_navi.jsp"%>
<div id="container">
	<h2 id="title">작성한 게시글</h2>
	<div id="format">
	<p id="wr">작성자: ${output.writer}</p>
	<hr>
	<br>
	<p id="co">내용: ${output.content}</p>
	<br>
	</div>
	<hr>
	<br>
	<br>
	
							<c:url value="/item_details.do" var="viewUrl">
								<c:param name="prod_no" value="${output.product_prod_no}" />
							</c:url>
							
	<div id="buttons">
	<a href="${viewUrl}" id="li">목록보기</a>
	<a href="${pageContext.request.contextPath}/epil_add.do?dw=${output.product_prod_no}" id="ad">게시글 추가</a>
	<a href="${pageContext.request.contextPath}/epil_edit.do?epil_bbs_no=${output.epil_bbs_no}" id="ed" class="hidbtn">글 수정</a>
	</div>
	<form action="${pageContext.request.contextPath}/epil_delete_ok.do?epil_bbs_no=${output.epil_bbs_no}" id="fo">
	<input type="text" id="product_prod_no" name="product_prod_no" value="${output.product_prod_no}" style="display: none">
	<input type="text" id="epil_bbs_no" name="epil_bbs_no" value="${output.epil_bbs_no}" style="display: none">
	<button type="submit" id="de" class="hidbtn">글 삭제</button>
	</form>
	</div>
	<div>
		<%@ include file="inc/footer.jsp"%>
		</div>
		
		<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
			<script src="assets/plugins/sweetalert/sweetalert2.min.js"></script>
	<script src="assets/js/common.js"></script>
	<script>
	$('#ad').click(function() {
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
	});
	
	window.onload = function () {
		var un = '${user_no}';
		var bun= '${output.members_user_no}';
		if(un!=bun || un==null){
			$('.hidbtn').hide();
		}
	}

	</script>
</body>
</html>