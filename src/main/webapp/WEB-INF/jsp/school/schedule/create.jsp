<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 등록</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
	<style>
		label {
		  display: inline-flex;
		  align-items: center;
		  gap: 0.5rem;
		  cursor: pointer;
		}
		
		[type="checkbox"] {
		  appearance: none;
	   	  position: relative;
		  border: max(2px, 0.1em) solid gray;
		  border-radius: 1.25em;
		  width: 2.25em;
		  height: 1.25em;
		}
		
		[type="checkbox"]::before {
		  content: "";
		  position: absolute;
		  left: 0;
		  width: 1em;
		  height: 1em;
		  border-radius: 50%;
		  transform: scale(0.8);
		  background-color: gray;
		  transition: left 250ms linear;
		}
		
		[type="checkbox"]:checked::before {
		  background-color: white;
		  left: 1em;
		}
		
		[type="checkbox"]:checked {
		  background-color: tomato;
		  border-color: tomato;
		}
	
	</style>	
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<section class="schedule-input-div d-flex justify-content-center">
			<div id="schedule-main-box">
				<h5 class="text-center mt-4">일정 등록하기</h5>
				<div class="text-right mt-3">
					<label>
					  <input role="switch" type="checkbox" />
					  <span>일정 등록 알람</span>
					</label>
				</div>

				<input class="form-control mt-1" type="text" placeholder="제목">
				<input class="form-control mt-3" type="text" placeholder="장소">
				<input id="datePicker" class="mt-3" type="text" placeholder="날짜">
				
				<button type="button" class="btn btn-block btn-secondary mt-3">일정 등록</button>
			
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>

</body>
</html>