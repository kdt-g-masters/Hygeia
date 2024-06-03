<img src="./README_asset/cover_image.png"/>

# 생활습관병(성인병) 예방 및 증상 완화를 위한 <br>식재료 정보 제공 서비스

<img src="./README_asset/logo_orange.png" width="100"/>

> <b>Hygeia</b>(히기에이아)란 그리스 로마 신화에 등장하는 의술의 신 아스클레피오스의 딸로 건강과 위생을 주관하는 신을 의미합니다. <br>

<br>

### 프로젝트 개발 기간

`2022.04.01.` - `2022.04.29.` (4주)

### 팀 활동

<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Hand%20gestures/Backhand%20Index%20Pointing%20Right%20Light%20Skin%20Tone.png" alt="Backhand Index Pointing Right Light Skin Tone" width="30" height="30" /> [<img src="https://img.shields.io/badge/trello-0052CC?style=for-the-badge&logo=trello&logoColor=white">](https://trello.com/b/d0qKpxgt/semi-project-hygeia, "hygeia team link")

<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Hand%20gestures/Backhand%20Index%20Pointing%20Right%20Light%20Skin%20Tone.png" alt="Backhand Index Pointing Right Light Skin Tone" width="30" height="30" /> [<img src="https://img.shields.io/badge/결과보고서-000000?style=for-the-badge&logo=googledocs&logoColor=white" />](https://github.com/kdt-g-masters/Hygeia/files/8597373/_4.pdf)  

<br>

# 📌 기술 스택

### Back-End

<div>
  <img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=openjdk&logoColor=white" />
  <img src="https://img.shields.io/badge/Spring Boot-6DB33F?style=for-the-badge&logo=Spring Boot&logoColor=white" />
  <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white" />
</div>

### Front-End

<div>
  <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"> 
  <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> 
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white">
  <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
  <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white"> 
</div>

### VCS

<div>
  <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">
  <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
  <img src="https://img.shields.io/badge/sourcetree-0052CC?style=for-the-badge&logo=sourcetree&logoColor=white">
</div>

### DevTool

<div>
  <img src="https://img.shields.io/badge/Eclipse IDE-2C2255?style=for-the-badge&logo=Eclipse IDE&logoColor=white" />
  <img src="https://img.shields.io/badge/STS3-6DB33F?style=for-the-badge&logo=Spring&logoColor=white" />
  <img src="https://img.shields.io/badge/Work Bench-4479A1?style=for-the-badge&logo=MySQL&logoColor=white" />
</div>

### Project Management Tool

<div>
  <img src="https://img.shields.io/badge/trello-0052CC?style=for-the-badge&logo=trello&logoColor=white">
  <img src="https://img.shields.io/badge/zoom-0B5CFF?style=for-the-badge&logo=zoom&logoColor=white">
  <img src="https://img.shields.io/badge/discord-5865F2?style=for-the-badge&logo=discord&logoColor=white">
</div>

<br>

# 📌 프로젝트 배경

- 생활습관병 증상을 개선하기 위해 파편화된 식재료 정보를 수집할 때 어려움이 있다.
- 식습관 개선을 통해 생활습관병을 완화 및 예방하려고 하는 사람들에게 정보와 부가적인 기능을 제공한다.

<br>

# 📌 프로젝트 개요

### 정보 제공

- [질병관리청 국가건강정보포털](https://health.kdca.go.kr/)에서 제공하는 생활습관병 데이터를 이용하여 정보 제공
- 농림축산식품 공공데이터 포털에서 제공하는 [제철 농산물 상세정보](https://data.mafra.go.kr/opendata/data/indexOpenDataDetail.do?data_id=20171128000000000925) OpenAPI를 이용하여 식재료 정보를 제공
- 증상 완화에 효과가 있는 식재료를 매칭

### 설문 형식의 맞춤 정보 제공

- 간단한 질문을 통해 발생 가능성이 있는 생활습관병 예측
- 질문마다 생활습관병에 대해 가중치를 부여하여 판단
- 해당 생활습관병을 예방에 효과가 있는 식재료 매칭

### 챗봇

- 네이버 클라우드 플랫폼 CLOVA chatbot custom API를 이용
- 생활습관병의 종류와 세부적인 정보 제공
- 챗봇을 통한 서비스 이용 가능

### 식재료 검색

- 키워드 입력시 자동완성
- 네이버 CLOVA Speech Recognition을 이용한 STT 기능

<br>

# 📌 서비스 화면

### 메인

![메인](./README_asset/screen/메인.png)

### 로그인

![로그인](./README_asset/screen/로그인.png)

### 회원가입

![회원가입](./README_asset/screen/회원가입.png)

### 생활습관병

리스트
![리스트](./README_asset/screen/생활습관병_리스트.png)

상세보기
![상세보기](./README_asset/screen/생활습관병_상세보기.png)

### 식재료

리스트
![리스트](./README_asset/screen/식재료_리스트.png)

상세보기
![상세보기](./README_asset/screen/식재료_상세보기.png)

검색
![검색](./README_asset/screen/식재료%20검색.png)

### 내 건강 정보

![증상 테스트](/README_asset/screen/증상%20테스트.png)

문항
![문항](/README_asset/screen/증상%20테스트_문항.png)

결과
![결과](/README_asset/screen/증상%20테스트_결과.png)

### 마이페이지

![마이페이지](/README_asset/screen/마이페이지.png)

### 후기

리스트
![리스트](/README_asset/screen/후기_리스트.png)

상세보기
![상세보기](/README_asset/screen/후기_상세보기.png)

### 챗봇

![챗봇](/README_asset/screen/챗봇.png)

# 📌 프로젝트 산출물

### ERD

![ERD](/README_asset/ERD.png)

### 화면 흐름도

![화면 흐름도](/README_asset/화면흐름도.png)

### 기능

![기능](/README_asset/기능.png)

### 챗봇 시나리오

![챗봇시나리오](/README_asset/챗봇_시나리오.png)

<br>

# 📌 기대효과

- 생활습관병과 식재료와 관련된 정보를 찾는 시간 절약
- 정보를 쉽고 편리하게 조회
- 생활습관병 관련 커뮤니티 형성

<br>

# 📌 팀원 소개

| 이새하                                                              | 김정규                                                          | 연주원                                                            | 이종무                                                            | 이훈학                                                            |
| ------------------------------------------------------------------- | --------------------------------------------------------------- | ----------------------------------------------------------------- | ----------------------------------------------------------------- | ----------------------------------------------------------------- |
| [![saehalee](https://avatars.githubusercontent.com/u/42618047?v=4)](https://github.com/saehalee)                             | [![inacro](https://avatars.githubusercontent.com/u/86817551?v=4)](https://github.com/inacro)                             | [![joo1yeon](https://avatars.githubusercontent.com/u/50977497?v=4)](https://github.com/joo1yeon)                           | [![JaeHa29](https://avatars.githubusercontent.com/u/100458789?v=4)](https://github.com/JaeHa29)                             | [![hoonak2](https://avatars.githubusercontent.com/u/132100894?v=4)](https://github.com/hoonak2)                             |
| 팀장 <br>PM <br>챗봇 기능 <br>DB 모델링 <br>마이 페이지 <br>UI 설계 | <br>생활습관병 정보 제공 기능 <br>후기 기능                     | <br>회원 관리 <br>메인 페이지 <br>식재료 검색 기능                | <br>증상 테스트 기능 <br>문서화 <br>최종 발표                     | <br>식재료 정보 제공 기능 <br>                                    |

<br>
