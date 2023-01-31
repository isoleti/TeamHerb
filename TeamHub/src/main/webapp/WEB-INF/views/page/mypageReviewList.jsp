<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 	<%@ page import="java.util.*" %>
 	<%@ page import="project.healingcamp.vo.ReviewVo" %>

 	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 	<%@ page session="true" %>
 	
  	<% List<ReviewVo> list = (List<ReviewVo>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 상담사후기</title>
<link href="<%= request.getContextPath() %>/resources/css/bootstrap.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/resources/css/css2.css" rel="stylesheet">
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
        .content{display:inline-block; position: relative; top:-450px;}
        .content div{margin-bottom: 20px; background:white; }
        .content a{ font-size:20px;  font-weight: bold;
            display:block;  margin-left:70px;}
        #rcontent{width:800px; height:100px; border:1px solid #e4e4e4; position:flex;
         justify-content:space-between; margin-left:70px;}
         .del{float:right; width:50ox; border:none; background:none; margin-right:10px; font-size:20px; color:#ff7f7f;}
         .contents{display:inline-block; float:left;}
        .rdate{display:inline-block; float:right; margin-right:20px; margin-top:70px;color:#afafaf;}
        /*  .content button{display: block; border: none; width: 100px; 
            height:30px; margin-top: 20px; border-radius:10px; background:#ff7f7f; font-weight:bold; color:white;
            position: relative; left:700px;}*/
        .p{font-weight:bold;}
        #navi{width:200px; position:relative; left:600px; top:-430px;}
        #navi a{font-size:15px; color:black;}
      
</style>
</head>
<body>
	 <header>       
        <div ><p><a href="<%=request.getContextPath()%>/user/logout.do">로그아웃</a></p><p><a href="">마이페이지</a></p><p><a href="">고객센터</a></p></div><!-- 로그인 및 고객센터 관련 버튼--> 
        <nav class="navbar" style="background-color: #dff6e1;"> <!-- 네비게이션 -->
            <h1><a href=""><img src="../resources/upload/힐링캠프 logo.png" alt="홈버튼"></a></h1>
            <a href="">치료프로그램</a>
            <a href="">심리테스트</a>
            <a href="">커뮤니티</a>
            <a href="">상담 예약</a>
            <a href="">상담사 게시판</a>
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
                <button class="btn2" onclick="location.href='<%=request.getContextPath()%>/page/mypageCount.do'">결제 내역</button>
                <button class="btn2" onclick="location.href='<%=request.getContextPath()%>/page/mypageWrite.do'">내가 쓴 글</button>
                <button class="btn2" onclick="location.href='<%=request.getContextPath()%>/page/mypageReviewList.do'">상담사 후기</button>
                <button class="btn2" onclick="location.href='<%=request.getContextPath()%>/page/mypageScrap.do'">스크랩 글</button>
  
            </div><!--//.bar-->
        
        <div class="content">
	            <a >상담사 후기</a><br><br>
         		<c:forEach items="${list}" var="vo">
         		
	  			          
	  			<form  action="review_delete.do" method="post">  
	  			<div id="rcontent">
	  				
	  				<button  class="del">x</button>
	  				<input type="hidden" name="ridx" value="${vo.ridx}">
	  				<c:set var="rdate" value="${vo.rdate }"/>
	  				<div class="contents">${vo.rcontent}</div>
	  				<div class="rdate">${fn:substring(rdate,0,11)}</div>
	  			</div><!--//.rcontent-->
	         	 </form>
 				</c:forEach>
            
			
					
				
    				
            </div><!--//.content  -->
    
    <div id="navi">
    
    <nav aria-label="Page navigation example">
        <ul class="pagination">
        <!-- Prev 시작 -->
          <c:if test="${pageMaker.prev}"> <!--  -->
          <li class="page-item">
            <a class="page-link" href="<%=request.getContextPath() %>/page/mypageReviewList.do?page=${(pageMaker.startPage-1)}&perPageNum=${pageMaker.perPageNum}" aria-label="Prev">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          </c:if>
          <!-- Prev 끝 -->
          <!-- Page번호 시작 -->
           <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="index">
          <li class="page-item"><a class="page-link <c:if test='${pageMaker.page eq index }'>active</c:if>" href="<%=request.getContextPath() %>/page/mypageReviewList.do?page=${index}">${index}</a></li>
          </c:forEach>
         <!-- Page번호 끝 -->
         <!-- Next 시작 -->
          <c:if test="${pageMaker.next}">
          <li class="page-item">
            <a class="page-link" href="<%=request.getContextPath() %>/page/mypageReviewList.do?page=${(pageMaker.endPage+1)}&perPageNum=${pageMaker.perPageNum}" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
          </c:if>	
          <!-- Next 끝 -->
        </ul>
      </nav>

     </div><!--#navi-->   
     
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