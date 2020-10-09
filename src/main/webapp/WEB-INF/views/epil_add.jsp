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
  <link href="${pageContext.request.contextPath}/assets/css/write.css" rel="stylesheet" />
   <link href="${pageContext.request.contextPath}/assets/css/navi.css" rel="stylesheet" >
   <link href="${pageContext.request.contextPath}/assets/css/modal.css" rel="stylesheet" >
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
  <link rel="sytlesheet" href="assets/plugins/superslides/stylesheets/superslides.css" />
</head>
<body>
<%@ include file="inc/top_navi.jsp"%>
<div id="container">
	<form method="post" action="${pageContext.request.contextPath}/epil_add_ok.do">
		
		<br>
		<div>
		<label>글 제목</label>
		<input type="text" id="subject" name="subject" placeholder="제목을 쓰세요." maxlength="50" />
		</div>
		<br>
		<div>
		<label>작성자</label>
		<input type="text" id="writer" name="writer" placeholder="이름을 쓰세요." maxlength="50" />
		</div>
		<br>
		<div>
		<label>글 내용</label>
		<input type="text" placeholder="내용을 쓰세요" id="content" name="content" maxlength="2048">
		</div>
		<input type="text"  id="product_prod_no" name="product_prod_no" value="${product_prod_no}" style="display: none">
	<br>
	<div id="bottom">
		<button type="submit" id="button1">저장하기</button>
		<button type="reset" id="button2">다시작성</button>
	</div>
	</form>
	</div>
		<%@ include file="inc/footer.jsp"%>
</body>
</html>