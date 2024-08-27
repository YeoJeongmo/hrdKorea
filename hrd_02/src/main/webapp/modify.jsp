<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<input type="hidden" name="mode" value="modify">
		<table border="1">
<%
Connection conn = null;
Statement stmt = null;
String mod_custno = request.getParameter("mod_custno");
String custname = "";
String phone = "";
String address = "";
Date joindate;
String joindateStr = "";
String grade = "";
String city = "";

try {
	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql = "SELECT * FROM member_tbl_02 WHERE custno = " + mod_custno ;
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	mod_custno = rs.getString("custno");
	custname = rs.getString("custname");
	phone = rs.getString("phone");
	address = rs.getString("address");
	joindate = rs.getDate("joindate");
	grade = rs.getString("grade");
	city = rs.getString("city");
	
	SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
	joindateStr = transFormat.format(joindate);
}catch (Exception e){
	e.printStackTrace();
}
%>
			<tr>
				<td>회원정보(자동발생)</td>
				<td><input type="text" name="custno" value="<%=mod_custno %>" readonly></td>
			</tr>
			<tr>
				<td>회원성명</td>
			<td><input type="text" name="custname" value="<%=custname %>"></td>
		</tr>
		<tr>
			<td>회원전화</td>
			<td><input type="text" name="phone" value="<%=phone %>"></td>
		</tr>
		<tr>
			<td>회원주소</td>
			<td><input type="text" name="address" value="<%=address %>"></td>
		</tr>
		<tr>
			<td>가입일자</td>
			<td><input type="text" name="joindate" value="<%=joindateStr %>"></td>
		</tr>
		<tr>
			<td>고객등급 [A:VIP, B:일반, C:직원]</td>
			<td><input type="text" name="grade" value="<%=grade %>"></td>
		</tr>
		<tr>
			<td>도시코드</td>
			<td><input type="text" name="city" value="<%=city %>"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정" onclick="return modify()">
					<input type="button" value="조회" onclick="return search()">
				</td>
			</tr>
		</table>
	</form>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>