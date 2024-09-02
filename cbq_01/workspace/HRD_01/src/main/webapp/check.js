function addCheck(){
	if(frm.resistMonth.value.length == 0) {
		alert("수강월이 입력되지 않았습니다.");
		frm.resistMonth.focus();
		return false;
	}
	else if(frm.cName.value == 0) {
		alert("회원명이 입력되지 않았습니다.");
		frm.cName.focus();
		return false;
	}
	else if(frm.classArea[0].checked == false && 
			frm.classArea[1].checked == false &&
			frm.classArea[2].checked == false &&
			frm.classArea[3].checked == false &&
			frm.classArea[4].checked == false) { 
		alert("강의장소가 입력되지 않았습니다.");
		frm.classArea[0].focus();
		return false;
	}
	else if(frm.className.value == 0) {
		alert("강의명이 입력되지 않았습니다.");
		frm.className.focus();
		return false;
	}
	else {
		alert("수강신청이 정상적으로 완료되었습니다!")
		frm.submit();
		window.location = index.jsp;
		return true;
	}
}
function res(){
	alert("정보를 지우고 처음부터 다시 입력합니다!")
	frm.reset();
}
function getCNo(c_no){
	document.getElementById("c_no").value = c_no;
}
function getTuition(tuition){
	if(frm.cNo.value >= 20000){
		document.getElementById("tuition").value = tuition / 2;
	} else if(frm.cNo.value < 20000){
		document.getElementById("tuition").value = tuition;
	}
}