# iLikeSchool
동창찾기/모임 서비스
* '아이러브스쿨' 을 모티브로 한 서비스
* 같은 학교 졸업생끼리 동창회 및 소모임을 만드는 기능 제공
* 로그인 기반, 친구찾기 기능 과 개인별 방명록 기능

## ⏰ 개발 기간
<b>2023.02.27 ~ 2023.04.03 (5주)</b>

## 📜 기획, 설계 문서
* 기획(Ovenapp) : https://ovenapp.io/view/2JgmEe7wKzEShUoiS92QYGMtEPzu9ZDM#cI8KK
* 설계(google spreadsheet) : https://docs.google.com/spreadsheets/d/1Xdyx1U1oFMmkJLSMBY7kFgIs5rfVYrPvgHoriv7Gn8E/edit#gid=1433693606

## 🖥️ 접속 환경
* 주소 : http://52.79.80.199:8080/user/signin/view
* 테스트 계정 : ID: duboo/ PW: 1234

## 🔆 포트폴리오
노션으로 작성하였습니다 :)   
https://aboard-chinchilla-ff9.notion.site/3875a94f243446659bf266fd9a8f60f8

## ⚒️ 기술 Stack
<div align=center>
<img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white">
<img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white">
<img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white">
<img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
<img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
<img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
<img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white">
<img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">
<img src="https://img.shields.io/badge/amazonaws-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white">
<img src="https://img.shields.io/badge/gradle-02303A?style=for-the-badge&logo=gradle&logoColor=white">
<img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">
<img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
</div>

## 📝 주요 기능
자세한 기능 설명과 개발 과정은 포트폴리오를 참고 해주세요 :)   
### 회원가입, 로그인, 아이디/비밀번호 찾기
* 회원가입과 로그인 기능
* 회원 정보 내에 일치하는 아이디 찾기 기능
* 임시 비밀번호 발급 기능 → 로그인 후 마이페이지에서 비밀번호 수정 가능

### 학교 정보 입력
* 최초 로그인 시 졸업한 학교 정보를 입력받는 기능
* 학교 정보 또한 마이페이지에서 수정 가능함
* 동일한 학교 이름을 DB에 추가하기 위하여 ⚡커리어넷 open API⚡ 를 사용한 학교 검색 기능 

### 마이페이지
* 회원 가입 시, 입력했던 사용자 정보 및 프로필 사진 수정 기능

### 내 학교 소식
* 사용자가 입력한 학교들의 네이버 뉴스 검색 결과를 보여주는 기능
* ⚡네이버 검색 API⚡ 활용

### 🐾동창회🐾
* 졸업 년도와 상관없이 동문끼리 일정/투표/소모임/게시글을 공유할 수 있는 페이지
* 일정 : 풀캘린더를 활용하여 DB에 등록된 일정 공유 → 일정 등록 가능
* 투표 : 투표 등록 후 기한내에 있는 투표에 대하여 참여할 수 있으며, 기한이 지나면 결과가 보여지는 기능
* 소모임 : 동창회 페이지는 동문이라면 모두 공유가 가능하기 때문에, 가입한 멤버끼리만 볼 수 있는 페이지
* 게시글 : 동문이라면 학교 동창회 페이지에서 공통으로 보여지는 게시글. 사진 첨부 가능

### 친구 찾기
* 가입한 회원에 한하여 이름과 학교를 입력하면 일치하는 사용자를 조회하는 기능
* 결과에서 이름을 클릭하면 해당 사용자의 방명록으로 연결 되는 기능

### 방명록
* 사용자 별 방명록 페이지를 제공하며, 본인의 방명록에서는 글을 작성할 수 없음

## 🔎 향후 계획
* 네이버 로그인 기능 추가
* 친구찾기에서 정확하지 않은 키워드에 대한 결과값도 보여주기
* 방명록에서 개인 프로필 사진 로드

### 실제 서비스 화면
![image](https://github.com/duboo-mom/Insutaguram/assets/108273076/6b388b35-34e2-4b2a-8293-277308eed13a)
![image](https://github.com/duboo-mom/Insutaguram/assets/108273076/3c1280f8-af68-4ab9-a232-12e06aba9972)
![image](https://github.com/duboo-mom/Insutaguram/assets/108273076/8f6f68dd-c6e6-42b7-8e1f-6c67de2b5088)
