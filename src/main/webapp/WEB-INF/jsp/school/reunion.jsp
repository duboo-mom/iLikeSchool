<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>i Like School - 동창회</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
    <script>
        window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행

        let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
        let today = new Date();     // 페이지를 로드한 날짜를 저장
        today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화

        // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
        function buildCalendar() {

            let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
            let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날

            let tbody_Calendar = document.querySelector(".Calendar > tbody");
            document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
            document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신

            while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
                tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
            }

            let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가           

            for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
                let nowColumn = nowRow.insertCell();        // 열 추가
            }

            for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

                let nowColumn = nowRow.insertCell();        // 새 열을 추가하고


                let newDIV = document.createElement("p");
                newDIV.innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력
                nowColumn.appendChild(newDIV);

                if (nowDay.getDay() == 6) {                 // 토요일인 경우
                    nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
                }

                if (nowDay < today) {                       // 지난날인 경우
                    newDIV.className = "pastDay";
                }
                else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
                    newDIV.className = "today";
                    newDIV.onclick = function () { choiceDate(this); }
                }
                else {                                      // 미래인 경우
                    newDIV.className = "futureDay";
                    newDIV.onclick = function () { choiceDate(this); }
                }
            }
        }

        // 날짜 선택
        function choiceDate(newDIV) {
            if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
                document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
            }
            newDIV.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
        }

        // 이전달 버튼 클릭
        function prevCalendar() {
            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
            buildCalendar();    // 달력 다시 생성
        }
        // 다음달 버튼 클릭
        function nextCalendar() {
            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
            buildCalendar();    // 달력 다시 생성
        }

        // input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
        function leftPad(value) {
            if (value < 10) {
                value = "0" + value;
                return value;
            }
            return value;
        }
    </script>
</head>

<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
			<div class="school-menu d-flex align-items-center">
				<h4 class="ml-5">동원초등학교</h4>
				<form>
					<label><input type="radio" class="ml-4 mr-1 school-type-input" name="schoolType" value="e" checked="checked">초등학교</label>
					<label class="ml-3"><input type="radio" class="mr-1 school-type-input" name="schoolType" value="m">중학교</label>				
					<label class="ml-3"><input type="radio" class="mr-1 school-type-input" name="schoolType" value="h">고등학교</label>				
					<label class="ml-3"><input type="radio" class="mr-1 school-type-input" name="schoolType" value="u">대학교</label>				
				</form>				
			</div>
			<hr>
			<section class="school-main-content d-flex justify-content-between align-itmes-end">
				<div class="school-plan">
					<div class="ml-5 mr-5 d-flex justify-content-between">
						<h5>우리학교 일정</h5>	
						<div><a href="/school/schedule/view" class="small">일정 등록하기</a></div>									
					</div>
	                <div class="school-calendar">
				        <table class="Calendar">
				            <thead>
				                <tr>
				                    <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
				                    <td colspan="5">
				                        <span id="calYear"></span>년
				                        <span id="calMonth"></span>월
				                    </td>
				                    <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
				                </tr>
				                <tr>
				                    <td>일</td>
				                    <td>월</td>
				                    <td>화</td>
				                    <td>수</td>
				                    <td>목</td>
				                    <td>금</td>
				                    <td>토</td>
				                </tr>
				            </thead>
				
				            <tbody>
				            </tbody>
				        </table>
				    </div>
		            
		            <div class="ml-5 mt-4">
		            	<div class="d-flex justify-content-between">
			            	<h5>우리학교 투표</h5>
							<i class="bi bi-three-dots mr-5 pr-3"></i>	            	
		            	</div>
		            	<ul>
		            		<li>동창회 일정</li>
		            		<li>여름 야유회</li>
		            	</ul>
		            </div>
		            
		            <div class="ml-5 mt-4">
		            	<div class="d-flex justify-content-between">
			            	<h5>내 모임 소식</h5>
							<a class="a-custom" href="/school/gathering/list/view"><i class="bi bi-three-dots mr-5 pr-3"></i></a>	            	
		            	</div>
		            	<ul>
		            		<li>미종 : 난 안갈랭</li>
		            		<li>보갬 : 동창회하면 갈 사람?</li>
		            	</ul>
		            </div>
		            
		            <div class="ml-5 mt-4">
		            	<h5>열혈 활동 랭킹</h5>
		            	<table class="rank-table text-center" border="1">
		            		<tr>
		            			<th>순위</th>
		            			<th>이름</th>
		            			<th>게시글수</th>
		            		</tr>
		            		<tr>
		            			<td>1</td>
		            			<td>미종</td>
		            			<td>3</td>
		            		</tr>
		            		<tr>
		            			<td>2</td>
		            			<td>두부</td>
		            			<td>1</td>
		            		</tr>
		            	</table>
		            </div>
		            
				</div>
			          
				
				<div class="school-post">
					<div class="d-flex justify-content-between">
						<h4>조잘조잘</h4>
						<a href="/school/create/view">글쓰기</a>					
					</div>
					<div class="post-detail">
						<div class="name-tag-div d-flex align-items-center">
							<img class="rounded-circle" width="50" src="https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_960_720.jpg">
							<div class="ml-2">두부 - 동원초등학교</div>
						</div>
						<img class="my-2" width="550" src="https://cdn.pixabay.com/photo/2017/07/27/16/48/toppokki-2545943_960_720.jpg">
						<div class="mt-1">
							: 학교앞에 떡볶이 맛있었는뎅
						</div>
					</div>
					<div class="post-detail mt-3">
						<div class="name-tag-div">
							<img src="">
							미종 - 동원초등학교
						</div>
						<div>
							: 애두라 모하니?
						</div>
					</div>
					
				</div>
					
			</section>


		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>

	
</body>
</html>