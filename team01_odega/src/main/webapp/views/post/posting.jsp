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
<link href="../../resources/static/css/posting.css" rel="stylesheet">

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
		
		<!-- 태그추가 -->
		<div class="m-2 d-flex align-items-center">
			<div class="col-1">
				<label for="tag"></label><span style="width: 100px;">태그 입력</span>
			</div>
			<div class="col-2">
				<input class=" form-control" type="text" id="tag" size="20" placeholder="스페이스 혹은 엔터 입력" />
			</div>
		</div>
		<ul id="tag-list"></ul>


		<textarea class="form-control" rows="10" cols="40" name="content" placeholder="본문을 입력해주세요!"></textarea>
		<!-- /제목&본문 -->
		
		
		<!-- 추가한 장소 리스트 -->
		<div id="placeList">
			
		</div>
		
		
		<!-- 장소 추가하기 -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_addPlace" onclick="mapOpen()">장소 추가하기</button>		
	</form>
	
	<!-- Modal -->
		<jsp:include page="modal.jsp" />


</body>
<script>
$(document).ready(function () {

  	var tag = {};
  	var counter = 0;

  	//태그 추가
  	function addTag(value) {
	    tag[counter] = value; // 태그를 Object 안에 추가
	    counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
  	};
  	//서버에 넘길때 tag값들을 array type 으로 
  	function marginTag() {
	    return Object.values(tag).filter(function (word) {
	        return word !== "";
      	});
  	};

  $("#tag").on("keyup", function (e) {
      var self = $(this);
      console.log("입력중...");

      //엔터 및 스페이스바 입력(추가)
      if (e.key === "Enter" || e.keyCode == 32) {
        var tagValue = self.val(); // 입력값
        
        //null값이아니라면
        if (tagValue !== "") {
          	// 같은 태그가 있는지 검사, 해당값이 array 로 return
          	var result = Object.values(tag).filter(function (word) {
              	return word === tagValue;
          	});

          	// 태그 중복 검사
	        if (result.length == 0) {
	        	$("#tag-list").append("<li class='tag-item'>"
	        			+ tagValue
	        			+ "<span class='del-btn close-icon' idx='" + counter + "'>X</span></li>");
            	addTag(tagValue);
            	self.val("");
          	} else {
	            alert("태그값이 중복됩니다.");
          	}
        };
        
        e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
      }
    });

  // 삭제 버튼:비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
  $(document).on("click", ".del-btn", function (e) {
      var index = $(this).attr("idx");
      tag[index] = "";
      $(this).parent().remove();
    });
});
</script>
</html>