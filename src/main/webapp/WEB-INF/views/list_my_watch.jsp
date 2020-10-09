<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
    <link rel="stylesheet" href="assets/css/common.css">
    <link rel="stylesheet" href="assets/css/navi.css">
      <link rel="stylesheet" href="assets/css/modal.css" >
    <link rel="stylesheet" href="assets/css/list_commmos1.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <style type="text/css">
      #recomand_result h3 {
          text-indent: 5px;
          color: #464646;
          padding-bottom: 3px;
      }
  
      #recomand_notice {
          color: #db7f41;
          padding:10px 0 10px 0;
      }
  
      #recomand_result hr {
          display: block;
          height: 1px;
          background-color: #db7f41;
          border: none;
      }
    </style>
</head>

<body>
 <%@ include file="inc/top_navi.jsp"%>
  <div id="container">
    <div id="header">
      <h1>나만의 시계</h1>
    </div>
    
    <div id="naman">
      <a href="#" id="modal-open">My Watch</a>
    </div>
        <div id="recomand_result">
            <h2>시계를 <span id="recomand_notice">추천</span> 드립니다!</h2>
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
            <hr />
        </div>
   </div>
    <!-----------------------------------페이징 끝------------------------------------------------------->

	<%@ include file="inc/footer.jsp"%>
  <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="assets/js/list_commons.js"></script>
  <script src="assets/js/common.js"></script>
  

</body>

</html>