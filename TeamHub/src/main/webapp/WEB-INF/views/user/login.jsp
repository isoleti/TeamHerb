<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" style="--vh:5.02px;">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>힐링캠프 로그인</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		html,
		body{
			margin:0 auto;
			padding:0;
			overflow-x: hidden;
			
			}
		a{
		 	color:black;
			text-decoration-line: none;
		}	
		body{
			overflow-y: hidden;
		}
		.login_area{
				margin:0 auto;
				width:45%;
				height:900px;
				display:flex;
				position:relative;
						
		}
		.login_box{
			width:600px;
			height:700px;
			margin:auto auto;
		}
		.logo{
			width:400px;
			margin:40px auto;
			text-align: center;
			font-size:35px;
			cursor: pointer;
		}
		
		.logo img{
			margin-left:0;
			height:60px;
		}

		#frm{
			text-align: center;
		
		}

		input{
			border:1px solid rgba(108, 247, 157, 0.677);
			width:400px;
			height:50px;
			font-size:17px;
			padding-left:8px;
		}

		input::placeholder{
			font-size:17px;
			left:3px;
			
		}
		input:focus {
			outline: none;
		} 

		form #id{
			margin-bottom:10px;
		}	
		form #pw{
			margin-bottom:20px;
		}
	
		label{
			display:inline-block;
			width:120px;
			

		}
		form #checking{
			position:relative;
			margin-top:9px;
			width:600px;

			
		}
		form div #check{
			position:absolute;
			width:20px;	
			height:20px;
			margin-top: 6px;
			left:102px;
			border-color: rgb(19, 192, 135);
			
		}

		form #btn{
			font-size:23px; 
			border:none;
			cursor: pointer;
			background-color: rgba(42, 237, 133, 0.784);
		}
		
	
		form  div span {
			position:absolute;
			font-size:14px;
			top:5px;
			cursor: pointer;
		}
		
		#checking :nth-child(2){
			left:133px;
		}

		#checking :nth-child(3){
			left:249px;
		}

		#checking :nth-child(4){
			right:106px;
		}
		.start_login .naver,
		.kakao{
			position:absolute;
			border:2px solid rgba(7, 227, 117, 0.92);
			width:400px;
			height:60px;
			margin-left:101px;
			background:#fff;	
			cursor: pointer;
		}
		.start_login .naver{
			
			margin-top:50px;
		}
		
		.start_login .kakao{
			margin-top:120px;
		}	


		.btn_content img,
		.btn_content2 img{
			position:relative;
			width:30px;
			top:2px;
			right:5px;
		}

		.start_naver,
		.start_kakao{
			position:relative;
			font-size:18px;
			margin-bottom:10px;
			top:-6px;
			left:3px;
			
		}
	</style>
</head>
<body>
		<div class="login_area">
			<div class="login_box">
				<div class="logo">
					<a href="<%=request.getContextPath()%>/views/home.jsp/"><img src="<%=request.getContextPath() %>/resources/images/힐링캠프 logo2.png"></a>
				</div><!--logo-->
				<form action="login.do" method="post" id="frm">
					<input type="text" id="id" name="id" autocomplete="off" required placeholder="아이디">
					<br>
					<input type="password" id="pw" name="pw" autocomplete="off" required placeholder="비밀번호">
					<br>
					<!-- <input type="button" value="로그인" id="btn" > -->
					<button>로그인</button>
					<br>
					<div id="checking">
						<input type="checkbox" id="check" value="로그인유지">
						<span>로그인 유지</span>
						<span><a href="<%=request.getContextPath() %>/user/idFind.do">아이디/비밀번호 찾기</a></span>
						<span><a href="<%=request.getContextPath() %>/user/join.do">회원가입</a></span>
					</div><!---->
				</form>
				<div class="start_login">
					<button type="button" class="naver">
						<span class="btn_content">
							<a href=""><img src="<%=request.getContextPath() %>/resources/images/naverLogo.png"></a>
						</span><!--btn_content-->
						<span class="start_naver">네이버로 시작하기</span>
					</button><!--naver-->
					<button type="button" class="kakao">
						<span class="btn_content2">
							<a href=""><img src="<%=request.getContextPath() %>/resources/images/kakao.png"></a>
						</span><!--btn_content2-->
						<span class="start_kakao">카카오로 시작하기</span>
					</button><!--kakao	-->
				</div><!--start_login-->

			</div><!--login_box-->
		</div><!--login_box-->

	

</body>
</html>