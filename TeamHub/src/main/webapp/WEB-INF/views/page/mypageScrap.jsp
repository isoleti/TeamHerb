<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 스크랩글</title>
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
        .content{display:inline-block; position: relative; top:-180px; left:50px; }
        .content a{ font-size:20px; 
            display:block; margin-top:20px;}
        .content a:nth-child(3){display:inline-block;}
        .content button{margin-top:20px; border:1px solid #e4e4e4; width:100px; height:30px; 
            background:white; border-radius:5px; margin-right:20px; margin-bottom:50px; }
        .content p{display:inline-block; }
        .content input{margin:20px;}
        .p{font-weight:bold;}
        #sb a{font-size:15px; font-style: none;}
        #sb {display:inline-block;}
        #sb button{background:#0ed145; color:white; margin-left:100px;}

        #tb table{border:1px solid #dff6e1; width:800px; height:200px; text-align:center; margin-top:40px;}
        #tb tr:nth-child(1){font-weight: bold;}
        #tb td:nth-child(5){padding:0;}
        #tb tr:nth-child(2n){background-color:#dff6e1;}
        #tb button{width:50px; margin:0;}
        #navi{width:200px; margin-left:300px;}
        #navi a{font-size:15px; color:black;}

   </style>
</head>
<body>
	<header>       
        <div ><p><a href="">로그아웃</a></p><p><a href="">마이페이지</a></p><p><a href="">고객센터</a></p></div><!-- 로그인 및 고객센터 관련 버튼--> 
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
            <a class="p">스크랩글</a>

           
            <div id="tb">
            <table border="1">
                <tr>
                    <td>스크랩</td>
                    <td>제목</td>
                    <td>사연</td>
                    <td>작성 일시</td>
                    <td>작성자</td>
                </tr>
                <tr>
                    <td>★</td>
                    <td>제목</td>
                    <td>사연</td>
                    <td>작성 일시</td>
                    <td>작성자</button></td>
                </tr>
                <tr>
                    <td>★</td>
                    <td>제목</td>
                    <td>사연</td>
                    <td>작성 일시</td>
                    <td>작성자</button></td>
                </tr>
                <tr>
                    <td>★</td>
                    <td>제목</td>
                    <td>사연</td>
                    <td>작성 일시</td>
                    <td>작성자</button></td>
                </tr>
                <tr>
                    <td>★</td>
                    <td>제목</td>
                    <td>사연</td>
                    <td>작성 일시</td>
                    <td>작성자</button></td>
                </tr>
                <tr>
                    <td>★</td>
                    <td>제목</td>
                    <td>사연</td>
                    <td>작성 일시</td>
                    <td>작성자</button></td>
                </tr>
            
            </table>
             
    </div><!--#tb-->

    <div id="navi">
    <nav aria-label="Page navigation example">
        <ul class="pagination">
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
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