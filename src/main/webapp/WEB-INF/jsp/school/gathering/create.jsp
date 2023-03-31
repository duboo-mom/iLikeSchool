<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 만들기</title>

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
		
		<section class="d-flex justify-content-center">
			<div class="gathering-create-div">
				<h4 class="text-center mt-4">새 모임 만들기</h4>
				
				<input type="text" class="form-control mt-4" placeholder="모임 제목" id="titleInput">
				<input type="text" class="form-control mt-3" placeholder="설명 (20자 제한)" id="detailInput">
				
				<button type="button" class="mt-4 btn btn-block input-btn" id="createBtn" data-school-id=${param.schoolId }>만들기</button>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>
	
	<script>
	
		$(document).ready(function() {
			
			$("#createBtn").on("click", function() {
				
				let schoolId = $(this).data("school-id");
				let title = $("#titleInput").val();
				let detail = $("#detailInput").val();
				
				if(title == "") {
					alert("제목을 입력하세요");
					return;
				}
				
				if(detail == "") {
					alert("설명을 입력하세요");
					return;
				}
				
				$.ajax({
					type:"get"
					, url:"/school/gathering/create"
					, data:{"schoolId":schoolId, "title":title, "detail":detail}
					, success:function(data) {
						if(data.result == "success") {
							location.href="/school/gathering/list/view?schoolId="+schoolId
						} else {
							alert("모임 생성 실패");
						}						
					}
					, error:function() {
						alert("모임 생성 에러");
					}
				});
				
				
			});
			
		});	
	
	</script>
</body>
</html>