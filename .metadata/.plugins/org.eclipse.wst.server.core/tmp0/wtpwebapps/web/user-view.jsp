<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String uiNum = request.getParameter("uiNum");
Connection con = DBCon.getCon();
String sql = "SELECT * FROM USER_INFO WHERE UI_NUM=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1,uiNum);
ResultSet rs = pstmt.executeQuery();
if(rs.next()){
%>
번호 : <%=rs.getInt("UI_NUM") %><br>
이름 : <%=rs.getString("UI_NAME") %><br>
아이디 : <%=rs.getString("UI_ID") %><br>
비번 : <%=rs.getString("UI_PWD") %><br>
등록일 : <%=rs.getString("UI_DATE") %><br>
<button onclick="location.href='/user-update.jsp?uiNum=<%=rs.getInt("UI_NUM")%>'">수정</button>
<% 
}
%>
</body>
</html>