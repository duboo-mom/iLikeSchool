<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iLikeSchool - 아이디 찾기</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

</head>
<body>
<div class="container" width="1200">
		<div class="empty-box"></div>
		
		<div class="singin-box d-flex justify-content-center">
		
			<div>
				<div class="text-center">
					<div class="display-4">아이디 찾기</div>
					<h5 class="text-secondary mt-3">i Like School 아이디 찾기</h5>
				</div>
				<div class="d-flex justify-content-center">
					<div class="col-12">
						<input type="text" class="form-control mt-5" placeholder="이름(실명)" id="nameInput">
						<input type="text" class="form-control mt-2" placeholder="email 주소" id="emailInput">
					
						<button class="btn btn-primary btn-block mt-3 mb-3 text-white" id="searchBtn">찾기</button>
						
						<hr>
						
						<div class="text-center d-none" id="idResultDiv">
							<h6>회원님의 아이디는</h6>
							<h5 id="idResult"></h5>
							<h6>입니다.</h6>
						</div>
						
					</div>	
				</div>
				<div class="mt-4 d-flex justify-content-around">
					<a href="/user/signin/view">로그인</a>
					<a href="/user/find_pw/view">비밀번호 찾기</a>
					<a href="/user/signup/view">회원가입</a>
				</div>
				
				
			</div>
		</div>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>
	
	
	<script>
		$(document).ready(function() {
			
			$("#searchBtn").on("click", function() {
				
				let name = $("#nameInput").val();
				let email = $("#emailInput").val();
				
				if(name == "") {
					alert("이름(실명)을 입력하세요");
					return;
				}
				
				if(email == "") {
					alert("이메일을 입력하세요");
					return;
				}
				
				$.ajax({
					type:"get"
					, url:"/user/find_id"
					, data:{"name":name, "email":email}
					, success:function(data) {
						if(data.result == "success") {
							$("#idResultDiv").removeClass("d-none");
							$("#idResult").text(data.loginId);
						} else {
							alert("일치하는 사용자가 없습니다");
						}	
					}
					, error:function() {
						alert("아이디 찾기 에러");
					}
				});
				
				
			});
			
		});
	
	</script>
	
</body>
</html>