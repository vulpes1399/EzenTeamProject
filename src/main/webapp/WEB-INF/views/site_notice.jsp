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
    <h1>공지사항</h1>
  </div>
  <!-- 전체박스 -->
  <div class="collapse">
    <!-- 게시글 하나 단위 -->
  <div class='collapse-item'>
        <!-- 게시글 제목영역 -->
    <h2 class='collapse-title'><a href="#content1">대리구매 이용 자제를 당부드립니다.</a></h2>
        <!-- 게시글 내용영역 -->
    <div id="content1" class="content">대리구매 이용 시 사기 피해가 발생될 수 있으며, 개인 정보가 노출되어 악용될 수 있습니다. <br /> 대리구매로 발생되는 피해는 오버워치에서 책임지지 않사오니 이용 자제를 당부드립니다.</div>
  </div>
    <!-- 게시글 하나 단위 -->
  <div class='collapse-item'>
        <!-- 게시글 제목영역 -->
    <h2 class='collapse-title'><a href="#content2">후기 도용 관련 공지입니다.</a></h2>
        <!-- 게시글 내용영역 -->
    <div id="content2" class="content">타인의 후기를 도용하여 후기를 작성하는 사례들에 대한 신고가 들어오고 있습니다. <br /> 후기를 도용한 경우 해당 카테고리의 후기는 삭제되며, 1년 간 커뮤니티의 이용이 차단됩니다. <br /> 반드시 본인이 작성한 후기만을 등록해주시기 바랍니다.</div>
  </div>
    <!-- 게시글 하나 단위 -->
  <div class='collapse-item'>
        <!-- 게시글 제목영역 -->
    <h2 class='collapse-title'><a href="#content3">반송 정보 미입력 교환/환불 주문 자동 철회 안내</a></h2>
        <!-- 게시글 내용영역 -->
    <div id="content3" class="content">상품 교환/환불 요청 후 9일 이내에 반송 정보를 입력하지 않으실 경우 반품 접수 취소로 구분되어 교환/환불 요청이 자동으로 철회됩니다. <br /> 아래 일정을 확인하여 사이트 이용에 참고 부탁드립니다.  <br /> - 4월 2일 02시 30분 ~ 03시접수 철회 진행 > 주문 상태 구매 확정으로 전환</div>
  </div>
    <!-- 게시글 하나 단위 -->
  <div class='collapse-item'>
        <!-- 게시글 제목영역 -->
    <h2 class='collapse-title'><a href="#content4">반송 정보 미입력 교환/환불 주문 자동 철회 안내</a></h2>
        <!-- 게시글 내용영역 -->
    <div id="content4" class="content">상품 교환/환불 요청 후 9일 이내에 반송 정보를 입력하지 않으실 경우 반품 접수 취소로 구분되어 교환/환불 요청이 자동으로 철회됩니다. <br /> 아래 일정을 확인하여 사이트 이용에 참고 부탁드립니다.  <br /> - 4월 2일 02시 30분 ~ 03시접수 철회 진행 > 주문 상태 구매 확정으로 전환</div>
  </div>
  <!-- 게시글 하나 단위 -->
  <div class='collapse-item'>
    <!-- 게시글 제목영역 -->
<h2 class='collapse-title'><a href="#content5">대리구매 이용 자제를 당부드립니다.</a></h2>
    <!-- 게시글 내용영역 -->
<div id="content5" class="content">대리구매 이용 시 사기 피해가 발생될 수 있으며, 개인 정보가 노출되어 악용될 수 있습니다. <br /> 대리구매로 발생되는 피해는 오버워치에서 책임지지 않사오니 이용 자제를 당부드립니다.</div>
</div>
<!-- 게시글 하나 단위 -->
<div class='collapse-item'>
  <!-- 게시글 제목영역 -->
<h2 class='collapse-title'><a href="#content6">대리구매 이용 자제를 당부드립니다.</a></h2>
  <!-- 게시글 내용영역 -->
<div id="content6" class="content">대리구매 이용 시 사기 피해가 발생될 수 있으며, 개인 정보가 노출되어 악용될 수 있습니다. <br /> 대리구매로 발생되는 피해는 오버워치에서 책임지지 않사오니 이용 자제를 당부드립니다.</div>
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
      $(target).slideToggle(200);
            // 내용영역(.content)중에서
            // 클릭한 요소가 지정한 항목만 제외(not($(target)))
            // 하고 화면에서 숨긴다.
      $(".content").not($(target)).slideUp(100);
    });
  });
</script>
</body>
</html>