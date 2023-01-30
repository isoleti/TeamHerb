<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" style="--vh:5.02px;">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>힐링캠프 아이디찾기</title>
	<style>
		*{
			margin:0;
			padding:0;
			list-style: none;
		}
		html,
		body{
			margin:0 auto;
			padding:0;
			overflow-x: hidden;
		
			}
		body{
			overflow-y: hidden;
		}
		a{
		color:black;
		text-decoration-line: none;	
		}
		.idCheck_Area{
			margin:0 auto;
			width:45%;
			height:900px;
			display:flex;
			position:relative;
			
		}
		.idCheck_box{
			width:600px;
			height:700px;
			margin:auto auto;
			
		}
		.logo{
			width:400px;
			margin:80px auto 40px;
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
		#frm ul{
			
			margin:0 auto 20px;
		
			width:404px; 
			height:54px;

			
		}
		#frm ul li{
			cursor: pointer;
			float:left;
			border:1px solid rgba(11, 185, 72, 0.813);
			width:200px;
			height:52px;
		}
		#frm ul li p{
			font-size: 17px;
			line-height: 52px;
			
			
		}
		li #idcheck{
			background-color:rgba(40, 186, 91, 0.853) ;
		}
		input{
			border:1px solid rgba(11, 169, 66, 0.873);
			width:394px;
			height:50px;
			font-size:17px;
			padding-left:8px;
		}
		input:focus {
			outline: none;
		} 
		form #mail{
			margin-bottom: 20px;
		}
		form #btn{
			width:404px;
			font-size:23px; 
			border:none;
			cursor: pointer;
			background-color:rgba(115, 198, 121, 0.947);
		}
		

	</style>

</head>
<body>
	<div class="idCheck_Area">
		<div class="idCheck_box">
			<div class="logo">
				<a href="<%=request.getContextPath()%>/">
					<img src="<%=request.getContextPath() %>/resources/images/힐링캠프 logo2.png">
				</a>			
			</div><!--logo-->
			
			<form id="frm" method="post" action="findId.do" name="findform">
			
				<ul>
					
					<li><a href="<%=request.getContextPath() %>/user/idFind.do"><p id="idcheck">아이디찾기</p></a></li>
					<li><a href="<%=request.getContextPath() %>/user/pwFind.do"><p id="pwcheck">비밀번호 찾기</p></a></li>
				</ul>
				
				<input type="text" id="mail" name="mail" autocomplete="off" required placeholder="이메일을 입력해주세요. ex)hogildong@naver.com">
				<br>
				<button>아이디찾기</button>
			<!-- 	<input type="button" id="btn"  value="아이디 찾기"> -->
			</form><!--frm-->
			
		</div><!--idCheck_box-->
	</div><!--idCheck_Area-->
</body>
</html>