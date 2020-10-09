$('#res').click(function() {

	swal({
		html: "<b>구매 확정하시겠습니까?</b>", // 내용
		type: "question", // 종류
		showCancelButton: true, // 취소버튼 표시 여부
		cancelButtonText: "취소",
		confirmButtonText: "확인",
		confirmButtonColor: "#db7f41",
	}).then(function(req) {
		if (req.value) {
			swal("구매확정","구매가 확정 되었습니다.", "success");
		}
	});
});



$('#ch').click(function() {

	swal({
		html: "<b>교환 요청을 하시겠습니까?</b>", // 내용
		type: "question", // 종류
		showCancelButton: true, // 취소버튼 표시 여부
		cancelButtonText: "취소",
		confirmButtonText: "확인",
		confirmButtonColor: "#db7f41",
	}).then(function(req) {
		if (req.value) {
			swal("요청확인","교환 요청이 접수되었습니다.", "success");

		}
	});
});

$('#ref').click(function() {

	swal({
		html: "<b>환불 요청을 하시겠습니까?</b>", // 내용
		type: "question", // 종류
		showCancelButton: true, // 취소버튼 표시 여부
		cancelButtonText: "취소",
		confirmButtonText: "확인",
		confirmButtonColor: "#db7f41",
	}).then(function(req) {
		if (req.value) {
						swal("요청확인","환불 요청이 접수되었습니다.", "success");

		}
	});
});



