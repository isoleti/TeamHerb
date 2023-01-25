<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link href="<%= request.getContextPath() %>/resources/css/css2.css" rel="stylesheet">
<style>
   main{margin:0 auto;  width:1160px; }
        main{margin:0 auto;  width:1160px; }
        main h2{font-size:22px; margin:80px 250px; }
        .userimfo{width:600px; height:250px; display:block; border:1px solid #e4e4e4; 
                 padding-top: 30px; margin-left:250px; border-radius:10px;
                padding:40px; margin-bottom:10px;}
        .p{font-size:25px; margin-bottom:20px;display: block; font-weight:bold;}
        #password{margin-top:30px; width: 300px; height:30px;}
        .btn{width:100px; height:30px; margin-left: 50px;}
        #step{margin-top: 30px; }
        #step button{width:100px; height:35px; border:none; font-weight: bold; color:white; border-radius:5px;
            background: #e4e4e4}

        #step button:nth-child(2){width:300px; height:40px; background:#70ad47; 
                font-size:16px; margin-left:130px;}

        #bottom {margin-top: 400px;}
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
        <h2>회원탈퇴</h2>

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
        
        <a><input type="checkbox">  위 사항을 확인하였으며 동의합니다</a><br><Br><br>
        
        <a>귀하의 회원탈퇴 진행을 위해 비밀번호를 인증해주세요.</a><br>
        <input type="password" name="password" id="password">

        <button class="btn">인증</button>
        <div id="step">
        <button class="btn">취소</button>
        <button class="btn">회원탈퇴</button>
        </div>
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