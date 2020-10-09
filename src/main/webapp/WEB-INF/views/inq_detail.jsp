<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<link href="${pageContext.request.contextPath}/assets/css/common.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/assets/css/detail.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/assets/css/navi.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/modal.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="sytlesheet"
	href="assets/plugins/superslides/stylesheets/superslides.css" />
</head>
<body>
	<%@ include file="inc/top_navi.jsp"%>
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
	<div id="buttons">
	
			<%-- 조회결과가 없는 경우 --%>
			
			
			<a href="${pageContext.request.contextPath}/inq_list.do" id="li">목록보기</a>
			
			<c:if test="${user_no==output.members_user_no}">
			<a href="${pageContext.request.contextPath}/inq_edit.do?inq_bbs_no=${output.inq_bbs_no}" id="ed">글 수정</a>
			<a href="${pageContext.request.contextPath}/inq_delete_ok.do?inq_bbs_no=${output.inq_bbs_no}" id="de">글 삭제</a>	
		
			</c:if>
			
	</div>
	<%@ include file="inc/footer.jsp"%>
</body>
</html>