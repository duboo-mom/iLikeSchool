<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 등록</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	<link rel="stylesheet" href="/static/css/datepicker.css" type="text/css">
	
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
		
		<section class="schedule-input-div d-flex justify-content-center">
			<div id="schedule-main-box">
				<h5 class="text-center mt-4">일정 등록하기</h5>
				<div class="text-right mt-3">
					<label>
					  <input role="switch" type="checkbox" />
					  <span>일정 등록 알람</span>
					</label>
				</div>

				<input class="form-control mt-1" type="text" placeholder="제목" id="titleInput">
				<input class="form-control mt-3" type="text" placeholder="장소" id="locationInput">
				<input id="datePicker" class="mt-3 form-control" type="text" placeholder="날짜">

				<textarea class="form-control mt-3" rows="4" placeholder="설명" id="detailInput"></textarea>
				
				<button type="button" class="btn btn-block input-btn mt-3" id="scheduleInputBtn" data-school-id="${param.schoolId }">일정 등록</button>
			
			</div>
		</section>
		

	<script>
		$(document).ready(function() {
			
			$("#scheduleInputBtn").on("click", function() {
				
				let schoolId = $(this).data("school-id");
				let title = $("#titleInput").val();
				let locationInfo = $("#locationInput").val();
				let dateInfo = $("#datePicker").datepicker("getDate");
				let detail = $("#detailInput").val();
				
				console.log(dateInfo);
				
				if(title == "") {
					alert("제목을 입력하세요");
					return;
				}
				
				if(locationInfo == "") {
					alert("장소 정보를 입력하세요");
					return;
				}
						
				if(dateInfo == "") {
					alert("날짜 정보를 입력하세요");
					return;
				}
				
				
				$.ajax({
					type:"get"
					, url:"/school/schedule/create"
					, data:{"schoolId":schoolId, "title":title, "locationInfo":locationInfo, "dateInfo":dateInfo, "detail":detail}
					, success:function(data) {
						if(data.result == "success") {
							alert("일정이 등록되었습니다");
							window.close();
							opener.parent.location.reload();
						} else {
							alert("등록 실패");
						}
					}
					, error:function() {
						alert("등록 에러");
					}
						
				});
				
			});
			
			$("#datePicker").datepicker({
				dateFormat: "yy-mm-dd",
				minDate:0,
				autoclose : true,
				prevText: '이전 달',
				nextText: '다음 달',
				monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				dayNames: ['일', '월', '화', '수', '목', '금', '토'],
				dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
				dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
				showMonthAfterYear: true,
				yearSuffix: '년'
				
			});
			
			
		});
	</script>

</body>
</html>