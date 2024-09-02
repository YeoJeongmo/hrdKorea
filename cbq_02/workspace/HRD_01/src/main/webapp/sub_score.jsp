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
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp"></jsp:include>

<section style="position: fixed; top: 60px; width: 100%;">
	<h2 style="text-align: center;">과목별 성적조회</h2>
	<form style="display: flex; padding-bottom: 60px; width: 100%; justify-content: center; align-content: center; text-align: center">
		<table border="1">
			<tr>
				<td> 과목코드 </td>
				<td> <input type="text" name="sub_code"> </td>
				<td> <input type="submit" value="조회"> </td>
			</tr>
		</table>
	</form>
	<form style="display: flex; width: 100%; justify-content: center; align-content: center; text-align: center">
		<table border="1">
			<tr>
				<td> 학번 </td>
				<td> 성명 </td>
				<td> 학과 </td>
				<td> 과목 </td>
				<td> 중간 </td>
				<td> 기말 </td>
				<td> 출석 </td>
				<td> 레포트 </td>
				<td> 기타 </td>
				<td> 총점 </td>
				<td> 학점 </td>
			</tr>
<% 
request.setCharacterEncoding("UTF-8");
String sub_code = request.getParameter("sub_code");
String score = "";
try {
	Connection conn = Util.getConnection();
	String sql = "select st.stuid, st.sname, st.dept_name, su.subname, sc.midscore, sc.finalscore, sc.attend, sc.report, sc.etc, round(sc.midscore*0.3+sc.finalscore*0.3+sc.attend*0.2+sc.report*0.1+sc.etc*0.1, 1) from tbl_student_202210 st, tbl_score_202210 sc, tbl_subject_202210 su where st.stuid=sc.sid and su.subcode=sc.subcode and su.subcode=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, sub_code);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		double sc = Double.parseDouble(rs.getString(10));
		if(sc>=95){
			score = "A+";
		} else if (sc>=90){
			score = "A";
		} else if (sc>=85){
			score = "B+";
		} else if (sc>=80){
			score = "B";
		} else if (sc>=75){
			score = "C+";
		} else if (sc>=70){
			score = "C";
		} else if (sc>=65){
			score = "D+";
		} else if (sc>=60){
			score = "D";
		} else if (sc<60){
			score = "F";
		}
%>
			<tr>
				<td> <%=rs.getString(1) %> </td>
				<td> <%=rs.getString(2) %> </td>
				<td> <%=rs.getString(3) %> </td>
				<td> <%=rs.getString(4) %> </td>
				<td> <%=rs.getString(5) %> </td>
				<td> <%=rs.getString(6) %> </td>
				<td> <%=rs.getString(7) %> </td>
				<td> <%=rs.getString(8) %> </td>
				<td> <%=rs.getString(9) %> </td>
				<td> <%=rs.getString(10) %> </td>
				<td> <%=score %> </td>
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