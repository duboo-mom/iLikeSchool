<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>i Like School - 친구 찾기</title>

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
			<div style="width:400px;">
				<h4 class="text-center mt-4">친구 찾기</h4>
				<div>
					<input type="text" class="form-control mt-4" placeholder="찾고싶은 친구 이름" id="nameInput">
					<input type="text" class="form-control mt-2" placeholder="학교" id="schoolInput">
				
					<button class="btn btn-block mt-3 mb-3 search-btn" id="searchBtn">검색</button>
						
					<hr>
					
					<div class="mt-3" id="friendResultDiv">
					
					</div>
						
				</div>	
			</div>
								
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>

	<script>
		$(document).ready(function() {
			
			$("#searchBtn").on("click", function() {
				
				let name = $("#nameInput").val();
				let school = $("#schoolInput").val();
				
				if(name == "") {
					alert("이름(실명)을 입력하세요");
					return;
				}
				
				if(school == "") {
					alert("학교 이름을 입력하세요");
					return;
				}
				
				$.ajax({
					type:"get"
					, url:"/school/findfriend/result/div"
					, data:{"friendName":name, "friendSchool":school}
					, success:function(data) {
						$("#friendResultDiv").html(data);
					}
					, error:function() {
						alert("친구 찾기 에러");
					}
				});
				
				
			});
			
		});
	
	</script>


</body>
</html>