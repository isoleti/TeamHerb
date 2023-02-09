<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*" %>
<%@ page import="project.healingcamp.vo.Community_BoardVO" %>
<%@ page session="true" %>

<% List<Community_BoardVO> list = (List<Community_BoardVO>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담사페이지</title>
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
        .bar input{ text-align:center; border:none; }
        .bar img{margin-top: 20px;}
        .bar a:nth-child(2){font-size:20px; margin-top:20px;}
        .bar button{width:200px;  background:white;
             border:1px solid #e4e4e4; } 
        .btn1{ height:50px; font-size:18px;  margin:30px 0;font-weight:bold;}
        
        .btn2{height:35px; font-size:15px; border-radius:5px;  margin-top:20px;}
        .content{display:inline-block; position: relative; top:-300px; left:50px; }
        .p{ font-size:20px; 
            display:block; margin-top:20px;}
        .content a:nth-child(3){display:inline-block;}
        .content button{margin-top:20px; border:1px solid #e4e4e4; width:100px; height:30px; 
            background:white; border-radius:5px; margin-right:20px; }
        .content p{display:inline-block; }
        .content input{margin:20px;}
        .p{font-weight:bold;}
        #sb a{font-size:15px; font-style: none;}
        #sb {display:inline-block;}
        #sb button{background:#0ed145; color:white; margin-left:100px;}

		#tb td{height:50px;}
        #tb table{border:1px solid #dff6e1; width:800px; height:200px; text-align:center; margin-top:40px;}
        #tb tr:nth-child(1){font-weight: bold;}
        #tb td:nth-child(5){padding:0;}
        #tb tr:nth-child(2n){background-color:#dff6e1;}
        #tb button{width:50px; margin:0;}
        #navi{width:200px; margin-left:300px;}
        #navi a{font-size:15px; color:black;}
		ul.pagination{position:relative; top:-250px; left:557px;}
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
                 <a>상담사페이지</a>
                <img src="../resources/upload/profile.png" alt="프로필" class="pro">
                <a><input type="text" id="id" name="id" value="${login.id}" readonly></a>
                <button class="btn1" onclick="location.href='<%=request.getContextPath()%>/page/pwConfirm.do'">회원정보</button>
                <button class="btn2" onclick="location.href='<%=request.getContextPath()%>/page/counspageRes.do'">예약 목록</button>
                <button class="btn2" onclick="location.href='<%=request.getContextPath()%>/page/counspageCou.do'">상담 내역</button>
                <button class="btn2" onclick="location.href='<%=request.getContextPath()%>/page/counspageWrite.do'">내가 쓴 글</button>
  
            </div><!--//.bar-->
        <div class="content">
            <a class="p">내가 쓴 글</a>
           <!--  <a class="p">작성 기간</a>
            <button class="btn3">1개월</button>
            <button class="btn3">3개월</button>
            <button class="btn3">6개월</button>
            <p>기간 입력</p>
            <input type="date" name="date1" id="date1" >
            <p>~</p>
            <input type="date" name="date2" id="date2" > -->


             <div id="tb">
             
            <table border="1"> 
            
                <input type="hidden" name="uidx" value="${cboardVO.uidx}">
                <tr>
                    <td>글 번호</td>
                    <td>제목</td>
                    <td>작성 일시</td>
                    <td>관리</td>
                </tr>
                
                
                 <c:forEach items="${list}" var="cboardVO">
                <tr>
                    <td>${cboardVO.bidx}</td>
                    <td><a href="<%=request.getContextPath()%>/counseller_board/counseller_board_view.do?bidx=${cboardVO.bidx}">${cboardVO.title}</a></td>
                	<c:set var="wdate" value="${cboardVO.wdate}"/>
                    <td>${fn:substring(wdate,0,11)}</td>
                    <td><button type="button" onclick="location.href='<%=request.getContextPath()%>/counseller_board/counseller_board_modify.do?bidx=${cboardVO.bidx}'">수정</button>
                       <!--  <button>삭제</button>--> </td>
                </tr>
                  </c:forEach>  
               

            </table>
             
     </div><!--#tb-->
	</div><!-- #content -->
    <nav aria-label="Page navigation example">
        <ul class="pagination">
        <!-- Prev 시작 -->
          <c:if test="${mypageMaker.prev}"> <!--  -->
          <li class="page-item">
            <a class="page-link" href="<%=request.getContextPath() %>/page/counspageWrite.do?page=${(mypageMaker.startPage-1)}&perPageNum=${mypageMaker.perPageNum}" aria-label="Prev">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          </c:if>
          <!-- Prev 끝 -->
          <!-- Page번호 시작 -->
           <c:forEach begin="${mypageMaker.startPage }" end="${mypageMaker.endPage}" var="index">
          <li class="page-item"><a class="page-link <c:if test='${mypageMaker.page eq index }'>active</c:if>" href="<%=request.getContextPath() %>/page/counspageWrite.do?page=${index}">${index}</a></li>
          </c:forEach>
         <!-- Page번호 끝 -->
         <!-- Next 시작 -->
          <c:if test="${mypageMaker.next}">
          <li class="page-item">
            <a class="page-link" href="<%=request.getContextPath() %>/page/counspageWrite.do?page=${(mypageMaker.endPage+1)}&perPageNum=${mypageMaker.perPageNum}" aria-label="Next">
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
</html>