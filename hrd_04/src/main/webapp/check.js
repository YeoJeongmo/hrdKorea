function add(){
	if(document.frm4.id.value.length == 0){
		alert("과목코드가 입력되지 않았습니다.");
		frm4.id.focus();
		return false;
	}
	else if(document.frm4.name.value.length == 0){
		alert("과목명이 입력되지 않았습니다.");
		frm4.name.focus();
		return false;
	}
	else if(document.frm4.credit.value.length == 0){
		alert("학점이 입력되지 않았습니다.");
		frm4.credit.focus();
		return false;
	}
	else if(document.frm4.lecturer_id.value == 0){
		alert("담당감사가 선택되지 않았습니다.");
		frm4.lecturer.focus();
		return false;
	}
	else if(document.frm4.week[0].checked == false &&
			document.frm4.week[1].checked == false &&
			document.frm4.week[2].checked == false &&
			document.frm4.week[3].checked == false &&
			document.frm4.week[4].checked == false){
		alert("요일이 선택되지 않았습니다.");
		frm4.week[0].focus();
		return false;
	}
	else if(document.frm4.start_hour.value.length == 0){
		alert("시작 시간이 입력되지 않았습니다.");
		frm4.start_hour.focus();
		return false;
	}
	else if(document.frm4.end_hour.value.length == 0){
		alert("종료 시간이 입력되지 않았습니다.");
		frm4.end_hour.focus();
		return false; 
	}
	else
		alert("교과목 추가가 완료되었습니다.");
		document.frm4.submit();
	return true;
}

function search(){
	window.location = 'list.jsp';
}
function modify(){
	alert("교과목이 수정되었습니다.");
	document.frm4.submit();
}
function res(){
	alert("교과목 수정이 취소되었습니다.")
	document.frm4.reset();
}