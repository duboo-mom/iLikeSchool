<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iLikeSchool - 마이페이지</title>

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
			<h4><a href="/school/main" class="text-dark" id="mainLogo">i Like School</a></h4>
			<div class="mt-3 text-right">
				${userNickname } 님 <a href="/user/signout">로그아웃</a>		
			</div>		
		</div>

		<div class="mypage-box d-flex justify-content-center">
			<div>
				
				<h3 class="mt-3 text-center">프로필 정보</h3>
				
				<!-- 개인 정보 수정 -->
				<div class="d-flex align-items-center mt-4">
					<h1 id="profileImageIcon"><i class="bi bi-person-square"></i></h1>
					<input id="fileInput" type="file" class="d-none">
					<div class="ml-3" id="imageUploadBtn"><i class="bi bi-plus-circle text-primary"></i>프로필 이미지 설정</div>
				</div>
				
				<div class="mt-2 small">별명</div>
				<div class="d-flex">
					<input class="form-control mr-2" type="text" placeholder="별명" id="nicknameInput" value="${user.nickname }">
					<button class="btn check-btn" id="checkNicknameBtn">중복확인</button> 				
				</div>
				
				<div class="small text-danger text-left d-none" id="duplicatedNickname">사용중인 별명 입니다</div>
				<div class="small text-primary text-left d-none" id="availableNickname">사용가능한 별명 입니다</div>
								
				<div class="mt-2 small">비밀번호</div>				
				<input class="form-control" type="password" placeholder="비밀번호" id="passwordInput">
				<input class="form-control mt-2" type="password" placeholder="비밀번호 확인" id="passwordConfirmInput">
				
				<div class="mt-2 small">이메일</div>
				<input type="text" class="form-control mr-2" id="emailInput" value="${user.email }">

				<div class="mt-2 small">핸드폰 번호(000-0000-0000)</div>
				<input type="text" class="form-control" id="phoneNumberInput" value="${user.phoneNumber }">
				
				<div class="mt-2 small">생년월일(YYMMDD)</div>
				<input type="text" class="form-control" id="birthdayInput" value="${user.yymmdd }">

				<button class="btn btn-warning btn-block mt-3" id="saveBtn" data-user-id="${userId }">저장하기</button>

				<!-- 학교정보 수정 -->
				<h5 class="text-left mt-4">나의 졸업 학교정보</h5>
	
				<div class="small mt-2">초등학교</div>
				<div class="input-group">
					<input type="text" class="form-control" id="elementaryInput" value="${user.elementary }">
					<button class="btn btn-light btn-outline-secondary" type="button">찾기</button>			
					<button class="btn btn-info" type="button" id="elementaryBtn">저장</button>			
				</div>
				
				<div class="small mt-2">중학교</div>
				<div class="input-group">
					<input type="text" class="form-control" id="middleschoolInput" value="${user.middleSchool }">
					<button class="btn btn-light btn-outline-secondary" type="button">찾기</button>			
					<button class="btn btn-info" type="button">저장</button>					
				</div>
				
				<div class="small mt-2">고등학교</div>
				<div class="input-group">
					<input type="text" class="form-control" id="highschoolInput" value="${user.highSchool }">
					<button class="btn btn-light btn-outline-secondary" type="button">찾기</button>			
					<button class="btn btn-info" type="button">저장</button>				
				</div>
				
				<div class="small mt-2">대학교</div>
				<div class="input-group">
					<input type="text" class="form-control" id="universityInput" value="${user.university }">
					<button class="btn btn-light btn-outline-secondary" type="button">찾기</button>			
					<button class="btn btn-info" type="button">저장</button>				
				</div>			
					
			</div>
		</div>	
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>
	
	<script>
		$(document).ready(function() {
		
		
			var nicknameDuplicate = false;
			var checkNickname = true;
			
			// 별명 변경을 안했다면 중복확인 안해도 되게!
			$("#nicknameInput").on("change", function() {
				checkNickname = false;
			});
			
			
			$("#profileImageIcon").on("click", function() {
				// 파일 인풋을 클릭한 효과
				$("#fileInput").click();				
			});
			
			$("#imageUploadBtn").on("click", function() {
				$("#fileInput").click();
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
			
			
			$("#saveBtn").on("click", function() {
				
				let password = $("#passwordInput").val();
				let passwordConfirm = $("#passwordConfirmInput").val();
				let nickname = $("#nicknameInput").val();
				let email = $("#emailInput").val();
				let phoneNumber = $("#phoneNumberInput").val();
				let birthday = $("#birthdayInput").val();
				
				
				if(password == "") {
					alert("비밀번호를 입력하세요");
					return;
				}
				
				if(password != passwordConfirm) {
					alert("비밀번호를 확인하세요");
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
				
				if(!checkNickname) {
					alert("닉네임 중복확인을 해주세요");
					return;
				}
				
				if(nicknameDuplicate) {
					alert("중복된 별명은 사용할 수 없습니다");
					return;
				}
				
				var formData = new FormData();
				formData.append("password", password);
				formData.append("nickname", nickname);
				formData.append("email", email);
				formData.append("phoneNumber", phoneNumber);
				formData.append("birthday", birthday);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					type:"post"
					, url:"/user/edit/userinfo"
					, data:formData
					, enctype:"multipart/form-data"
					, processData:false
					, contentType:false
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("사용자 정보 수정 실패");
						}
					}
					, error:function() {
						alert("사용자 정보 수정 에러");
					}
					
				});
				
				
				
			});
			
			
			
			
		});
				
	
	</script>
	
</body>
</html>