<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
		
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<section class="d-flex justify-content-center">
			<div style="width:600px;">
				<div class="my-3">
					<h4>${userNickname } 의 방명록</h4>				
				</div>
				
				<!-- 내 방명록이 아닐 경우에만 guest-input-div 보이도록 -->
				<c:if test="${param.bookUserId ne userId }">
					<div class="guest-input-div d-flex p-3">
						<div class="profile-div mt-3 ml-2 mr-2">
							<img class="rounded-circle" width="50" src="https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_960_720.jpg">
							<div class="text-center">${userNickname }</div>
						</div>
						<div class="ml-2 mr-2">
							<!-- <label><input type="checkbox">비밀글</label> -->						
							<textarea rows="4" cols="40" class="form-control" placeholder="글쓰기"></textarea>
						</div>
						<div class="mt-3 ml-2">
							<button class="btn input-btn p-4">올리기</button>					
						</div>
					</div>		
				</c:if>
				<div class="my-guestbook-div">
					<div class="guestbook-post d-flex p-3">
						<div class="profile-div mt-3 ml-2 mr-2">
							<img class="rounded-circle" width="50" src="https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_960_720.jpg">
							<div class="text-center">미종</div>
						</div>
						<div class="ml-2 mr-2 bg-white p-2" style="width:400px;height:100px;border:1px solid #bebebe;">
							내용 주절주절..
						</div>					
					</div>
					<div class="guestbook-post d-flex p-3">
						<div class="profile-div mt-3 ml-2 mr-2">
							<img class="rounded-circle" width="50" src="https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_960_720.jpg">
							<div class="text-center">미종</div>
						</div>
						<!-- <h6><i class="bi bi-lock-fill"></i>비밀글 입니다.</h6> -->				
						<div class="ml-2 mr-2 bg-white p-2" style="width:400px;height:100px;border:1px solid #bebebe;">
							내용 주절주절..
						</div>					
					</div>
				</div>
			</div>
								
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>


</body>
</html>