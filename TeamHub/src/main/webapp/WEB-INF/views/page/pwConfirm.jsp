<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 인증</title>
<link href="<%= request.getContextPath() %>/resources/css/bootstrap.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/resources/css/css2.css" rel="stylesheet">
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
        <div ><p><a href="">로그아웃</a></p><p><a href="">마이페이지</a></p><p><a href="">고객센터</a></p></div><!-- 로그인 및 고객센터 관련 버튼--> 
        <nav class="navbar" > <!-- 네비게이션 -->
            <h1><a href=""><img src="../resources/upload/힐링캠프 logo.png" alt="홈버튼"></a></h1>
           
            <section></section>
        </nav>
    </header> 
    <main>
        <div class="pwcheck">
            <a>비밀번호 인증</a>
            <a >귀하의 개인정보를 보호하기 위해 비밀번호를
                인증해주세요.</a>
            
            <input type="password" name="password" id="password" >
            <button class="btn1"  onclick="location.href='<%=request.getContextPath()%>/page/userModify.do'">확인</button>
           
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