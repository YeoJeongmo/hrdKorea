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
<script type="text/javascript" src="check.js"></script>

<jsp:include page="header.jsp"></jsp:include>

<section style="position: fixed; top: 65px; width:100%;">
	<h3 style="text-align: center;">교과목 목록</h3>
	<form name="frm4" method="post" action="action.jsp" style="display: flex; justify-content: center;">
		<input type="hidden" name="mode" value="modify">
		<table border="1">
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");

try {
	Connection conn = Util.getConnection();
	String sql = "select * from course_tbl where id=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	String lecturer_id = rs.getString(4);
	String week = rs.getString(5);
	
	String start_hour = rs.getString(6);
	while(start_hour.length()<4){
		start_hour = "0" + start_hour;
	}
	String end_hour = rs.getString(7);
	while(end_hour.length()<4){
		end_hour = "0" + start_hour;
	}
%>
			<tr>
				<td> 과목코드 </td>
				<td> <input type="text" name="id" value="<%=id %>" readonly> </td>
			</tr>
			<tr>
				<td> 과목명 </td>
				<td> <input type="text" name="name" value="<%=rs.getString(2) %>"> </td>
			</tr>
			<tr>
				<td> 학점 </td>
				<td> <input type="text" name="credit" value="<%=rs.getString(3) %>"> </td>
			</tr>
			<tr>
				<td> 담당강사 </td>
				<td> 
					<select name="lecturer_id" style="width:100%">
						<option value="">담당강사선택</option>
						<option value="1" <% if(lecturer_id.equals("1")) out.println("selected"); %>> 김교수</option>
						<option value="2" <% if(lecturer_id.equals("2")) out.println("selected"); %>> 이교수</option>
						<option value="3" <% if(lecturer_id.equals("3")) out.println("selected"); %>> 박교수</option>
						<option value="4" <% if(lecturer_id.equals("4")) out.println("selected"); %>> 우교수</option>
						<option value="5" <% if(lecturer_id.equals("5")) out.println("selected"); %>> 최교수</option>
						<option value="6" <% if(lecturer_id.equals("6")) out.println("selected"); %>> 임교수</option>
					</select> 
				</td>
			</tr>
			<tr>
				<td> 요일 </td>
				<td> 
					<input type="radio" name="week" id="md" value="1" <% if(week.equals("1")) out.println("checked"); %>><label id="md">월</label> 
					<input type="radio" name="week" id="td" value="2" <% if(week.equals("2")) out.println("checked"); %>><label id="td">화</label> 
					<input type="radio" name="week" id="wd" value="3" <% if(week.equals("3")) out.println("checked"); %>><label id="wd">수</label> 
					<input type="radio" name="week" id="thd" value="4" <% if(week.equals("4")) out.println("checked"); %>><label id="thd">목</label> 
					<input type="radio" name="week" id="fd" value="5" <% if(week.equals("5")) out.println("checked"); %>><label id="fd">금</label> 
				</td>
			</tr>
			<tr>
				<td> 시작 시간 </td>
				<td> <input type="text" name="start_hour" value="<%=start_hour %>"> </td>
			</tr>
			<tr>
				<td> 종료 시간 </td>
				<td> <input type="text" name="end_hour" value="<%=end_hour %>"> </td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"> 
					<input type="button" value="수정" onclick="modify()"> 
					<input type="button" value="취소" onclick="res()"> 
				</td>
			</tr>
<%
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