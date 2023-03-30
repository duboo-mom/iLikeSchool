<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

					<c:forEach var="news" items="${newsList }">
					<div class="news-content mt-3">
						<h5>${news.title}</h5>
						<div class="text-dark">${news.description }</div>
						<div class="small text-secondary">${news.pubDate }</div>
					</div>
					</c:forEach>

					<div class="mt-3">
						<a href="https://search.naver.com/search.naver?where=news&sm=tab_jum&query=${schoolName }">더 많은 뉴스 보기</a>									
					</div>