<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="odega.bean.UserDAO"%>
<%@page import="odega.bean.UserDTO"%>
<%
 request.setCharacterEncoding("UTF-8");
    String user_id = request.getParameter("user_id");
    String phone = request.getParameter("phone");
     
UserDAO dao = new UserDAO();
 String found_pw = dao.findPw(user_id, phone); //아이디를 디비에서 가져옴..실패시 널
 
%>

<form name="pwsearch" method="post">
	<%
       if (found_pw != null) {
      %>

	<div class="container">
		<div class="found-success">
			<h4>회원님의 아이디는</h4>
			<div class="found_pw"><%=found_pw%></div>
			<h4>입니다</h4>
		</div>
		<div class="found-login">
			<input type="button" id="btnLogin" value="로그인" onClick='login()' />
		</div>
	</div>
	<%
  } else {
 %>
	<div class="container">
		<div class="found-fail">
			<h4>등록된 정보가 없습니다</h4>
		</div>
		<div class="found-login">
			<input type="button" id="btnback" value="다시 찾기" onClick="history.back()" /> <input type="button" id="btnjoin" value="회원가입" onClick="joinin()" />
		</div>
	</div>

	<div class="adcontainer">
		<a href="#"><img src="../images/casead.png" /></a>
	</div>
	<%
  }
 %>
</form>