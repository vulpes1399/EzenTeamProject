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
  <link rel="stylesheet" href="assets/css/write_item.css" />
  <link rel="stylesheet" href="assets/css/navi.css" >
      <link rel="stylesheet" href="assets/css/modal.css" >
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
  <link rel="stylesheet" href="assets/css/borad.css" />

</head>

<body>
 <%@ include file="inc/top_navi.jsp"%>

<div id="container">
  <div id="header">
    <h1>FAQ</h1>
  </div>
  <!-- 전체박스 -->
  <div class="collapse">
    <!-- 게시글 하나 단위 -->
  <div class='collapse-item'>
        <!-- 게시글 제목영역 -->
    <h2 class='collapse-title'><a href="#content1">회원탈퇴 방법은 어떻게 되나요?</a></h2>
        <!-- 게시글 내용영역 -->
    <div id="content1" class="content">마이페이지 > 회원정보에서 가능합니다.</div>
  </div>
    <!-- 게시글 하나 단위 -->
  <div class='collapse-item'>
        <!-- 게시글 제목영역 -->
    <h2 class='collapse-title'><a href="#content2">배송은 얼마나 걸리나요?</a></h2>
        <!-- 게시글 내용영역 -->
    <div id="content2" class="content">평균 배송일은 당일 출고 기준일 1~2일 소요됩니다.<br /> 산간지역 및 제주도는 배송일이 더 소요됩니다.</div>
  </div>
    <!-- 게시글 하나 단위 -->
  <div class='collapse-item'>
        <!-- 게시글 제목영역 -->
    <h2 class='collapse-title'><a href="#content3">회원정보 수정 방법은?</a></h2>
        <!-- 게시글 내용영역 -->
    <div id="content3" class="content">마이페이지 > 회원정보에서 가능합니다.</div>
  </div>
    <!-- 게시글 하나 단위 -->
  <div class='collapse-item'>
        <!-- 게시글 제목영역 -->
    <h2 class='collapse-title'><a href="#content4">고객센터 시간 어떻게 되나요?</a></h2>
        <!-- 게시글 내용영역 -->
    <div id="content4" class="content">오전 9시 ~ 오후 6시 입니다. <br /> 점심시간(12:00 ~ 13:00) 제외</div>
  </div>
  <!-- 게시글 하나 단위 -->
  <div class='collapse-item'>
    <!-- 게시글 제목영역 -->
<h2 class='collapse-title'><a href="#content5">교환/환불은 어떻게 진행하나요?</a></h2>
    <!-- 게시글 내용영역 -->
<div id="content5" class="content">마이페이지에서 구매내역을 통해 진행할 수 있습니다.</div>
</div>
<!-- 게시글 하나 단위 -->
<div class='collapse-item'>
  <!-- 게시글 제목영역 -->
<h2 class='collapse-title'><a href="#content6">배송되었는데 교환하거나 환불하고 싶어요.</a></h2>
  <!-- 게시글 내용영역 -->
<div id="content6" class="content">상품이 배송된 이후에는 교환/환불이 어렵습니다. <br /> 상품을 받으신 후 교환/환분을 진행해주셔야 합니다.</div>
</div>

  </div>
  </div>

  <!-- container 태그 끝 -->
	<%@ include file="inc/footer.jsp"%>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="assets/js/common.js"></script>
<script type="text/javascript">

  $(function() {
        /** 게시글의 제목을 클릭한 경우 호출되는 이벤트 정의 */
    $(".collapse-title a").click(function(e) {
            // 링크의 기본 동작(페이지 이동) 방지
      e.preventDefault();

            // 클릭한 요소의 href 속성을 가져온다 --> 내용영역의 id
      var target = $(this).attr('href');
            // 가져온 내용영역의 id를 화면에 표시한다.
      $(target).slideToggle(100);
            // 내용영역(.content)중에서
            // 클릭한 요소가 지정한 항목만 제외(not($(target)))
            // 하고 화면에서 숨긴다.
      $(".content").not($(target)).slideUp(100);
    });
  });
</script>
</body>
</html>