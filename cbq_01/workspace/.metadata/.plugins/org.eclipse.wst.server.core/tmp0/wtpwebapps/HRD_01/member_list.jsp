<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
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
<section style="position: fixed; width:100%; top: 60px;justify-content: center;">
	<h2 style="text-align: center; ">회원정보조회</h2>
	<form style="display: flex; justify-content: center; text-align: center;">
		<table border="1">
			<tr>
				<td> 수강월 </td>
				<td> 회원번호 </td>
				<td> 회원명 </td>
				<td> 강의명 </td>
				<td> 강의장소 </td>
				<td> 수강료 </td>
				<td> 등급 </td>
			</tr>
<%
request.setCharacterEncoding("UTF-8");
String resist_month = "";
String class_price = "";

try{
	Connection conn = Util.getConnection();
	String sql = "select c.resist_month, m.c_no, m.c_name, t.class_name, c.class_area, c.tuition, m.grade from tbl_teacher_202201 t, tbl_member_202201 m, tbl_class_202201 c where t.teacher_code=c.teacher_code and m.c_no=c.c_no";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		resist_month = rs.getString(1);
		String rm = resist_month.substring(0, 4) + "년" + resist_month.substring(4, 6) + "월";
		class_price = rs.getString(6);
		String cp = "￦" + class_price.substring(0, 3) + "," + class_price.substring(3);
%>
			<tr>
				<td> <%=rm %> </td>
				<td> <%=rs.getString(2) %> </td>
				<td> <%=rs.getString(3) %> </td>
				<td> <%=rs.getString(4) %> </td>
				<td> <%=rs.getString(5) %> </td>
				<td> <%=cp %> </td>
				<td> <%=rs.getString(7) %> </td>
			</tr>
<%	
	}
} catch (Exception e){
	e.printStackTrace();
}
%>
		</table>
	</form>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>