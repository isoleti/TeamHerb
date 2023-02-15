<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ page import="java.util.*" %>
        <%@ page import="project.healingcamp.vo.UserVo" %>
    <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 인증</title>
<link href="<%= request.getContextPath() %>/resources/css/bootstrap.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/resources/css/css2.css" rel="stylesheet">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/images/icons8-clover-16.png">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>
<script >

 $(function(){ //회원가입페이지가 로드됐을때 function실행 
   $("form").submit(function(){
      if($("#pw").val() == ""){
         alert("비밀번호를 입력하세요.");
         return false;
      }
      
      })
   });

</script>

<style>
	   main{margin:0 auto;  width:1160px; }
        
        .pwcheck{width:500px; height:350px; display:inline-block; border:1px solid #e4e4e4; 
                text-align:center; padding-top: 30px; margin-left:322px; margin-top: 100px;
                padding:40px;}
        .pwcheck a:nth-child(1){font-size:25px; font-weight: bold; margin-bottom:20px;display: block;}
        .pwcheck a:nth-child(2){width:450px; border-bottom:1px solid #e4e4e4; display: block; padding-bottom: 30px;
            position: relative; left:-10px;}
        .pwcheck button{margin-top:20px; display:block; position: relative; left:118px;}
        .pwcheck input{width:200px; height:40px; border:1px solid #e4e4e4; margin-top:30px; }
        .btn1{padding:10px;  height:50px; width:150px; margin-left:20px; 
            background: #70ad47; border:none; color: white; font-size:15px; font-weight:bold;}
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
    	<form action="checkPw.do"  method="post">
        <div class="pwcheck">
            <a>비밀번호 인증</a>
            <a >귀하의 개인정보를 보호하기 위해 비밀번호를
                인증해주세요.</a>
            <input type="hidden" id="id" value="${login.id}">
             <input type="hidden" id="uidx" value="${login.uidx}">
            <input type="password" name="pw" id="pw" >
            <button class="btn1">확인</button>
           
        </div>
		</form>
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