<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="odega.bean.ThemeDAO"%>
<%@ page import="odega.bean.ThemeDTO"%>
<%@ page import="odega.bean.FilterDAO"%>
<%@ page import="odega.bean.FilterDTO"%>
<%@ page import="java.util.*"%>

<script language="javascript">
	 function reset(){  // 카테고리 선택 초기화 버튼 
		 if(confirm("초기화를 하시겠습니까?")){
			 reponse.sendRedirect("./main_theme.jsp")
		 }
	 }    
	 
	 function test1(){  // 아직 기능구현 미완성. 
		 alert(document.filterBox.filter.value()); 
		 if ( document.filterBox.filter.value() == null or document.filterBox.filter.value() == "" ) {
			 alert("선택 된 항목이 없습니다." ); 
			 return ; 
		 }	
	 } 

	
</script>
<div id="title" class="text-center">
	<b>원하시는 항목을 선택하면 추천 여행지를 확인할 수 있습니다!</b><br>
	<br>
</div>
<!-- 검색 버튼 누를시 filterPro 실행하여 결과 출력 카테고리(태그) 테이블 필요할 것 같습니다...!-->
<form name="filterBox" action="filterPro.jsp" method="post">
	<div id="category">
		<b>나이</b> <input type="checkbox" name="age" value="10"> 20대 미만 <input type="checkbox" name="age" value="20"> 20대 <input type="checkbox" name="age" value="30"> 30대 <input type="checkbox" name="age" value="40"> 40대 <input
			type="checkbox" name="age" value="50"> 50대 이상 <br> <b>누구와</b> <input type="checkbox" name="who" value="1"> 혼자 <input type="checkbox" name="who" value="2"> 친구 <input type="checkbox" name="who" value="3"> 연인 <input
			type="checkbox" name="who" value="4"> 가족 <input type="checkbox" name="who" value="5"> 반려견 <input type="checkbox" name="who" value="6"> 아이 <br> <b>여행기간</b> <input type="checkbox" name="day" value="1"> 당일치기 <input
			type="checkbox" name="day" value="2"> 1박2일 <input type="checkbox" name="day" value="3"> 2박3일 <input type="checkbox" name="day" value="4"> 장기여행<br> <b>여행목적</b> <input type="checkbox" name="place" value="1">
		자연/힐링 <input type="checkbox" name="place" value="2"> 맛집 <input type="checkbox" name="place" value="3"> 레포츠/체험 <input type="checkbox" name="place" value="4"> 드라이브 <input type="checkbox" name="place" value="5"> 쇼핑 <input
			type="checkbox" name="place" value="6"> 포토스팟<br> <b>여행지역</b> <select name="city">
			<option value="1">서울</option>
			<option value="2">인천</option>
			<option value="3">부산</option>
			<option value="4">광주</option>
			<option value="5">대전</option>
			<option value="6">대구</option>
			<option value="7">울산</option>
			<option value="8">제주도</option>
		</select><br>
		<br>
		<div id="button" class="text-center">
			<input type="reset" value="선택초기화" onclick="reset();"> <input type="submit" value="여행지찾기">
		</div>
	</div>
	</from>
	<hr>