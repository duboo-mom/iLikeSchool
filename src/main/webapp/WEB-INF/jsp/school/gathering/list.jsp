<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 목록</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
	<style>
		label {
		  display: inline-flex;
		  align-items: center;
		  gap: 0.5rem;
		  cursor: pointer;
		}
		
		[type="checkbox"] {
		  appearance: none;
	   	  position: relative;
		  border: max(2px, 0.1em) solid gray;
		  border-radius: 1.25em;
		  width: 2.25em;
		  height: 1.25em;
		}
		
		[type="checkbox"]::before {
		  content: "";
		  position: absolute;
		  left: 0;
		  width: 1em;
		  height: 1em;
		  border-radius: 50%;
		  transform: scale(0.8);
		  background-color: gray;
		  transition: left 250ms linear;
		}
		
		[type="checkbox"]:checked::before {
		  background-color: white;
		  left: 1em;
		}
		
		[type="checkbox"]:checked {
		  background-color: tomato;
		  border-color: tomato;
		}
	
	</style>	
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<section class="schedule-input-div d-flex justify-content-center">
			<div id="schedule-main-box">
				<h5 class="text-center mt-4">우리학교 소모임 목록</h5>
				<div class="text-right mt-3">
					<label>
					  <input role="switch" type="checkbox" />
					  <span>내 모임만 보기</span>
					</label>
				</div>
			         <ul class="list-group">
			         	<c:forEach var="gathering" items="${gatheringList }">
							<li class="list-group-item d-flex justify-content-between align-items-center">
							  ${gathering.title }
							  <!-- go 누르면 해당 모임의 gatheringId 받아서 소모임 메인페이지로 이동 -->
							  <span class="badge badge-danger gathering-go-btn" data-gathering-id="${gathering.id }">go</span>
							</li>
			         	</c:forEach>
			         </ul>
				
				<button type="button" class="btn btn-block input-btn mt-3" onClick="location.href='/school/gathering/create/view?schoolId=${param.schoolId}'">모임 만들기</button>
			
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>

	<script>
		$(document).ready(function() {
			
			$(".gathering-go-btn").on("click", function() {
				
				let id = $(this).data("gathering-id");
				
				// 모임멤버인지 확인해서 맞으면 소모임 메인으로 들어갈 수 있도록
				// 멤버가 아니라면 가입화면 팝업
				$.ajax({
					type:"get"
					, url:"/school/gathering/isMember"
					, data:{"gatheringId":id}
					, success:function(data) {
						if(data.result) {
							location.href="/school/gathering/main/view?gatheringId="+id;							
						} else {
							window.open('/school/gathering/join/view?gatheringId='+id,'가입하기','width=430,height=500,location=no,status=no,scrollbars=yes');
						}
					}
					, error:function() {
						alert("멤버 조회 에러");
					}
				});
				
				
			});
			
		});
	
	</script>
</body>
</html>