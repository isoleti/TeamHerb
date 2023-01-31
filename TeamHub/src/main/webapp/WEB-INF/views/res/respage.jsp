<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="ko" style="--vh:5.02px;">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약하기</title>
     <!--부트스트랩, header footer css 연결-->
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">
    <style>
        main{position:relative;}

        main h1{margin-left:15%; margin-bottom:2%;}
       
        main #resS{width:50%; height:75px; margin:0; margin-left:13%;  margin-bottom:4%; border:2px solid #000; border-radius:15px;}
        main #resS div{display:inline-block; margin-left:10%; margin-top:1.75%; font-size:20px;}
        main #resS #s1{margin-left:5%;}
        main #resS #s1,
        main #resS #s2{margin-right:15%;}
        
        main div{margin-bottom:3%;}
        main div h2{margin-left:15%; margin-bottom:2%;}
        main #step1 table{width:50%; height:60%; margin-left:13%; text-align:center;}
        main #step2 table{width:50%; height:60%; margin-left:13%; text-align:center;}
        main #step3 #calendar{width:45%; margin-left:13%; text-align:center;}        
        
        main #res{width:30%; height:100%; display:inline-block; background-color: azure; position:absolute; top:0; right:5%;}
        main #res h2{margin-top:10%; margin-bottom:5%;}
        main #res p{margin-left:7.5%; margin-bottom:5%;}
        main #res .btn-outline-success{margin-left:25%;}
        main #res .btn-dark{margin-left:4%;}       
        
        main input {border:none; background:#f0ffff;}
        
        /*modal style*/
        #modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        #modal .modal-window {
            background: rgba( 169, 250, 250, 0.70 );
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 400px;
            height: 500px;
            position: relative;
            top: -100px;
            padding: 10px;
        }
        #modal .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;
            
        }
        #modal .title h2 {
            display: inline;
        }
        #modal .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        
        #modal .content {
            margin-top: 20px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/index.global.js"></script>
	<!-- iamport 연결 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script>
		document.addEventListener('DOMContentLoaded', function()
		{
			$()
			//예약일
			var rdate = document.getElementsByName("resdate");			
			
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(
					calendarEl,
					{
						initialView: 'dayGridMonth',
						headerToolbar: {
							start: "prev",
							center: "title",
							end: "dayGridMonth,next",
						},
						titleFormat : function(date) { // title 설정
							return date.date.year +"년 "+(date.date.month +1)+"월";
						},
						dayHeaderContent: function (date) {
							let weekList = ["일", "월", "화", "수", "목", "금", "토"];
							return weekList[date.dow];
						},
						dateClick: function (dateClickInfo) { //년월 값
							var modal = document.getElementById("modal")
							//console.log(dateClickInfo.dateStr);
							var fcDayNumber = document.getElementsByName("dateClickInfo.dateStr");
							//console.log(fcDayNumber);
							const fcDayElements = document.querySelectorAll(".fc-daygrid-day.fc-day");
							// init background color found element
							fcDayElements.forEach((element, key, parent) => {
								element.style.backgroundColor = "#ffffff";
							});
							// set background color clicked Element
							dateClickInfo.dayEl.style.backgroundColor = "#dff6e1";
							
							//날짜 가져오기
							
							
							//modal script					        
							modal.style.display = "flex"
					        function modalOn() {
					            modal.style.display = "flex"
					        }
					        function isModalOn() {
					            return modal.style.display === "flex"
					        }
					        function modalOff() {
					            modal.style.display = "none"
					        }
					        const closeBtn = modal.querySelector(".close-area")
					        closeBtn.addEventListener("click", e => {
					            modal.style.display = "none"
					        })
					        modal.addEventListener("click", e => {
						    const evTarget = e.target
						    if(evTarget.classList.contains("modal-overlay")) {
						        modal.style.display = "none"
						    	}
					        })			    
					        $(rdate).attr('value',dateClickInfo.dateStr);
						},
						
						
						navLinks: true,
						selectable: true,
						selectMirror: true,
						allDaySlot: false, // allDay 표시 안함
					}
			);
			calendar.render();					
		});		
		//예약시간
		var rtime = document.getElementsByName("restime");	
		var coun = document.getElementsByName("counseling");			
		var counseler = document.getElementsByName("couns");
		var date = document.getElementsByName("resdate");
		var count = document.getElementsByName("rescount");
		
		//객체 초기화
		var IMP = window.IMP;   // 생략 가능
		IMP.init("imp05817143");
		
		//예약시간 담기
		function modalClick1(obj) {
			var rt = $(obj).next();
			var rtval = rt.text();
			
			$(rtime).attr('value',rtval);
		}
		function modalClick2(obj) {
			var rt = $(obj).next();
			var rtval = rt.text();
			
			$(rtime).attr('value',rtval);
		}
		function modalClick3(obj) {
			var rt = $(obj).next();
			var rtval = rt.text();
			
			$(rtime).attr('value',rtval);
		}
		function modalClick4(obj) {
			var rt = $(obj).next();
			var rtval = rt.text();
			
			$(rtime).attr('value',rtval);
		}
		
		var today = new Date();   
	    var hours = today.getHours(); // 시
	    var minutes = today.getMinutes();  // 분
	    var seconds = today.getSeconds();  // 초
	    var milliseconds = today.getMilliseconds();
	    var makeMerchantUid = hours +  minutes + seconds + milliseconds;
	    
	    //iamport 결제 모듈
	    function requestPay() {
	    	
		   var rtval = $(rtime).text();
		   var coval  = $(counseler).text();
		   var couval = $(coun).text();
		   
		   var rtjson = JSON.stringify(rtval);
		   var cojson = JSON.stringify(coval);
		   var coujson = JSON.stringify(coval);
		   
		   console.log("rtval"+rtval);
		   console.log("coval"+coval);
		   console.log("couval"+couval);
		   
	       IMP.request_pay({
	           pg : 'html5_inicis.INIpayTest',
	           pay_method : 'card',
	           merchant_uid: "IMP"+makeMerchantUid, 
	           name : ""+$(coujson)+$(cojson)+$(rtjson)+"",
	           amount : 100000,
	           buyer_email : 'Iamport@chai.finance',
	           buyer_name : '아임포트 기술지원팀',
	           buyer_tel : '010-1234-5678'
	       }, function (rsp) { // callback
	             if (rsp.success) {
	                 console.log(rsp);
	             } else {
	                 console.log(rsp);
	             }
	          });
	    }
	</script>
