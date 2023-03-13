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
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<body>

	<div class="container" width="1200">
		<div class="empty-box"></div>
		
		<div class="d-flex justify-content-between align-items-center">
			<h4><a href="/user/signin/view" class="text-dark">i Like School</a></h4>
			<div class="mt-3 text-right">
				${userNickname } 님 <a href="/user/signout">로그아웃</a>		
			</div>		
		</div>

		<div class="sign-up-box d-flex justify-content-center">
			<div class="text-center">
				
				<h3 class="mt-3">프로필 정보</h3>
				
				<div class="d-flex align-items-center mt-4">
					<h1 id="profileImageIcon"><i class="bi bi-person-square"></i></h1>
					<div class="ml-3"><i class="bi bi-plus-circle text-primary"></i>프로필 이미지 설정</div>
				</div>
				
				<div class="d-flex mt-2">
					<input class="form-control mr-2" type="text" placeholder="별명" id="nicknameInput">
					<button class="btn check-btn" id="checkNicknameBtn">중복확인</button> 				
				</div>
				
				<div class="small text-danger text-left d-none" id="duplicatedNickname">사용중인 별명 입니다</div>
				<div class="small text-primary text-left d-none" id="availableNickname">사용가능한 별명 입니다</div>
								
				<input class="form-control mt-2" type="password" placeholder="비밀번호" id="passwordInput">
				<input class="form-control mt-2" type="password" placeholder="비밀번호 확인" id="passwordConfirmInput">

				<div class="d-flex mt-2">
					<input type="text" class="form-control mr-2" placeholder="email" id="emailInput">
					<div class="ml-1 mr-1">@</div>
					<input type="text" class="form-control d-none" id="domainCustom">
					<select class="form-control" id="domainInput">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option value="custom">직접입력</option>
					</select>				
				</div>
				<input type="text" class="form-control mt-2" placeholder="핸드폰 번호 (000-0000-0000)" id="phoneNumberInput">
				<input type="text" class="form-control mt-2" placeholder="생년월일 (YYMMDD)" id="birthdayInput">

				<h5 class="text-left mt-2">나의 졸업 학교정보</h5>
	
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
	
	
	</script>
	
</body>
</html>