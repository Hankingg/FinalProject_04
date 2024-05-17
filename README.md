# 메디케어

<img src="https://github.com/Hankingg/FinalProject_04/blob/main/medicare/src/main/webapp/resources/logo/logo.png" width="200">

## 📄 프로젝트 소개
**메디케어 : 통합 의료기관 사이트**

#### ❓ 프로젝트 기획 의도

<div>
  현대인들은 건강을 최우선으로 여기며 건강을 유지하고 개선하기 위한 다양한 방법을 모색하고 있습니다. <br>
  거동이 불편하거나 시간부족의 불편함을 해결하기 위해 비대면 진료/접수예약 서비스, 처방전 전송을 통한 비대면 약품 구매 등을 포함한 포괄적인 의료 서비스를 제공하여 편의성을 향상시킬 수 있도록 하고자 기획하였습니다.
</div>

<br><br>
#### 🧷 프로젝트 특징

&nbsp; - 편의성: 사용자는 하나의 사이트에서 편리하게 의료 정보와 서비스에 액세스할 수 있으므로 여러 사이트나 애플리케이션이 필요하지 않습니다.

&nbsp; - 사용자 친화적인 인터페이스: 인터페이스는 사용자 친화적으로 설계되어 있어 필수 서비스에 쉽게 탐색하고 액세스할 수 있습니다.

&nbsp; - 종합 서비스: 원격 상담, 약품 구매, 응급 지원 등 다양한 의료 서비스를 제공하여 의료 요구 사항을 하나의 플랫폼으로 통합합니다.

<br><br>

## 📆 개발기간
2024.03.26 ~ 2024.05.02 (금)

&nbsp; - 2024.03.26 (화) ~ 2024.04.03 (화) : 프로젝트 분석

&nbsp; - 2024.04.03 (화) ~ 2024.04.05 (화) : 화면 설계

&nbsp; - 2024.04.05 (화) ~ 2024.04.10 (일) : 데이터 설계

&nbsp; - 2024.04.10 (월) ~ 2024.04.15 (목) : 화면 JSP 생성 및 로그인 기능 구현

&nbsp; - 2024.04.15 (금) ~ 2024.04.29 (화) : 기능 개발

&nbsp; - 2024.04.29 (수) ~ 2024.05.02 (금) : 프로젝트 검수 및 테스트

&nbsp; - 2024.05.02 (월) : 최종 발표

<br><br>
## 👥 구성원 및 역

⭐ 조장 : 이한기 (깃주소)

&nbsp; - 관리자 페이지 (회원/상품관리/공지사항/신고/통계)

&nbsp; - 알림

&nbsp; - 채팅

&nbsp; - 인기검색어

⭐ 조원 : 이종민 (깃주소)

&nbsp; - 마이페이지

&nbsp; - 상품 등록/수정/삭제

&nbsp; - 판매/구매 내역

&nbsp; - 관심상품

&nbsp; - 리뷰

&nbsp; - 거래 요청

⭐ 조원 : 노정민 (깃주소)

&nbsp; ◻️ 마이페이지
- 회원정보 조회
- 회원정보 수정(카카오 주소 API)
- 회원 탈퇴
- 리뷰 리스트(회원, 관리자)
  
&nbsp; ◻️ 한의원 통합 페이지
- 한의원 목록 조회(전국 병•의원 찾기 서비스 API 중 위치정보를 사용한 현위치와의 거리, 이름, 번호, 주소 조회)
- 현위치 사용동의 후 지도에 현위치 표시(네이버지도 API)
- 목록에 나온 한의원의 위치를 지도에 핀으로 표시(네이버지도 API)
- 핀이나 목록 클릭시 해당 한의원의 상세페이지로 이동
    
