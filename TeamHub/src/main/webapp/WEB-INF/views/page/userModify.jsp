<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link href="<%= request.getContextPath() %>/resources/css/css2.css" rel="stylesheet">
<style>
   main{margin:0 auto;  width:1160px; }
        main h2{font-size:22px; margin:80px 250px; }
        .userimfo{width:600px; height:600px; display:block; border:1px solid #e4e4e4; 
                 padding-top: 30px; margin-left:250px; border-radius:10px;
                padding:40px;}
        .p{font-size:25px; margin-bottom:20px;display: block; font-weight:bold;}
        .basic input{width:250px; height:25px; margin-left:20px;}
        .userimfo hr{margin:20px 0; }
        .userimfo a{font-weight: bold;}
        #phone{margin-left:52px;}
        #id{margin-left:12px;}
        .userimfo input{ margin-bottom:10px; border:1px solid #e4e4e4; border-radius:5px; }
        #id{position: relative; left:40px;}

        .m{height:40px;}
        .m input{ margin-left: 20px;}
        .m a{font-weight:bold;}
        .b input:nth-child(1){width:100px; height:30px; margin:10px; border:1px solid #e4e4e4; border-radius:10px;}
        .b input:nth-child(2){width:40px; height:30px; margin:10px; border:1px solid #e4e4e4; border-radius:10px;}
        .b input:nth-child(3){width:40px; height:30px; margin:10px; border:1px solid #e4e4e4; border-radius:10px;}

        .ch1{position:relative; left:252px; }
        .ch1 input{ margin-right:10px;}
        .ch2{position:relative; left:450px; top:-42px;}
        .ch2 input{margin-right:10px;}

        .btn{width:180px; height:40px; border-radius:5px; border: none; color:white; 
                font-weight:bold; margin-left:80px;cursor: pointer; position:relative; top:130px; font-size:15px;}
        .btn:nth-child(2){background: #e4e4e4;}
        .btn:nth-child(3){background: #70ad47;}
        #bar a{border-bottom:1px solid black; display:inline-block; cursor: pointer; position:relative; top:135px;}        
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
        <h2>회원정보</h2>

         <div class="userimfo">
            <div class="basic">
            <a class="p">기본정보</a>
            <a>아이디 <input type="text" name="id" id="id"><br>
            <a>이메일주소  <input type="text" name="mail" id="mail"></a><br>
            <a>연락처 <input type="number" name="phone" id="phone"></a>
            <hr>
            <a class="p">비밀번호 변경</a>
            <a>비밀번호 변경 <input type="password" name="password" id="password"><br>
            <a>비밀번호 확인 <input type="password" name="password" id="password"></a>
            <hr>
           
                 
            <div id="bar">
            <a href="<%= request.getContextPath() %>/page/userDel.do">회원탈퇴</a>
            <button class="btn">취소</button>
            <button class="btn">저장</button>
            </div>
 </div><!--.userimfo-->
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