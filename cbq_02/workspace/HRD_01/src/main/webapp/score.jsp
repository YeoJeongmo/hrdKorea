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

<section style="position: fixed; top: 60px; width: 100%;">
	<h2 style="text-align: center;">성젹현황</h2>
	<form name="frm" style="display: flex; width: 100%; justify-content: center; text-align: center">
		<table border="1">
			<tr>
				<td> 학번 </td>
				<td> 성명 </td>
				<td> 교과목 </td>
				<td> 교과목코드 </td>
				<td> 담당교수 </td>
				<td> 중간 </td>
				<td> 기말 </td>
				<td> 출석 </td>
				<td> 레포트 </td>
				<td> 기타 </td>
				<td> 평균 </td>
				<td> 총점 </td>
				<td> 학점 </td>
			</tr>
<%
request.setCharacterEncoding("UTF-8");
String score = "";
try {
	Connection conn = Util.getConnection();
	String sql = "select st.stuid, st.sname, su.subname, su.subcode, su.proname, sc.midscore, sc.finalscore, sc.attend, sc.report, sc.etc, ROUND((sc.midscore + sc.finalscore + sc.attend + sc.report + sc.etc)/5), round(sc.midscore*0.3+sc.finalscore*0.3+sc.attend*0.2+sc.report*0.1+sc.etc*0.1, 1) from tbl_student_202210 st, tbl_score_202210 sc, tbl_subject_202210 su where st.stuid=sc.sid and su.subcode=sc.subcode";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		double sc = Double.parseDouble(rs.getString(12));
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
				<td> <%=rs.getString(11) %> </td>
				<td> <%=rs.getString(12) %> </td>
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