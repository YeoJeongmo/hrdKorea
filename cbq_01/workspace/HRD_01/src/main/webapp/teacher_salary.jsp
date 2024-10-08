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
	<h2 style="text-align: center; ">강사매출현황</h2>
	<form style="display: flex; justify-content: center; text-align: center;">
		<table border="1">
			<tr>
				<td> 강사코드 </td>
				<td> 강의명 </td>
				<td> 강사명 </td>
				<td> 총매출 </td>
			</tr>
<%
request.setCharacterEncoding("UTF-8");
String tuition = "";
String teach_resist_date = "";

try{
	Connection conn = Util.getConnection();
	String sql = "select t.teacher_code, t.class_name, t.teacher_name, sum(c.tuition) from tbl_teacher_202201 t, tbl_class_202201 c where t.teacher_code=c.teacher_code group by t.teacher_code, t.class_name, t.teacher_name order by t.teacher_code asc";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		tuition = rs.getString(4);
		String cp = "￦" + tuition.substring(0, 3) + "," + tuition.substring(3);
%>
			<tr>
				<td> <%=rs.getString(1) %> </td>
				<td> <%=rs.getString(2) %> </td>
				<td> <%=rs.getString(3) %> </td>
				<td> <%=cp %> </td>
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