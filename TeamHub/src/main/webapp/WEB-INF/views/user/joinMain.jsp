<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="<%= request.getContextPath() %>/resources/css/bootstrap.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/resources/css/css2.css" rel="stylesheet">
 <style>
    
        main{margin:0 auto;  width:1160px; }
        main h2{width:800px; display:inline-block; margin:0 200px 80px; font-weight:bold; font-size:25px;}
        .joinb1{width:400px; height:230px; display:inline-block; border:3px solid #70ad47; 
                text-align:center; padding-top: 30px; margin-left:100px;}
        .joinb2{width:400px; height:230px; display:inline-block; border:3px solid #4472c4; 
                text-align:center; padding-top: 30px; float: right; margin-right:100px;}
        .joinb1 a:nth-child(1){font-size:25px; font-weight: bold;}
        .joinb2 a:nth-child(1){font-size:25px; font-weight: bold;}
        .joinb1 button:hover{background:#0ed145; }
        .joinb2 button:hover{background:#1269ff;}
        .btn1{padding:10px; border-radius:30px; height:40px; width:100px; margin-left:30px;
            background: #70ad47; border:none; color: white; font-size:15px; font-weight:bold;}
        .btn2{padding:10px; border-radius:30px; height:40px; width:100px; margin-left:30px;
            background: #4472c4; border:none; color: white; font-size:15px; font-weight:bold;}
        #bottom{margin-top:200px;}
    </style>
</head>
<body>
	 <header>       
        <div ><p><a href="">로그인</a></p>
        <p><a href="">회원가입</a></p>
        <p><a href="">고객센터</a></p></div><!-- 로그인 및 고객센터 관련 버튼--> 
        <nav class="navbar" > <!-- 네비게이션 -->
            <h1><a href=""><img src="resources/upload/힐링캠프 logo.png" alt="홈버튼"></a></h1>
           
            <section></section>
        </nav>
    </header> 
    <main>
        <h2>회원가입</h2>
        <div class="joinb1"><a>내담자 전용</a>
            <button class="btn1" onclick="location.href='<%=request.getContextPath()%>/user/join.do'">회원가입</button><br><br><br>
        <a style="color: #848484; margin-top: 30px;">내담자 회원가입을 원하시면 선택해주세요.</a>
        </div>
        <div class="joinb2"><a>상담자 전용</a>
            <button class="btn2" onclick="location.href='<%=request.getContextPath()%>/user/joinCounselor.do'">회원가입</button><br><br><br>
        <a style="color: #848484; margin-top: 30px;">상담자 회원가입을 원하시면 선택해주세요.</a>
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