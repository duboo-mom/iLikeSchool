<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 가입</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

</head>
<body>
	<div>
		<h4 style="background-color:#AAEBAA">가입하기</h4>
		
		<h5 class="mt-3">선택하신 소모임에 가입 하시겠습니까?</h5>
		
		<h6 class="mt-3">모임 제목 : ${gatheringDetail.title }</h6>
		<div class="mt-2">모임 설명</div>
		<div class="text-secondary"> : ${gatheringDetail.detail }</div>
		
		<button type="button" class="btn save-btn btn-block mt-4" id="joinBtn" data-gathering-id="${param.gatheringId }">가입</button>
	</div>
	
	<script>
		$(document).ready(function() {
			
			$("#joinBtn").on("click", function() {
								
				let gatheringId = $(this).data("gathering-id");
				
				// gatheringMember에 추가하는 api 호출
				$.ajax({
					type:"get"
					, url:"/school/gathering/join"
					, data:{"gatheringId":gatheringId}
					, success:function(data) {
						if(data.result == "success") {
							alert("가입이 정상적으로 처리되었습니다.");
							window.close();
						} else {
							alert("가입 실패");
						}
					}
					, error:function() {
						alert("가입 에러");
					}
				});
				
			});
			
			
		});
	
	</script>	
</body>
</html>