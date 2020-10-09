<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<link rel="stylesheet"
	href="assets/plugins/sweetalert/sweetalert2.min.css" />
<div id="modal-layer"></div>
<!-- 모달 뒷 배경 -->
<div class="overlay hidden"></div>
<!-- 네비 뒷 배경 -->
<!-- header 바 -->
<div id="bar" class="clear">
	<h1>
		<a href="${pageContext.request.contextPath}" id="logo">OVERWATCH</a>
	</h1>

	<a href="#" id="btn_link" class="clear"> <span id="btn_navi"><i
			class="fa fa-bars fa-2x"></i></span>
	</a>
</div>
<div id="gra"></div>

<!-- navi -->
<div id="navi">

	<div id="navi-header">
		<h2>
			<a href="#" id="close" class="fas fa-times"></a> <span>OVERWATCH</span>
			<a href="${pageContext.request.contextPath}/basket.do" id="cart"
				class="fas fa-shopping-cart"></a>
		</h2>

	</div>

	<c:if test="${user_id == null}">
		<div class="navi-button clear" id="login">
			<div class="login-btn">
				<a href="${pageContext.request.contextPath}/login_main.do">로그인</a>
			</div>
			<div class="signup">
				<a href="${pageContext.request.contextPath}/sign_up.do">회원가입</a>
			</div>
		</div>
	</c:if>
	<c:if test="${user_id != null}">
		<div class="navi-button clear" id="logout">
			<div class="my_page">
				<a href="${pageContext.request.contextPath}/my_page_main.do">마이페이지</a>
			</div>
			<div class="logout-btn">
				<button onclick="location.href='logout.do'">로그아웃</button>

			</div>
		</div>
	</c:if>

	<form method="get"
		action="${pageContext.request.contextPath}/list_search.do">
		<div id="search" class="clear">
			<label for="keyword"></label> <input type="search" name="keyword"
				id="keyword" placeholder="검색어 입력" value="${keyword}" />
			<button type="submit"
				onclick="location.href='${pageContext.request.contextPath}/list_search.do'">검색</button>
		</div>
	</form>

	<div id="navi-list">
		<div class="smhead">
			<p>
				<strong>Category</strong>
			</p>
		</div>

		<ul>
			<li><a href="${pageContext.request.contextPath}/list_best.do">베스트</a></li>
			<li><a href="${pageContext.request.contextPath}/list_new.do">신상품</a></li>
			<li><a href="${pageContext.request.contextPath}/list_man.do">남성시계</a></li>
			<li><a href="${pageContext.request.contextPath}/list_woman.do">여성시계</a></li>
			<li><a href="#" id="modal-click">나만의시계</a></li>
		</ul>
	</div>

</div>

<!-- 나만의 시계 모달 -->


<div id="modal1" class="modal hidden">
	<div class="modal-head clear">
		<h2>나만의 시계 찾기</h2>
		<a href="#" class="fas fa-times modal-close"></a>
	</div>

	<div class="modal-body">
		<p>
			지금부터 나오는 선택지를<br>자신에 맞게 선택해 주세요
		</p>
	</div>

	<div class="modal-button">

		<button id="next1">Start</button>
	</div>
</div>

<div id="modal2" class="modal hidden">
	<div class="modal-head clear">
		<h2>Gender</h2>
		<a href="#" class="fas fa-times modal-close"></a>
	</div>

	<div class="modal-body">
		<div id="check2">
			<label><input type="checkbox" name="mywatch"
				class="chk_gender" value="M"><span class="checkmark"></span>Man</label>
			<label><input type="checkbox" name="mywatch"
				class="chk_gender" value="W"><span class="checkmark"></span>Woman</label>


		</div>
	</div>
</div>


<div id="modal3" class="modal hidden">
	<div class="modal-head clear">
		<h2>Style</h2>
		<a href="#" class="fas fa-times modal-close"></a> 
	</div>

	<div class="modal-body">
		<div id="check3">
			<label><input type="checkbox" name="mywatch" class="chk_use"
				value="suit"><span class="checkmark"></span>Suit</label> <label><input
				type="checkbox" name="mywatch" class="chk_use" value="casual"><span
				class="checkmark"></span>Cacual</label> <label><input
				type="checkbox" name="mywatch" class="chk_use" value="sports"><span
				class="checkmark"></span>Sports</label>

			<div class="modal-button">
				<div id="re3">Back</div>
			</div>

		</div>
	</div>
</div>

<div id="modal4" class="modal hidden">
	<div class="modal-head clear">
		<h2>Strap</h2>
		<a href="#" class="fas fa-times modal-close"></a>
	</div>

	<div class="modal-body">
		<div id="check4">
			<label><input type="checkbox" name="mywatch"
				class="chk_strap" value="metal"><span class="checkmark"></span>Metal</label>
			<label><input type="checkbox" name="mywatch"
				class="chk_strap" value="leather"><span class="checkmark"></span>Leather</label>
			<label><input type="checkbox" name="mywatch"
				class="chk_strap" value="etc"><span class="checkmark"></span>etc</label>

			<div class="modal-button">
				<div id="re4">Back</div>
			</div>
		</div>
	</div>

</div>

<div id="modal5" class="modal hidden">
	<div class="modal-head clear">
		<h2>Size</h2>
		<a href="#" class="fas fa-times modal-close"></a>
	</div>

	<div class="modal-body">
		<div id="check5">
			<label><input type="checkbox" name="mywatch" class="chk_size"
				value="L"><span class="checkmark"></span>Large</label> <label><input
				type="checkbox" name="mywatch" class="chk_size" value="M"><span
				class="checkmark"></span>Middle</label> <label><input
				type="checkbox" name="mywatch" class="chk_size" value="S"><span
				class="checkmark"></span>Small</label>

			<div class="modal-button">
				<div id="re5">Back</div>
				<button id="next5">Next</button>
			</div>
		</div>
	</div>

</div>

<div id="modal6" class="modal hidden">
	<div class="modal-head clear">
		<h2>Movement</h2>
		<a href="#" class="fas fa-times modal-close"></a>
	</div>

	<div class="modal-body">
		<div id="check6">
			<label><input type="checkbox" name="mywatch"
				class="chk_movement" value="Q"><span class="checkmark"></span>Quatrz</label>
			<label><input type="checkbox" name="mywatch"
				class="chk_movement" value="A"><span class="checkmark"></span>Automatic</label>

			<div class="modal-button">
				<div id="re6">Back</div>
				<button id="finish">Finish</button>
			</div>
		</div>
	</div>

</div>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
	<script src="assets/plugins/sweetalert/sweetalert2.min.js"></script>
<script>
	$('#finish').click(function() {
		swal({
			html : "<b>나만의 시계를 찾으시겠습니까??</b>", // 내용
			type : "question", // 종류
			showCancelButton : true, // 취소버튼 표시 여부
			cancelButtonText : "취소",
			confirmButtonText : "확인",
			confirmButtonColor : "#db7f41",
		}).then(function(req) {
			if (req.value) {

				var url = "list_my_watch.do?"

				$("input[name='mywatch']:checked").each(function(i) {
					url += "sendChk=" + ($(this).val()) + "&";
				});

				$(location).attr('href', url);

			}

		})

	})

	$('#cart').click(function() {
		var aa = "${user_no}";

		if (aa == "") {
			alert("로그인을 해야합니다.").then(function() {
				location.href = "login_main.do";
			});
		}
	});
</script>