<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

<!-- 책 선택하기 모달창 -->
<div class="modal" id="modal_addPlace" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-container">
				<div class="modalHeader">
					<div class="title">책 선택하기</div>
					<button type="button" class="closeBtn" data-dismiss="modal" aria-label="Close">닫기</button>
				</div>
				<div class="modal-search">
					<form id="query-form"> 				<!-- input 값 받아오려고 추가(희원) -->
						<input type="text" class="search_box" id="query" placeholder=" ex) 책 제목, 저자명, 출판사를 검색해보세요" name="query"> 
					</form>
				</div>
				<div class="modal-playlist">
					<ul id="modal-playlist"> <!-- ul에 id 추가(희원) -->
						<!--  
						<li class="list">
							<div class="book-img-container">
								<img src="${pageContext.request.contextPath}/asset/img/book/book2.jpeg" alt="" class="img-thumbnail">
							</div>
							<div class="info-container">
								<button class="book-title">자유로부터의 도피</button>
								<div class="book-author">에리히 프롬(Erich Fromm)</div>
								<div class="review-count">서평수 163+</div>
							</div>
						</li>
						-->
					</ul>
				</div>
				<nav class="paging" aria-label="Page navigation example">
					<ul class="pagination">
						<!-- 
						<li class="page-item"><a class="page-link" href="" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						
						<li class="page-item"><a class="page-link" href="">1</a></li>
						<li class="page-item"><a class="page-link" href="">2</a></li>
						<li class="page-item"><a class="page-link" href="">3</a></li>
						<li class="page-item"><a class="page-link" href="">4</a></li>
						<li class="page-item"><a class="page-link" href="">5</a></li>
						
						<li class="page-item"><a class="page-link" href="" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
						-->
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- /책 선택하기 -->
