<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<table class="table">
		<tr>
			<th>학교명</th>
			<th>주소</th>
		</tr>
		<c:forEach var="school" items="${result }">
		<tr>
			<td>${school.schoolName }</td>
			<td>${school.adres }</td>			
			<td><button type="button" class="btn btn-primary btn-sm">선택</button></td>			
		</tr>
		</c:forEach>
	</table>

	
	<script>
	
	
	</script>