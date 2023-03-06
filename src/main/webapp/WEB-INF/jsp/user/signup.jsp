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
			<div class="text-center">
			
				<div class="display-4">회원가입</div>
				
				<div class="d-flex mt-4">
					<input class="form-control mr-2" type="text" placeholder="ID">
					<button class="btn btn-success">중복확인</button> 				
				</div>
				<input class="form-control mt-2" type="password" placeholder="비밀번호">
				<input class="form-control mt-2" type="password" placeholder="비밀번호 확인">
				<input class="form-control mt-2" type="text" placeholder="이름(실명) - ID/친구찾기 용">
				<div class="d-flex mt-2">
					<input class="form-control mr-2" type="text" placeholder="별명">
					<button class="btn btn-success">중복확인</button> 				
				</div>
				<div class="d-flex mt-2">
					<input type="text" class="form-control mr-2" placeholder="email">
					<select class="form-control">
						<option>도메인 선택</option>
						<option>@naver.com</option>
						<option>@daum.net</option>
						<option>@google.com</option>
						<option>직접입력</option>
					</select>				
				</div>
				<input type="text" class="form-control mt-2" placeholder="핸드폰 번호 (000-0000-0000)">
				<input type="text" class="form-control mt-2" placeholder="생년월일 (YYMMDD)">
				
				<div class="d-flex text-left mt-2">
					<h5 class="mr-3">성별</h5>
					<label><input type="radio" class="mr-1">남</label>
					<label class="ml-2"><input type="radio" class="mr-1">여</label>
				</div>

				<button class="btn btn-warning btn-block mt-3">다음</button>
			</div>
		</div>
	
	
	</div>
	
</body>
</html>