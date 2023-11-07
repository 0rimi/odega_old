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

	<div>
		<div class="col" align="left">
			<%@ include file="../user/top.jsp"%>
			<h2 class="mt-3">
				<button type="button" class="btn btn-success">구독중</button>
				&nbsp&nbsp
				<button type="button" class="btn btn-success">포스트 작성</button>
				&nbsp&nbsp<a href="myPage.jsp?sql1=posts_reg&sql2=desc"><button type="button" class="btn btn-success">마이페이지</button></a>

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
				<a href="adminMembers.jsp?msql1=num&msql2=desc"><button type="button" class="btn btn-outline-success">전체 최신순</button></a> 
				<a href="adminMembers.jsp?msql1=num&msql2=asc"><button type="button" class="btn btn-outline-success">전체 오래된순</button></a> 
				<select name="searchOption">
					<option value="total">제목+본문</option>
					<option value="title">제목</option>
				</select> <input type="text" name="search" placeholder="보고싶은 포스팅은?">
				<button type="submit" class="btn btn-success">검색</button>
		</form>
	</div>

	<div align="center">
		<form action="search.jsp">
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				<a href="admin.jsp?msql1=reg&msql2=desc"><button type="button" class="btn btn-outline-success">추천/글삭제</button></a> 
				<a href="adminMembers.jsp?msql1=reg&msql2=asc"><button type="button" class="btn btn-outline-success">회원 강제 탈퇴</button></a> 
		</form>
	</div>
	
	<hr />

	<h1></h1>
	<br />


	<div class="container">
		<div class="col" align="left">

			<div>
				<%   
			   String msql1 = request.getParameter("msql1");
			   String msql2 = request.getParameter("msql2");
			   
			   if(msql1 == null || msql2 == null){
			      msql1 = "reg";
			      msql2 = "desc";
			   } else{
			      msql1 = request.getParameter("msql1");
			      msql2 = request.getParameter("msql2");   
			   }
			   %>
			   </div>
		</div>
	</div>
			<div class="container">
					<div class="row" align="center">
						<%
   myPageDAO dao = new myPageDAO();
   ArrayList<myPageDTO> list = dao.userList(start, end, msql1 , msql2);
   for(myPageDTO dto : list){
%><div class="col-md-4">
							<p style="font-size: 15px;">
								유저번호 :
								<%=dto.getNum()%></p>
							<p style="font-size: 15px;">
								유저ID :
								<%=dto.getUserid()%></p>
							<p style="font-size: 15px;">
								유저 닉네임 :
								<%=dto.getNickname() %></p>
							<p style="font-size: 15px;">
								생년월일 :
								<%=dto.getBirth()%></p>
							<p style="font-size: 15px;">
								등록일 :
								<%=dto.getReg()%></p>
							<p style="font-size: 15px;">
								유저 이름 :
								<%=dto.getUser_name()%></p>
							<script type="text/javascript">
								function del() {
								  if (confirm("정말 삭제하시겠습니까?"))
								    list_ok.submit();
								 }
							</script>
								<a href="myMemberDelete.jsp?unum=<%=dto.getNum()%>" onclick="del();"><button onclick="del(); type="button" class="btn btn-success" >삭제</button></a>
								<h3></h3>
								<hr />
						</div>

						<% } %>
					</div>
				</div>
				<h1></h1>
				<br />

				<div align="center">
					<%
   int count = dao.ucount();
   if(count > 0){
      int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
      int startPage = (int)(currentPage/10)*10+1;
      int pageBlock = 10;
      int endPage = startPage + pageBlock - 1;
      if(endPage > pageCount){
         endPage = pageCount;
      }
      
      
      if(startPage > 10){
      %>
					<b><a href="adminMembers.jsp?msql1=<%=msql1%>&msql2=<%=msql2%>&pageNum=<%=startPage-10%>">[이전]</a></b>
					<%   }
      
      for(int i=startPage; i<=endPage; i++){
      %>
					<a href="adminMembers.jsp?msql1=<%=msql1%>&msql2=<%=msql2%>&pageNum=<%=i%>"><b>[<%=i%>]
					</b></a>

					<%} if(endPage < pageCount){
   %>
					<b><a href="adminMembers.jsp?msql1=<%=msql1%>&msql2=<%=msql2%>&pageNum=<%=startPage+10%>">[다음]</a></b>
					<%   }   
   }
%>
				</div>
				<h1></h1>
				<br />
				<h1></h1>
				<br />
</body>
</html>



