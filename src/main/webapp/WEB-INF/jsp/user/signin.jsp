<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iLikeSchool - 로그인</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
<body>
	<div class="container" width="1200">
		<div class="empty-box"></div>
		
		<div class="singin-box d-flex justify-content-center">
		
			<div>
				<div class="text-center">
					<div class="display-4">i Like SChool</div>
					<h5 class="text-secondary mt-3">로그인 해서 동창을 만나보세요</h5>
				</div>
				<div class="d-flex justify-content-center">
					<div class="col-12">
						<input type="text" class="form-control mt-5" placeholder="ID">
						<input type="text" class="form-control mt-2" placeholder="비밀번호">
					
						<button class="btn signin-btn btn-block mt-3 text-white">로그인</button>
						<button class="btn signin-naver btn-block mt-3 text-white">네이버로 로그인</button>
					</div>	
				</div>
			</div>

		</div>
		
	
	
	</div>

	
</body>
</html>