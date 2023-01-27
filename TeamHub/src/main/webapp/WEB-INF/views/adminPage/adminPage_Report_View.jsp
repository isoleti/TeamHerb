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
        #left_nav{
            background-color: rgb(183,214,163);
            border-radius: 10px;
            padding:20px;
            display: inline-flex;
            flex-direction: column;
            float:left;
            margin-right:30px;
        }
        #left_nav h3{
            font-weight: bold;
        }
        #left_nav ul{
            margin-bottom:0rem;
        }
        #left_nav li{
            padding:10px 0;
            font-size: 17px;
        }
        #btn_wrapper{
            display: flex;
            flex-direction: row-reverse;
            }
        .btn{
            border-style: none;
            background-color: rgb(183,214,163);
            border-radius: 5px;
            padding:0 15px;
            font-weight: bold;
            height:32px;
        }
        .btn:nth-child(2){
            margin:0 10px 0 10px;
        }
        #view_wrapper{
            margin-top:10px;
            display: flex;
            flex-wrap: wrap;
            border-bottom:2px solid rgb(112,173,71);
        }
        #title_wrapper{
            border-top:2px solid rgb(112,173,71);
            border-bottom:2px solid rgb(112,173,71);
            width:100%;
            height:100px;
        }
        #title_wrapper #title{
            font-size:25px;
            font-weight:bold;
            padding:10px;
        }
        #write_info_wrapper{
            display: flex;
        }
        #write_info_wrapper #write_info{
            display: flex;
            padding-left:0rem;
        }
        #write_info_wrapper #write_info li{
            padding:0 7px;
            font-size: 14px;;
        }
        #write_info_wrapper #write_info li:nth-child(2){
            border-left:2px solid silver;
            border-right:2px solid silver;
        }
        #content_wrapper{
            border-bottom:2px solid rgb(112,173,71);
            margin-bottom:20px;
            width:100%;
            height:500px;
        }
        #content_wrapper #content{
            padding:10px;
            height:400px;
        }
        #report_wrapper{
            border-top:1px solid silver;
            padding:10px;
        }
        #report_wrapper tr td:nth-child(1){
            font-weight: bold;
            text-align: right;
        }
        #report_wrapper tr td:nth-child(2){
            padding:0 10px;
        }
        #reply_wrapper{
            padding-bottom:20px;
        }
        .reply_info_wrapper .reply_info{
            display: flex;
            padding:0rem;
        }
        .reply_info_wrapper .reply_info li{
            padding:0 7px;
            font-size:13px;
        }
        .reply_info_wrapper .reply_info li:not(:last-of-type){
            border-right:2px solid silver;
        }
        .reply_view_wrapper{
            margin-left:15px;
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

        <div id="btn_wrapper">
            <button class="btn">삭제하기</button>
            <button class="btn">취소하기</button>
            <button class="btn">목록가기</button>
        </div><!--e:#write_wrapper-->

        <div id="view_wrapper">
            <div id="title_wrapper">
                <div id="title">제목제목</div>
                <div id="write_info_wrapper">
                    <ul id="write_info">
                        <li id="category">카테고리</li>
                        <li class="id">작성자</li>
                        <li class="wdate">2023-01-03 12:42</li>
                    </ul><!--e:#write_info-->
                </div><!--e:#write_info_wrapper-->
            </div><!--e:#title_wrapper-->

            <div id="content_wrapper">
                <div id="content">내용내용내용</div>
                <div id="report_wrapper">
                    <table>
                        <tr>
                            <td>신고한 아이디 : </td>
                            <td>singoja</td>
                        </tr>
                        <tr>
                            <td>신고일시 : </td>
                            <td>2023-01-04 11:51</td>
                        </tr>
                        <tr>
                            <td>신고내용 : </td>
                            <td>욕설/인신공격</td>
                        </tr>
                    </table>
                </div><!--e:#report_wrapper-->
            </div><!--e:#content_wrapper-->
            <div id="reply_wrapper">
                <div class="reply_info_wrapper">
                    <ul class="reply_info">
                        <li class="id">작성자</li>
                        <li class="wdate">2023-01-03 12:42</li>
                    </ul><!--e:.write_info-->
                </div><!--e:.write_info_wrapper-->
                <div class="reply_view_wrapper">
                    <div class="reply_view">댓글댓글댓글</div>
                </div><!--e:.reply_view_wrapper-->
            </div><!--e:#reply_wrapper-->
        </div><!--e:#view_wrapper-->            
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