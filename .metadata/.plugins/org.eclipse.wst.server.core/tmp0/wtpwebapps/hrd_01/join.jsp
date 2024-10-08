<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
</head>
<body>

<script type="text/javascript" src="check.js"></script>

<jsp:include page="header.jsp"/>


<section style="position:fixed;
				top: 60px;
				color: black;
				width: 100%;
				">
<h2 style="text-align: center;">홈쇼핑 회원 등록</h2>
<form 	method="post"
		action="action.jsp"
		name="frm"
		style="display:flex;
			align-items: center;
			justify-content: center;"
		>

	<input type="hidden" name="mode" value="insert">

	<table border="1">
		<%
		Connection conn = null;
		Statement stmt = null;
		String custno = "";
		
		try {
			conn = Util.getConnection();	// DB 연결
			stmt = conn.createStatement();	// sql 실행하기 위한 변수 생성
			String sql = "SELECT MAX(custno)+1 custno FROM member_tbl_02";
			ResultSet rs = stmt.executeQuery(sql);	// stmt 통해서 sql 실행 결과
			rs.next();	// 1개의 결과물 출력
			custno = rs.getString("custno");
		} catch(Exception e) {
			e.printStackTrace(); // 단계별로 에러를 추출해서 전체 에러메시지를 출력해주는 함수
		}
		%>
		<tr>
			<td>회원번호(자동발생)</td>
			<td><input type="text" name="custno" value="<%=custno %>" readonly="readonly"></td>
		</tr>
		<tr>
			<td>회원성명</td>
			<td><input type="text" name="custname"></td>
		</tr>
		<tr>
			<td>회원전화</td>
			<td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<td>회원주소</td>
			<td><input type="text" name="address"></td>
		</tr>
		<tr>
			<td>가입일자</td>
			<td><input type="text" name="joindate"></td>
		</tr>
		<tr>
			<td>고객등급 [A:VIP, B:일반, C:직원]</td>
			<td><input type="text" name="grade"></td>
		</tr>
		<tr>
			<td>도시코드</td>
			<td><input type="text" name="city"></td>
		</tr>
		<tr>
			<td colspan="2"
				style="text-align: center">
				<input type="submit" value="등록" onclick="return joinCheck()"/>
				<input type="button" value="조회" onclick="return search()"/>
			</td>
		</tr>
	</table>
</form>

</section>

<jsp:include page="footer.jsp"/>

</body>
</html>