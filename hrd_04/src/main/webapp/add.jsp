<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section style="position: fixed; top: 65px; width:100%;">
	<h3 style="text-align: center;">교과목 목록</h3>
	<form style="display: flex; justify-content: center;">
		<table border="1">
			<tr>
				<td> 과목코드 </td>
				<td> <input type="text" name="code"> </td>
			</tr>
			<tr>
				<td> 과목명 </td>
				<td> <input type="text" name="name"> </td>
			</tr>
			<tr>
				<td> 학점 </td>
				<td> <input type="text" name="score"> </td>
			</tr>
			<tr>
				<td> 담당강사 </td>
				<td> 
					<select>
						<option>담당강사선택</option>
						<option>아이</option>
						<option>아이</option>
						<option>아이</option>
					</select> 
				</td>
			</tr>
			<tr>
				<td> 요일 </td>
				<td> 
					<input type="radio" name="week" id="md"><label id="md">월</label> 
					<input type="radio" name="week" id="td"><label id="td">화</label> 
					<input type="radio" name="week" id="wd"><label id="wd">수</label> 
					<input type="radio" name="week" id="thd"><label id="thd">목</label> 
					<input type="radio" name="week" id="fd"><label id="fd">금</label> 
				</td>
			</tr>
			<tr>
				<td> 시작 시간 </td>
				<td> <input type="text" name="stime"> </td>
			</tr>
			<tr>
				<td> 종료 시간 </td>
				<td> <input type="text" name="etime"> </td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"> 
					<input type="submit" value="추가">
					<input type="button" value="목록"> 
				</td>
			</tr>
		</table>
	</form>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>