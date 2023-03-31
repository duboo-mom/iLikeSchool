<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<section class="d-flex justify-content-center mt-3">
			<div class="gathering-content">
				<div class="d-flex">
					<h4>${gatheringDetail.title }</h4>
					<div class="ml-3 text-secondary">${gatheringDetail.detail }</div>
				</div>
				
				<div class="mt-3 d-flex justify-content-between">
					<div>
						방장 : <span style="color:#FF50CF	">${gatheringDetail.masterName }</span>				
					</div>
					<%--가입하지 않은 사람이면 가입하기 버튼, 가입한 사용자면 탈퇴하기 버튼 선택적으로 보여주기 --%>
					<%--방장에게는 모임 삭제로 ver1.01 --%>
					<c:if test="${gatheringDetail.userId ne userId }">
						<button class="btn btn-danger btn-sm" id="leaveBtn" data-gathering-id=${param.gatheringId } data-school-id=${gatheringDetail.schoolId }>탈퇴하기</button>					
					</c:if>
				</div>
				
				<hr>
				<div>
					<div class="d-flex justify-content-between">
						<h5>공지사항</h5>
						<%-- 로그인한 userId와 해당 모임의 주인 userId가 일치하는 경우에만 아래 태그 보여주기 --%>
						<c:if test="${gatheringDetail.userId eq userId }">
							<button class="btn btn-outline-info btn-sm" id="editAnnounceBtn">수정하기</button>											
						</c:if>
					</div>
					<div id="announceDiv" style="width:450px">
						${gatheringDetail.announcement }
					</div>
										
					<div class="d-flex mt-2 mb-2">
						<textarea class="form-control d-none" id="announcementInput"></textarea>
						<button type="button" class="btn btn-outline-warning ml-2 d-none" id="announceSaveBtn" data-gathering-id="${param.gatheringId }">완료</button>					
					</div>
				</div>
				<hr>
				<div>
					<div class="d-flex justify-content-between">
						<h5>모임사진</h5>
						<%-- 로그인한 userId와 해당 모임의 주인 userId가 일치하는 경우에만 아래 태그 보여주기 --%>
						<c:if test="${gatheringDetail.userId eq userId }">
							<button class="btn btn-outline-info btn-sm" id="editPhotoBtn">등록하기</button>											
						</c:if>					
					</div>
					<div class="text-secondary">
						사진이 없습니다. <br>
						사진을 등록해주세요 :)
					</div>
					
				</div>
				<hr>
				<h5>주절주절</h5>
				<div class="gathering-comment-div">
					<c:forEach var="comment" items="${gatheringDetail.commentList }">
						<div><b>${comment.userNickname }</b>&nbsp ${comment.comment }</div>					
					</c:forEach>
				</div>
				<div class="d-flex mt-2 mb-4">
					<input type="text" class="form-control" placeholder="${userNickname } (으)로 한마디" id="commentInput">
					<!-- <input type="text" class="form-control" name="${post.id}">  -->
					<button type="button" class="btn input-btn ml-2 comment-btn" id="saveBtn" data-gathering-id=${param.gatheringId }>남기기</button>
				</div>
			</div>
						
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>

	<script>
		$(document).ready(function() {
			
			$("#editAnnounceBtn").on("click", function() {
				
				$("#announceSaveBtn").removeClass("d-none");
				$("#announcementInput").removeClass("d-none");
				$("#editAnnounceBtn").addClass("d-none");
				
			});
			
			$("#announceSaveBtn").on("click", function() {
				
				let announce = $("#announcementInput").val();
				let gatheringId = $(this).data("gathering-id");
				
				$.ajax({
					type:"get"
					, url:"/school/gathering/edit/annonce"
					, data:{"gatheringId":gatheringId, "announce":announce}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("수정 실패");
						}
					}
					, error:function() {
						alert("수정 에러");
					}
				});
				
			});
			
			
			$("#leaveBtn").on("click", function() {
				
				let gatheringId = $(this).data("gathering-id");
				let schoolId = $(this).data("school-id");
				
				$.ajax({
					type:"get"
					, url:"/school/gathering/leave"
					, data:{"gatheringId":gatheringId}
					, success:function(data) {
						if(data.result == "success") {
							location.href="/school/gathering/list/view?schoolId="+schoolId;
						} else {
							alert("탈퇴 실패");
						}
					}
					, error:function() {
						alert("탈퇴 에러");
					}
				});
				
			});
			
			$("#saveBtn").on("click", function() {
				
				let gatheringId = $(this).data("gathering-id");
				let comment = $("#commentInput").val();
				
				if(comment == "") {
					alert("내용을 입력후 버튼을 눌러주세요");
					return;
				}
				
				$.ajax({
					type:"get"
					, url:"/school/gathering/comment/add"
					, data:{"gatheringId":gatheringId, "comment":comment}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("남기기 실패");
						}
					}
					, error:function() {
						alert("남기기 에러");
					}
						
				});
				
			});
			
		});
	</script>

</body>
</html>