<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>i Like School!</title>

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
			
			<section class="main-content d-flex justify-content-between align-itmes-end">
				<div class="col-3 school-rank-table">
					<div class="empty-box"></div>
					<div class="empty-box"></div>
					<div class="empty-box"></div>
					<div class="empty-box"></div>
					<div class="empty-box"></div>
					<div class="empty-box"></div>
					<div class="empty-box"></div>
					<h5>학교 랭킹</h5>
					<table class="table">
						<tr>
							<th>학교 이름</th>
							<th>게시글 수</th>
						</tr>
						<tr>
							<td>ㅇㅇ초등학교</td>
							<td>21</td>							
						</tr>
						<tr>
							<td>ㅁㅁ초등학교</td>
							<td>13</td>							
						</tr>
						<tr>
							<td>ㅂㅂ고등학교</td>
							<td>5</td>							
						</tr>						
					</table>
				</div>
				
				<div class="col-6">
					<div class="main-content-item">
						<h4>최신 게시글</h4>
						<div class="text-secondary">어쩌구저쩌구...</div>
					</div>
					<hr>
					<div class="main-content-item">
						<h4>학교 소식</h4>
						<div class="text-secondary">어디어디학교의 입학식</div>
					</div>
				</div>
				<div class="col-2">
					<div class="empty-box"></div>
					<div class="empty-box"></div>
					<div class="empty-box"></div>
					<div class="empty-box"></div>
					<div class="empty-box"></div>
					<div class="empty-box"></div>
					<div class="empty-box"></div>

					<img width="200" alt="친구찾기" src="https://cdn.pixabay.com/photo/2014/03/25/16/34/reading-297450_960_720.png">
					
					<h6 class="mt-4">우리학교 소식 확인하기</h6>
					<div class="input-group mt-1">
						<input type="text" class="form-control" placeholder="학교검색">
						<button class="btn btn-outline-secondary" type="button">검색</button>					
					</div>
				</div>
							
			</section>


		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>

</body>
</html>