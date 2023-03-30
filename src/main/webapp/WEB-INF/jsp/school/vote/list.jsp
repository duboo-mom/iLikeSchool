<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표 리스트</title>

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
		
		<section class="schedule-input-div d-flex justify-content-center">
			<div id="voteListBox">
				<h5 class="text-center mt-4">투표 리스트</h5>

				<table class="table">
					<tr>
						<th></th>
						<th>No.</th>
						<th>제목</th>
						<th>현황</th>
						<th></th>
					</tr>
					<c:forEach var="vote" items="${voteList }" varStatus="status">
					<tr>
						<td>
							<c:if test="${vote.userId eq userId }">
							<button type="button" class="btn btn-danger btn-small delete-btn-${vote.id }">삭제</button>
							</c:if>
						</td>
						<td>${status.count }</td>
						<td>${vote.title }</td>
						<c:choose>
							<c:when test="${vote.endDate > now }">							
								<td class="text-primary">진행중</td>
								<td><button type="button" class="btn btn-primary btn-small" onclick="window.open('/school/vote/voting/view?voteId=${vote.id}','투표창','width=430,height=500,location=no,status=no,scrollbars=yes')">투표하기</button></td>
							</c:when>
							<c:otherwise>
								<td class="text-warning">마감</td>
								<td><button type="button" class="btn btn-warning btn-small">결과보기</button></td>
							</c:otherwise>
						</c:choose>
					</tr>
					</c:forEach>
				</table>
			
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>

	<script>
		$(document).ready(function() {
			

		});
	</script>
</body>