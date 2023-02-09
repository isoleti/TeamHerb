<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="project.healingcamp.vo.UserVo" %>
<%@ page session="true" %>    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보수정</title>
		<link href="<%= request.getContextPath() %>/resources/css/css2.css" rel="stylesheet">
		<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>
		<script>
		$(function(){ //회원가입페이지가 로드됐을때 function실행 
			$("form").submit(function(){ 
				alert("call");
				var mailval = $("#mail").val();
				var phoneval = $("#phone").val();
		
				var npwval = $("#npw").val();
				var pwcval = $("#pwc").val();
				
				alert(	  "mailval : "	+ mailval	+ "\n"
						+ "phoneval : "	+ phoneval	+ "\n"
						//+ "opwval : "	+ opwval	+ "\n"
						+ "npwval : "	+ npwval	+ "\n"
						+ "pwcval : "	+ pwcval	+ "\n"
						+ "mail : ${vo.mail}"		+ "\n"
						+ "phone : ${vo.phone}");
		
				if ( mailval != "${vo.mail}" || phoneval != "${vo.phone}" )
				{
					alert("개인정보 수정");
					// 이메일이나 전화번호 업데이트 처리
					form.action="<%=request.getContextPath() %>/page/userModify.do";
					form.method="POST";
					form.submit();
					
				}
				if ( npwval != null )
				{
					alert("개인 정보와 비번 수정");
					if( npwval != pwcval )
					{
						// 새 비번과 비번확인이 같지 않으므로, 사용자에게 메세지를 보내고, submit을 중단하고, 회원정보 페이지로 되돌린다
						alert("변경된 비밀번호가 일치하지 않습니다.");
						return false;
					}else if( npwval == pwcval )
					{
						alert("새로운 비번으로 설정");
						
						// 기존 비밀번호가 올바른지 DB랑 통신을 한다
						// case 1 : 비번이 올바르면 새 비밀번호를 DB에 업데이트 한다
						// case 2 : 기존 비번이 올바르지 않으니, 사옹자에게 알리고, 회원정보 페이지로 되돌린다.
						form.action ="pwReset.do";
						form.method="POST"; //감춰져서 넘기는 방식 Post
						form.submit();
						
					} //else if
				} //else if ( npwval != null )
			})
		});
		
		</script>
		<style>
		   main{margin:0 auto;  width:1160px; }
		        main h2{font-size:22px; margin:80px 250px; }
		        .userimfo{width:600px; height:400px; display:block; border:1px solid #e4e4e4; 
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
				
				 #center{margin-left:35px;}
		        .btn{width:180px; height:40px; border-radius:5px; border: none; color:white; 
		                font-weight:bold; margin-left:80px;cursor: pointer; position:relative; top:130px; font-size:15px;}
		        .btn:nth-child(2){background: #e4e4e4;}
		        .btn:nth-child(3){background: #70ad47;}
		        #bar a{border-bottom:1px solid black; display:inline-block; cursor: pointer; position:relative; top:135px;} 
		        #bar a:hover{color:red; border-color:red;}       
		</style>
	</head>
<body>
	 <header>       
          <div> <!--로그인 관련-->
          <c:if test = "${login == null}">   
            <p><a href="<%=request.getContextPath() %>/user/login.do">로그인</a></p>
            <p><a href="<%= request.getContextPath() %>/joinMain.do">회원가입</a></p>
            <p><a href="<%=request.getContextPath() %>/customerService/customerNotice.do">고객센터</a></p>
         </c:if><!-- 로그아웃 or 로그인x -->
         
        <c:if test = "${login != null}">
            
               <p><a href="<%=request.getContextPath()%>/user/logout.do">로그아웃</a></p>
               <c:if test = "${login.usertype eq 'a'}">
               <p><a href="<%=request.getContextPath() %>/adminPage/adminPage_Member_List.do">관리자 페이지</a></p>
               </c:if>
               <c:if test = "${login.usertype eq 'u'}">
               <p><a href="<%= request.getContextPath() %>/page/mypageRes.do">마이 페이지</a></p>
               </c:if>
               <c:if test = "${login.usertype eq 'c'}">
               <p><a href="<%= request.getContextPath() %>/page/counspageRes.do">상담사 페이지</a></p>
               </c:if>
               <p><a href="<%=request.getContextPath() %>/customerService/customerNotice.do">고객센터</a></p>
      </c:if>
      </div>
   
        <nav class="navbar" > <!-- 네비게이션 -->
            <h1><a href=""><img src="../resources/upload/힐링캠프 logo.png" alt="홈버튼"></a></h1>
           
            <section></section>
        </nav>
    </header>
    <main>
        <h2>회원정보</h2>
        
		<form method="POST"> <!-- onsubmit="return DoSubmit();" --> 
			<input type="hidden" id="uidx" name="uidx" value="${login.uidx}">
         <div class="userimfo">
            <div class="basic">
            <a class="p">기본정보</a>
            <a>아이디 <input type="text" name="id" id="id" value="${vo.id}" disabled></a><br>
            <a>이메일주소  <input type="text" name="mail" id="mail" value="${vo.mail}"></a><br>
            <a>연락처 <input type="number" name="phone" id="phone" value="${vo.phone}"></a><br>
            <c:if test = "${login.usertype eq 'c'}">
            <a>상담기관 <input type="text" name="center" id="center" value="${login.center}"></a>
             </c:if>
           <!--  <hr> -->
           <!--  <a class="p">비밀번호 변경</a>
           	 -->
           <!--  <a>현재 비밀번호 <input type="password" id="opw" autoComplete="off"></a><br> -->
         <!--    <a>비밀번호 변경 <input type="password" name="pw" id="npw" autoComplete="off"></a><br>
            <a>비밀번호 확인 <input type="password" id="pwc" autoComplete="off"></a>  -->
            
            <!-- <hr> -->
          	</div>
                 
            <div id="bar">
            <a href="<%= request.getContextPath() %>/page/userDel.do">회원탈퇴</a>
            <c:if test = "${login.usertype eq 'u'}">
            <button type="button" class="btn" onclick="location.href='<%=request.getContextPath()%>/page/mypageRes.do'">취소</button>
            </c:if>
            <c:if test = "${login.usertype eq 'c'}">
            <button type="button" class="btn" onclick="location.href='<%=request.getContextPath()%>/page/countspageRes.do'">취소</button>
            </c:if>
            <button class="btn">저장</button>
            </div><!-- #bar -->
 		</div><!--.userimfo-->
 		</form>
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