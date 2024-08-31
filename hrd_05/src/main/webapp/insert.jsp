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

<section style="width: 100%; position: fixed; top: 60px; left: 0; line-height: 30px;">
	<h2 style="text-align: center;">근무좌석예약</h2>
	<form name="frm-insert" style="display: flex; justify-content: center; text-align: center;">
		<table border="1">
			<tr>
				<td>예약번호</td>
				<td><input type="text" name="resvno">예)20210001</td>
			</tr>
			<tr>
				<td>사원번호</td>
				<td><input type="text" name="empno">예)20210001</td>
			</tr>
			<tr>
				<td>예약일자</td>
				<td><input type="text" name="resvdate">예)20210001</td>
			</tr>
			<tr>
				<td>좌석번호</td>
				<td><input type="text" name="seatno">예)20210001</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="button" value="등록">
					<input type="button" value="다시쓰기">
				</td>
			</tr>
		</table>
	</form>

</section>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>