<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임</title>

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
		
		<section class="d-flex justify-content-center mt-3">
			<div class="gathering-content">
				<div class="d-flex">
					<h4>모임 이름</h4>
					<div class="ml-3 text-secondary">모임 소개~~~ 50자 제한</div>
				</div>
				
				<div class="mt-3 d-flex justify-content-between">
					<div>
						방장의 프로필 보여주는 box					
					</div>
					<%--가입하지 않은 사람이면 가입하기 버튼, 가입한 사용자면 탈퇴하기 버튼 선택적으로 보여주기 --%>
					<!-- <button class="btn btn-success btn-sm">가입하기</button> -->
					<button class="btn btn-danger btn-sm">탈퇴하기</button>
				</div>
				
				<hr>
				<div>
					<div class="d-flex justify-content-between">
						<h5>공지사항</h5>
						<%-- 로그인한 userId와 해당 모임의 주인 userId가 일치하는 경우에만 아래 태그 보여주기 --%>
						<a href="#">수정하기</a>					
					</div>
					<ul>
						<li>1. 어쩌구저쩌구</li>
						<li>2. 함냐함냐</li>
					</ul>
				</div>
				<hr>
				<div>
					<h5>모임사진</h5>
					<div class="text-secondary">
						사진이 없습니다. <br>
						사진을 등록해주세요 :)
					</div>
				</div>
				<hr>
				<h5>주절주절</h5>
				<div class="gathering-comment-div">
					<div><b>미종</b>&nbsp 다들 여기 빨리 가입해봐</div>
					<div><b>미종</b>&nbsp 안녕하세용</div>
				</div>
				<div class="d-flex mt-2 mb-4">
					<input type="text" class="form-control" placeholder="${userNickname } (으)로 한마디">
					<!-- <input type="text" class="form-control" name="${post.id}">  -->
					<button type="button" class="btn input-btn ml-2 comment-btn">남기기</button>
				</div>
			</div>
						
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>

</body>
</html>