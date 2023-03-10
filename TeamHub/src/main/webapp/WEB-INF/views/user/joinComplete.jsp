<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
<link href="<%= request.getContextPath() %>/resources/css/css2.css" rel="stylesheet">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/images/icons8-clover-16.png">
<style>
  main{margin:0 auto;  width:1160px; }
        
        .joinb1{width:500px; height:250px; display:inline-block; border:1px solid #e4e4e4; 
                text-align:center; padding-top: 30px; margin-left:250px; margin-top: 100px;
                padding:40px;}
        .joinb1 a:nth-child(1){font-size:25px; font-weight: bold; margin-bottom:20px;display: block;}
        .joinb1 a:nth-child(2){width:450px; border-bottom:1px solid #e4e4e4; display: block; padding-bottom: 30px;
            position: relative; left:25px;}
        .joinb1 button{margin-top:50px;}
            footer{margin:0 auto;  }
        .btn1{padding:10px;  height:50px; width:150px; margin-left:20px;  
            border:1px solid #e4e4e4; background:white; font-size:15px; font-weight:bold;}
        .btn2{padding:10px;  height:50px; width:150px; margin-left:20px; 
            background: #70ad47; border:none; color: white; font-size:15px; font-weight:bold;}
        #bottom{background: #f7f7f7; height:200px; margin-top:150px; text-align: center;}
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
            
               <p><a href="<%=request.getContextPath()%>/user/logout.do">로그아웃</a></p>
               <c:if test = "${login.usertype eq 'a'}">
               <p><a href="<%=request.getContextPath() %>/adminPage/adminPage_Member_List.do">관리자 페이지</a></p>
               </c:if>
               <c:if test = "${login.usertype eq 'u'}">
               <p><a href="<%= request.getContextPath() %>/page/mypageRes.do">마이 페이지</a></p>
               </c:if>
               <c:if test = "${login.usertype eq 'c'}">
               <p><a href="<%= request.getContextPath() %>/page/counspageRes.do">상담사 페이지</a></p>
               </c:if>
               <p><a href="<%=request.getContextPath() %>/customerService/customerNotice.do">고객센터</a></p>
      </c:if>
      </div>
        <nav class="navbar" > <!-- 네비게이션 -->
            <h1><a href="<%=request.getContextPath()%>/"><img src="../resources/upload/힐링캠프 logo.png" alt="홈버튼"></a></h1>
           
            <section></section>
        </nav>
    </header> 
    
    <main>
        
        <div class="joinb1">
            <a>회원가입이 완료되었습니다.</a>
            <a style="color: #848484; margin-top: 30px;">회원가입을 축하드립니다.</a>
            <button class="btn1" onclick="location.href='<%=request.getContextPath()%>/'">홈으로</button>
            <button class="btn2" onclick="location.href='<%=request.getContextPath()%>/user/login.do'">로그인</button><br><br><br>
        </div>

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