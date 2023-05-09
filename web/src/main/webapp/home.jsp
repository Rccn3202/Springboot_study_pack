<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Connection con; //커넥션 준비
	Class.forName("com.mysql.cj.jdbc.Driver"); //유심장착

	String url = "jdbc:mysql://localhost:3305/nothing"; //전화번호
	String id = "root"; //아이디
	String pwd = "1234"; //비밀번호

	con = DriverManager.getConnection(url, id, pwd);
	Statement stmt = con.createStatement(); //sql 입력창 만든 것

	ResultSet rs = stmt.executeQuery("SELECT * FROM USER_INFO02");
	//ResultSet은 SELECT문의 결과를 저장하는 객체
	//executeQuery 1. 수행결과로 ResultSet 객체의 값을 반환합니다. 2. SELECT 구문을 수행할 때 사용되는 함수입니다.
	%>
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>주소</th>
			<th>비밀번호</th>
			<th>생년월일</th>
			<th>성별</th>
			<th>날짜</th>
			<th>시간</th>
			<th>outdate?</th>
			<th>active?</th>
			<th>수준?</th>
			<th>직무</th>
		</tr>

		<%
		while (rs.next()) {
			int uiNum = rs.getInt("UI_NUM");
			String uiId = rs.getString("UI_ID");
			String uiName = rs.getString("UI_NAME");
			String uiEmail = rs.getString("UI_EMAIL");
			String uiAddress = rs.getString("UI_ADDRESS");
			String uiPwd = rs.getString("UI_PWD");
			String uiBirth = rs.getString("UI_BIRTH");
			String uiTrans = rs.getString("UI_TRANS");
			String credat = rs.getString("CREDAT");
			String cretim = rs.getString("CRETIM");
			String outdat = rs.getString("OUTDAT");
			String active = rs.getString("ACTIVE");
			String uiLvl = rs.getString("UI_LVL");
			String uiDuties = rs.getString("UI_DUTIES");
			
			out.println("<td>" + uiNum + "</td>");
			out.println("<td>" + uiId + "</td>");
			out.println("<td>" + uiName + "</td>");
			out.println("<td>" + uiAddress + "</td>");
			out.println("<td>" + uiPwd + "</td>");
			out.println("<td>" + uiBirth + "</td>");
			out.println("<td>" + uiTrans + "</td>");
			out.println("<td>" + credat + "</td>");
			out.println("<td>" + cretim + "</td>");
			out.println("<td>" + outdat + "</td>");
			out.println("<td>" + active + "</td>");
			out.println("<td>" + uiLvl + "</td>");
			out.println("<td>" + uiDuties + "</td>");
			out.println("</tr>");
		}
		%>
	</table>
</body>
</html>