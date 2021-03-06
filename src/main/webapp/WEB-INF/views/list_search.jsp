<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/list_commmos1.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/modal.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/navi.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<style type="text/css">
#search_words h3 {
	text-indent: 10px;
	color: #464646;
	padding-bottom: 3px;
}

#search_keyword {
	color: #db7f41;
}

#recomand_result hr {
	display: block;
	height: 1px;
	background-color: #db7f41;
	border: none;
}

#search_words {
padding: 10px 0 10px 0;
}
</style>
</head>

<body>

	<%@ include file="inc/top_navi.jsp"%>
	<div id="container">
		<div id="header">
			<h1>검색결과</h1>
		</div>
		<div id="naman">
			<a href="#" id="modal-open">My Watch</a>
		</div>
		<!------------------------------------헤더 끝--------------------------------------------->

		<div id="search_words">
			<h3>
				<span id="search_keyword">'${keyword}'</span>대한 검색 결과입니다.
			</h3>

		</div>
		<hr />
		<!------------------------------------헤더 끝--------------------------------------------->


<div id="content_body" class="clear">
			<ul id="gallery" class="clear">

				<c:choose>
					<%-- 조회결과가 없는 경우 --%>
					<c:when test="${output == null || fn:length(output) == 0}">
						<tr>
							<td align="center">조회결과가 없습니다.</td>
						</tr>
					</c:when>
					<%-- 조회결과가 있는  경우 --%>
					<c:otherwise>
						<%-- 조회 결과에 따른 반복 처리 --%>
						<c:forEach var="item" items="${output}" varStatus="status">
							<%-- 출력을 위해 준비한 학과이름과 위치 --%>
							<c:set var="prod_name" value="${item.prod_name}" />
							<c:set var="prod_price" value="${item.prod_price}" />
							<c:set var="origin_name" value="${item.origin_name}" />
							<c:set var="file_path" value="${item.file_path}" />

							<%-- 검색어가 있다면? --%>
							<c:if test="${keyword != ''}">
								<%-- 검색어에 <mark> 태그를 적용하여 형광팬 효과 준비 --%>
								<c:set var="mark" value="<mark>${keyword}</mark>" />
								<%-- 출력을 위해 준비한 학과이름과 위치에서 검색어와 일치하는 단어를 형광팬 효과로 변경 --%>
								<c:set var="prod_name" value="${fn:replace(prod_name, keyword, mark)}" />
							</c:if>


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
	<div id="paging">
		<!-- 페이지 번호 구현 -->
		<%-- 이전 그룹에 대한 링크 --%>
		<c:choose>
			<%-- 이전 그룹으로 이동 가능하다면? --%>
			<c:when test="${pageData.prevPage > 0}">
				<%-- 이동할 URL 생성 --%>
				<c:url value="list_search.do" var="prevPageUrl">
					<c:param name="page" value="${pageData.prevPage}" />
				</c:url>
				<a href="${prevPageUrl}"><i class="fas fa-chevron-left"></i></a>
			</c:when>
			<c:otherwise>
				<i class="fas fa-chevron-left"></i>
			</c:otherwise>
		</c:choose>
		<%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
		<c:forEach var="i" begin="${pageData.startPage}"
			end="${pageData.endPage}" varStatus="status">
			<%-- 이동할 URL 생성 --%>
			<c:url value="list_search.do" var="pageUrl">
				<c:param name="page" value="${i}" />
			</c:url>

			<%-- 페이지 번호 출력 --%>
			<c:choose>
				<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
				<c:when test="${pageData.nowPage == i}">
					<strong>${i}</strong>
				</c:when>
				<%-- 나머지 페이지의 경우 링크 적용함 --%>
				<c:otherwise>
					<a href="${pageUrl}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<%-- 다음 그룹에 대한 링크 --%>
		<c:choose>
			<%-- 다음 그룹으로 이동 가능하다면? --%>
			<c:when test="${pageData.nextPage > 0}">
				<%-- 이동할 URL 생성 --%>
				<c:url value="list_search.do" var="nextPageUrl">
					<c:param name="page" value="${pageData.nextPage}" />
				</c:url>
				<a href="${nextPageUrl}" id="next"><i
					class="fas fa-chevron-right"></i></a>
			</c:when>
			<c:otherwise>
				<i class="fas fa-chevron-right"></i>
			</c:otherwise>
		</c:choose>
	</div>
	<!-----------------------------------페이징 끝------------------------------------------------------->
	<%@ include file="inc/footer.jsp"%>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/common.js"></script>

</body>

</html>