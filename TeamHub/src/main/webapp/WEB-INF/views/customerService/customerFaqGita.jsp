<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" style="--vh:5.02px;">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>힐링캠프 고객센터 FAQ 기타</title>
	<!--부트스트랩, header footer css 연결-->
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/css3.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>
		h1,h2,h3{
			margin:0
		}
		
		main .main_wrap{
			
			width:inherit;	
			height:700px;
		}
		main .customerCenter_area{
			margin:0 7%;
			width:75%;
			height:100%;
			display: flex;
			
			position:relative;
		}
		.left_box{
			
			width:300px;
			height:100%;
		}
		.inner{
			border:1px solid #000;
			width:300px;
			height:170px;
			margin-top:20px;
			text-align: center;
			
		}
		.inner h3{
			padding:15px;
			font-size:1.17em;
			
			border-bottom:1px solid rgba(167, 161, 161, 0.788);
		}
		.option{
			display:flex;
			flex-direction: column;
			
			height:68%;
			width:100%; 
			padding:10px;
		}
		button{
			text-align: left;
			background-color:#fff;
			font-size:15px;
			padding-left:10px;
		}
		button:hover{
			background-color: rgb(250, 223, 223);
		}
		#FAQ{
			background-color: rgb(250, 223, 223);
		}
		#FAQ:hover{
			background-color: rgba(254, 173, 173, 0.644);
			
		}
		.notice_area{
			padding:3%;
			float:right;
			
			width:100%;
			height:100%;

		}
		h2{
			cursor: pointer;
			font-size:27px;
			font-weight: bold;
			border-bottom:1px solid rgba(0, 0, 0, 0.392);
			padding: 15px;
		}
		.notice_place{
			
			height: 80%;
			width:100%;
			
		}
		
		input[id*="answer"]{
			display: none;
		}
		input[id*="answer"]+label{
			display:block;
			padding:20px;
			border:1px solid rgba(0, 0, 0, 0.392);
			border-left:none;
			border-right:none;
			
			color:black;
			font-weight: 900;
			background:#fff;
			cursor: pointer;
			position:relative;
		}
		input[id*="answer"] + label em i{
			position:absolute;
			top:50%;
			right:10px;
			width:30px;
			height:30px;
			margin-top:-15px;
			display:inline-block;
		}
		input[id*="answer"]+label +div{
			max-height:0;
			transition: all .35s;
			overflow: hidden;
			background: #fff;
			font-size:15px;
			
			
		}
		input[id*="answer"] + label +div p{
			display:inline-block;
		}

		input[id*="answer"]:checked + label +div{max-height: 400px;}
		
		.content p{
			margin-left:20px;
			margin-top:20px;
		}
		.content{
			height:250px;
		}

		i{
			position:relative;
			top:0;
			right:0;
		}
		.FAQ_select{
			
			border-bottom: 1px solid #000;
			width:100%;
			height:60px;
			text-align: center;	
		}
		
	
		#counselling,#all, #reservation{
			border:1px solid rgba(128, 128, 128, 0.787);
			border-top:none;
			border-left:none;
			border-bottom:none;
			background-color: #f2f2f2;

		}
		#gita{
			border:1px solid black;
			border-bottom:none;
			z-index:100;
			background-color: #fff;
		}
		.faq_nav{
			cursor: pointer;
			float:left;
			border:1px solid #f2f2f2;
			border-bottom: none;
			border-top:none;
			display:inline-block;
			width:25%;
			height: 100%;
			line-height: 60px;
		}
		#all:hover,
		#counselling:hover, 
		#reservation:hover, 
		#gita:hover{
			transition: 0.5;
			background-color: #e8e6e6;
		}
	</style>

</head>
<body>
	<header>    <!--header-->
        <div> <!--로그인 관련-->
            <p><a href="">로그인</a></p>
            <p><a href="">회원가입</a></p>
            <p><a href="">고객센터</a></p>
        </div> <!-- fin 로그인 관련 -->
        <nav class="navbar" style="background-color: #dff6e1;"> <!-- 상단 네비게이션 -->
             <h1><a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath() %>/resources/images/힐링캠프 logo.png" alt="홈버튼"></a></h1>
            <a href="">치료프로그램</a>
            <a href="">심리테스트</a>
            <a href="">커뮤니티</a>  
            <a href="">상담 예약</a>
            <a href="">상담사 게시판</a>
            <section></section>
        </nav> <!-- fin 상단 네비게이션 -->
    </header> <!--fin header-->
	<main><!--메인-->
		<div class="main_wrap">
			<div class="customerCenter_area">
				<div class="left_box"><!--왼쪽 공지사항 박스-->
					<div class="inner">
						<h3>고객센터</h3>
						<div class="option">
							<a href="<%=request.getContextPath()%>/customerService/customerNotice.do"><button id="notice">공지사항</button></a>
							<a href="<%=request.getContextPath()%>/customerService/customerFAQ.do"><button id="FAQ">FAQ</button></a>
						</div><!--option-->
					</div><!--inner-->
				</div><!--navbar-->
				<div class="notice_area">
					<h2>FAQ</h2>
					<div class="FAQ_select">
						<a href="<%=request.getContextPath()%>/customerService/customerFAQ.do"><div class="faq_nav" id="all">전체</div></a><!--전체-->
						<a href="<%=request.getContextPath()%>/customerService/customerFAQ_counselling.do"><div class="faq_nav" id="counselling">심리상담</div></a><!--심리상담-->
						<a href="<%=request.getContextPath()%>/customerService/customerFaqReservation.do"><div class="faq_nav" id="reservation">예약결제</div></a><!--예약결제-->
						<a href="<%=request.getContextPath()%>/customerService/customerFaqGita.do"><div class="faq_nav" id="gita">기타</div></a><!--기타-->
					</div><!---->
					<div class="notice_place">
						<input type="checkbox" id="answer02">
						<label for="answer02">기타<em><i class="xi-check xi-2x"></i></em></label>
						<div class="content">
							<p>기타기타</p>
						</div><!--content-->
					</div><!--notice_place-->
				</div><!--notice_area-->

			</div><!--customer_area-->
		</div><!--메인 랩-->
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