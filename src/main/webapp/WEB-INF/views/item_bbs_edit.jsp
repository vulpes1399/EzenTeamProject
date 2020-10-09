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
  <link href="${pageContext.request.contextPath}/assets/css/edit.css" rel="stylesheet" />
   <link href="${pageContext.request.contextPath}/assets/css/navi.css" rel="stylesheet" >
   <link href="${pageContext.request.contextPath}/assets/css/modal.css" rel="stylesheet" >
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
  <link rel="sytlesheet" href="assets/plugins/superslides/stylesheets/superslides.css" />
</head>
<body>
<%@ include file="inc/top_navi.jsp"%>
	<h2>게시물 수정</h2>
	<br>
	<hr>
	<br>
	<form method="post" action="${pageContext.request.contextPath}/item_bbs_edit_ok.do">
		<% /* action 페이지에서 사용할 WHERE 조건값을 hidden 필드로 숨겨서 전송한다. */ %>
		<input type="hidden" name="item_inq_no" value="${output.item_inq_no}" />
		<div>
			<label for="subject">제목: </label>
			<input type="text" name="subject" id="subject" value="${output.subject}" />
		</div>
		<br>
		<hr>
		<br>
		<div>
			<label for="content">내용: </label>
			<input type="text" name="content" id="content" value="${output.content}" />
		</div>
		<br>
		<hr>
		<br>
		<div id="buts">
		<button type="submit" id="su">저장하기</button>
		<button type="reset" id="re">다시작성</button>
		</div>
	</form>
	 	<%@ include file="inc/footer.jsp"%>
</body>
</html>