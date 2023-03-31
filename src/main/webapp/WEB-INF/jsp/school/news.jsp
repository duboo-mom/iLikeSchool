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
		<div class="d-flex justify-content-center">
		
			<section class="main-item-div p-2">
				<div>
					<form>
						<label><input type="radio" class="mr-1 school-type-input" name="schoolType" value="${user.elementary }" checked="checked">초등학교</label>
						<label class="ml-3"><input type="radio" class="mr-1 school-type-input" name="schoolType" value="${user.middleSchool}">중학교</label>				
						<label class="ml-3"><input type="radio" class="mr-1 school-type-input" name="schoolType" value="${user.highSchool }">고등학교</label>				
						<label class="ml-3"><input type="radio" class="mr-1 school-type-input" name="schoolType" value="${user.university }">대학교</label>				
					</form>				
				</div>
				<hr>
				<h5 id="nicknameColor">${userNickname } 님 학교 뉴스</h5>				
				<hr>
				
				<div id="emptyUniveDiv" class="mt-5 display-4 text-secondary d-none">
					학교 정보를 입력해주세요 :)
				</div>
				
				<div class="news-div" id="newsDiv">				
					<c:forEach var="news" items="${newsList }">
					<div class="news-content mt-3">
						<h5>${news.title}</h5>
						<div class="text-dark">${news.description }</div>
						<div class="small text-secondary">${news.pubDate }</div>
					</div>
					</c:forEach>

					<div class="mt-3">
						<a href="https://search.naver.com/search.naver?where=news&sm=tab_jum&query=${user.elementary }">더 많은 뉴스 보기</a>									
					</div>
				</div>
			</section>
		
		</div>

		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>


	<script>
		$(document).ready(function() {
			
			// 라디오 버튼 선택에 따른 학교 인풋 변경
			$("input[name=schoolType]").on("click", function() {
				
				var schoolName = $('input[name="schoolType"]:checked').val();
				
				if(schoolName == "") {
					
					$("#newsDiv").addClass("d-none");
					$("#emptyUniveDiv").removeClass("d-none");
					
				} else {
					
					$("#newsDiv").removeClass("d-none");
					$("#emptyUniveDiv").addClass("d-none");
					
					$.ajax({
						type:"get"
						, url:"/school/news/content/div"
						, data:{"schoolName":schoolName}
						, success:function(data) {
							
							$("#newsDiv").html(data);
							
						}
						, error:function() {
							alert("뉴스 조회 에러");
						}
					});										
				}
				
				
			});
			
			
		});
	</script>
	
</body>
</html>