&nbsp; ◻️ 한의원 상세 페이지
- 한의원의 상세 정보 조회(한의원 이름, 전화번호, 주소, 상세설명, 진료시간, 진료상태)
- 현재 요일이 진료시간에서 휴진날이면 영업안함, 시간에 포함되면 진료중, 진료전이나 후면 진료종료로 가독성 좋게 표시
- 전화번호와 주소 복사 기능
- 지도에 해당 한의원의 위치 핀으로 표시(네이버 지도 API)
- 리뷰 등록
- 리뷰 조회


⭐ 조원 : 윤상연 (깃주소)

&nbsp; - 아이디/비밀번호 찾기

&nbsp; - 회원가입

&nbsp; - 회원 정보 수정

&nbsp; - 이메일 인증 API

&nbsp; - 우편번호 검색 API

<br><br>
## ⚙️ 개발 환경

- OS : Windows10

- IDE : Spring, VSCode

- Server : Apach Tomcat 9.0

- DBMS : Oracle

- Languages : JAVA, HTML, CSS, JavaSciprt, JQuery, JSP, SQL

- Management : Git, GitHub, SourceTree

<br><br>
## 🔧 기술 스택

- FrontEnd : HTML5, CSS3, JavaScript, JQuery, Ajax

- BackEnd : Java 11, JSP & Servlet

<br><br>
## 🖋️ 설계

ERD Cloud

<img src=https://prod-files-secure.s3.us-west-2.amazonaws.com/2b32712a-5a50-4af8-8867-a864842a3da9/d9613175-2be9-41c2-8a66-527fe33d4401/%EB%A9%94%EB%94%94%EC%BC%80%EC%96%B4_ERD.png >

<br><br>

#### ✂ 프로젝트 개선점

&nbsp; -  

<br><br>
#### 🧶 프로젝트를 통해 깨달은 점

🧑 이종민

&nbsp; - 세미프로젝트때보다 만든 페이지 수는 적었지만 공공데이터를 활용한 조회 기능이나 예약 일정 관리, 그리고 비대면 진료같은 알찬 기능들을 많이 넣어서 더욱 의미 있던 시간이었습니다. 
하지만 비대면 진료에 할애된 시간이 너무 많았기 때문에, 짧은 개발 기간 동안에 각 기능의 완성도를 충분히 확인하는데 어려움을 겪었습니다. 이를 통해 향후에는 기능 개발과 테스트 기간을 균형 있게 조정해야 한다는 깨달음을 얻었습니다.


👦 이한기

&nbsp; - 이번 프로젝트를 진행하며, 개발자로서의 경로에서 기술적인 근본을 더욱 깊이 이해하게 되었습니다. 각 기능과 요소가 단순히 생성되는 것이 아니라, 깊은 사고와 체계적인 계획, 그리고 반복된 시행착오를 통해 형성된다는 점을 명확히 인식하게 되었습니다. 이 과정은 저에게 현실적인 기술적 한계를 인지하게 했으며, 이를 극복하기 위한 새로운 동기를 부여했습니다.

&nbsp; 앞으로의 발전을 위해, 저는 다음 단계로 나아가기 위한 구체적인 계획을 세웠습니다. 첫째, 기존 지식의 깊이를 더욱 증진시키기 위해 체계적인 학습을 지속할 것입니다. 둘째, 기술 스택을 확장하여 다양한 도메인과 기술에 대한 이해를 넓힐 것입니다. 셋째, 실제 프로젝트와 협업을 통해 경험을 쌓아, 이론과 실제의 격차를 줄여나갈 계획입니다.

&nbsp; 이러한 계획을 실천함으로써, 저는 더욱 발전하는 개발자로 거듭나 기술적 문제 해결 능력을 강화하고, 새로운 기술을 창조하는 데 기여하고자 합니다. 이는 끊임없는 학습과 도전을 통해 가능한 목표이며, 이 과정에서 얻어지는 성취와 발전이 저의 기술적 여정을 더욱 가치 있게 만들 것입니다.

👩 노정민

&nbsp; -

👧 윤상연

&nbsp; -

<br><br>
## 📖 프로젝트 구현
이종민

