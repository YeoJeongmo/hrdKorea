<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<section style="position: fixed; top: 60px; width: 100%; ">
	<h3 style="text-align: center;">회원목록조회/수정</h3>
	<form style="display: flex; justify-content: center; text-align: center;">
		<table border="1">
			<tr>
				<td> 회원번호 </td>
				<td> 회원성명 </td>
				<td> 전화번호 </td>
				<td> 주소 </td>
				<td> 가입일자 </td>
				<td> 고객등급 </td>
				<td> 거주지역 </td>
			</tr>
<%
Connection conn = null;
Statement stmt = null;
String grade = "";
Date joindate;
String joindateStr = "";

try {
	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql = "SELECT * FROM member_tbl_02";
	ResultSet rs = stmt.executeQuery(sql);
	SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
	while(rs.next()){
		grade = rs.getString("grade");
		switch(grade){
		case "A" :
			grade = "VIP";
			break;
		case "B" :
			grade = "일반";
			break;
		case "C" :
			grade = "직원";
			break;
		}
		joindate = rs.getDate("joindate");
		joindateStr = transFormat.format(joindate);
		
%>
			<tr>
				<td> <a href="modify.jsp?modify_custno=<%=rs.getString("custno") %>"> <%=rs.getString("custno") %> </a> </td>
				<td> <%=rs.getString("custname") %> </td>
				<td> <%=rs.getString("phone") %> </td>
				<td> <%=rs.getString("address") %> </td>
				<td> <%=joindateStr %> </td>
				<td> <%=grade %> </td>
				<td> <%=rs.getString("city") %> </td>
			</tr>
<%
	}
}catch (Exception e){
	e.printStackTrace();
}
%>
		</table>
	</form>
</section>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>