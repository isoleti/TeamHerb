<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" style="--vh:5.02px;">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>아이디찾기 일치</title>
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
		.idMatch_area{
			margin:0 auto;
			width:60%;
			height:900px;
			display:flex;
			position:relative;
		}
		.idMatch_place{
			margin:auto auto;
			
			width:80%;
			height:80%;
			
		}
		.img_place{
			position:relative;
			width:100%;
			height:300px;
			text-align: center;
			
		}
		.img_place img{
			position:absolute;
			width:28%;
			top:-8%;
			left:36%;
			cursor: pointer;
			
		}

		#p1,#p2{
			font-size:35px;
			text-align:center;
			font-weight: bold;
			color:rgb(27, 180, 27);
		}
		#p2{
			margin-top:30px;
			font-size:20px;
			color:rgb(7, 121, 7);
			margin-bottom: 40px;
		}
		.id_check{
			text-align: center;
		}

		input{
			border:1px solid #fff;
			border:none;
			width:400px;
			height:50px;
			font-size:17px;
			padding-left:10px;
		}
		input:focus{
			outline:none;
		}
		#id{
			margin-bottom:30px;
			text-align: center;
			background-color:rgb(240, 147, 42);
		}
		#btn{
			width:410px;
			background-color:rgba(24, 167, 24, 0.925);
			cursor: pointer;
		}

	</style>
</head>
<body>
	<div class="idMatch_area">
		<div class="idMatch_place">
			<div class="img_place">
				<img src="../resources/images/check.png"/>
			</div><!--img_place-->
			<p id="p1">입력하는 정보와 일치하는 결과입니다.</p>
			<p id="p2">개인정보를 위해 <br>아이디 또는 이메일 일부만 제공해 드립니다.</p>
			<div class="id_check">
					<input type="text" id="id" name="id" value="${id}" readonly>
				<br>
				<a href="<%=request.getContextPath() %>/user/login.do">
					<input type="button"  value="로그인 하러가기" id="btn" >
				</a>
			</div>
		</div><!--idMatch_place-->
	</div><!--id_match-->
</body>
</html> 