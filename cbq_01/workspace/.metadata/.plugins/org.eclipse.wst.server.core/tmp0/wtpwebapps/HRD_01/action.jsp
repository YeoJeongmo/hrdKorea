<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String resist_month = request.getParameter("resistMonth");
String c_no = request.getParameter("cNo");
String class_area = request.getParameter("classArea");
String tuition = request.getParameter("tuition");
String classname = request.getParameter("className");
int teacher_code = Integer.parseInt(classname)/1000;

try {
	Connection conn = Util.getConnection();
	String sql = "insert into tbl_class_202201 values (?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, resist_month);
	pstmt.setString(2, c_no);
	pstmt.setString(3, class_area);
	pstmt.setString(4, tuition);
	pstmt.setInt(5, teacher_code);
	
	pstmt.executeUpdate();
	
} catch (Exception e){
	e.printStackTrace();
}
%>