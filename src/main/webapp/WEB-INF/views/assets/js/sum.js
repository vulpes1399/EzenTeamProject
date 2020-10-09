// 전체 합계를 페이지 열리자마자 실행하시오

window.onload = function () {
	
		var arr1 = $('.total').length;

	for(var i = 0; i<arr1; i++){

		
		var num = $(".num:eq(" + i + ")").val();
		num = $(".num:eq(" + i + ")").val(num * 1);
		var a = $(".num:eq(" + i + ")").val();
	
		var prc = $(".prc:eq(" + i + ")").val();
		var b = parseInt(prc);
		
		var optPrc = $(".optPrc:eq(" + i + ")").val();
		var c = parseInt(optPrc);
		
		
		var tot = $(".total:eq(" + i + ")").val();
		tot = $(".total:eq(" + i + ")").val(a * (b+c));
		$(".total:eq(" + i + ")").val(a*(b+c));
	}
	
		var arr = $('.total');
		var tot = 0;
		for (var i = 0; i < arr.length; i++) {
			if (parseInt(arr[i].value))
				tot += parseInt(arr[i].value);
		}
		document.getElementById('all_total').value = tot;

};


$(function() {
	
	$('.count_plus').click(function() {
		var n = $('.count_plus').index(this);

		var num = $(".num:eq(" + n + ")").val();
		num = $(".num:eq(" + n + ")").val(num * 1 + 1);
		var a = $(".num:eq(" + n + ")").val();
	
		var prc = $(".prc:eq(" + n + ")").val();
		var b = parseInt(prc);
		var tot = $(".total:eq(" + n + ")").val();
		tot = $(".total:eq(" + n + ")").val(a * b);


		$(".total:eq(" + n + ")").val(a * b);


		var arr = $('.total');
		var tot = 0;
		for (var i = 0; i < arr.length; i++) {
			if (parseInt(arr[i].value))
				tot += parseInt(arr[i].value);
		}
		document.getElementById('all_total').value = tot;


	});


	$('.count_minus').click(function() {
		var n = $('.count_minus').index(this);
		var num = $(".num:eq(" + n + ")").val();
		if (num <= 1) {
			swal("error", "상품개수는 1이상 입력해 주십시오.", "error");
		} else {
			num = $(".num:eq(" + n + ")").val(num * 1 - 1);
			var a = $(".num:eq(" + n + ")").val();

			var prc = $(".prc:eq(" + n + ")").val();
			var b = parseInt(prc);

			var tot = $(".total:eq(" + n + ")").val();
			tot = $(".total:eq(" + n + ")").val(a * b);

			$(".total:eq(" + n + ")").val(a * b);


		}

		var arr = $('.total');
		var tot = 0;
		for (var i = 0; i < arr.length; i++) {
			if (parseInt(arr[i].value))
				tot += parseInt(arr[i].value);
		}
		document.getElementById('all_total').value = tot;
	});


});


$('#select_cancel').click(function() {

	var chk = document.getElementsByName("chk_item");  //name="pidx1" 값을 모두 가져옴.
	var data = "";
	var chk_check = false;

	for (i = 0; i < chk.length; i++) {

		if (chk[i].checked == true) {

			data = data + ", " + chk[i].value;            // 값을 가져와서 data 넣는다.

			if (chk[i].checked) chk_check = true;    // 하나라도 체크 됐다면 chk_check = true 값 반환

		}

	}

	if (chk_check) {              // chk_check 값이 true 라면

		if (confirm("삭제하시겠습니까?")) {

			$("input[name=chk_item]:checked").parent().parent().remove();


		}else {                         // chk_check 값이 false 라면

		swal("에러", '하나이상을 체크하여 주십시오', 'error');

		return;

	}
	
	if($(".row").length>0){
		$('#bsk_null-notice').hide();
	}else {
			$('#bsk_null-notice').show();
			
					var arr = $('.total');
		var tot = 0;
		for (var i = 0; i < arr.length; i++) {
			if (parseInt(arr[i].value))
				tot += parseInt(arr[i].value);
		}
		document.getElementById('all_total').value = tot;

	}

	
}

});
	
		$('#order_buy').click(function() {
		var chk = $(".row").length;

			if (!chk) {
				swal("에러", '상품을 담아주세요.', 'error');
				return false;
			}
			swal({
				html : "<b>선택하신 상품을 주문하시겠습니까?</b>", // 내용
				type : "question", // 종류
				showCancelButton : true, // 취소버튼 표시 여부
				cancelButtonText : "취소",
				confirmButtonText : "확인",
				confirmButtonColor : "#db7f41",
			}).then(function(req) {
				if (req.value) {
					$(location).attr('href', 'pay.do');
				}
			});
	
});