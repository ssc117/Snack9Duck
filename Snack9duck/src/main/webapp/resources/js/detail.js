function count(type)  {

	var sell_price = document.getElementById('sell_price').value;
	const result2Element = document.getElementById('result2');
//	결과를 표시할 element
	const resultElement = document.getElementById('quantity');

	// 현재 화면에 표시된 값
	let number = result2Element.innerText;

	// 더하기/빼기
	if(type === 'plus') {
		number = parseInt(number) + 1;
	}else if(type === 'minus')  {
		if(number>1)
			number = parseInt(number) - 1;
	}
	var total_price = number*sell_price;

	// 결과 출력
	result2Element.innerText = number;
	document.getElementById("total_price").innerText = total_price.toLocaleString();
	//console.log("result2Element.innerText")
}
$(document).ready(function() {
	$('#review-detail').summernote({
		height: 500,
		toolbar: [
			['style', ['bold', 'italic', 'underline', 'clear']],
			['font', ['strikethrough', 'superscript', 'subscript']],
			['fontsize', ['fontsize']],
			['color', ['color']],
			['para', ['ul', 'ol', 'paragraph']],
			['height', ['height']]
			]
	});
});

//	var data={
//			id :  $("#userId").val(),
//			prodnum : $("#productNum").val(),
//			content : $("#review-detail").val()
//	};

//	if(document.frame.review-detail.value == ""){
//	alert("글 내용을 써주세요.");
//	faram.review-detail.focus();
//	return false;
	


//	$.ajax({
//		type: "POST",
//		url: "/product/reviewwrite",
//		data: JSON.stringify(data),
//		contentType: "application/json; charset=utf-8",
//		dataType: "text"
//	}).done(function(result){
//		if (result === '200') {
//			successMessage();
//		} else {
//			failMessage();
//		}
//	})
//}
//function successMessage() {
//	Swal.fire({
//		html: '리뷰가 등록되었습니다.',
//		icon: 'success',
//		timer: 2000,
//		timerProgressbar: true,
//		willClose: () => {
//			clearInterval(timerInterval)
//		}
//	}).then((result) => {
//		location.href = document.referrer;
//	})
//}
//
//function failMessage() {
//	Swal.fire({
//		html: '리뷰 등록 중 오류가 발생하였습니다.',
//		icon: 'error',
//		timer: 2000,
//		timerProgressbar: true,
//		willClose: () => {
//			clearInterval(timerInterval)
//		}
//	}).then((result) => {
//		location.href = document.referrer;
//	})

//var id =  $("#userId").val();
//var prodnum = $("#productNum").val();
//var content = $("#review-detail").val();

