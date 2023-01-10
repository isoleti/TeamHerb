<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" style="--vh:5.02px;">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약하기</title>
     <!--부트스트랩, header footer css 연결-->
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">
    <style>
        main{position:relative;}

        main h1{margin-left:15%; margin-bottom:2%;}
       
        main #resS{width:50%; height:75px; margin:0; margin-left:13%;  margin-bottom:4%; border:2px solid #000; border-radius:15px;}
        main #resS div{display:inline-block; margin-left:10%; margin-top:1.75%; font-size:20px;}
        main #resS #s1{margin-left:5%;}
        main #resS #s1,
        main #resS #s2{margin-right:15%;}
        
        main div{margin-bottom:3%;}
        main div h2{margin-left:15%; margin-bottom:2%;}
        main #step1 table{width:50%; height:60%; margin-left:13%; text-align:center;}
        main #step2 table{width:50%; height:60%; margin-left:13%; text-align:center;}
        main #step3 div{width:50%; height:60%; margin-left:13%; text-align:center;}
        
        main #res{width:30%; height:100%; display:inline-block; background-color: azure; position:absolute; top:0; right:5%;}
        main #res h2{margin-top:10%; margin-bottom:5%;}
        main #res p{margin-left:7.5%; margin-bottom:5%;}
        main #res .btn-outline-success{margin-left:25%;}
        main #res .btn-dark{margin-left:4%;}
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
        <h1>상담기관명</h1>
        <div id="resS"> <!-- 예약 순서 -->
            <div id="s1">상담/검사선택</div>
            <div id="s2">상담사 선택</div>
            <div id="s3">예약 일시</div>
        </div> <!-- fin 예약 순서 -->
        <div id="step1"> <!-- 상담 선택-->
            <h2>1.상담 검사</h2>
            <table class="table table-hover">
            <tr><td>상담 1</td><td>50분</td><td><button class="btn btn-outline-success">선택</button></td></tr>            
            <tr><td>상담 2</td><td>50분</td><td><button class="btn btn-outline-success">선택</button></td></tr>            
            <tr><td>상담 3</td><td>50분</td><td><button class="btn btn-outline-success">선택</button></td></tr>            
            </table>            
        </div>
        <div id="step2">
            <h2>2.당담 상담사</h2>
            <table class="table table-hover">
                <tr><td>상담사</td><td>100,000</td><td><button class="btn btn-outline-success">선택</button></td></tr>            
                <tr><td>상담 2</td><td>90,000</td><td><button class="btn btn-outline-success">선택</button></td></tr>            
                <tr><td>상담 3</td><td>80,000</td><td><button class="btn btn-outline-success">선택</button></td></tr>            
                </table>          
        </div>
        <div id="step3">
            <h2>3. 예약 일시</h2>
            <div>
                <p>구글 캘린더 넣기</p>
            </div>
        </div>
        <div id="res">
            <h2>예약상세</h2>
            <p>상담/검사 : </p>
            <p>담당상담사 : </p>
            <p>예약일시 : </p>
            <p>상담비용 : </p>
            <button class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath()%>/res/resf.do'">현장결제</button>
            <button class="btn btn-dark">지금결제</button> <!-- 결제 페이지 열기 -->
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