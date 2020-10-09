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
<link rel="stylesheet" href="assets/css/common.css" />
<link rel="stylesheet" href="assets/css/item_deails1.css" />
<link rel="stylesheet" href="assets/css/navi.css">
<link rel="stylesheet" href="assets/css/modal.css">
<link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert2.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

</head>

<body>
	<%@ include file="inc/top_navi.jsp"%>
	<div id="container">
		<div id="header">
			<!-- <h2>제품상세 페이지</h2> -->
		</div>

		<!-- 본문 영역 -->
		<div id="content">
			<div class="top">

				<img id="img01" src="assets/img/${output.origin_name}" alt="상품 이미지">

			</div>
			<div class="abc">
				<h2 id="title">${output.prod_name}</h2>
			</div>
			<div id="item_option">
			<div id="na_pri">
				<label for="item_pri">상품가격 : </label><input type="text" id="item_pri" name="item_pri" placeholder="${output.prod_price}"readonly/>
				</div>
				<ul id="option_group">
					<li><select id="option-1" class="more-option"
						name="option-1">
							<option value="">시계줄 변경</option>
							<option value="0">선택 안함</option>
							<option value="${output.opt_price}">${output.prod_opt}+${output.opt_price}</option>
					</select></li>

					<li><select id="option-11" name="option-11"
						disabled="disabled">
							<option value="">가로길이선택</option>
							<option value="200cm">200cm</option>
							<option value="300cm||+500">300cm(+500원)</option>
					</select></li>
					<li><select id="option-12" name="option-12"
						disabled="disabled">
							<option value="">세로길이선택</option>
							<option value="200cm">200cm</option>
							<option value="300cm||+500">300cm(+500원)</option>
					</select></li>
					<li><select id="option-13" class="nomore-option"
						name="option-13" disabled="disabled">
							<option value="">재질선택</option>
							<option value="가죽">가죽</option>
							<option value="우레탄||+500">우레탄(+500원)</option>
							<option value="메탈||+1000">메탈(+1,000원)</option>
					</select></li>
				</ul>
				<ul id="selected-result">
				</ul>
				<div id="total-price">
					총 금액 : <span id=ttz></span>
				</div>
				
				
				
			</div>

			<div class="button">
				<div id="order">
					<input type="button" name="button1" id="button1" value="주문하기">
					<input type="button" name="button2" id="button2" value="장바구니에 담기">
				</div>
			</div>



			<!-- 탭의 전체 박스 -->
			<div class="tab">
				<!-- 탭 버튼 영역 -->
				<ul class="tab-button clearfix">
					<li class="tab-button-item pull-left"><a
						class="tab-button-item-link selected" href="#tab-page-1">제 품 상
							세</a></li>
					<li class="tab-button-item pull-left"><a
						class="tab-button-item-link" id="link1" href="#tab-page-2">배 송
							안 내</a></li>
					<li class="tab-button-item pull-left"><a
						class="tab-button-item-link" id="link2" href="#tab-page-3">구 매
							후 기</a></li>
					<li class="tab-button-item pull-left"><a
						class="tab-button-item-link" id="link3" href="#tab-page-4">상 품
							문 의</a></li>
				</ul>

				<div class="tab-pannel">
					<div id="tab-page-1">
						<img src="assets/img/item_data.jpg" id="item">
					</div>
					<div id="tab-page-2" class="hide">
						<img src="assets/img/transport.png" id="trans">
					</div>
					<div id="tab-page-3" class="hide">
							게시판 다시 만드는 중
					</div>
					<div id="tab-page-4" class="hide">
							게시판 다시 만드는 중
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- container 태그 끝 -->

	<%@ include file="inc/footer.jsp"%>
	<script src="assets/plugins/sweetalert/sweetalert2.min.js"></script>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>

	<script src="assets/js/common.js"></script>



	<script type="text/javascript">
		/** 탭 버튼 기능구현 */
		$(function() {
			/** 탭 버튼의 클릭 처리 */
			$('.tab-button-item-link').click(function(e) {
				// 페이지 이동 방지
				e.preventDefault();

				// 클릭된 요소를 제외한 나머지에게 selected 클래스 제거 --> 배경색 원상복구
				$(".tab-button-item-link").not(this).removeClass("selected");

				// 클릭된 요소에게 selected 클래스 적용 --> 배경색 변경됨
				$(this).addClass("selected");

				var target = $(this).attr('href');
				$(target).removeClass('hide');
				$('.tab-pannel > div').not($(target)).addClass('hide');
			});
		});

		// 상품선택 시 추가화면 구현
		$(document).ready(function() {
			$('#container li select').change(function() {
				if (!$(this).hasClass('nomore-option')) {
					var val = $(this).val();
					var str = $(this).attr('id').split('-');
					var id = str[0] + '-' + str[1].substr(0, 1);

					var val = $(this).val();
					var idx = $('select[id^=' + id + ']').index($(this));

					if (val == '') {
						var $el = $('select[id^=' + id + ']:gt(' + idx + ')');

						$el.val('');
						$el.attr('disabled', true);
					} else {
						var $el = $('select[id^=' + id + ']:gt(' + idx + ')');

						$el.val('');
						$el.attr('disabled', true);

						$el.each(function() {
							if ($(this).is(':disabled')) {
								$(this).attr('disabled', false);
								return false;
							}
						});
					}
				}
			});

			$('#container li select.nomore-option').change(function() {
				if ($(this).hasClass('nomore-option')) {
					var str = $(this).attr('id').split("-");
					var id = str[0] + '-' + str[1].substr(0, 1);
					optionDisplay(id);
				}
			});

			// 상품개수증가
			$('span.add-item').live('click', function() {
				var $cntinput = $(this).closest('li').find('input');
				var count = parseInt($cntinput.val());
				count++;

				$cntinput.val(count);

				calculatePrice();
			});

			// 상품개수감소
			$('span.subtract-item').live('click', function() {
				var $cntinput = $(this).closest('li').find('input');
				var count = parseInt($cntinput.val());
				count--;

				if (count < 1) {
					swal("error", "상품개수는 1이상 입력해 주십시오.", "error");
					count = 1;
				}

				$cntinput.val(count);

				calculatePrice();
			});

			// 선택옵션삭제
			$('span.option-delete').live('click', function() {
				$(this).closest('li').remove();

				var resultcount = $('ul#selected-result li').size();
				if (resultcount < 1) {
					$('ul#selected-result').css('display', 'none');
					$('#total-price').css('display', 'none');
				}

				calculatePrice();
			});
		});

		function optionDisplay(id) {
			var option = "";
			var sep = "";
			var optionval = "";
			var optionprc = "";
			var optionprice = "";
			var optionid = "";
			var optionadd = false;

			if ($('ul#selected-result').is(':hidden')) {
				$('ul#selected-result').css('display', 'block');
				$('#total-price').css('display', 'block');
			}

			$('#container li select[id^=' + id + ']').each(
					function() {
						var str = $(this).val().split('||');
						optionval = str[0];
						if (str[1] == undefined) {
							optionprc = "0";
						} else {
							optionprc = str[1];
						}
						optionid = $(this).attr('id');

						if (optionval == '') {
							optionadd = true;
							return false;
						}

						option += sep
								+ '<span class="selected-' + optionid + '">'
								+ optionval + '</span>';
						optionprice += '<span class="price-value">' + optionprc
								+ '</span>';

						sep = "/";
					});

			// 선택된 옵션체크
			$('ul#selected-result li span.selected-value').each(function() {
				var oldoption = $(this).html();

				if (oldoption == option) {
					swal("에러", "이미 선택된 옵션입니다.", "error");
					optionadd = true;
					return false;
				}
			});

			if (!optionadd) {
				var resultcount = $('ul#selected-result li').size();
				var optioncontent = '<li><span class="selected-value">'
						+ option
						+ '</span><span class="option-price">'
						+ optionprice
						+ '</span><span class="item-count">수량<input type="text" name="itemcount[]" value="1" /></span><span class="add-item"><i class="far fa-plus-square"></i></span><span class="subtract-item"><i class="far fa-minus-square"></i></span><span class="option-delete"> <i class="far fa-trash-alt"></i></span></li>';

				if (resultcount > 0) {
					$('ul#selected-result li:last').after(optioncontent);
				} else {
					$('ul#selected-result').html(optioncontent);
				}

				calculatePrice();
			}
		}

		function calculatePrice() {
			var totalprice = 0;
			var itemprice = parseInt($('span#item-price').text().replace(
					/[^0-9]/g, ''));

			$('ul#selected-result li').each(function() {
				var $prcelmt = $(this).find('.price-value');
				var optprc = 0;
				var itcnt = parseInt($(this).find('input').val());

				$prcelmt.each(function() {
					var prc = parseInt($(this).text());
					optprc += prc;
				});

				totalprice += (itemprice + optprc) * itcnt;
			});

			$('#total-price span').text(number_format(totalprice) + '원');
		}

		function number_format(input) {
			var input = String(input);
			var reg = /(-?d+)(d{3})($|.d+)/;
			if (reg.test(input)) {
				return input.replace(reg, function(str, p1, p2, p3) {
					return number_format(p1) + "," + p2 + "" + p3;
				});
			} else {
				return input;
			}
		}
		

		$('#button1').click(function() {
		var chk = $('ul#selected-result li').length;

				if (!chk) {

				swal("에러", '하나이상을 체크하여 주십시오', 'error');

				return false;
				
				}else if(confirm("결제페이지로 이동하시겠습니까?") ==true){
					       location.href="${pageContext.request.contextPath}/order"
					    } else {
					        return;
					    }
		});
	

		$('#button2').click(function() {
		var chk = $('ul#selected-result li').length;

				if (!chk) {

				swal("에러", '하나이상을 체크하여 주십시오', 'error');

				return false;
				
				}else{
					swal("", "장바구니에 담으시겠습니까?", "info").then(function() {
						swal("", "장바구니에 담겼습니다.", "success")
					});
					    }

				

		});

		
	</script>

</body>

</html>