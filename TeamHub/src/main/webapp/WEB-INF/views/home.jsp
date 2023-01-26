<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>힐링캠프</title>
    <!--부트스트랩, header footer css 연결-->
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">

    <!--swiper 연결-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"/>
    <style>
       main h2{margin-left:15%; margin-bottom:2%;}

       main #test{margin-bottom:5%; width:100%; background-color: aliceblue;}
       main #test div{display:flex;}
       main #test h2{display:inline-block; margin-left:45%; margin-top:4%; margin-bottom:2%;}
       main #test div div{width:200px; height:100px; margin-left:8%; margin-top:4%; display:inline-block;}

       main #program{margin-bottom:5%;}
       main #program h2{margin-bottom:4%;}
       main #program div{display:inline-block; margin-left:10%; font-weight:bold; font-size:20px;}

       main #mainbottom{position: relative;}

       main #res{width:20%; margin-left:20%; margin-bottom:5%;}
       main #res h2{margin-bottom:4%;}
       main #res div{width:250px; height:100px;}

       main #healingwords{position:absolute; top:0%; right:20%; width:20%;}

       body main .bannerSwiper{height:500px; margin-bottom:5%;}
       body main .mySwiper{height:250px; margin-bottom:5%;}
       
        /*swiper 관련 css*/
        .swiper {
        width: 80%;
        height: 100%;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }

      .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }

      .swiper {
        margin-left: auto;
        margin-right: auto;
      }
       /*fin swiper 관련 css*/
    </style>
