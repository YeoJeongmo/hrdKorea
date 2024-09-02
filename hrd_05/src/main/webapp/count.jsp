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
<jsp:include page="header.jsp"></jsp:include>

<section style="width: 100%; position: fixed; top: 60px; left: 0; line-height: 30px;">
	<h2 style="text-align: center;">부서별근무일수집계</h2>
	<form style="display: flex; justify-content: center;">
	<table border="1";>
		<tr>
			<td> 사원번호 </td>
			<td> 이름 </td>
			<td> 부서명 </td>
			<td> 근무일수 </td>
		</tr>
<%
request.setCharacterEncoding("UTF-8");

try {
	Connection conn = Util.getConnection();
	String sql = "select e.empno, e.empname, e.deptcode, count(r.resvdate) from tbl_emp_202108 e, tbl_resv_202108 r where e.empno=r.empno group by e.empno, e.empname, e.deptcode order by e.deptcode asc";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		String deptcode = rs.getString(3);
		switch(deptcode){
		case "10" :
			deptcode = "영업팀";
			break;
		case "20" :
			deptcode = "총무팀";
			break;
		case "30" :
			deptcode = "구매팀";
			break;
		}
%>
		<tr>
			<td> <%=rs.getString(1) %> </td>
			<td> <%=rs.getString(2) %> </td>
			<td> <%=deptcode %> </td>
			<td> <%=rs.getString(4) %> </td>
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