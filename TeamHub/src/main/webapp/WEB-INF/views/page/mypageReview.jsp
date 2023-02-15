<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 	<%@ page import="java.util.*" %>
 	<%@ page import="project.healingcamp.vo.ReviewVo" %>
	<%@ page import="project.healingcamp.vo.ReserveVO" %>
 	<%@ page session="true" %>
 	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 후기작성</title>
<link href="<%= request.getContextPath() %>/resources/css/bootstrap.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/resources/css/css2.css" rel="stylesheet">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/images/icons8-clover-16.png">

<style>
	     main{margin:0 auto;  width:1160px; }
        main h2{font-size:22px; margin:80px 250px; }
        .bar{width:280px; height:700px; display:inline-block; border:1px solid #e4e4e4; 
                text-align:center; padding-top: 30px; 
                padding:40px;}
        .bar a{display:block;}
        .bar a:nth-child(1){font-size:25px; font-weight: bold; padding-bottom:20px;display: block; 
                width:280px; border-bottom:1px solid #e4e4e4; position:relative; left:-40px;}
        .bar img{margin-top: 20px;}
        .bar a:nth-child(2){font-size:20px; margin-top:20px;}
        .bar button{width:200px;  background:white;
             border:1px solid #e4e4e4; } 
        .btn1{ height:50px; font-size:18px;  margin:30px 0;font-weight:bold;}
        
        .btn2{height:35px; font-size:15px; border-radius:5px;  margin-top:20px;}
        .content{display:inline-block; position: relative; top:-600px; left:350px; }
       
        .content a{ font-size:20px;  font-weight: bold;
            display:block;}
        #rcontent{width:800px; height:150px; border:1px solid #e4e4e4;}
        .content button{display: block; border: none; width: 100px; 
            height:30px; margin-top: 20px; border-radius:10px;
            position: relative; left:700px;}
        .p{font-weight:bold;}
    
</style>
</head>
<body>
	  <header>       
        <div> <!--로그인 관련-->
          <c:if test = "${login != null}">
	      <p>[&nbsp ${login.id }&nbsp]님 환영합니다.</p>
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
               <p><a href="">상담사 페이지</a></p>
               </c:if>
               <p><a href="<%=request.getContextPath() %>/customerService/customerNotice.do">고객센터</a></p>
      </c:if>
      </div>
        <nav class="navbar" style="background-color: #dff6e1;"> <!-- 네비게이션 -->
            <h1><a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/resources/upload/힐링캠프 logo.png" alt="홈버튼"></a></h1>
           <a href="<%=request.getContextPath()%>/program.do">치료프로그램</a>
            <a href="<%=request.getContextPath()%>/test.do">심리테스트</a>
            <a href="<%=request.getContextPath()%>/community/community_list.do">커뮤니티</a>
            <a href="<%=request.getContextPath()%>/res/findcenter.do">상담 예약</a>
            <a href="<%=request.getContextPath()%>/counseller_board/counseller_board_list.do">상담사 게시판</a>
            <section></section>
        </nav>
    </header> 
    <main>
        <div class="bar">
                <a>마이페이지</a>
                <img src="../resources/upload/profile.png" alt="프로필" class="pro">
                <a>아이디</a>
               <button class="btn1" onclick="location.href='<%=request.getContextPath()%>/page/pwConfirm.do'">회원정보</button>
                <button class="btn2" onclick="location.href='<%=request.getContextPath()%>/page/mypageRes.do'">나의 예약 </button>
                <button class="btn2" onclick="location.href='<%=request.getContextPath()%>/page/mypageCouns.do'">상담 예약</button>
                <button class="btn2" onclick="location.href='<%=request.getContextPath()%>/page/mypageWrite.do'">내가 쓴 글</button>
                <button class="btn2" onclick="location.href='<%=request.getContextPath()%>/page/mypageReviewList.do'">상담사 후기</button>
  
            </div><!--//.bar-->
        <form action="mypageReview.do" method="post">
	        <div class="content">
	            <a >상담사 후기</a><br><br>
	            <a >후기작성</a>
	            <textarea name="rcontent" id="rcontent"></textarea>
	            <button>등록</button>
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