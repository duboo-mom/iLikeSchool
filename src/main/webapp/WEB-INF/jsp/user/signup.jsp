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
				
				<h2><a href="/user/signin/view">i Like School</a></h2>
				
				<div class="display-4 mt-3">회원가입</div>
				
				<div class="d-flex mt-4">
					<input class="form-control mr-2" type="text" placeholder="ID" id="idInput">
					<button class="btn check-btn" id="checkIdBtn">중복확인</button> 				
				</div>
				
				<div class="small text-danger text-left d-none" id="duplicatedId">사용중인 아이디 입니다</div>
				<div class="small text-primary text-left d-none" id="availableId">사용가능한 아이디 입니다</div>
				
				<input class="form-control mt-2" type="password" placeholder="비밀번호" id="passwordInput">
				<input class="form-control mt-2" type="password" placeholder="비밀번호 확인" id="passwordConfirmInput">
				<input class="form-control mt-2" type="text" placeholder="이름(실명) - ID/친구찾기 용" id="nameInput">
				<div class="d-flex mt-2">
					<input class="form-control mr-2" type="text" placeholder="별명" id="nicknameInput">
					<button class="btn check-btn" id="checkNicknameBtn">중복확인</button> 				
				</div>
				
				<div class="small text-danger text-left d-none" id="duplicatedNickname">사용중인 별명 입니다</div>
				<div class="small text-primary text-left d-none" id="availableNickname">사용가능한 별명 입니다</div>
				
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
				
				<div class="d-flex text-left mt-2">
					<h5 class="mr-3">성별</h5>
					<form>
						<label><input type="radio" class="mr-1 gender-input" name="gender" value="m" checked="checked">남</label>
						<label class="ml-2"><input type="radio" class="mr-1 gender-input" name="gender" value="f">여</label>				
					</form>
				</div>

				<button class="btn btn-block mt-3" id="signupBtn">가입하기</button>
			</div>
		</div>	
	
	</div>
	
	<script>
	
		$(document).ready(function() {
			
			var idDuplicate = false;
			var checkId = false;
			var nicknameDuplicate = false;
			var checkNickname = false;
			
			
			// 아이디 중복확인			
			$("#checkIdBtn").on("click", function() {
				
				let id = $("#idInput").val();
				
				$.ajax({
					type:"get"
					, url:"/user/loginid/is_duplicated"
					, data:{"loginId":id}
					, success:function(data) {
						
						if(data.result) {
							$("#duplicatedId").removeClass("d-none");
							$("#availableId").addClass("d-none");
							idDuplicate = true;
						} else {
							$("#availableId").removeClass("d-none");
							$("#duplicatedId").addClass("d-none");
							idDuplicate = false;
						}
						
						
						checkId = true;
					}
					, error:function() {
						alert("중복 확인 에러");
					}
				});
				
				
			});
			
			
			// 별명 중복확인
			$("#checkNicknameBtn").on("click", function() {
				
				let nickname = $("#nicknameInput").val();
				
				$.ajax({
					type:"get"
					, url:"/user/nickname/is_duplicated"
					, data:{"nickname":nickname}
					, success:function(data) {
						
						if(data.result) {
							$("#duplicatedNickname").removeClass("d-none");
							$("#availableNickname").addClass("d-none");
							nicknameDuplicate = true;
						} else {
							$("#availableNickname").removeClass("d-none");
							$("#duplicatedNickname").addClass("d-none");
							nicknameDuplicate = false;
						}
						
						checkNickname = true;
						
					}
					, error:function() {
						alert("별명 중복 확인 에러");
					}
				});
				
				
			});
			
			
			$("#signupBtn").on("click", function() {
				
				let id = $("#idInput").val();
				let password = $("#passwordInput").val();
				let passwordConfirm = $("#passwordConfirmInput").val();
				let name = $("#nameInput").val();
				let nickname = $("#nicknameInput").val();
				let emailId = $("#emailInput").val();
				let emailDomain = $("#domainInput").val();
				let phoneNumber = $("#phoneNumberInput").val();
				let birthday = $("#birthdayInput").val();
				let gender = $(".gender-input").val();
				
				// email 직접입력 input text 보여주기
				$("#domainInput").on("change", function() {
					
					let domain = $(this).val();
					
					if(domain == "custom") {
						$(this).addClass("d-none");
						$("#domainCustom").removeClass("d-none");
					} else {
						$(this).removeClass("d-none");
						$("#domainCustom").addClass("d-none");
					}
					
				});
				
				let email = emailId + '@' +  emailDomain;
				
				if(id == "") {
					alert("아이디를 입력하세요");
					return;
				}
				
				if(password == "") {
					alert("비밀번호를 입력하세요");
					return;
				}
				
				if(password != passwordConfirm) {
					alert("비밀번호를 확인하세요");
					return;
				}
				
				if(name == "") {
					alert("이름(실명)을 입력하세요");
					return;
				}
				
				if(nickname == "") {
					alert("별명(닉네임)을 입력하세요");
					return;
				}
				
				if(email == "") {
					alert("이메일을 입력하세요");
					return;
				}
				
				if(phoneNumber == "") {
					alert("핸드폰 번호를 입력하세요");
					return;
				}
				
				if(birthday == "") {
					alert("생년월일을 입력하세요");
					return;
				}
				
				if(!checkId) {
					alert("아이디 중복확인을 해주세요");
					return;
				}
				
				if(idDuplicate) {
					alert("중복된 아이디는 사용할 수 없습니다");
					return;
				}
				
				if(!checkNickname) {
					alert("닉네임 중복확인을 해주세요");
					return;
				}
				
				if(nicknameDuplicate) {
					alert("중복된 별명은 사용할 수 없습니다");
					return;
				}
				
				
				$.ajax({
					type:"post"
					, url:"/user/signup/user"
					, data:{"loginId":id, "password":password, "name":name, "nickname":nickname, "email":email, "phoneNumber":phoneNumber,"birthday":birthday, "gender":gender}
					, success:function(data) {
						if(data.result == "success") {
							location.href="/user/signin/view";
						} else {
							alert("사용자 생성 실패");
						}
					}
					, error:function() {
						alert("사용자 생성 에러");
					}
				});
				
				
			});
			
			
		});
	
	
	</script>
	
</body>
</html>