<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
</head>
<body>

<script type="text/javascript" src="check2.js"></script>

<jsp:include page="header.jsp"></jsp:include>

<section
	style="
		position: fixed;
		top: 60px;
		width: 100%;
		text-align: center;"
>

	<h3>홈쇼핑 화면 등록</h3>
	<form method="post"
		action = "action.jsp"
		name="frm2"
		style="
			display: flex;
			justify-content: center;
			align-content: center;
			width: 100%;"
		>
		<input type="hidden" name="mode" value="insert">
		<table border="1">
<%
Connection conn = null;
Statement stmt = null;
String custno = "";

try {
	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql = "SELECT max(custno)+1 custno FROM member_tbl_02";
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	custno = rs.getString("custno");
}catch (Exception e){
	e.printStackTrace();
}
%>
			<tr>
				<td>회원정보(자동발생)</td>
				<td><input type="text" name="custno" value="<%=custno %>" readonly></td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td><input type="text" name="custname"></td>
			</tr>
			<tr>
				<td>회원전화</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td>회원주소</td>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type="text" name="joindate"></td>
			</tr>
			<tr>
				<td>고객등급[A:VIP, B:일반, C:직원]</td>
				<td><input type="text" name="grade"></td>
			</tr>
			<tr>
				<td>도시코드</td>
				<td><input type="text" name="city"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록" onclick="return joinCheck()">
					<input type="button" value="조회" onclick="return search()">
				</td>
			</tr>
		</table>
	</form>
</section>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>