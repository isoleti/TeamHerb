<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" style="--vh:5.02px;">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 페이지</title>
     <!--부트스트랩, header footer css 연결-->
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">
    <style>
       main #res{width:40%; height:45%; margin:auto; margin-top:10%; border:3px solid #dff6e1; text-align: center; border-radius:15px;}
       main #res h2{margin-top:3%;}
       main #res button{margin-bottom:3%;}
       
       html body main{margin-bottom:14.5%;}
    </style>
</head>
<body>
    <header>    <!--header-->
        <div> <!--로그인 관련-->
       <%--<%if(uidx == 0) {%>--%>
            <p><a href="">로그인</a></p>
            <p><a href="">회원가입</a></p>
            <p><a href="">고객센터</a></p>
       <%-- <%}else if(usertype.equals("admin") ){ %>--%>
           <!--  
            <p><a href="">로그아웃</a></p>
            <p><a href="">관리자 페이지</a></p>
            <p><a href="">고객센터</a></p>
        <%--<%}else if(usertype.equals("coun")){ %>--%>
        	<p><a href="">로그아웃</a></p>
            <p><a href="">상담사 페이지</a></p>
            <p><a href="">고객센터</a></p>
        <%--<%}else {%>--%>
         	<p><a href="">로그아웃</a></p>
            <p><a href="">마이 페이지</a></p>
            <p><a href="">고객센터</a></p>
         <%--<%} %> --%>   
             -->
          
        </div> <!-- fin 로그인 관련 -->
        <nav class="navbar" style="background-color: #dff6e1;"> <!-- 상단 네비게이션 -->
            <h1><a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/resources/upload/힐링캠프 logo.png" alt="홈버튼"></a></h1>
           <a href="<%=request.getContextPath()%>/program.do">치료프로그램</a>
            <a href="<%=request.getContextPath()%>/test.do">심리테스트</a>
            <a href="">커뮤니티</a>
            <a href="<%=request.getContextPath()%>/res/findcenter.do">상담 예약</a>
            <a href="">상담사 게시판</a>
            <section></section>
        </nav> <!-- fin 상단 네비게이션 -->
    </header> <!--fin header-->
    <main>
        <div id="res">
            <h2>결제가 정상적으로 완료되었습니다.</h2>
            <p>상담 예약일시는 입니다. 예약 날짜에 유의하세요</p>
            <p>결제 금액 원</p>
            <button class="btn btn-outline-success">홈으로 돌아가기</button>
        </div>
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
</body>
</html>