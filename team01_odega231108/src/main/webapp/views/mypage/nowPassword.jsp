<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<%@ page import="java.util.ArrayList"%>
<%@ page import="odega.bean.mypage.myPageDTO"%>
<%@ page import="odega.bean.mypage.myPageDAO"%>
  
<head>
<meta charset="UTF-8">
<title>ODEGA</title>
<link href="/odega/resources/img/good.PNG" rel="shortcut icon" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>


<body>
	<%-- 페이징 --%>
	<%
   int pageSize = 6;
   
   String pageNum = request.getParameter("pageNum");
   if(pageNum == null){
      pageNum = "1";
   }
   
   int currentPage = Integer.parseInt(pageNum);
   int start = (currentPage - 1) * pageSize + 1;
   int end = currentPage * pageSize;
%>

	<div align="center">
		<div class="col" align="left">
			<%@ include file="../user/top.jsp"%>
			<h2 class="mt-3">
				<button type="button" class="btn btn-success"">구독중</button>
				&nbsp&nbsp
				<button type="button" class="btn btn-success"">포스트 작성</button>
				&nbsp&nbsp<a href="myPage.jsp?sql1=posts_num&sql2=desc"><button type="button" class="btn btn-success">마이페이지</button></a>
				<button type="button" class="btn btn-success" 
				data-bs-toggle="dropdown" aria-expanded="false">
   				회원정보 수정</button>
   				  <ul class="dropdown-menu">
				    <li><a class="dropdown-item" href="nowPassword.jsp">비밀번호 변경</a></li>
				    <li><a class="dropdown-item" href="reMember.jsp">회원정보 변경</a></li>
				  </ul>
				<%
				   String sid = (String)session.getAttribute("sid");
				   if(sid != null){
			      %>
				&nbsp&nbsp
				<button onclick="window.location='../user/logout.jsp'" type="button" class="btn btn-success">로그아웃</button>
				<%} else {
%>
				&nbsp&nbsp
				<button onclick="window.location='./user/loginform.jsp'" type="button" class="btn btn-success">로그인</button>
				<% }%>
			</h2>

		</div>
	</div>
	<hr />
	<h1></h1>
	<br />

	<div align="center">
		<form action="search.jsp">
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <img
				src="/odega/resources/img/today.png" style="width: 130px"> <img src="/odega/resources/img/odega.gif" style="width: 200px"> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
				<a href="main.jsp?msql1=p.reg&msql2=desc"><button type="button" class="btn btn-outline-success">전체 최신순</button></a> 
				<a href="main.jsp?msql1=p.reg&msql2=asc"><button type="button" class="btn btn-outline-success">전체 오래된순</button></a> 
				<a href="main.jsp?msql1=p.post_like_cnt&msql2=desc"><button type="button" class="btn btn-outline-success">전체 좋아요순</button></a> 
				<select name="searchOption">
					<option value="total">제목+본문</option>
					<option value="title">제목</option>
				</select> <input type="text" name="search" placeholder="보고싶은 포스팅은?">
				<button type="submit" class="btn btn-success">검색</button>
		</form>
	</div>

	<h1></h1>
	<br />


	<div class="container">
		<div class="col" align="left">

			<div>
				<%   
   String msql1 = request.getParameter("msql1");
   String msql2 = request.getParameter("msql2");
   
   if(msql1 == null || msql2 == null){
      msql1 = "p.reg";
      msql2 = "desc";
   } else{
      msql1 = request.getParameter("msql1");
      msql2 = request.getParameter("msql2");   
   }
   %>
	<form action="nowPasswordPro.jsp">
		<div align="center">
			<table class="table table-hover table-bordered">
				<tr  align="center">
					<td><br /> <h3> 회원가입을 위해서 정보를 입력하세요</h3></td>
				</tr>
				<tr align="center">
					<td>현재 비밀번호<br /> <input type="password" name="nowPw" placeholder="현재 비밀번호 입력" required />
					<button type=submit class="btn btn-success">확인</button></td>
				</tr>
			</table>
			<h1></h1><br /><br /><br /><br /><br />
			</div>
	</form>
</body>
</html>



