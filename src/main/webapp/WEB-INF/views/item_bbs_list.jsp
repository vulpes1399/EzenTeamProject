<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE-edge" />
  <meta name="viewport"
    content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
  <title>OVERWATCH</title>

   <link href="${pageContext.request.contextPath}/assets/css/common.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/assets/css/write_board.css" rel="stylesheet" />
   <link href="${pageContext.request.contextPath}/assets/css/navi.css" rel="stylesheet" >
   <link href="${pageContext.request.contextPath}/assets/css/modal.css" rel="stylesheet" >
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
  <link rel="stylesheet"
	href="assets/plugins/sweetalert/sweetalert2.min.css" />
</head>
<body>
	<div id="container">
	<!-- 조회 결과 목록 -->
	<br>
	<br>
	<table id="table">
		<thead>
			<tr>
				<th width="200" align="center" id="wri">작성자</th>
				<th width="400" align="center" id="tit">제목</th>
			</tr>
		</thead>
		
		<tbody>
			<c:choose>
                <%-- 조회결과가 없는 경우 --%>
                <c:when test="${output3 == null || fn:length(output3) == 0}">
                    <tr>
                        <td colspan="3" align="center">조회결과가 없습니다.</td>
                    </tr>
                </c:when>
                <%-- 조회결과가 있는  경우 --%>
                <c:otherwise>
                    <%-- 조회 결과에 따른 반복 처리 --%>
                    <c:forEach var="item" items="${output3}" varStatus="status">
                        <%-- 출력을 위해 준비한 작성자 이름과 제목 --%>
                        <c:set var="writer" value="${item.writer}" />
                        <c:set var="subject" value="${item.subject}" />
                        
                        
                        
                        <%-- 상세페이지로 이동하기 위한 URL --%>
                        <c:url value="/item_bbs_detail.do" var="viewUrl">
                            <c:param name="item_inq_no" value="${item.item_inq_no}" />
                        </c:url>
                        
                        <tr>
                            <td align="center" class="col">${writer}</td>
                            <td align="center" class="col"><a href="${viewUrl}">${subject}</a></td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
		</tbody>
	</table>
	<form action="${pageContext.request.contextPath}/item_bbs_add.do">
	<input type="text" id="wd" name="wd" value="${output.prod_no}" style="display: none">
	<button type="submit" id="but2">글쓰기</button>
	</form>
	
	</div>
	
	<div id="fom">

	
	<!-- 페이지 번호 구현 -->
	<%-- 이전 그룹에 대한 링크 --%>
	<c:choose>
		<%-- 이전 그룹으로 이동 가능하다면? --%>
		<c:when test="${pageData.prevPage > 0}">
			<%-- 이동할 URL 생성 --%>
			<c:url value="/item_bbs_list.do" var="prevPageUrl">
				<c:param name="page" value="${pageData.prevPage}" />
				<c:param name="keyword" value="${keyword}" />
			</c:url>
			<a href="${prevPageUrl}">이전</a>
		</c:when>
		<c:otherwise>
			[이전]
		</c:otherwise>
	</c:choose>
	
	<%-- 페이지 번호 (시작 페이지부터 끝 페이지까지 반복) --%>
	<c:forEach var="i" begin="${pageData.startPage}" end="${pageData.endPage}" varStatus="status">
		<%-- 이동할 URL 생성 --%>
		<c:url value="/item_bbs_list.do" var="pageUrl">
			<c:param name="page" value="${i}" />
			<c:param name="keyword" value="${keyword}" />
		</c:url>
		
		<%-- 페이지 번호 출력 --%>
		<c:choose>
			<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
			<c:when test="${pageData.nowPage == i}">
				<strong>[${i}]</strong>
			</c:when>
			<%-- 나머지 페이지의 경우 링크 적용함 --%>
			<c:otherwise>
				<a href="${pageUrl}">[${i}]</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<%-- 다음  그룹에 대한 링크 --%>
	<c:choose>
	<%-- 다음 그룹으로 이동 가능하다면? --%>
		<c:when test="${pageData.nextPage > 0}">
			<%-- 이동할 URL 생성 --%>
			<c:url value="/item_bbs_list.do" var="nextPageUrl">
				<c:param name="page" value="${pageData.nextPage}" />
				<c:param name="keyword" value="${keyword}" />
			</c:url>
			<a href="${nextPageUrl}">다음</a>
		</c:when>
		<c:otherwise>
			[다음]
		</c:otherwise>
	</c:choose>
	</div>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="assets/plugins/sweetalert/sweetalert2.min.js"></script>
  <script src="assets/js/common.js"></script>
  <script>
  $('#but2').click(function() {
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
  </script>
</body>
</html>