<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<header class="d-flex justify-content-between align-items-center pt-4 pl-3 pr-3">
			<div>
				<h3><a href="/school/main" id="mainLogo" class="text-dark">iLikeSchool!</a></h3>			
			</div>
			
			<ul class="col-6 nav nav-fill">
				<li class="nav-item"><a class="nav-link main-menu-link text-dark" href="/school/news/view">내 학교 소식</a></li>
				<li class="nav-item"><a class="nav-link main-menu-link text-dark" href="/school/reunion/view">동창회</a></li>
				<li class="nav-item"><a class="nav-link main-menu-link text-dark" href="/school/find-friend/view">친구찾기</a></li>
				<li class="nav-item"><a class="nav-link main-menu-link text-dark" href="/school/guestbook/view">내 방명록</a></li>
			</ul>
									
			<div>
				<a id="mypage-icon" href="/user/mypage/view"><i class="bi bi-person"></i></a> ${userNickname } 님 <a href="/user/signout">로그아웃</a>
			</div>
		</header>
		<hr>