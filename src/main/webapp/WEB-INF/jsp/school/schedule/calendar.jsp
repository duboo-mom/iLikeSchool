<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리학교 일정</title>

	<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.5/index.global.min.js'></script>
	<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/web-component@6.1.5/index.global.min.js'></script>
	<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.5/index.global.min.js'></script>
</head>	
<body>

	<full-calendar shadow options='{
	  "headerToolbar": {
	    "left": "prev,next today",
	    "center": "title",
	    "right": "dayGridMonth,dayGridWeek,dayGridDay"
	  }
	}' />

	<script>
		
	
	</script>
</body>
</html>