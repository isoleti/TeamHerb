<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" style="--vh:5.02px;">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>비밀번호찾기 재설정</title>
	<script src = "<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>
	<script type="text/javascript">


	 function checkPw(){
			var fm = document.frm;
			var pw = document.getElementById(pw);
			
			if(fm.pw.value == ""){
				alert("비밀번호를 입력해주세요");
				fm.pw.focus();
				return;
			}else if(fm.pw_check.value==""){
				alert("비밀번호확인란을 입력해주세요");
				fm.pw_check.focus();
				return;
			}else if(fm.pw.value != fm.pw_check.value){
				alert("비밀번호가 일치하지 않습니다.");
				fm.pw_check.value ="";
				fm.pw_check.focus();
				return;
			}
	 }
	</script>
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
			width:150px;
			top:34%;
			left:41%;
			cursor: pointer;
			
		}
		#p1{
			font-size:20px;
			text-align:center;
			font-weight: bold;
			color:rgb(7, 121, 7);
			margin-bottom:35px;
		    cursor: pointer;
		}
	
		form{
			text-align: center;
		}

		input{
			border:1px solid green;
			width:400px;
			height:50px;
			font-size:17px;
			padding-left:10px;
		}
		input:focus{
			outline:none;
		}
		button{
			border:1px solid green;
			width:400px;
			height:50px;
			font-size:17px;
			padding-left:10px;
		
		}
		
		#pw{
			margin-bottom:20px;
		}
		#pw_check{
			margin-bottom:40px;
		}

		#btn{
			width:412px;
			font-size:23px; 
			border:none;
			cursor: pointer;
			background-color:rgba(24, 167, 24, 0.925);
		}
	</style>
</head>
<body>
	<div class="idMatch_area">
		<div class="idMatch_place">
			<div class="img_place">
				<img src="../resources/images/check.png"/>
			</div><!--img_place-->
			<p id="p1">비밀번호를 재설정해주세요.</p>
			<form id="frm" name="frm" action="pw_new.do" method="post">
				<input type="password" id="pw" name="pw" autocomplete="off" required placeholder="비밀번호">
				<br>
				<input type="password" id="pw_check" name="pw_check" autocomplete="off" required placeholder="비밀번호 확인">
				<br>
				<button value="비밀번호 재설정" id="btn" onclick="checkPw()">비밀번호 재설정</button>
				<input type="hidden" name="mail" value="${mail}">
			</form>	
		</div><!--idMatch_place-->
	</div><!--id_match-->
</body>
</html>