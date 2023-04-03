<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 글 작성</title>

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
				<h4 class="mt-3">글 쓰기</h4>
				
				<hr>
				<input id="fileInput" type="file" class="d-none">		
				<div class="d-flex">
					<div id="imgInputBtn">
						<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-camera-fill" viewBox="0 0 16 16">
						  <path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
						  <path d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z"/>
						</svg>
					</div>
					<img id="preview" width="80" class="d-none ml-4">				
				</div>		
				
				<textarea type="text" class="form-control mt-3" rows="5" placeholder="내용을 입력해주세요" id="contentInput"></textarea>
				
				<button type="button" class="mt-4 btn btn-block input-btn" id="uploadBtn" data-school-id="${param.schoolId }">작성하기</button>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>

	<script>
		$(document).ready(function() {
			
			$("#imgInputBtn").on("click", function() {
				// 파일 인풋을 클릭한 효과
				$("#fileInput").click();				
			});

			$("#fileInput").on("change", function() {
				
			    var file = event.target.files[0];

			    var reader = new FileReader(); 
			    reader.onload = function(e) {
			    	
					$("#preview").removeClass("d-none");
			        $("#preview").attr("src", e.target.result);
			    }

			    reader.readAsDataURL(file);
				
			});
			
			
			$("#uploadBtn").on("click", function() {
				
				let content = $("#contentInput").val();
				let schoolId = $(this).data("school-id");
				
				if(content == "") {
					alert("내용을 입력하세요");
					return;
				}
				
				// 사진은 필수항목 아님
				
				var formData = new FormData();
				formData.append("schoolId", schoolId);
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					type:"post"
					, url:"/school/create"
					, data:formData
					, enctype:"multipart/form-data"
					, processData:false
					, contentType:false
					, success:function(data) {
						if(data.result == "success") {
							location.href="/school/reunion/view"						
						} else {
							alert("게시글 업로드 실패");
						}
					}
					, error:function() {
						alert("게시글 업로드 에러");
					}
					
				});
			
			});
			
		});
	
	</script>
</body>
</html>