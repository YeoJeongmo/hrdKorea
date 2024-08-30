<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="check.js"></script>

<jsp:include page="header.jsp"></jsp:include>

<section style="position: fixed; top: 65px; width:100%;">
	<h3 style="text-align: center;">교과목 목록</h3>
	<form name="frm4" method="get" action="action.jsp" style="display: flex; justify-content: center;">
		<input type="hidden" name="mode" value="add">
		<table border="1">
			<tr>
				<td> 과목코드 </td>
				<td> <input type="text" name="id"> </td>
			</tr>
			<tr>
				<td> 과목명 </td>
				<td> <input type="text" name="name"> </td>
			</tr>
			<tr>
				<td> 학점 </td>
				<td> <input type="text" name="credit"> </td>
			</tr>
			<tr>
				<td> 담당강사 </td>
				<td> 
					<select name="lecturer_id" style="width:100%">
						<option value="">담당강사선택</option>
						<option value="1">김교수</option>
						<option value="2">이교수</option>
						<option value="3">박교수</option>
						<option value="4">우교수</option>
						<option value="5">최교수</option>
						<option value="6">임교수</option>
					</select> 
				</td>
			</tr>
			<tr>
				<td> 요일 </td>
				<td> 
					<input type="radio" name="week" id="md" value="1"><label id="md">월</label> 
					<input type="radio" name="week" id="td" value="2"><label id="td">화</label> 
					<input type="radio" name="week" id="wd" value="3"><label id="wd">수</label> 
					<input type="radio" name="week" id="thd" value="4"><label id="thd">목</label> 
					<input type="radio" name="week" id="fd" value="5"><label id="fd">금</label> 
				</td>
			</tr>
			<tr>
				<td> 시작 시간 </td>
				<td> <input type="text" name="start_hour"> </td>
			</tr>
			<tr>
				<td> 종료 시간 </td>
				<td> <input type="text" name="end_hour"> </td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"> 
					<input type="button" value="추가" onclick="add()">
					<input type="button" value="목록" onclick="search()"> 
				</td>
			</tr>
		</table>
	</form>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>