function addCheck(){
	if(document.frm.stuid.value.length == 0){
		alert("학번이 입력되지 않았습니다.");
		frm.stuid.focus();
		return false;
	}
	else if(document.frm.midscore.value.length == 0){
		alert("중간 성적 점수가 입력되지 않았습니다.");
		frm.midscore.focus();
		return false;
	}
	else if(document.frm.finalscore.value.length == 0){
		alert("기말 성적 점수가 입력되지 않았습니다.");
		frm.finalscore.focus();
		return false;
	}
	else if(document.frm.attend.value.length == 0){
		alert("출석 점수가 입력되지 않았습니다.");
		frm.attend.focus();
		return false;
	}
	else if(document.frm.attend.value.length == 0){
		alert("레포트 점수가 입력되지 않았습니다.");
		frm.attend.focus();
		return false;
	}
	else if(document.frm.report.value.length == 0){
		alert("기타 점수가 입력되지 않았습니다.");
		frm.report.focus();
		return false;
	}
	else if(document.frm.etc.value.length == 0){
		alert("학번이 입력되지 않았습니다.");
		frm.etc.focus();
		return false;
	}
	else {
		alert("성적등록이 완료되었습니다.");
		frm.submit();
		return true;
	}
}
