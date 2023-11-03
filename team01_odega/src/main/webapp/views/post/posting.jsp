<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포스팅</title>
<!--boot css-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<!--boot js-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- style -->
<link href="../../resources/static/css/mapSearch.css" rel="stylesheet">
</head>
<body>
	<form method="get" action="#">
		<!-- 제목&본문 -->
		<div class="form-floating mb-3">
			<input type="text" class="form-control" id="title" placeholder="제목을 입력하세요" name="title">
			<label for="title">제목</label>
		</div>
														<!-- 임시유저넘버:3 -->
		<input class="form-control" type="hidden" name="user_num" value="3">
		<textarea class="form-control" rows="10" cols="40" name="content" placeholder="본문을 입력해주세요!"></textarea>
		<!-- /제목&본문 -->
		
		
		
		<!-- 장소 추가하기 -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_addPlace" onclick="mapOpen()">장소 추가하기</button>		
	</form>
	
	<!-- Modal -->
		<jsp:include page="modal.jsp" />


</body>
</html>