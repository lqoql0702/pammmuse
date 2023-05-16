# Pammmuse

개인 프로젝트로 진행

여성의류 쇼핑몰입니다.



# Description

- 개발 기간: 2023.03 ~ 2023.05

- 사용 기술

  - SpringBoot 2.7.9,  Apache Tomcat 9.0, BootStrap,  Mybatis
  - Java 11,  Ajax,  Jquery, JavaScript,  Git,  MVC Pttern
  - MySQL DataBase

- 구현 내용

  - 메인 페이지 

  - 상품 카테고리 분류

  - 상품 검색

  - 상품 상세페이지 구현 (장바구니, 구매하기)

  - Spring Security를 이용한 로그인, 로그아웃, 회원가입, 소셜 로그인(카카오)

  - 회원정보 수정
  
  - 장바구니, 주문

  - 공지 게시판
  

  -admin 사이트
  
  -관리자 로그인
  
  -상품 등록, 삭제, 상세 조회
  
  -공지 등
  
  -주문 현황, 주문 취소
  
    

# Views

- **메인**

  <p align="center"><img src="src/main/resources/static/img/스크린샷 2023-05-16 233715.png"/></p>





- **상품 카테고리** 

  <p align="center"><img src="src/main/resources/static/img/녹음 2023-05-16 234052.mp4"/></p>





- **상품 상세**

  <p align="center"><img src="src/main/resources/static/img/상품 상세.png"/></p>





# Implementation

- #### 상품 카테고리

  <img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/%EC%B9%B4%ED%85%8C%EA%B3%A0%EB%A6%AC%ED%99%94%EB%A9%B4.png?raw=true" width="370" /><img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/%EC%B9%B4%ED%85%8C%EA%B3%A0%EB%A6%AC%ED%99%94%EB%A9%B42.png?raw=true" width="370"/>

  <img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/%EC%B9%B4%ED%85%8C%EA%B3%A0%EB%A6%AC%ED%99%94%EB%A9%B41.png?raw=true" width="370" />

  

  - **카테고리별 검색, 리스트, 순서, 페이징** 
    1. Mybatis 동적 쿼리문을 이용하여 하나의 쿼리문으로 카테고리별 검색, 리스트, 순서, 페이징을 한 번에 처리를 하고 JsonView를 설정하여 Json형태로   데이터를 가져와 Ajax 통신으로 상품 리스트를 구성합니다

 

------

- #### 상품 상세보기1

  <p align="center"><img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/%EB%94%94%ED%85%8C%EC%9D%BC1.png?raw=true"/></p>

  - **상품 추가 및 삭제 기능**

    1. Jquery를 사용하여 선택한 상품 추가 및 원하는 상품 삭제 가능.
    2. Jquery를 사용하여 추가한 상품 수량 증가 및 감소 시 가격 실시간 동적 변경.
    3. 중복되는 상품 유효성 체크 완료.

  - **좋아요, 장바구니, 구매하기 기능**

    1. ♥클릭 시 해당 상품을 MyPage 좋아요 게시판에 추가.
    2. 장바구니 클릭 시 선택한 상품이 장바구니 리스트에 등록됩니다. 그리고 팝업창이 뜹니다. 상품을 선택 안 할 시 유효성 체크 완료. 
    3. 구매하기 버튼 클릭 시 해당 상품과 같이 주문페이지로 이동.

  - **Navigation Bar**

    1. Bootstrap을 사용하여 메뉴 바를 구성하였고 버튼 클릭 시 해당 내용으로 이동할 수 있게 메뉴 바를 수정하였습니다. 

  - **상세정보**

    1. CkEditor를 사용하여 상품의 이미지, 내용을 등록시켰습니다. 상세정보에 나오는 이미지와 글씨는 DataBase에 저장된 내용을 그대로 추출하여 사용했습니다. 

       

- #### 상품 상세보기2

  <p align="center"><img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/%EB%94%94%ED%85%8C%EC%9D%BC2.png?raw=true"/></p>

  - **상품 문의 기능**
    1. JsonView를 설정해 Json형태로 데이터를 가져와 Ajax 통신으로 리스트 구성.
    2. Toggle을 사용하여 제목을 클릭 시 보이기, 숨기기 기능 구성.
  - **Review 기능**
    1. JsonView를 설정해 Json형태로 데이터를 가져와 Ajax 통신으로 리스트 구성.
    2. Toggle을 사용하여 제목을 클릭 시 보이기, 숨기기 기능 구성. 
    3. 리뷰를 등록할 때 CkEditor를 사용하여 DataBase에 저장된 이미지와 내용 출력.
    4. Ajax 및 Jquery로 페이징 구성.

 



- # CRUD

  <p align="center"><img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/crud.png?raw=true"/></p>

  - **상품(리뷰) 등록 및 수정 삭제**
    1. 상품 등록 및 수정 Controller에서 ModelAndView를 사용하여 하나의 Jsp에 상품 등록인지 수정인지 구분할 수 있는 String값을 전송하여 Jstl C태그 조건문을 사용하여 구분하였습니다. 
    2. 상품 삭제 기능은 Delete처리를 하지 않고 DataBase를 설계할 때 상품 테이블에 구분 컬럼을 추가해 Update를 시켜 해당 데이터를 유저들이 보지 못하게 구성해놨습니다(Delete도 가능).
  - **상품(리뷰) 이미지 업로드 및 옵션(컬러, 사이즈) 등록**
    1. 이미지 업로드 Controller를 만들어 이미지를 서버에 저장할 수 있게 구성.
    2. 상품 또는 리뷰를 등록할 때 모든 이미지는 다중 업로드 처리를 했습니다.
    3. 상품 이미지 업로드 시 DataBase 상품 테이블 썸네일 컬럼에 자동으로 썸네일 이미지가 추가 되고 모든 이미지는 Upload 테이블에 추가됩니다.  (Service에서 상품을 등록할 때 모든 처리). 
    4. 상품 옵션은 다중 for문을 이용해 각 컬러, 사이즈마다 하나씩 DataBase에 등록이 됩니다. 




       

# Trouble Shooting 

<p align="center"><img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/%ED%8A%B8%EB%9F%AC%EB%B8%94%EC%8A%88%ED%8C%851.png?raw=true"/></p>

<p align="center"><img src="https://github.com/77kkyu/Style_Is_You/blob/master/src/main/webapp/file/%ED%8A%B8%EB%9F%AC%EB%B8%94%EC%8A%88%ED%8C%852.png?raw=true"/></p>
