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
<title>회원탈퇴</title>
<link href="<%= request.getContextPath() %>/resources/css/css2.css" rel="stylesheet">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/images/icons8-clover-16.png">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>
<script >

 $(function(){ //회원가입페이지가 로드됐을때 function실행 
   $("form").submit(function(){
      if($("#agree").is(":checked") == false){
       alert("회원탈퇴 안내에 동의하셔야  회원탈퇴가 가능합니다.");
          return false;
      }
      else if($("#pw").val() == ""){
         alert("비밀번호를 입력하세요.");
         return false;
      }
      
      else {
    	  
         return true;
      }
      })
   });

</script>
<style>
	header a:hover{color: #0d6efd;}
   main{margin:0 auto;  width:1160px; }
        main{margin:0 auto;  width:1160px; }
        main h2{font-size:22px; margin:80px 250px; }
        .userimfo{width:600px; height:250px; display:block; border:1px solid #e4e4e4; 
                 padding-top: 30px; margin-left:250px; border-radius:10px;
                padding:40px; margin-bottom:10px;}
        .p{font-size:25px; margin-bottom:20px;display: block; font-weight:bold;}
        #pw{margin-top:30px; width: 300px; height:30px; }
        .btn{width:100px; height:30px; margin-left: 50px;}
        #step{margin-top: 30px; }
        #step button{width:200px; height:40px; border:none; font-weight: bold; color:white; border-radius:5px;
            background: #e4e4e4}

        #step button:nth-child(2){ background:#70ad47; 
                font-size:16px; }

        #bottom {margin-top: 400px;}
</style>

</head>
<body>
      <header>       
        <div id="loginBar"> <!--로그인 관련-->
          <c:if test = "${login != null}">
          <i id="xeicon" class="xi-profile-o"></i>
          <p id="loginId">${login.id }님 환영합니다.</p>
	      </c:if>
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
        <h2>회원탈퇴</h2>
      <form action="userDel.do"  method="post">
      
        <div class="userimfo">
           <div class="basic">
           <a class="p">회원 탈퇴 안내</a>
           <a><strong>회원정보삭제</strong>
            <br>
           <a>회원 탈퇴시 힐링캠프에 입력된 모든 개인정보는 삭제되며 복구되지 
            않습니다. 
            <br><br>
            단, 상법 및 '전자상거래 등에서 소비자 보호에 관한 법률' 등 관련 법령의 규정에 의하여 다음과 같이 ‘거래 관련 관리 의무 관계 확인’ 등을 이유로 일정 기간 보관됩니다.<br>
            - 계약 또는 청약 철회 등에 관한 기록 : 5년 <br>
            - 대금결제 및 재화 등의 공급에 관한 기록 : 5년<br>
            - 소비자의 불만 또는 분쟁 처리에 관한 기록 : 3년 <br><Br><br><Br>
        
        
        </div>
        
        <a><input type="checkbox" id="agree">  위 사항을 확인하였으며 동의합니다</a><br><Br><br>
        
        <a>귀하의 회원탈퇴 진행을 위해 비밀번호를 인증해주세요.</a><br>
        <input type="password" name="pw" id="pw" autoComplete="off">
        <input type="hidden"  id="id" name="id" value="${login.id}" readonly> 
         <input type="hidden"  id="uidx" name="uidx" value="${login.uidx}" readonly> 
        
        <div id="step">
        <button type="button" class="btn" onclick="location.href='<%=request.getContextPath()%>/'">취소</button>
        <button class="btn">회원탈퇴</button>
        </div><!--#step  -->
    </div><!--.userimfo  -->
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