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
	<h2 style="text-align: center; ">강사조회</h2>
	<form style="display: flex; justify-content: center; text-align: center;">
		<table border="1">
			<tr>
				<td> 강사코드 </td>
				<td> 강사명 </td>
				<td> 강의명 </td>
				<td> 수강료 </td>
				<td> 강사자격취득일 </td>
			</tr>
<%
request.setCharacterEncoding("UTF-8");
String class_price = "";
String teach_resist_date = "";

try{
	Connection conn = Util.getConnection();
	String sql = "select * from tbl_teacher_202201";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		class_price = rs.getString(4);
		String cp = "￦" + class_price.substring(0, 3) + "," + class_price.substring(3);
		teach_resist_date = rs.getString(5);
		String trd = teach_resist_date.substring(0, 4) + "년" + teach_resist_date.substring(4, 6) + "월" + teach_resist_date.substring(6) + "일";
%>
			<tr>
				<td> <%=rs.getString(1) %> </td>
				<td> <%=rs.getString(2) %> </td>
				<td> <%=rs.getString(3) %> </td>
				<td> <%=cp %> </td>
				<td> <%=trd %> </td>
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