<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE-edge" />
  <meta name="viewport"
    content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
  <title>OVERWATCH</title>
  <link rel="stylesheet" href="assets/css/common.css" />
  <link rel="stylesheet" href="assets/css/my_page_main.css" />
  <link rel="stylesheet" href="assets/css/navi.css">
      <link rel="stylesheet" href="assets/css/modal.css" >
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

</head>

<body>
 <%@ include file="inc/top_navi.jsp"%>
  <div id="container">
    <div id="header">
            <h1>My Page</h1>
        </div>

     <div id="user_top" class="clear">
            <div id="user_wellcome">
                <p><span>"${user_name}"</span>님 환영합니다.</p>
            </div>
            <div id="user_info_check">
            
                <a href="${pageContext.request.contextPath}/my_page_info.do"><button id="user_info_link">회원정보</button></a>
            </div>
        </div>

        <div id="my_page_menu" class="clear">
          <ul id="my_page_group" class="clear">
            <li>
             <div class="my_page_btn">
              <a href="${pageContext.request.contextPath}/my_delivery.do">
               <i class="fas fa-shipping-fast fa-2x"></i>
                <span>배송조회</span>
              </a>
              </div>
            </li>
            <li>
                 <div class="my_page_btn">
              <a href="${pageContext.request.contextPath}/my_order.do">
                <i class="fas fa-file-alt fa-2x"></i>
                <span>구매내역</span>
              </a>
              </div>
            </li>
            <li>
            <div class="my_page_btn">
              <a href="${pageContext.request.contextPath}/basket.do">
                <i class="fas fa-shopping-cart fa-2x"
                    style="position: relative; right: 1px;"></i>
                    <span>장바구니</span>
              </a>
              </div>
            </li>
            <li>
            <div class="my_page_btn">
              <a href="${pageContext.request.contextPath}/inq_list.do">
                <i class="fas fa-edit fa-2x"
                    style="position: relative; left: 5px;"></i>
                    <span>문의사항</span>
              </a>
              </div>
            </li>
            <li>
            <div class="my_page_btn">
              <a href="#">
                <i class="fas fa-bullhorn fa-2x"></i>
                <span>공지사항</span>
              </a>
              </div>
            </li>
            <li>
                 <div class="my_page_btn">
              <a href="#">
                <i class="fas fa-question-circle fa-2x"></i>
             
                <span>FAQ</span>
              </a>
              </div>
            </li>
            </ul>
        </div>

  </div>
	<%@ include file="inc/footer.jsp"%>
  <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="assets/js/common.js"></script>
</body>

</html>

