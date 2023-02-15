<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!-- jstl추가 -->
<%@ page import="project.healingcamp.vo.Community_BoardVO" %>
<%@ page session="true" %>
<%List<Community_BoardVO> notice_List = (List<Community_BoardVO>)request.getAttribute("notice_List");%>    
<!DOCTYPE html>
<html lang="ko" style="--vh:5.02px;">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>힐링캠프 고객센터 공지사항</title>
	<!--부트스트랩, header footer css 연결-->
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/css3.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/images/icons8-clover-16.png">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
</head>
<body>
	<header>    <!--header-->
       <div id="loginBar"> <!--로그인 관련-->
          <c:if test = "${login != null}">
          <i id="xeicon" class="xi-profile-o"></i>
          <p id="loginId">${login.id }님 환영합니다.</p>
	        </c:if>  
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
				<p><a href="">상담사 페이지</a></p>
				</c:if>
				<p><a href="<%=request.getContextPath() %>/customerService/customerNotice.do">고객센터</a></p>               				               
	      </c:if>
      </div>
        <nav class="navbar" style="background-color: #dff6e1;"> <!-- 상단 네비게이션 -->
            <h1><a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath() %>/resources/images/힐링캠프 logo.png" alt="홈버튼"></a></h1>
            <a href="<%=request.getContextPath()%>/program.do">치료프로그램</a>
            <a href="<%=request.getContextPath()%>/test.do">심리테스트</a>
            <a href="<%=request.getContextPath()%>/community/community_list.do">커뮤니티</a>
            <a href="<%=request.getContextPath()%>/res/findcenter.do">상담 예약</a>
            <a href="<%=request.getContextPath()%>/counseller_board/counseller_board_list.do">상담사 게시판</a>
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
							<a id="op1" href="<%=request.getContextPath()%>/customerService/customerNotice.do"><button id="notice">공지사항</button></a>
							<a id="op2" href="<%=request.getContextPath()%>/customerService/customerFAQ.do"><button id="FAQ">FAQ</button></a>
						</div><!--option-->
					</div><!--inner-->
				</div><!--navbar-->
				<div class="notice_area">
					<h2>공지사항</h2>
					<form id="view_form" actoion="customerNotice.do"> 
					<div class="notice_place">	
						<input type="checkbox" id="answer01" name="board_type" value="2">
        				 	 <c:forEach items="${data}" var="list" varStatus="status" >
        				 	 	
	        				 	  <div class="accordion" id="accordionExample" >
						                <div class="accordion-item" >
							                  	<h2 class="accordion-header" id="headingOne">
								                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${status.index}" aria-expanded="true" aria-controls="collapse${status.index}">
								                     	 ${list.title}
								                    </button>
							                  	</h2>
							                  	<div id="collapse${status.index}" class="accordion-collapse collapse" aria-labelledby="heading${status.index}" data-bs-parent="#accordionExample">
								                    <div class="accordion-body">
								                      	${list.content}  
								                    </div>
								                     <div class="accordion-body">
								                      	${list.wdate}  
								                    </div>
						                  		</div>
					                	</div>
<%-- 										    <div id="collapse${status.index}" class="${status.index eq 0 ?'accordion-collapse collapse show':'accordion-collapse collapse' }" aria-labelledby="heading${status.index}" data-bs-parent="#accordionExample"> --%>
					               </div><!-- accordion -->
					             
				               </c:forEach> 	
						</form>
						
						
				        <!--부트스트랩 페이지네이션-->
					        <nav aria-label="Page navigation example">
					            <ul style="margin-left:251px;" class="pagination justify-content-center">
					            
						<!--이전버튼 활성화 -->
					              <c:if test="${pageMaker.prev}">
						              <li class="page-item">
						                <a class="page-link" href="<%=request.getContextPath() %>/customerService/customerNotice.do?page=${(pageMaker.startPage-1)}&perPageNum=${pageMaker.perPageNum}" aria-label="Prev">
						                  <span aria-hidden="true">&laquo;</span>
						                </a>
						              </li>
						            </c:if>
					              
						<!-- Prev 끝 -->
				        <!-- Page번호 시작 -->
					           <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="index">
						         	<li class="page-item"><a class="page-link <c:if test='${pageMaker.page eq index }'>active</c:if>" href="<%=request.getContextPath() %>/customerService/customerNotice.do?page=${index}">${index}</a></li>
						       </c:forEach>
					    <!-- Page번호 끝 -->
					    <!-- Next 시작 -->
					          <c:if test="${pageMaker.next}">
						          <li class="page-item">
							            <a class="page-link" href="<%=request.getContextPath() %>/customerService/customerNotice.do?page=${(pageMaker.endPage+1)}&perPageNum=${pageMaker.perPageNum}" aria-label="Next">
							              	<span aria-hidden="true">&raquo;</span>
							            </a>
						          </li>
					          </c:if>	
					          <!-- Next 끝 -->
					        </ul>
				     	 </nav>
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
<style>
		h1,h2,h3{
			margin:0
		}
		main{position:relative;
			height:1000px;}
		main .main_wrap{
			
			width:inherit;	
			height:700px;
		}
		main .customerCenter_area{
			margin:0 auto;
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
		
		 #notice{
			background-color: rgb(250, 223, 223);
		} 
		
		.option #op1{
			background-color: rgb(250, 223, 223);
		}
		
		.notice_area{
			padding:3%;
			float:right;
			
			width:100%;
			height:100%;
			position:relative;
		}
		h2{
			font-size:27px;
			font-weight: bold;
			border-bottom:1px solid rgba(0, 0, 0, 0.392);
			padding: 15px;
			cursor: pointer;
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
		.content #content_input{
			float:left;
			margin:20px 0 0 20px;
			width:75%;
			height:360px;
			background-color: #dff6e1;
			padding:10px;
		}
		.content #wdate{
			float:left;
			margin-top:20px;
			width:18%;
			height:360px;
			background-color:yellow;
			padding:10px;
			text-align: center;
		}
		.content #wdate p{
			padding: none;
		}
		.content{
			position:flex;
			height:400px;
		}

		i{
			position:relative;
			top:0;
			right:0;
		}

		nav{
			
			top:0px;
			right:center;
			text-align:center;
					
		}
		
		nav ul{
			position:relative;
			left:-123px;
			top: 50px;
		}

	</style>
	<script>
		$(".accordion-button").click(function(){
			var nextt = $(this).find("div");
			console.log(nextt);
		});
	</script>


</html>

	