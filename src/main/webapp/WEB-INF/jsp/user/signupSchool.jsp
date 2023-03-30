<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iLikeSchool - 학교정보</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<body>

	<div class="container" width="1200">
		
		<div class="empty-box">
			<div class="mt-3 text-right">
				${userNickname } 님 <a href="/user/signout">로그아웃</a>		
			</div>
		</div>
		
		<div class="sign-up-box d-flex justify-content-center">
		
			<div class="text-center school-input-box">
			
				<div class="display-4">학교 정보 추가</div>
				<h5 class="text-secondary mt-2">졸업한 학교의 정보를 입력하세요 :)</h5>
							
				<h4 class="text-left mt-5">나의 졸업 학교정보</h4>

				<div class="input-group mt-2">
					<input type="text" class="form-control" placeholder="초등학교" id="elementaryInput">
					<button class="btn btn-success" type="button">찾기</button>			
				</div>
				<div class="input-group mt-2">
					<input type="text" class="form-control" placeholder="중학교" id="middleschoolInput">
					<button class="btn btn-success" type="button">찾기</button>			
				</div>
				<div class="input-group mt-2">
					<input type="text" class="form-control" placeholder="고등학교" id="highschoolInput">
					<button class="btn btn-success" type="button">찾기</button>			
				</div>
				<div class="input-group mt-2">
					<input type="text" class="form-control" placeholder="대학교" id="universityInput">
					<button class="btn btn-success" type="button">찾기</button>			
				</div>			
								
				<button class="btn btn-warning btn-block mt-3" id="saveBtn" data-user-id="${userId }">저장하기</button>
			</div>
		</div>
		
	</div>
	
	<script>
		$(document).ready(function() {
			
			$("#saveBtn").on("click", function() {
								
				let elementary = $("#elementaryInput").val();
				let middleschool = $("#middleschoolInput").val();
				let highschool = $("#highschoolInput").val();
				let university = $("#universityInput").val();
								
				if(elementary == "") {
					alert("초등학교 정보를 입력하세요");
					return;
				}
				
				if(middleschool == "") {
					alert("중학교 정보를 입력하세요");
					return;
				}

				$.ajax({
					type:"get"
					, url:"/school/add"
					, data:{"elementary":elementary, "middleschool":middleschool, "highschool":highschool, "university":university}
					, success:function(data) {
						if(data.result == "success") {
							// 사용자 학교정보 추가
							$.ajax({
								type:"get"
								, url:"/user/signup/userschool"
								, data:{"elementary":elementary, "middleschool":middleschool, "highschool":highschool, "university":university}
								, success:function(data) {
									if(data.result == "success") {
										location.href="/school/main"
									} else {
										alert("사용자 학교정보 저장 실패");	
									}
								}
								, error:function() {
									alert("사용자 학교정보 추가 에러");
								}
							});

						} else {
							alert("학교 정보 저장 실패");	
						}						
					}
					, error:function() {
						alert("학교 정보 추가 에러");
					}
				});
				
				
				
				
			});
			
			
		});
	
	</script>
	
	
</body>
</html>