s<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="ko" style="--vh:5.02px;">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>힐링캠프</title>
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">
    <style>
        main{
            width:1024px;
            margin:0 auto;
            }
        #banner img{
            width:100%;           
        }
        #items{
            margin-top:40px;
            display: flex;
            flex-wrap: wrap;
            justify-content:space-evenly;
            
        }
        #items .item_box{
            background-color: #dff6e1;
            border-radius:10px;
            width:30%;
            height:200px;
            padding:10px;
            margin-bottom:20px;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
        }
        #items .item_box:last-child{
            display:flex;
            justify-content: center;
            align-items: center;
        }
        #items .item_box .title{
            font-weight: bold;
            margin:10px 0 20px;
        }
        #items .item_box .description{
            font-size:15px;
            word-break: keep-all;
        }
        #items .item_box .start_btn{
            background-color:lightgray;
            border-radius: 5px;
            padding:10px;
        }
        #items .item_box .start_btn:hover{
            font-weight:bold;
            color:white;
        }
    </style>
    
</head>
<body>
    <header>        
       <div> <!--로그인 관련-->
             
          <c:if test = "${login == null}">   
            <p><a href="<%=request.getContextPath() %>/user/login.do">로그인</a></p>
            <p><a href="<%= request.getContextPath() %>/joinMain.do">회원가입</a></p>
            <p><a href="<%=request.getContextPath() %>/customerService/customerNotice.do">고객센터</a></p>
         </c:if><!-- 로그아웃 or 로그인x -->
         
        <c:if test = "${login != null}">
            
               <p><a href="">로그아웃</a></p>
               <c:if test = "${login.usertype eq 'a'}">
               <p><a href="">관리자 페이지</a></p>
               </c:if>
               <c:if test = "${login.usertype eq 'u'}">
               <p><a href="">마이 페이지</a></p>
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
    </header>
    <main>
       <div id="banner">
            <img src="<%=request.getContextPath()%>/resources/upload/universe-1566159_1920.jpg" alt="배너사진">
       </div><!--e:#banner-->
       <div id="items">
            <div class="item_box">
                <div class="contents_wrapper">
                    <h3 class="title">MBTI테스트</h3>
                    <p class="description">MBTI테스트 입니다.</p>
                </div><!--e:.contents_wrapper-->
                <div class="btn_wrapper">
                    <a class="start_btn" href="https://testharo.com/16personalities/ko" target="_blank">시작하기</a>
                </div><!--e:.btn_wrapper-->
            </div><!--e:.item_box-->

            <div class="item_box">
                <div class="contents_wrapper">
                    <h3 class="title">우울증 테스트</h3>
                    <p class="description">우울증 자가진단이 가능한 테스트 입니다.</p>
                </div>
                <div class="btn_wrapper">
                    <a class="start_btn" href="https://testharo.com/depression/ko" target="_blank">시작하기</a>
                </div>
            </div><!--e:.item_box-->

            <div class="item_box">
                <div class="contents_wrapper">
                    <h3 class="title">번아웃 증후군 테스트</h3>
                    <p class="description">번아웃증후군 테스트 결과를 알 수 있는 테스트입니다.</p>
                </div><!--e:.contents_wrapper-->
                <div class="btn_wrapper">
                    <a class="start_btn" href="https://testharo.com/burnout/ko" target="_blank">시작하기</a>
                </div><!--e:.btn_wrapper-->
            </div><!--e:.item_box-->

            <div class="item_box">
                <div class="contents_wrapper">
                    <h3 class="title">성격 유형 테스트</h3>
                    <p class="description">16가지의 성격유형중 나의 성격유형을 알아 볼 수 있는 테스트입니다.</p>
                </div>
                <div class="btn_wrapper">
                    <a class="start_btn" href="https://testharo.com/16personalities/ko" target="_blank">시작하기</a>
                </div>
            </div><!--e:.item_box-->

            <div class="item_box">
                <div class="contents_wrapper">
                    <h3 class="title">대인 기피증 테스트</h3>
                    <p class="description">대인기피증 척도를 검사 해 볼 수 있는 테스트입니다.</p>
                </div>
                <div class="btn_wrapper">
                    <a class="start_btn" href="https://simritest.com/anthropophobia" target="_blank">시작하기</a>
                </div>
            </div><!--e:.item_box-->

            <div class="item_box">
                <div class="contents_wrapper">
                    <h3 class="title">스트레스 자가진단</h3>
                    <p class="description">스트레스 자가진단 테스트입니다.</p>
                </div>
                <div class="btn_wrapper">
                    <a class="start_btn" href="https://www.simcong.com/quiz/2" target="_blank">시작하기</a>
                </div>
            </div><!--e:.item_box-->

            <div class="item_box">
                <div class="contents_wrapper">
                    <h3 class="title">ADHD 테스트</h3>
                    <p class="description">ADHD 테스트입니다.</p>
                </div>
                <div class="btn_wrapper">
                    <a class="start_btn" href="https://testharo.com/depression/ko" target="_blank">시작하기</a>
                </div>
            </div><!--e:.item_box-->

            <div class="item_box">
                <div class="contents_wrapper">
                    <h3 class="title">자존감 테스트</h3>
                    <p class="description">자존감 테스트입니다.</p>
                </div>
                <div class="btn_wrapper">
                    <a class="start_btn" href="https://www.simcong.com/quiz/136" target="_blank">시작하기</a>
                </div>
            </div><!--e:.item_box-->

            <div class="item_box">
                <h3 class="title">COMMING SOON</h3>
            </div><!--e:.item_box-->
       </div><!--e:#items-->
    </main>
    <footer>
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

    </footer>
</body>
</html>