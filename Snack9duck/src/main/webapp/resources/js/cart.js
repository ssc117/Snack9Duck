let basket = {
	totalCount : 0,
	totalPrice : 0,

	//체크한 장바구니 상품 비우기
	delCheckedItem : function() {

		var cartnum = "";
		var cartChk = document.getElementsByName("cartnum");
		var chked = false;
		var indexid = false;
		for (i = 0; i < cartChk.length; i++) {
			if (cartChk[i].checked) {
				if (indexid) {
					cartnum = cartnum + '-';
				}
				cartnum = cartnum + cartChk[i].value;
				indexid = true;
			}
		}
		console.log(cartnum);
		if (!indexid) {
			alert("삭제할 상품을 선택해 주세요.");
			return;
		} else {
			var agree = confirm("해당 상품을 삭제 하시겠습니까?");
			if (agree) {
				orderform.action = "/cart/cart_select_delete";
				orderform.submit();
			}
		}

		this.reCalc();
		this.updateUI();
	},

	//체크한 장바구니 상품 주문
	CheckedItemOrder : function() {
		var cartnum = "";
		var cartChk = document.getElementsByName("cartnum");
		var prodnum = document.getElementsByName("prodnum");
		var chked = false;
		var indexid = false;
		for (i = 0; i < cartChk.length; i++) {
			if (cartChk[i].checked) {
				if (indexid) {
					cartnum = cartnum + '-';
				}
				cartnum = cartnum + cartChk[i].value;
				indexid = true;
			}
		}
		console.log(cartnum);
		if (!indexid) {
			alert("구독할 상품을 선택해 주세요.");
			return;
		} else {
			var agree = confirm("해당 상품을 구독 하시겠습니까?");
			if (agree) {
				orderform.action = "/cart/order_insert";
				orderform.submit();
			}
		}
		this.reCalc();
		this.updateUI();
	},
	//장바구니 전체 비우기
//	delAllItem : function() {
//		document.querySelectorAll('.row.data').forEach(function(item) {
//			item.remove();
//		});
//
//		//전송 처리 결과가 성공이면
//		this.totalCount = 0;//전체 갯수
//		this.totalPrice = 0;//총 금액
//		this.reCalc();
//		this.updateUI();
//	},

	//재계산
	reCalc : function() {
		this.totalCount = 0;
		this.totalPrice = 0;
		document
				.querySelectorAll(".p_num")
				.forEach(
						function(item) {
							if (item.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild.firstElementChild.checked == true) {
								var count = parseInt(item.getAttribute('value'));
								this.totalCount += count;
								var price = item.parentElement.parentElement.previousElementSibling.firstElementChild
										.getAttribute('value');
								this.totalPrice += count * price;
							}
						}, this);
		// forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg
	},

	//화면 업데이트
	updateUI : function() {
		document.querySelector('#sum_p_num').textContent = '상품갯수: '
				+ this.totalCount.formatNumber() + '개';
		document.querySelector('#sum_p_price').textContent = '합계금액: '
				+ this.totalPrice.formatNumber() + '원';
	},

	//개별 수량 변경
	changePNum : function(pos) {
		var item = document.querySelector('input[id=p_num' + pos + ']');
		console.log(item);
		var p_num = parseInt(item.getAttribute('value'));

		event.target.classList.contains('up') ? p_num = p_num + 1
				: event.target.classList.contains('down') ? p_num = p_num - 1
						: event.target.value;

		if (parseInt(p_num) < 1 || parseInt(p_num) > 99) {
			return false;
		}

		console.log(p_num);

		item.setAttribute('value', p_num);
		document.querySelector('input[id=p_num' + pos + ']').value = p_num;

		item.value = p_num;

		var price = item.parentElement.parentElement.previousElementSibling.firstElementChild
				.getAttribute('value');
		item.parentElement.parentElement.nextElementSibling.textContent = (p_num * price)
				.formatNumber()
				+ "원";

		//전송 처리 결과가 성공이면    
		this.reCalc();
		this.updateUI();
	},
};

// 숫자 3자리 콤마찍기
Number.prototype.formatNumber = function() {
	if (this == 0)
		return 0;
	let regex = /(^[+-]?\d+)(\d{3})/;
	let nstr = (this + '');
	while (regex.test(nstr))
		nstr = nstr.replace(regex, '$1' + ',' + '$2');
	return nstr;
};
function go_update(updown, quantity, cartnum) {
	orderform.action = "/cart/cart_quantity?updown=" + updown + "&quantity="
			+ quantity + "&cartnum=" + cartnum;
	orderform.submit();

}