
 function Checkform() {

if(document.register_form.agreecheck.checked != true){

    alert("개인정보 수집에 동의해 주세요.");
    frm.confirm.focus();

    return false;
}
}







function go_del_ok(){
    if(document.register_form.agreecheck.checked != true){
    alert("위 내용에 동의해 주세요.");
    register_form.confirm.focus();
    return false;
    } else {
		document.register_form.action = "member_del_form_ok";
        document.register_form.submit();
    }
	
}


function win_zip() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
            var extraAddr = '';
            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }


            if (data.userSelectedType === 'R') {
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if (extraAddr !== '') {
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("reg_mb_addr3").value = extraAddr;

            } else {
                document.getElementById("reg_mb_addr3").value = '';
            }
            document.getElementById('reg_zip').value = data.zonecode;
            document.getElementById("reg_mb_addr1").value = addr;
            document.getElementById("reg_mb_addr2").focus();
        }
    }).open();
}



