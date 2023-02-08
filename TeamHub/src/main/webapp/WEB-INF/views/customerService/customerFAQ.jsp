<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!-- jstl추가 -->
<%@ page import="project.healingcamp.vo.Community_BoardVO" %>
<%List<Community_BoardVO> faq_List = (List<Community_BoardVO>)request.getAttribute("faq_List");%>
<%
	String cate = (String)request.getAttribute("category");
	if(cate == null) cate = "";
%>        
<!DOCTYPE html>
<html lang="ko" style="--vh:5.02px;">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>힐링캠프 고객센터 FAQ</title>
	<!--부트스트랩, header footer css 연결-->
     <link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/css3.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<style>
		h1,h2,h3{
			margin:0
		}
		
		main .main_wrap{
			
			width:inherit;	
			height:1200px;
		}
		main .customerCenter_area{
			margin:0 7%;
			width:75%;
			height:100%;
			display: flex;
			margin-bottom:50%;
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
		
	
		#counselling, #reservation, #gita{
			border:1px solid rgba(128, 128, 128, 0.787);
			border-top:none;
			border-left:none;
			border-bottom:none;
			background-color: #f2f2f2;

		}
		#all{
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
		
		nav{
			
			top:0px;
			right:center;
			text-align:center;
			point:curser;		
		}
		
		nav ul{
			position:relative;
			left:-123px;
			top: 50px;
		}
		nav ul li{
			cursor: pointer;
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
					<form action="" name="getForm" method="get" onsubmit="return false;">
						<input type="hidden" name="category" value="">
						<div class="FAQ_select">
							<input type="button" class='cate <%= (cate == "" || cate.equals("전체보기")) ? "active" : "" %>' value="전체보기">
							<input type="button" class='cate <%= (cate.equals("심리상담")) ? "active" : "" %>' value="심리상담">
							<input type="button" class='cate <%= (cate.equals("예약/결제")) ? "active" : "" %>' value="예약/결제">
							<input type="button" class='cate <%= (cate.equals("기타")) ? "active" : "" %>' value="기타">
						</div><!---->
					</form>
					<form id="view_form" action="customerFAQ.do">
						<div class="notice_place">
							<input type="checkbox" id="answer01" name="board_type" value="3">						
								<c:forEach items="${faq_List}" var="list" varStatus="status">
	        				 	  <div class="accordion" id="accordionExample">
						                <div class="accordion-item">
							                  	<h2 class="accordion-header" id="headingOne">	
								                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${status.index}" aria-expanded="true" aria-controls="collapseOne">
								                     	 ${list.title}
								                    </button>
							                  	</h2>
							                  	<div id="collapse${status.index}" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
								                    <div class="accordion-body">
								                      	${list.content}  
								                    </div>
								                     <div class="accordion-body">
								                      	${list.wdate.substring(0,10)}  
								                    </div>
						                  		</div>
					                	</div>
					               </div><!-- accordion -->
				               </c:forEach> 
						</div><!--notice_place-->
					</form><!-- view_form -->
					
			
			       	<!--부트스트랩 페이지네이션-->
			        <nav aria-label="Page navigation example">
			            <ul style="margin-left:251px;" class="pagination justify-content-center">
			            
						<!-- 이전버튼 활성화 -->
			              <c:if test="${pageVO.prev}">
				              <li class="page-item">
				                <a class="page-link" href="<%=request.getContextPath() %>/customerService/customerFAQ.do?pageNum=${pageVO.startPage-1}&amount=${pageVO.amount}<c:if test='${searchVO.category != null}'>&category=${searchVO.category}</c:if>" aria-label="Previous">
				                  <span aria-hidden="true">&laquo;</span>
				                </a>
				              </li>
				            </c:if>
			              
						<!--페이지 번호 -->
			              <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">
				              <li class="page-item">
					              <a class="page-link ${pageVO.pageNum == num ? "active":"" }' href="<%=request.getContextPath() %>/customerService/customerFAQ.do?pageNum=${num}&amount=${pageVO.amount}&searchType=${searchVO.searchType}&searchVal=${searchVO.searchVal}<c:if test='${searchVO.category != null}'>&category=${searchVO.category}</c:if>">${num}
					              </a>
				              </li>
				            </c:forEach>
			              
						<!-- 다음버튼 활성화 -->
			              <c:if test="${pageVO.next }">
				              <li class="page-item">
					                <a class="page-link" href="<%=request.getContextPath() %>/customerService/customerFAQ.do?pageNum=${pageVO.endPage+1}&amount=${pageVO.amount}<c:if test='${searchVO.category != null}'>&category=${searchVO.category}</c:if>" aria-label="Next">
					                  	<span aria-hidden="true">&raquo;</span>
					                </a>
				              </li>
							</c:if>			
			            </ul>
			          </nav>	
					
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

<script>
	$(function(){	
		//클릭시 카테고리 변경
		$(document).on("click",".cate",function(){
			
			var cateVal = $("input[name=category]").val($(this).val());
			if (cateVal.val() == "전체보기")
			{
				location.href='customerFAQ.do';
			}else
			{
				var paraStr = "customerFAQ.do?category=" + cateVal.val();
				location.href=paraStr; 
			}
		});
		
	});
</script>


</html>