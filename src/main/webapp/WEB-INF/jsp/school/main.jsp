<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>i Like School</title>

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
					<div class="empty-box"></div>
					<div class="empty-box"></div>
					<div class="empty-box"></div>
					<div class="empty-box"></div>
					<h5>아이라잌스쿨 학교 랭킹</h5>
					<table class="table">
						<tr>
							<th>학교 이름</th>
							<th>가입자 수</th>
						</tr>
						<c:forEach var="schoolMember" items="${mainDetail.schoolMemberList }">
						<tr>
							<td>${schoolMember.schoolName }</td>
							<td>${schoolMember.memberCount }</td>							
						</tr>
						</c:forEach>						
					</table>
				</div>
				
				<div class="col-6">
					<h4 style="background-color:#E8F5FF">최신 게시글</h4>
					<c:forEach var="schoolPost" items="${mainDetail.postDetailList }">
						<div class="post-detail mb-3">
							<div class="name-tag-div d-flex align-items-center justify-content-between">
								<div class="d-flex align-items-center">
									<c:choose> 
										<c:when test="${empty schoolPost.userProfilePath}">
											<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
											  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
											  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
											</svg>									
										</c:when>
										<c:otherwise>
											<img class="rounded-circle" width="40" height="40" src="${schoolPost.userProfilePath }">									
										</c:otherwise>
									</c:choose>
									<div class="ml-2">${schoolPost.userNickname } (${schoolPost.userName })</div>							
								</div>
								<div class="mr-3">
									<i class="bi bi-three-dots more-btn"></i>							
								</div>
							</div>
							<img height="350" class="my-2" src="${schoolPost.imagePath }">
							<div class="mt-1">
								: ${schoolPost.content }
							</div>
						</div>
					</c:forEach>
					<hr>
					<h4 style="background-color:#E8F5FF">최신 학교 뉴스</h4>
					<div class="main-content-item">
						<c:forEach var="news" items="${mainDetail.schoolNewsList }">
						<div class="news-content mt-3">
							<h5>${news.title}</h5>
							<div class="text-dark">${news.description }</div>
							<div class="small text-secondary">${news.pubDate }</div>
						</div>
						</c:forEach>
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
					<div class="empty-box"></div>
					<div class="empty-box"></div>
					<div class="empty-box"></div>
					
					<a href="/school/find-friend/view">
						<img width="200" alt="친구찾기" src="https://cdn.pixabay.com/photo/2014/03/25/16/34/reading-297450_960_720.png">					
					</a>
					
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