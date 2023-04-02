<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>i Like School - 동창회</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
	<script type="text/javascript" src="/static/js/calendar.js"></script>
	
	<link rel="stylesheet" href="/static/css/calendar.css" type="text/css">
	
</head>

<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<div class="school-menu d-flex align-items-center">
			<h4 class="ml-5" id="schoolTitle">${user.elementary }</h4>
			<form>
				<label><input type="radio" class="ml-4 mr-1 school-type-input" name="schoolType" value="${user.elementary }" checked="checked" data-school-id="${user.elementaryId }">초등학교</label>
				<label class="ml-3"><input type="radio" class="mr-1 school-type-input" name="schoolType" value="${user.middleSchool }" data-school-id="${user.middleschoolId }">중학교</label>				
				<label class="ml-3"><input type="radio" class="mr-1 school-type-input" name="schoolType" value="${user.highSchool }" data-school-id="${user.highschoolId }">고등학교</label>				
				<label class="ml-3"><input type="radio" class="mr-1 school-type-input" name="schoolType" value="${user.university }" data-school-id="${user.universityId }">대학교</label>				
			</form>				
		</div>
		<hr>
		
		<div id="notExistDiv" class="mt-5 ml-5 display-4 text-secondary d-none">
			학교 정보를 입력해주세요 :)
		</div>			
		
		<div id="existDiv" class="school-main-content d-flex justify-content-between align-itmes-end">
			<!-- 좌측 정보들 -->
			<div class="school-plan">
				<div class="ml-5 mr-5 mt-3 d-flex justify-content-between">
					<h5>우리학교 일정</h5>	
					
					<button type="button" class="btn btn-outline-warning btn-sm" onclick="window.open('/school/schedule/calendar/view?schoolId=${user.elementaryId}','우리학교 일정','_blank')">일정 보기 및 등록하기</button>	        	
					
					<%--
					<div><a href="/school/schedule/view?schoolId=${user.elementaryId }" class="small">일정 등록하기</a></div>														
					 --%>
				</div>
                <div class="school-calendar mt-3">
			        <table class="Calendar">
			            <thead>
			                <tr>
			                    <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
			                    <td colspan="5">
			                        <span id="calYear"></span>년
			                        <span id="calMonth"></span>월
			                    </td>
			                    <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
			                </tr>
			                <tr>
			                    <td>일</td>
			                    <td>월</td>
			                    <td>화</td>
			                    <td>수</td>
			                    <td>목</td>
			                    <td>금</td>
			                    <td>토</td>
			                </tr>
			            </thead>
			
			            <tbody>
			            </tbody>
			        </table>

			    </div>
	          
	            
	            <div class="ml-5 mt-4">
	            	<div class="d-flex justify-content-between">
		            	<h5>우리학교 투표</h5>
						<i data-toggle="modal" data-target="#moreMenuModal" class="bi bi-three-dots more-btn mr-5 pr-3"></i>	            	
	            	</div>
	            	<ul>
	            		<c:forEach var="vote" items="${voteList }">
	            			<li>
	            				${vote.title }
	            			</li>
	            		</c:forEach>
	            	</ul>
	            </div>
	            
	            <div class="ml-5 mt-4">
	            	<div class="d-flex">
		            	<h5 class="text-rainbow">소모임 소식 보러가기<a class="a-custom" href="/school/gathering/list/view?schoolId=${user.elementaryId }"><i class="bi bi-box-arrow-in-right ml-3 pr-3"></i></a></h5>	            	
	            	</div>
	            </div>
			</div>
			
			<!-- 조잘조잘 -->
			<div class="school-post">
				<div class="d-flex justify-content-between">
					<h4>조잘조잘</h4>
					<a href="/school/create/view?schoolId=${user.elementaryId }">글쓰기</a>					
				</div>
				<c:if test="${empty schoolPostList }">
					<div class="display-2 text-center mt-5">
						텅~
					</div>
					<div class="text-center">
						글을 작성해주세요 :)
					</div>
				</c:if>
				<c:forEach var="schoolPost" items="${schoolPostList }">
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
						<img height="400" class="my-2" src="${schoolPost.imagePath }">
						<div class="mt-1">
							: ${schoolPost.content }
						</div>
					</div>
				</c:forEach>

			</div>
		
		</div>
			
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>

	<!-- Modal -->
	<div class="modal fade" id="moreMenuModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      
	      <div class="modal-body text-center">
	      	<div>
		        <a href="/school/vote/create/view?schoolId=${user.elementaryId }" id="voteCreateBtn">투표 만들기</a>      	
	      	</div>
	      	<hr>
	      	<div class="mt-3">
		        <a href="/school/vote/list/view?schoolId=${user.elementaryId }" id="voteListBtn">투표 리스트</a>	      	
	      	</div>
	      </div>
	      
	    </div>
	  </div>
	</div>

	<script>
		$(document).ready(function() {
			
			// 학교 선택에 따라 타이틀 변경 및 section reload
			$("input[name=schoolType]").on("click", function() {
				var schoolId = $(this).data("school-id");
								
				var schoolName = $('input[name="schoolType"]:checked').val();
				$("#schoolTitle").text(schoolName);
				
				if(schoolName == "") {
					
					$("#existDiv").addClass("d-none");
					$("#notExistDiv").removeClass("d-none");
					
				} else {
					
					$("#existDiv").removeClass("d-none");
					$("#notExistDiv").addClass("d-none");
					
					$.ajax({
						type:"get"
						, url:"/school/reunion/select/div"
						, data:{"schoolId":schoolId}
						, success:function(data) {
							
							$("#existDiv").html(data);
							
						}
						, error:function() {
							alert("페이지 새로고침 에러");
						}
					});										
				}
								
			});
			
		});
	
	</script>
	
</body>
</html>