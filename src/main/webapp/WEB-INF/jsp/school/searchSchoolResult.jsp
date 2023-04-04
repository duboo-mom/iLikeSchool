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
			<td><button type="button" class="btn btn-primary btn-sm select-school-btn" data-gubun=${param.gubun } data-school-name=${school.schoolName }>선택</button></td>			
		</tr>
		</c:forEach>
	</table>

	
	<script>
		$(document).ready(function() {
			
			$(".select-school-btn").on("click", function() {
								
				let schoolName = $(this).data("school-name");
				
				let gubun = $(this).data("gubun");
				
				if(gubun == "elem_list") {
					$("#elementaryInput", opener.document).val(schoolName);
					window.close();					
				} else if(gubun == "midd_list") {
					$("#middleschoolInput", opener.document).val(schoolName);
					window.close();	
				} else if(gubun == "high_list") {
					$("#highschoolInput", opener.document).val(schoolName);
					window.close();	
				} else if(gubun == "univ_list") {
					$("#universityInput", opener.document).val(schoolName);
					window.close();	
				} 
				
				
			})
		});
	</script>