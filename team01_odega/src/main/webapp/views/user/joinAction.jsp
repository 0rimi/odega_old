
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page import="odega.bean.UserDAO"%>
<!-- userdao의클래스를 가져옴 -->
<%@ page import="java.io.PrintWriter"%>

<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user" class="odega.bean.UserDTO" scope="page" />
<jsp:setProperty name="user" property="user_id" />
<jsp:setProperty name="user" property="user_pw" />
<jsp:setProperty name="user" property="user_name" />
<jsp:setProperty name="user" property="nickname" />
<jsp:setProperty name="user" property="birth" />

<!DOCTYPE html>
<html>
<head>
<title>joinAction</title>
</head>
<body>
	<%
	//form으로부터 전달받은 값을 DAO로 전송하기 위한 joinAction.jsp

	UserDAO userDAO = new UserDAO();

	int result = userDAO.join(user.getUser_name(), user.getUser_id(), user.getUser_pw(), user.getNickname(), user.getBirth());

	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류입니다.')");
		script.println("history.back()");
		script.println("</script>");

	} else {
		session.setAttribute("name", user.getUser_name()); // 세션 생성 ☆★
		session.setAttribute("id", user.getUser_id()); // 세션 생성 ☆★
		session.setAttribute("pw", user.getUser_pw()); // 세션 생성 ☆★
		session.setAttribute("nickname", user.getNickname()); // 세션 생성 ☆★
		session.setAttribute("birth", user.getBirth()); // 세션 생성 ☆★
		PrintWriter script = response.getWriter();

		script.println("<script>");
		script.println("alert('회원가입 성공')");
		script.println("location.href = 'loginform.jsp'");
		script.println("</script>");
	}
	%>
</body>

</html>