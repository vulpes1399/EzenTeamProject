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
  <link rel="stylesheet" href="assets/css/my_page_info.css" />
  <link rel="stylesheet" href="assets/css/navi.css">
      <link rel="stylesheet" href="assets/css/modal.css" >

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

</head>

<body>
  <%@ include file="inc/top_navi.jsp"%>
  <div id="container">
    <div id="header">
      <h1>회원정보조회</h1>
    </div>
    <form class="form-horizontal" name="join_form" id="join_form">
			<div class="form-group">
				<div class="col-md-10">
					<input type="text" name="user_id" id="user_id" class="form-control"
						placeholder="${user_id}" readonly/>
				</div>
			</div>

			<div class="form-group">
				<div class="col-md-10">
					<input type="text" name="user_name" id="user_name"
						class="form-control" placeholder="${user_name}" readonly/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-10">
					<input type="email" name="email" id="email" class="form-control"
						placeholder="${output.email}" readonly/>
				</div>
			</div>

			<div class="form-group">
				<div class="col-md-10">
					<input type="tel" name="tel" id="tel" class="form-control"
						placeholder="${output.tel}" readonly/>
				</div>
			</div>


			<div class="form-group">
				<div class="col-md-10">
					<input type="text" name="user_postcode" id="sample2_postcode"
						class="form-control" placeholder="${output.postcode}" readonly />
				</div>
			</div>
			<div id="input_address" class="form-group">

				<div class="col-md-10">
					<input type="text" name="user_address" id="sample2_address"
						class="form-control" placeholder="${output.addr1}" readonly />
				</div>
			</div>
			<div id="input_detail_address" class="form-group">

				<div class="col-md-10">
					<input type="text" name="user_detail_address"
						id="sample2_detailAddress" class="form-control" placeholder="${output.addr2}" readonly/>
				</div>

			</div>
			<div id="layer"
				style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
				<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
					id="btnCloseLayer"
					style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
					onclick="closeDaumPostcode()" alt="닫기 버튼">
			</div>
	<div id="last_btn" class="clear">
    <a href="${pageContext.request.contextPath}/my_page_update.do">
      <button type="button" id="info_update" class="last_select">회원정보수정</button></a>
      <a href="${pageContext.request.contextPath}/withdraw.do">
				<button type="button" id="withdraw" class="last_select">회원탈퇴</button></a>
			</div>
		</form>
		
  </div>

	<%@ include file="inc/footer.jsp"%>
  <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="assets/js/common.js"></script>
 
</body>

</html>