<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>salary</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<section
	style="
		position: fixed;
		top: 60px;
		width: 100%;
		text-align: center;"
>

	<h3>회원매출조회</h3>
	<form style="
		display: flex;
		justify-content: center;">
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>고객등급</td>
				<td>매출</td>
			</tr>
<%
Connection conn = null;
Statement stmt = null;
String grade = "";

try {
	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql = "select me.custno, me.custname, me.grade, sum(mo.price) price " +
			"from member_tbl_02 me, money_tbl_02 mo " +
			"where me.custno=mo.custno " +
			"group by me.custno, me.custname, me.grade " +
			"order by sum(mo.price) desc";
	ResultSet rs = stmt.executeQuery(sql);
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
%>
			<tr>
				<td><%=rs.getString("custno") %></td>
				<td><%=rs.getString("custname") %></td>
				<td><%=grade %></td>
				<td><%=rs.getString("price") %></td>
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