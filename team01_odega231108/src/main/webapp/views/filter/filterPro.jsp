<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="odega.bean.ThemeDAO"%>
<%@ page import="odega.bean.ThemeDTO"%>
<%@ page import="odega.bean.PostsDAO"%>
<%@ page import="odega.bean.PostsDTO"%>
<%@include file="dbconn.jsp"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>검색결과</title>
<!--boot css-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<!--boot js-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="./themeView.css" rel="stylesheet">
</head>
<body>
	<!--header-->
	<header class="bg-dark text-white d-flex justify-content-between align-items-center">
		<logo class="m-3">ODEGA</logo>

		<!-- 로그인 안했을때 -->
		<div id="loginBox" class="d-flex justify-content-end m-3">
			<a>로그인</a> <a>회원가입</a>
		</div>
		<!-- 로그인 했을때
        <div id="miniProfile"></div> -->
	</header>
	<!--/header-->
	<!-- 메뉴 -->
	<div class="mt-3 ms-3">
		<b>탐색</b>
		<hr>
		<b>테마별</b> <a href="./powerGuide.jsp">파워가이드</a></br>
		<hr>
		<b>검색결과..</b><br>
		<br>
		<div class="d-flex justify-content-start align-items-center">


			<%
	request.setCharacterEncoding("utf-8");
    //기본 쿼리문은 여러 테이블을 조인하는 쿼리문입니다
    String query = "select a.*, b.*, c.* from posts a join users b on a.user_num = b.num join images c on a.num = c.num where 1=1  " ;
    String age = request.getParameter("age"); // 항목별 각 선택 값을 입력받기 위한 변수를 선언
    String who = request.getParameter("who"); 
    String day = request.getParameter("day"); 
    String place = request.getParameter("place");  
    String city = request.getParameter("city");
    System.out.println( "test1: " + age  + " test2: " + who + " test3: " + place + " test4: " + day  + " test5: " + city ) ; // 콘솔창에 선택 된 값을 확인하기 위한 출력문 
   
    if (age != null && !age.isEmpty()) {
  
        query += " and content like ? " ;   //선택된 값이 있을 경우 기본 쿼리문 뒤에 붙이는 쿼리문입니다. 
        System.out.println( "test!" + query + "/ " + age ) ; 
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, "%" + age +"%");
		/* pstmt.setString(2, who);
		pstmt.setString(3, day);
		pstmt.setString(4, place);
		pstmt.setString(5, city);
		*/
        rs = pstmt.executeQuery();

    }   
    
    	else {
    	System.out.println("선택하신 필터값이 없습니다!") ; 
    	//document.getElementById('filterBox').submit() ; 
    }
    while (rs.next()) { 
  %>
			<div id="profileBox" class="d-flex justify-content-center m-1">
				<img src="<%=rs.getString("img_url")%>" width="200 px" height="180 px">
				<div id="infoBox" class="m-3">
					<a href="./content.jsp" title="<%=rs.getString("nickname")%>의 포스팅 보기"><%=rs.getString("title") %><a><br> <%=rs.getString("nickname") %> 님 <br> <%=rs.getTimestamp("reg") %><br>
							<div>
								<div class="tag">#힐링</div>
								<div class="tag">#가을</div>
								<div class="tag">#시티투어</div>
							</div>
							<div class="d-flex justify-content-start align-items-center">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                            </svg>

								<div class="ms-1"><%=rs.getInt("post_like_cnt")%></div>
							</div>
				</div>
			</div>
		</div>
		<br>
		<%}
			    if (rs != null) {
			        rs.close();
			    }
			    if (pstmt != null) {
			        pstmt.close();
			    }
			    if (conn != null) {
			        conn.close();
			    }
			    %>

		<hr>
	</div>
</body>