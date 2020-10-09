/** ----------------네비게이션--------------- */
$('#btn_navi').on('click', function() {
	$('#navi').addClass('active');
	$('.overlay').fadeIn();
});

$('.overlay').on('click', function() {
	$('#navi').removeClass('active');
	$('.overlay').fadeOut();
});

$('#close').on('click', function() {
	$('#navi').removeClass('active');
	$('.overlay').fadeOut();
});

/** ------------------------나만의 시계 모달-------------------------- */
$('#modal-open').on('click', function() {
	$('#modal1').fadeIn();
	$('#modal-layer').fadeIn();
})

$('#modal-click').on('click', function() {
	$('#modal1').fadeIn();
	$('#modal-layer').fadeIn();
})


// next 1
$('#next1').click(function() {
	$('#modal1').attr('style', 'display:none');
	$('#modal2').attr('style', 'display:block');
})


$('.chk_gender').click(function() {
	$('#modal2').attr('style', 'display:none');
	$('#modal3').attr('style', 'display:block');
})

$('.chk_use').click(function() {
	$('#modal3').attr('style', 'display:none');
	$('#modal4').attr('style', 'display:block');
})

$('.chk_strap').click(function() {
	$('#modal4').attr('style', 'display:none');
	$('#modal5').attr('style', 'display:block');
})

$('.chk_size').click(function() {
	$('#modal5').attr('style', 'display:none');
	$('#modal6').attr('style', 'display:block');
})

/*$('.chk_movement').click(function() {
	$('#modal6').attr('style', 'display:none');
	$('#modal7').attr('style', 'display:block');
})
*/


// re 2~7
$('#re2').click(function() {
	$('#modal2').attr('style', 'display:none');
	$('#modal1').attr('style', 'display:block');
})

$('#re3').click(function() {
	$('#modal3').attr('style', 'display:none');
	$('#modal2').attr('style', 'display:block');
})

$('#re4').click(function() {
	$('#modal4').attr('style', 'display:none');
	$('#modal3').attr('style', 'display:block');
})

$('#re5').click(function() {
	$('#modal5').attr('style', 'display:none');
	$('#modal4').attr('style', 'display:block');
})

$('#re6').click(function() {
	$('#modal6').attr('style', 'display:none');
	$('#modal5').attr('style', 'display:block');
})


// select_all 2,3,4,5,6,7
$(document).ready(function() {
	$("#check_all2").click(function() {
		if ($("#check_all2").prop("checked")) {
			$("input[name=chk_gender]").prop("checked", true);
		} else {
			$("input[name=chk_gender]").prop("checked", false);
		}
	});
});

$(document).ready(function() {
	$("#check_all3").click(function() {
		if ($("#check_all3").prop("checked")) {
			$("input[class=price]").prop("disabled", true);
			$('#min_price').val('0');
			$('#max_price').val('999999');
		} else {
			$("input[class=price]").prop("disabled", false);
			$('#min_price').val('');
			$('#max_price').val('');
		}
	});
});


$(document).ready(function() {
	$("#check_all4").click(function() {
		if ($("#check_all4").prop("checked")) {
			$("input[name=chk_use]").prop("checked", true);
		} else {
			$("input[name=chk_use]").prop("checked", false);
		}
	});
});

$(document).ready(function() {
	$("#check_all5").click(function() {
		if ($("#check_all5").prop("checked")) {
			$("input[name=chk_strap]").prop("checked", true);
		} else {
			$("input[name=chk_strap]").prop("checked", false);
		}
	});
});

$(document).ready(function() {
	$("#check_all6").click(function() {
		if ($("#check_all6").prop("checked")) {
			$("input[name=chk_size]").prop("checked", true);
		} else {
			$("input[name=chk_size]").prop("checked", false);
		}
	});
});



// chechbox 선택 여부 검사
$(function() {
	$("#check2").submit(function(e) {
		e.preventDefault();

		var check_list = $(".chk_gender:checked");
		if (check_list.length == 0) {
			alert("선택된 항목이 없습니다.");
			return false;
		} else {
			$('#modal2').attr('style', 'display:none');
			$('#modal3').attr('style', 'display:block');
		}
	});
});

$(function() {
	$("#check3").submit(function(e) {
		e.preventDefault();

		var minprice = $("#min_price").val();
		var maxprice = $("#max_price").val();
		if (!minprice || !maxprice) {
			alert("금액을 입력하세요.");
			return false;
		} else {
			$('#modal3').attr('style', 'display:none');
			$('#modal4').attr('style', 'display:block');
		}
	});
});

$(function() {
	$("#check4").submit(function(e) {
		e.preventDefault();

		var check_list = $(".chk_use:checked");
		if (check_list.length == 0) {
			alert("선택된 항목이 없습니다.");
			return false;
		} else {
			$('#modal4').attr('style', 'display:none');
			$('#modal5').attr('style', 'display:block');
		}
	});
});

$(function() {
	$("#check5").submit(function(e) {
		e.preventDefault();

		var check_list = $(".chk_strap:checked");
		if (check_list.length == 0) {
			alert("선택된 항목이 없습니다.");
			return false;
		} else {
			$('#modal5').attr('style', 'display:none');
			$('#modal6').attr('style', 'display:block');
		}
	});
});


// 모달 여백, 닫기버튼
$('#modal-layer').on('click', function() {
	$('.modal').fadeOut();
	$('#modal-layer').fadeOut();
})

$('.modal-close').click(function() {
	$('.modal').fadeOut();
	$('#modal-layer').fadeOut();
})

// 탑버튼
$(function() {
	$(window).scroll(function() {
		if ($(this).scrollTop() > 200) {
			$('#move_top_btn').fadeIn();
		} else {
			$('#move_top_btn').fadeOut();
		}
	});

	$("#move_top_btn").click(function() {
		$('html, body').animate({
			scrollTop: 0
		}, 400);
		return false;
	});
});
