$('#cd').click(function() {

	swal({
		html: "<b>배송을 취소하시겠습니까?</b>", // 내용
		type: "question", // 종류
		showCancelButton: true, // 취소버튼 표시 여부
		cancelButtonText: "취소",
		confirmButtonText: "확인",
		confirmButtonColor: "#db7f41",
	}).then(function(req) {
		if (req.value) {
			swal("배송취소","배송 취소 요청이 접수되었습니다.", "success");
		}
	});
});