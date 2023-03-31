<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표 등록</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	<link rel="stylesheet" href="/static/css/datepicker.css" type="text/css">
	
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<section class="schedule-input-div d-flex justify-content-center">
			<div id="schedule-main-box">
				<h5 class="text-center mt-4">투표 만들기</h5>

				<input class="form-control mt-3" type="text" placeholder="투표 제목" id="voteTitleInput">
				<input id="datePicker" class="mt-3 form-control" type="text" placeholder="기한">		
				<div class="mt-3">투표 항목</div>		
				<div class="input-group mt-1">
					<input type="text" class="form-control" placeholder="내용을 입력해주세요" id="firstInput">
							<button class="btn btn-white" type="button" id="enable1"> O </button>			
					<button class="btn btn-danger" type="button" id="disable1"> X </button>				
				</div>
				<div class="input-group mt-1">
					<input type="text" class="form-control" placeholder="내용을 입력해주세요" id="secondInput">
					<button class="btn btn-white" type="button" id="enable2"> O </button>			
					<button class="btn btn-danger" type="button" id="disable2"> X </button>					
				</div>	
				<div class="input-group mt-1">
					<input type="text" class="form-control" placeholder="내용을 입력해주세요" id="thirdInput">
					<button class="btn btn-white" type="button" id="enable3"> O </button>			
					<button class="btn btn-danger" type="button" id="disable3"> X </button>					
				</div>
				<div class="input-group mt-1">
					<input type="text" class="form-control" placeholder="내용을 입력해주세요" id="fourthInput">
					<button class="btn btn-white" type="button" id="enable4"> O </button>			
					<button class="btn btn-danger" type="button" id="disable4"> X </button>				
				</div>
				<div class="input-group mt-1">
					<input type="text" class="form-control" placeholder="내용을 입력해주세요" id="fifthInput">
					<button class="btn btn-white" type="button" id="enable5"> O </button>			
					<button class="btn btn-danger" type="button" id="disable5"> X </button>			
				</div>
				
				<button type="button" class="btn btn-block input-btn mt-3" id="voteInputBtn" data-school-id="${param.schoolId }">등록하기</button>
			
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>

	<script>
		$(document).ready(function() {
			
			$("#voteInputBtn").on("click", function() {
				
				let schoolId = $(this).data("school-id");
				let title = $("#voteTitleInput").val();
				let dateInput = $("#datePicker").val();
				let endDate = $("#datePicker").datepicker("getDate");
				
				let item1 = $("#firstInput").val();
				let item2 = $("#secondInput").val();
				let item3 = $("#thirdInput").val();
				let item4 = $("#fourthInput").val();
				let item5 = $("#fifthInput").val();
				
				console.log(item1);
				console.log(item2);
				console.log(item3);
				console.log(item4);
				console.log(item5);
				
				if(title == "") {
					alert("제목을 입력하세요");
					return;
				}
				
				if(typeof dateInput == "undefined" || dateInput == "" || dateInput == null) {
					alert("기한을 입력하세요");
					return;
				}
				
				if(item1 == "" && item2 == "" && item3 == "" && item4 == "" && item5 == "") {
					alert("최소 1개의 항목을 입력하세요");
					return;
				}
				
				$.ajax({
					type:"get"
					, url:"/school/vote/create"
					, data:{"schoolId":schoolId, "title":title, "endDate":endDate}
					, success:function(data) {
						if(data.result == "success") {
							// 투표 등록이 성공 하면
							// 아이템 등록
							$.ajax({
								type:"get"
								, url:"/school/vote/item/create"
								, data:{"schoolId":schoolId, "title":title, "item1":item1, "item2":item2, "item3":item3, "item4":item4, "item5":item5}
								, success:function(data) {
									if(data.result == "success") {
										location.href="/school/vote/list/view?schoolId="+schoolId ;
									} else {
										alert("투표 아이템 등록 실패");
									}
								}
								, error:function() {
									alert("투표 아이템 등록 에러");
								}
							});
							
						} else {
							alert("투표 등록 실패");
						}
					}
					, error:function() {
						alert("투표 등록 에러");
					}
				});
				
			});
			
			
			$("#enable1").on("click", function() {
				$("#firstInput").attr('disabled', false);
			});
			
			$("#disable1").on("click", function() {
				$("#firstInput").attr('disabled', true);
				$("#firstInput").val("");
			});	
			
			$("#enable2").on("click", function() {
				$("#secondInput").attr('disabled', false);
			});
			
			$("#disable2").on("click", function() {
				$("#secondInput").attr('disabled', true);
				$("#secondInput").val("");
			});	
			
			$("#enable3").on("click", function() {
				$("#thirdInput").attr('disabled', false);
			});
			
			$("#disable3").on("click", function() {
				$("#thirdInput").attr('disabled', true);
				$("#thirdInput").val("");
			});			
			
			$("#enable4").on("click", function() {
				$("#fourthInput").attr('disabled', false);
			});
			
			$("#disable4").on("click", function() {
				$("#fourthInput").attr('disabled', true);
				$("#fourthInput").val("");
			});
			
			$("#enable5").on("click", function() {
				$("#fifthInput").attr('disabled', false);
			});
			
			$("#disable5").on("click", function() {
				$("#fifthInput").attr('disabled', true);
				$("#fifthInput").val("");
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