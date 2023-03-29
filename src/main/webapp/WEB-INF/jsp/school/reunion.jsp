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
			<h4 class="ml-5" id="schoolTitle"></h4>
			<form>
				<label><input type="radio" class="ml-4 mr-1 school-type-input" name="schoolType" value="${user.elementary }" checked="checked">초등학교</label>
				<label class="ml-3"><input type="radio" class="mr-1 school-type-input" name="schoolType" value="${user.middleSchool }">중학교</label>				
				<label class="ml-3"><input type="radio" class="mr-1 school-type-input" name="schoolType" value="${user.highSchool }">고등학교</label>				
				<label class="ml-3"><input type="radio" class="mr-1 school-type-input" name="schoolType" value="${user.university }">대학교</label>				
			</form>				
		</div>
		<hr>
		
		<div id="notExistDiv" class="mt-5 ml-5 display-4 text-secondary">
			학교 정보를 입력해주세요 :)
		</div>			
		
		<div id="existDiv" class="school-main-content d-flex justify-content-between align-itmes-end">

			<div class="school-plan">
				<div class="ml-5 mr-5 d-flex justify-content-between">
					<h5>우리학교 일정</h5>	
					<div><a href="/school/schedule/view" class="small">일정 등록하기</a></div>									
				</div>
                <div class="school-calendar">
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
	            		<li>동창회 일정</li>
	            		<li>여름 야유회</li>
	            	</ul>
	            </div>
	            
	            <div class="ml-5 mt-4">
	            	<div class="d-flex justify-content-between">
		            	<h5>내 모임 소식</h5>
						<a class="a-custom" href="/school/gathering/list/view"><i class="bi bi-three-dots mr-5 pr-3"></i></a>	            	
	            	</div>
	            	<ul>
	            		<li>미종 : 난 안갈랭</li>
	            		<li>보갬 : 동창회하면 갈 사람?</li>
	            	</ul>
	            </div>
	            
	            <div class="ml-5 mt-4">
	            	<h5>열혈 활동 랭킹</h5>
	            	<table class="rank-table text-center" border="1">
	            		<tr>
	            			<th>순위</th>
	            			<th>이름</th>
	            			<th>게시글수</th>
	            		</tr>
	            		<tr>
	            			<td>1</td>
	            			<td>미종</td>
	            			<td>3</td>
	            		</tr>
	            		<tr>
	            			<td>2</td>
	            			<td>두부</td>
	            			<td>1</td>
	            		</tr>
	            	</table>
	            </div>
	            
			</div>
		          
			
			<div class="school-post">
				<div class="d-flex justify-content-between">
					<h4>조잘조잘</h4>
					<a href="/school/create/view">글쓰기</a>					
				</div>
				<div class="post-detail">
					<div class="name-tag-div d-flex align-items-center">
						<img class="rounded-circle" width="50" src="https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_960_720.jpg">
						<div class="ml-2">두부 - 동원초등학교</div>
					</div>
					<img class="my-2" width="550" src="https://cdn.pixabay.com/photo/2017/07/27/16/48/toppokki-2545943_960_720.jpg">
					<div class="mt-1">
						: 학교앞에 떡볶이 맛있었는뎅
					</div>
				</div>
				<div class="post-detail mt-3">
					<div class="name-tag-div">
						<img src="">
						미종 - 동원초등학교
					</div>
					<div>
						: 애두라 모하니?
					</div>
				</div>
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
		        <a href="/school/vote/create/view" id="voteCreateBtn">투표 만들기</a>      	
	      	</div>
	      	<hr>
	      	<div class="mt-3">
		        <a href="/school/vote/list/view" id="voteListBtn">투표 리스트</a>	      	
	      	</div>
	      </div>
	      
	    </div>
	  </div>
	</div>

	<script>
		$(document).ready(function() {
			
			// 학교 선택에 따라 타이틀 변경 및 section reload
			$("input[name=schoolType]").on("click", function() {
				
				var schoolName = $('input[name="schoolType"]:checked').val();
				$("#schoolTitle").text(schoolName);
				
				if(schoolName == "" || schoolName == null) {
					$("#notExistDiv").removeClass("d-none");
					$("#existDiv").addClass("d-none");
				} else {
					$("#existDiv").removeClass("d-none");
					$("#notExistDiv").addClass("d-none");
				}
				
			});
			
		});
	
	</script>
	
</body>
</html>