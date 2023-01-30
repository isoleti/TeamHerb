<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="ko">
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
        main #left_nav{
            background-color: rgb(183,214,163);
            border-radius: 10px;
            padding:20px;
            display: inline-flex;
            flex-direction: column;
            float:left;
            margin-right:30px;
        }
        main #left_nav h3{
            font-weight: bold;
        }
        main #left_nav ul{
            margin-bottom:0rem;
        }
        main #left_nav li{
            padding:10px 0;
            font-size: 17px;
        }
        #search_wrapper{
            display: flex;
            margin-bottom:15px;
        }
        #search_wrapper #searchType{
            height:32px;
            border-radius:5px;
        }
        #search_wrapper #searchVal{
            height:32px;
            width:300px;
            border-radius:5px;
        }
        #search_wrapper #search_btn{
            height:32px;
            border-style: none;
            padding:0 20px;
            background-color: rgb(183,214,163);
            border-radius: 5px;
            font-weight: bold;
        }
        #filter{
            display:flex;
            flex-direction: row-reverse;
        }
        #filter_option{
            margin-bottom:0rem;
            padding-left:0rem;
            display:inline-flex;
            font-size:14px;
        }
        #filter_option li{
            padding:0 10px;
            list-style:none;
        }
        #filter_option li:not(:last-of-type){
            border-right:1px solid gray;
        }
        #list{
            display:flex;
            margin-top:15px;
        }
        #list table{
            text-align: center;
            background-color: #EBF1E9;
            margin-bottom:20px;
        }
        #list table tr{
            border-bottom:1px solid white;
        }
        #list table tr th{
            font-weight:bold;
        }
        #list table tr th,td{
            padding:5px;
        }
        #list table tr td{
            font-size:14px;
        }
        #list table td:nth-child(3),
        #list table td:nth-child(4){
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
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
    </header> <!--fin header-->
    
    <main>
       <div id="left_nav">
            <h3>관리자 페이지</h3>
            <ul>
                <li><a href="<%=request.getContextPath() %>/adminPage/adminPage_Member_List.do">회원관리</a></li>
                <li><a href="<%=request.getContextPath() %>/adminPage/adminPage_Counseller_List.do">상담사관리</a></li>
                <li><a href="<%=request.getContextPath() %>/adminPage/adminPage_Community_List.do">커뮤니티관리</a></li>
                <li><a href="<%=request.getContextPath() %>/adminPage/adminPage_Counseller_Board_List.do">상담사 게시판 관리</a></li>
                <li><a href="<%=request.getContextPath() %>/adminPage/adminPage_Notice_List.do">공지사항 관리</a></li>
                <li><a href="<%=request.getContextPath() %>/adminPage/adminPage_Faq_List.do">FAQ 관리</a></li>
                <li><a href="<%=request.getContextPath() %>/adminPage/adminPage_Report_List.do">신고내역관리</a></li>
            </ul>
       </div><!--e:#left_nav-->
            <div id="search_wrapper">
                <form>
                    <select name="searchType" id="searchType">
                        <option>신고사유</option>
                        <option>글제목</option>
                        <option>아이디</option>
                    </select>
                    <input type="text" name="searchVal" id="searchVal">
                    <button id="search_btn">검색</button>
                </form>
            </div><!--e:#seasrch_wrapper-->
        <div id="filter">
           <ul id="filter_option">
                <li>신고 오름차순</li>
                <li>신고 내림차순</li>
                <li>댓글</li>
                <li>글</li>
           </ul><!--e:#filter_option-->
        </div><!--e:#filter-->

        <div id="list">
            <table style="width: 100%; table-layout: fixed;">
                <tr>
                    <th style="width:5%;">NO</th>
                    <th>유형</th>
                    <th style="width:25%;">신고사유</th>
                    <th style="width:25%;">글 제목</th>
                    <th>아이디</th>
                    <th>신고일</th>
                    <th>처리여부</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>댓글</td>
                    <td>같은 내용의 반복 게시(도배)</td>
                    <td>진달래 개나리 십빠빠 빠삐코 어쩔티비 저쩔티비</td>
                    <td>kim1234</td>
                    <td>2023-01-04</td>
                    <td>N</td>
                </tr>
            </table>
        </div><!--e:#list-->

        <!--부트스트랩 페이지네이션-->
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>
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