
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
<link rel="stylesheet" href="assets/css/index.css" />
<link rel="stylesheet" href="assets/css/navi.css">
<link rel="stylesheet" href="assets/css/modal.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="sytlesheet"
	href="assets/plugins/superslides/stylesheets/superslides.css" />
	<link rel="stylesheet"
	href="assets/plugins/sweetalert/sweetalert2.min.css" />
</head>

<body>
	<%@ include file="inc/top_navi.jsp"%>

	<!-- 내용 영역 -->
	<div id="container">
		<div id="slide-container">
			<div id="slides">
				<ul class="slides-container">
					<!-- 슬라이드 1 -->
					<li>
						<div class="slide-contents">
							<div class="slide-contents-cell">
								<h1>슬라이드 제목</h1>
								<p>슬라이드 내용</p>
							</div>
						</div> <img src="assets/img/slideex1.jpg" />
					</li>
					<!-- 슬라이드 2 -->
					<li>
						<div class="slide-contents">
							<div class="slide-contents-cell">
								<h1>슬라이드 제목</h1>
								<p>슬라이드 내용</p>
							</div>
						</div> <img src="assets/img/slideex2.jpg" />
					</li>
					<!-- 슬라이드 3 -->
					<li>
						<div class="slide-contents">
							<div class="slide-contents-cell">
								<h1>슬라이드 제목</h1>
								<p>슬라이드 내용</p>
							</div>
						</div> <img src="assets/img/slideex3.jpg" />
					</li>
				</ul>
			</div>
		</div>

		<!-- 목록페이지 이동 버튼 -->
		<div id="tab">
			<ul class="clear">
				<li class="activebtn"><a
					href="${pageContext.request.contextPath}/list_best.do"><strong>Best</strong></a>
				</li>

				<li class="activebtn"><a
					href="${pageContext.request.contextPath}/list_new.do"><strong>New</strong></a>
				</li>

				<li class="activebtn"><a
					href="${pageContext.request.contextPath}/list_man.do"><strong>Man</strong></a>
				</li>

				<li class="activebtn"><a
					href="${pageContext.request.contextPath}/list_woman.do"><strong>Woman</strong></a>
				</li>
			</ul>
		</div>

		<!-- gallery 시작 -->
		<hr/>
		<h2>
			<a id="besthead" href="${pageContext.request.contextPath}/list_best.do">
				Best Item </a>
		</h2>
		<hr/>
		<div class="content_body clear">
			<ul class="gallery clear">

				<c:choose>
					<%-- 조회결과가 없는 경우 --%>
					<c:when test="${output == null}">
						<tr>
							<td align="center">조회결과가 없습니다.</td>
						</tr>
					</c:when>
					<%-- 조회결과가 있는  경우 --%>
					<c:otherwise>
						<%-- 조회 결과에 따른 반복 처리 --%>
						<c:forEach var="item" items="${output}" begin="0" end="3"
							varStatus="status">
							<%-- 출력을 위해 준비한 학과이름과 위치 --%>
							<c:set var="prod_name" value="${item.prod_name}" />
							<c:set var="prod_price" value="${item.prod_price}" />
							<c:set var="origin_name" value="${item.origin_name}" />
							<c:set var="file_path" value="${item.file_path}" />


							<%-- 상세페이지로 이동하기 위한 URL --%>
							<c:url value="/item_details.do" var="viewUrl">
								<c:param name="prod_no" value="${item.prod_no}" />
							</c:url>

							<li><a href="${viewUrl}"> <span class="thumb"><img
										src="${pageContext.request.contextPath}/assets/img/${item.origin_name}"
										alt="이미지1" /></span> <span class="text">${item.prod_name}</span> <span
									class="price">${item.prod_price}</span>
							</a></li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<hr />
		<h2>
			<a id="newhead" href="${pageContext.request.contextPath}/list_new.do">
				New Item </a>
		</h2>
		<hr/>
		<div class="content_body clear">
			<ul class="gallery clear">
				<c:choose>
					<%-- 조회결과가 없는 경우 --%>
					<c:when test="${output == null}">
						<div>
							<div align="center">조회결과가 없습니다.</div>
						</div>
					</c:when>
					<%-- 조회결과가 있는  경우 --%>
					<c:otherwise>
						<%-- 조회 결과에 따른 반복 처리 --%>
						<c:forEach var="item" items="${output1}" begin="0" end="3"
							varStatus="status">
							<%-- 출력을 위해 준비한 학과이름과 위치 --%>
							<c:set var="prod_name" value="${item.prod_name}" />
							<c:set var="prod_price" value="${item.prod_price}" />


							<c:set var="origin_name" value="${item.origin_name}" />
							<c:set var="file_path" value="${item.file_path}" />


							<%-- 상세페이지로 이동하기 위한 URL --%>
							<c:url value="/item_details.do" var="viewUrl">
								<c:param name="prod_no" value="${item.prod_no}" />
							</c:url>

							<li><a href="${viewUrl}"> <span class="thumb"><img
										src="${pageContext.request.contextPath}/assets/img/${item.origin_name}"
										alt="이미지1" /></span> <span class="text">${item.prod_name}</span> <span
									class="price">${item.prod_price}</span>
							</a></li>
						</c:forEach>
					</c:otherwise>
				</c:choose>

			</ul>
		</div>
	</div>

	<%@ include file="inc/footer.jsp"%>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="assets/js/common.js"></script>
	<script src="assets/plugins/superslides/jquery.easing.1.3.js"></script>
	<script src="assets/plugins/superslides/jquery.superslides.min.js"></script>

	<script src="assets/plugins/sweetalert/sweetalert2.min.js"></script>


	<script>
		/** 슬라이드 */
		$(function() {
			$('#slides').superslides({
				inherit_width_from : '#slide-container',
				inherit_height_from : '#slide-container',
				play : 4000,
				animation : 'slide'
			});
		});
	</script>
</body>

</html>