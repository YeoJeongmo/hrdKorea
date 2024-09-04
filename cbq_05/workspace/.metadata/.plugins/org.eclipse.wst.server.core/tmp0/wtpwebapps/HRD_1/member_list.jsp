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
<section style="position: fixed; top: 60px; width: 100%;">
	<h2 style="text-align: center;">회원정보조회</h2>
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

try{
	Connection conn = Util.getConnection();
	String sql = "select tc.resist_month, tm.c_no, tm.c_name, tt.class_name, tc.class_area, tc.tuition, tm.grade from tbl_teacher_202201 tt, tbl_member_202201 tm, tbl_class_202201 tc where tt.teacher_code=tc.teacher_code and tc.c_no=tm.c_no";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		String tuition = "￦" + rs.getString(6).substring(0, 3) + "," + rs.getString(6).substring(3);
		String resist_month = rs.getString(1).substring(0, 4) + "년" + rs.getString(1).substring(4) + "월";
%>
		<tr>
			<td> <%=resist_month %> </td>
			<td> <%=rs.getString(2) %> </td>
			<td> <%=rs.getString(3) %> </td>
			<td> <%=rs.getString(4) %> </td>
			<td> <%=rs.getString(5) %> </td>
			<td> <%=tuition %> </td>
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