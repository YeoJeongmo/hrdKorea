function joinCheck(){
	if(document.frm2.custname.value.length == 0){
		alert("회원성명이 입력되지 않았습니다.");
		frm2.custname.focus();
		return false;
	}
	if(document.frm2.phone.value.length == 0){
		alert("회원전화가 입력되지 않았습니다.");
		frm2.phone.focus();
		return false;
	}
	if(document.frm2.address.value.length == 0){
		alert("회원주소가 입력되지 않았습니다.");
		frm2.address.focus();
		return false;
	}
	if(document.frm2.joindate.value.length == 0){
		alert("가입일자가 입력되지 않았습니다.");
		frm2.joindate.focus();
		return false;
	}
	if(document.frm2.grade.value.length == 0){
		alert("고객등급이 입력되지 않았습니다.");
		frm2.grade.focus();
		return false;
	}
	if(document.frm2.city.value.length == 0){
		alert("도시코드가 입력되지 않았습니다.");
		frm2.city.focus();
		return false;
	}
	success();
	return true;
}
function success(){
	alert("회원등록이 완료되었습니다!");
}
function search(){
	window.location='list.jsp';
}
function modify(){
	alert("회원수정이 완료되었습니다.")
}