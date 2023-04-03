<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학교검색</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
</head>
<body>

	<div id="searchBlock" style="width:'400px'">
		<h4>학교 검색</h4>
		<div class="my-3">
		    <select class="form-control form-group-margin" data-bind="value: gubun" name="gubun" placeholder="구분">
		        <option value="elem_list">초등학교</option>
		        <option value="midd_list">중학교</option>
		        <option value="high_list">고등학교</option>
		        <option value="univ_list">대학교</option>
		       </select>  
	    </div>
	
		<div>
			<select class="form-control form-group-margin" data-bind="value: region" name="region" placeholder="지역">
		        <option value="">전체</option>
		        <option value="100260">서울특별시</option>
		        <option value="100267">부산광역시</option>
		        <option value="100269">인천광역시</option>
		        <option value="100271">대전광역시</option>
		        <option value="100272">대구광역시</option>
		        <option value="100273">울산광역시</option>
		        <option value="100275">광주광역시</option>
		        <option value="100276">경기도</option>
		        <option value="100278">강원도</option>
		        <option value="100280">충청북도</option>
		        <option value="100281">충청남도</option>
		        <option value="100282">전라북도</option>
		        <option value="100283">전라남도</option>
		        <option value="100285">경상북도</option>
		        <option value="100291">경상남도</option>
		        <option value="100292">제주도</option>
	       </select>              
	     </div>
	 
		<div class="my-3">
			<input class="form-control" placeholder="학교이름" type="text">
	    </div>
		<div class="mb-5">
			<button class="btn btn-light btn-block" type="button" id="searchBtn">검색</button>
	    </div>
	</div>
	
	<hr>
	<h5>검색 결과</h5>
	<div id="searchResultDiv"></div>

	<script>
		$(document).ready(function() {
			
			// 검색어 입력 받아서
			// 검색 버튼 눌렀을대 ajax 호출하고 결과 school
			
			
		});
	
	</script>
	
</body>
</html>