</head>
<body>
    <header>    <!--header-->
        <div> <!--로그인 관련-->
             
          <c:if test = "${login == null}">   
            <p><a href="<%=request.getContextPath() %>/user/login.do">로그인</a></p>
            <p><a href="<%= request.getContextPath() %>/joinMain.do">회원가입</a></p>
            <p><a href="<%=request.getContextPath() %>/customerService/customerNotice.do">고객센터</a></p>
         </c:if><!-- 로그아웃 or 로그인x -->
         
        <c:if test = "${login != null}">
            
               <p><a href="<%=request.getContextPath()%>/user/logout.do">로그아웃</a></p>
               <c:if test = "${login.usertype eq 'a'}">
               <p><a href="<%=request.getContextPath() %>/adminPage/adminPage_Member_List.do">관리자 페이지</a></p>
               </c:if>
               <c:if test = "${login.usertype eq 'u'}">
               <p><a href="<%= request.getContextPath() %>/page/mypageRes.do">마이 페이지</a></p>
               </c:if>
               <c:if test = "${login.usertype eq 'c'}">
               <p><a href="">상담사 페이지</a></p>
               </c:if>
               <p><a href="<%=request.getContextPath() %>/customerService/customerNotice.do">고객센터</a></p>
      </c:if>
      </div>
   
         
         <!-- fin 로그인 관련 -->
        <nav class="navbar" style="background-color: #dff6e1;"> <!-- 상단 네비게이션 -->
            <h1><a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/resources/upload/힐링캠프 logo.png" alt="홈버튼"></a></h1>
           <a href="<%=request.getContextPath()%>/program.do">치료프로그램</a>
            <a href="<%=request.getContextPath()%>/test.do">심리테스트</a>
            <a href="<%=request.getContextPath()%>/community/community_list.do">커뮤니티</a>
            <a href="<%=request.getContextPath()%>/res/findcenter.do">상담 예약</a>
            <a href="<%=request.getContextPath()%>/counseller_board/counseller_board_list.do">상담사 게시판</a>
            <section></section>
        </nav> <!-- fin 상단 네비게이션 -->
    </header> <!--fin header-->
    <main>
        <div class="swiper bannerSwiper"> <!--banner-->
            <div class="swiper-wrapper">
              <div class="swiper-slide">배너 1</div>
              <div class="swiper-slide">배너 2</div>
              <div class="swiper-slide">배너 3</div>             
            </div>
        </div> <!-- fin banner-->
        <div class="swiper mySwiper"> <!-- board list-->
            <div class="swiper-wrapper">
              <div class="swiper-slide">Slide 1</div>
              <div class="swiper-slide">Slide 2</div>
              <div class="swiper-slide">Slide 3</div>
              <div class="swiper-slide">Slide 4</div>
              <div class="swiper-slide">Slide 5</div>
              <div class="swiper-slide">Slide 6</div>
              <div class="swiper-slide">Slide 7</div>
              <div class="swiper-slide">Slide 8</div>
              <div class="swiper-slide">Slide 9</div>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-pagination"></div>
          </div> <!-- fin board list-->
        <div id="test"> <!--심리 테스트-->
            <h2>심리 테스트</h2><br>
            <div>
               <div><a href="https://testharo.com/16personalities/ko" target="_blank">MBTI 테스트</a></div>
               <div><a href="https://testharo.com/depression/ko" target="_blank">우울증 테스트</a></div>
               <div><a href="https://testharo.com/burnout/ko" target="_blank">번아웃 증후군 테스트</a></div>
               <div><a href="https://testharo.com/16personalities/ko" target="_blank">성격유형 테스트</a></div>
               <div><a href="https://testharo.com/depression/ko" target="_blank">ADHD 테스트</a></div>     
            </div>       
        </div> <!--fin 심리 테스트-->
        <div id="program"> <!-- 치료 프로그램-->
            <h2>치료 프로그램 설명</h2>
            <div>독서치료란?<br><iframe width="560" height="315" src="https://www.youtube.com/embed/vtx4tD_b6oU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe></div>
            <div>인지학습치료란?<br><iframe width="560" height="315" src="https://www.youtube.com/embed/HikrEKEXQko" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe></div>
        </div><!-- fin 치료 프로그램-->
        <div id="mainbottom"> <!-- 메인 하단-->
            <div id="res"> <!--상담예약-->
                <h2>상담 예약</h2>
                <div>
                    <p><a href="<%=request.getContextPath()%>/res/findcenter.do">상담 예약하기</a></p>   
                    <p>예약순서</p>                 
                    <p>1.상담 선택</p>                 
                    <p>2.상담사 선택</p>                 
                    <p>3.상담일자 선택</p>
                    <p>부담 없이 예약해보세요.</p>                 
                </div>
                
            </div> <!-- fin 상담예약-->
            <div id="healingwords"> <!-- 글귀 -->
                <h2>힐링워드</h2>
                <p>글귀1</p>
                <p>글귀2</p>
                <p>글귀3</p>            
                <p>글귀4</p>            
                <p>글귀5</p>            
                <p>글귀6</p>            
            </div><!-- fin 글귀-->
        </div> <!-- fin 메인 하단-->
    </main>
    <footer> <!-- footer -->
        <div id="bottom">   
            <br> 
            <p>(주)&nbsp;힐링캠프</p>
            <p>Team : 허브</p>
            <p>이젠 아카데미</p>
            <br>
            <address>전라북도 전주시 덕진구 금암1동 667-52</address>
            <p>전화번호 : 010-0000-0000</p>
            <p>FAX : 063-000-0000</p>
        </div>
</footer> <!-- end footer -->
     
    <!-- Swiper JS -->
     <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

     <!-- Initialize Swiper -->
     <script>

        var swiper2 = new Swiper(".bannerSwiper", {
            spaceBetween: 30,
            centeredSlides: true,
            loop: true,
            autoplay: {
            delay: 4000,
            disableOnInteraction: false,
            },
            pagination: {
            el: ".swiper-pagination",
            clickable: true,
            },
           
        }); 

        var swiper = new Swiper(".mySwiper", {
            spaceBetween: 30,
            centeredSlides: true,
            loop: true,
            autoplay: {
            delay: 3000,
            disableOnInteraction: false,
            },
            pagination: {
            el: ".swiper-pagination",
            clickable: true,
            },
            navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
            },
        });
     </script>
</body>
</html>