상세페이지
<img src="https://github.com/Hankingg/FinalProject_04/assets/151510208/6efa63a9-7131-4075-af11-a716f6204d83">

진료예약, 진료 내역 확인
<img src="https://github.com/Hankingg/FinalProject_04/assets/151510208/c1f63238-e8a3-4d75-96bf-277debd314fd">

예약 일정 관리
<img src="https://github.com/Hankingg/FinalProject_04/assets/151510208/97384528-4169-4275-a67a-761500551f8f">

비대면 진료
<img src="https://github.com/Hankingg/FinalProject_04/assets/151510208/28dfe5a8-0138-4424-951a-44c13627a9f0">


노정민

• 날씨 맑음
![맑은 날씨](https://github.com/Hankingg/FinalProject_04/assets/151510057/66737563-e89d-42c7-ab32-4726b1c11b20)

• 날씨 구름많음
![구름많음 날씨](https://github.com/Hankingg/FinalProject_04/assets/151510057/58062e62-5e97-4c93-9b6f-3de047860a62)

• 날씨 비

• 회원 정보 조회, 수정 / 리뷰 조회, 삭제 / 회원 탈퇴
![회원정보 조회,수정, 리뷰조회,삭제,회원탈퇴](https://github.com/Hankingg/FinalProject_04/assets/151510057/63120df6-f6c0-48cf-9b84-67bf0ff98b00)

• 한의원 목록페이지
![한의원 목록페이지](https://github.com/Hankingg/FinalProject_04/assets/151510057/d85b39da-ef75-4d66-868b-682f638e1b54)

• 한의원 상세페이지
![한의원 상세페이지](https://github.com/Hankingg/FinalProject_04/assets/151510057/d888e74a-cf75-4869-b411-acf88344b9ec)

• 1:1 채팅
![채팅](https://github.com/Hankingg/FinalProject_04/assets/151510057/a9f5d593-aa5d-4e5b-9df7-4a366faad9ce)

• 리뷰 작성, 조회
![리뷰 작성, 조회](https://github.com/Hankingg/FinalProject_04/assets/151510057/5738ad4e-afee-45e7-9d9a-20242ad4074b)




윤상연

•  회원가입
![회원가입](https://github.com/Hankingg/FinalProject_04/assets/151510176/6ccefb90-bbe5-4d45-a127-67865ebfffea)



•  일반 로그인
![일반로그인](https://github.com/Hankingg/FinalProject_04/assets/151510176/ad00df48-82f9-4c40-a8cd-91d661aa41e2)


•  카카오 로그인
![카카오로그인](https://github.com/Hankingg/FinalProject_04/assets/151510176/a80ccb65-e8dc-436f-aa0b-c64035b6ceca)


•  네이버 로그인
![네이버 로그인](https://github.com/Hankingg/FinalProject_04/assets/151510176/134c2ab7-550a-4e5a-b54e-92a545e7d04f)


•  비밀번호 변경
![비밀번호 변경](https://github.com/Hankingg/FinalProject_04/assets/151510176/d62b7029-b189-43be-8713-2c37f9c9aebb)


•  관리자 회원
![관리자회원관리](https://github.com/Hankingg/FinalProject_04/assets/151510176/26e54d42-4082-48eb-89c7-268529e8fd86)


•  멤버십 월간구독
![멤버십 월간구독권](https://github.com/Hankingg/FinalProject_04/assets/151510176/9b229a98-a99f-486f-aba3-192f9974212a)


•  멤버십 연간구독
![멤버십 연간구독권](https://github.com/Hankingg/FinalProject_04/assets/151510176/dffdf137-f8e9-4074-a0d9-5f551ad3edb0)


•  응급실 실시간
![응급실2](https://github.com/Hankingg/FinalProject_04/assets/151510176/81e501ba-48ec-4421-84f7-b8f75cd79560)


•  단체채팅
![단체채팅](https://github.com/Hankingg/FinalProject_04/assets/151510176/003eb866-a2ef-454c-a2ca-513d9ee5e13c)






