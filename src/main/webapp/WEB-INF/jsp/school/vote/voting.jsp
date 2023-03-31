<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표 하기</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

</head>
<body>
	<div>
		<h4>${title }</h4>
		<table class="table" style="width:400">
			<tr>
				<th>No.</th>
				<th>보기</th>
				<th>선택</th>
			</tr>
			
			<c:forEach var="voteItem" items="${voteItems }" varStatus="status">
			<tr>
				<td>${status.count }</td>
				<td>${voteItem.item }</td>
				<td>
					<input type="radio" value="${voteItem.id }" name="itemCheck">
				</td>
			</tr>
			</c:forEach>		
		</table>
		<!-- 이미 투표를 한 사용자라면 저장 버튼 안보이게 -->
		<button type="button" class="btn save-btn btn-block" id="saveBtn" data-vote-id="${voteItem.voteId }">저장</button>
	</div>
	
	<script>
		$(document).ready(function() {
			
			$("#saveBtn").on("click", function() {
								
				let itemId = $("input[name='itemCheck']:checked").val();
				
				// vote result에 추가하는 api
				$.ajax({
					type:"get"
					, url:"/school/vote/voting"
					, data:{"itemId":itemId}
					, success:function(data) {
						if(data.result == "success") {
							alert("투표가 정상적으로 처리되었습니다.");
							window.close();
						} else {
							alert("투표 실패");
						}
					}
					, error:function() {
						alert("투표 에러");
					}
				});
				
			});
			
			
		});
	
	</script>	
</body>
</html>