</head>
<body>
   <header>    <!--header-->
        <div> <!--로그인 관련-->
             
          <c:if test = "${login == null}">   
            <p><a href="<%=request.getContextPath() %>/user/login.do">로그인</a></p>
            <p><a href="<%= request.getContextPath() %>/joinMain.do">회원가입</a></p>
            <p><a href="<%=request.getContextPath() %>/customerService/customerNotice.do">고객센터</a></p>
         </c:if><!-- 로그아웃 or 로그인x -->
         
        <c:if test = "${login != null}">
            
               <p><a href="">로그아웃</a></p>
               <c:if test = "${login.usertype eq 'a'}">
               <p><a href="">관리자 페이지</a></p>
               </c:if>
               <c:if test = "${login.usertype eq 'u'}">
               <p><a href="">마이 페이지</a></p>
               </c:if>
               <c:if test = "${login.usertype eq 'c'}">
               <p><a href="">상담사 페이지</a></p>
               </c:if>
               <p><a href="<%=request.getContextPath() %>/customerService/customerNotice.do">고객센터</a></p>
      </c:if>
      </div>
   
         
         <!-- fin 로그인 관련 -->
        <nav class="navbar" style="background-color: #dff6e1;"> <!-- 상단 네비게이션 -->
            <h1>
	            <a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/resources/upload/힐링캠프 logo.png" alt="홈버튼"></a></h1>
	            <a href="<%=request.getContextPath()%>/program.do">치료프로그램</a>
	            <a href="<%=request.getContextPath()%>/test.do">심리테스트</a>
	            <a href="<%=request.getContextPath()%>/community/community_list.do">커뮤니티</a>
	            <a href="<%=request.getContextPath()%>/res/findcenter.do">상담 예약</a>
	            <a href="<%=request.getContextPath()%>/counseller_board/counseller_board_list.do">상담사 게시판</a>
            <section></section>
        </nav> <!-- fin 상단 네비게이션 -->
    </header> <!--fin header-->
    <main>
        <h1>상담기관명</h1>
        <div id="resS"> <!-- 예약 순서 -->
            <div id="s1">상담/검사선택</div>
            <div id="s2">상담사 선택</div>
            <div id="s3">예약 일시</div>
        </div> <!-- fin 예약 순서 -->                
	    <div id="step1"> <!-- 상담 선택-->
	        <h2>1.상담 검사</h2>
	        <table class="table table-hover">
		        <tr id="n11"><td>상담 1</td><td>50분</td><td><button class="btn btn-outline-success" onclick="click11(this)">선택</button></td></tr>            
		        <tr id="n12"><td>상담 2</td><td>50분</td><td><button class="btn btn-outline-success" onclick="click12(this)">선택</button></td></tr>            
		        <tr id="n13"><td>상담 3</td><td>50분</td><td><button class="btn btn-outline-success" onclick="click13(this)">선택</button></td></tr>            
	        </table>            
	    </div>
	    <div id="step2">
	        <h2>2.당담 상담사</h2>
	        <table class="table table-hover">
		         <tr id="n21"><td>상담사</td><td>100000</td><td><button class="btn btn-outline-success" onclick="click21(this)">선택</button></td></tr>            
		         <tr id="n22"><td>상담사2</td><td>90000</td><td><button class="btn btn-outline-success" onclick="click22(this)">선택</button></td></tr>            
		         <tr id="n23"><td>상담사3</td><td>80000</td><td><button class="btn btn-outline-success" onclick="click23(this)">선택</button></td></tr>            
	        </table>          
	    </div>
        <div id="step3">
            <h2>3. 예약 일시</h2>
            <div id='calendar'></div>
        </div>
        <div id="res">
            <h2>예약상세</h2>
            <!-- <form method="post"> -->
            	<input type="hidden" name="uidx" id="uidx">
            	<input type="hidden" name="id" id="id">
	            <p>상담/검사 :<input type="text" name="counseling" id="counseling" readonly> </p>
	            <p>담당상담사 :<input type="text" name="couns" id="couns" readonly> </p>
	            <p>예약일 :<input type="text" name="resdate" id="resdate" readonly> </p>
	            <p>예약시간 : <input type="text" name="restime" id="restime" readonly> </p>
	            <p>상담비용 :<input type="number" name="rescount" id="rescount" readonly> </p>
	            <button class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath()%>/res/resf.do'">현장결제</button><!-- post양식으로 onclick으로 만들기 -->
	            <button class="btn btn-dark" onclick="requestPay()">지금결제</button> <!-- 결제 페이지 열기 --><!-- post양식으로 onclick으로 만들기 -->
            <!-- </form>  -->
        </div>
        <div id="modal" class="modal-overlay">
	        <div class="modal-window">
	            <div class="title">
	                <h2>예약가능 시간</h2>
	            </div>
	            <div class="close-area">X</div><br>
	            <input type="radio" name="reserve" class="content" value="09:00 ~ 12:00" onclick="modalClick1(this)"><label>09:00 ~ 12:00</label><br>
	            <input type="radio" name="reserve" class="content" value="12:00 ~ 15:00" onclick="modalClick2(this)"><label>12:00 ~ 15:00</label><br>
	            <input type="radio" name="reserve" class="content" value="15:00 ~ 18:00" onclick="modalClick3(this)"><label>15:00 ~ 18:00</label><br>
	            <input type="radio" name="reserve" class="content" value="18:00 ~ 21:00" onclick="modalClick4(this)"><label>18:00 ~ 21:00</label>
	        </div>
    	</div>        
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
<script src="<%=request.getContextPath()%>/resources/js/respage.js"></script>    
</body>
</html>