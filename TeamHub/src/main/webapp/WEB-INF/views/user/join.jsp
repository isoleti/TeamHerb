<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link href="<%= request.getContextPath() %>/resources/css/css2.css" rel="stylesheet">
 <style>
    
       header a:hover{color: inherit;}
        main{margin:0 auto;  width:1160px; }
        main h2{font-size:20px; margin:20px 250px; font-weight:bold;}
        input::placeholder {color:#7777; font-size:15px;}
        #frm {width:800px;margin-left:300px; }
        
        
        .t input{width:350px; height:30px; margin:10px; border:1px solid #e4e4e4; border-radius:10px;}
        span{color:red;}
        .btn{width:100px; height:35px; border-radius:5px; border: none; background:#70ad47; color:white; 
                font-weight:bold; margin-left:40px; cursor: pointer;}
        .m input{margin-left:10px;}
        .b input:nth-child(1){width:100px; height:30px; margin:10px; border:1px solid #e4e4e4; border-radius:10px;}
        .b input:nth-child(2){width:40px; height:30px; margin:10px; border:1px solid #e4e4e4; border-radius:10px;}
        .b input:nth-child(3){width:40px; height:30px; margin:10px; border:1px solid #e4e4e4; border-radius:10px;}
        #agree input{margin-bottom:20px; margin-left:300px;}
        #agree button{margin-left:330px; margin-top: 30px; width:300px; height:40px; font-size:15px;}
        #agree p{display:inline-block; border-bottom:1px solid black; margin-left:10px; cursor: pointer;}
 </style>
</head>
<body>
  <header>       
        <div >
        <p><a href="">로그아웃</a></p>
        <p><a href="<%= request.getContextPath() %>/page/mypage.do">마이페이지</a></p>
        <p><a href="">고객센터</a></p>
        </div><!-- 로그인 및 고객센터 관련 버튼--> 
        <nav class="navbar" > <!-- 네비게이션 -->
            <h1><a href=""><img src="../resources/upload/힐링캠프 logo.png" alt="홈버튼"></a></h1>
           
            <section></section>
        </nav>
    </header> 

    <main>
        <h2>회원가입</h2>
        <form id="frm">
            <div class="t">
            <a>아이디  <span>*</span><br> <input type="text" name="id" id="id" onblur="blurId(this)" placeholder=" 아이디"  ></a><button class="btn" type="button" onclick="checkId()">중복확인</button>
            <br>
            <a>이메일 주소  <span>*</span><br> <input type="text" name="email" id="email" placeholder=" 이메일 주소"></a><button class="btn" type="button" onclick="checkEmail()">중복확인</button> <br>
            <a>연락처  <span>*</span><br> <input type="text" name="phone" id="phone" placeholder=" 010-0000-0000"></a><button class="btn" type="button" onclick="requestCert()">인증요청</button><br>
            <a>인증번호  <span>*</span><br><input type="text" name="number" id="number" placeholder=" 인증번호"></a><button class="btn" type="button" onclick="checkCert()">인증하기</button><br>
            <a>비밀번호  <span>*</span><br> <input type="password" name="password" id="password" placeholder=" 비밀번호"></a><br>
            <a>비밀번호 확인  <span>*</span><br> <input type="password" name="password" id="password" placeholder=" 비밀번호 확인"></a><br>
            </div>
            <div class="m">
            <a>성별
                <input type="radio" name="gender" id="man">남성</a>
                <input type="radio" name="gender" id="woman">여성</a><br><br>
            </div>
            <div class="b">
            <a>생년월일  <input type="text" name="year" id="year"  >년
                <input type="text" name="month" id="month" >월
                <input type="text" name="day" id="day" >일</a>
            <br><br>
            </div> 
           
        </form>
        
        <h2 >이용약관 동의</h2>

        <div id="agree">
        <input type="checkbox" name="all" value="all"> 전체 동의 <br>
        <input type="checkbox" name="util" value="util">  <span>*</span> 이용약관 동의 <p>상세보기</p> <br>
        <input type="checkbox" name="priv" value="priv">  <span>*</span> 개인정보 수집 이용 동의 <p>상세보기</p><br>
        <input type="checkbox" name="locat" value="locat">  <span>*</span> 위치서비스 이용 동의 <p>상세보기</p><br>
        <input type="checkbox" name="mark" value="mark"> 마케팅 정보 활용 동의 <p>상세보기</p><br>
        
        <button class="btn">가입완료</button>
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