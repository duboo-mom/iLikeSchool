<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
						<h5>검색 결과</h5>

						<c:if test="${empty friendList}">
							<h4 class="text-secondary">일치하는 사용자가 없습니다 ㅠ ㅠ</h4>
						</c:if>
						
						<ul>
							<c:forEach var="friend" items="${friendList }">
								<li><span class="text-warning">${friend.friendName }</span> 의 방명록으로 <a href="/school/guestbook/view?bookUserId=${friend.friendId }">이동하기</a></li>
							</c:forEach>
						</ul>