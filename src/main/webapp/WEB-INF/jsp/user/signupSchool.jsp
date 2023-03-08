<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iLikeSchool - 회원가입</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
<body>

	<div class="container" width="1200">
		<div class="empty-box"></div>
		
		<div class="sign-up-box d-flex justify-content-center">
		
			<div class="text-center school-input-box">
			
				<div class="display-4">학교 정보 추가</div>
				<h5 class="text-secondary">졸업한 학교의 정보를 입력하세요 :)</h5>
							
				<h4 class="text-left mt-4">학교정보</h4>
				<input type="text" class="form-control mt-2" placeholder="초등학교">
				<input type="text" class="form-control mt-2" placeholder="중학교">
				<input type="text" class="form-control mt-2" placeholder="고등학교">
				<input type="text" class="form-control mt-2" placeholder="대학교">
			
				<button class="btn btn-warning btn-block mt-3">완료</button>
			</div>
		</div>
	
	
	</div>
	
</body>
</html>