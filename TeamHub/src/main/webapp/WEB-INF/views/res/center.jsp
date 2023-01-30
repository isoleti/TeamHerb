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
    <title>기관</title>
     <!--부트스트랩, header footer css 연결-->
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <style>
        main{position: relative;}
        main h1{margin-left:15%; margin-bottom:2%;}
        main h2{margin-left:15%; margin-bottom:2%;}
        main #cp{width:50%; height:400px; margin-left:13%; display:inline-block; margin-bottom:3%;}
        main #res{width:30%; height:100%; display:inline-block; background-color: azure; position:absolute; right:5%;}
        main #res p{margin-top:5%; margin-left:10%; display:inline-block;}
        main #res #res1{margin-top:25%; margin-left:15%;}
        main #res #res2{margin-left:25%;}
        main #res .cal{margin-bottom:15%;}
        main #res #test{margin-top:5%; margin-left:10%;}
        main #res #test table{width:80%;}
        main #res #test table td{width:25%;}
        main #res #test table td button{margin:0; width:100px; display:inline-block; margin-left:5%;}
        main .btn-outline-success,
        main .btn-dark{width:32.5%; margin-top:5%; margin-left:10%; margin-bottom:5%;}
        main .cou{width:50%; margin-left:13%; margin-bottom:5%;}
        main .cou p{margin-left:25%;}
        main #cenN{width:50%; margin-left:13%; margin-bottom:5%;}
        main #cenN div{display:inline-block;margin-left:10%; margin-right:10%; }
        main #notice p{margin-left:15%; margin-bottom:3%;}
        main #review{width:50%; margin-left:13%; margin-bottom:5%;}
        main #review p{margin-left:5%;}
        main #resInfo{width:50%; margin-left:13%; margin-bottom:5%;}
        main #resInfo dt{margin-left:5%;}
        main #resInfo dl{margin-top:1%;}
        main #faq{width:50%; margin-left:13%; margin-bottom:5%;}
        main #faq .faqmenu{width:15%; height:40px;display:inline-block; margin:0; margin-left:-3px; margin-right:-3px; border:1px solid #000; text-align:center;}
        main #faq .accordion  .accordion-button{width:100%;}
        main #map{margin-left:25%; }
        main .cal #calendar tr{height:45px;}
    </style>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
     <script>
    
     	function like_func(){
		  var frm_read = $('#frm_read');
		  var center = $('#center', frm_read).val();
		  var uidx = $('#uidx', frm_read).val();
		  console.log("center, uidx : " + center +","+ uidx);
		  
		  $.ajax({
		    url: "../res/like.do",
		    type: "GET",
		    cache: false,
		    dataType: "json",
		    data: 'center=' +center+ '&uidx=' +uidx,
		    success: function(data) {
			      var msg = '';
			      var like_img = '';
			      msg += data.msg;
			      alert(msg);
			      
			      if(data.like_check == 0){
			        like_img = "./images/dislike.png";
			      } else {
			        like_img = "./images/like.png";
			      }      
			      $('#like_img', frm_read).attr('src', like_img);
			      $('#like_cnt').html(data.like_cnt);
			      $('#like_check').html(data.like_check);
		    },
		    error: function(request, status, error){
		      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		  });
		}
     </script>
     <script src="<%=request.getContextPath()%>/resources/js/index.global.js"></script> 
	 <script>
	
	      document.addEventListener('DOMContentLoaded', function() {
	    	  
	        var calendarEl = document.getElementById('calendar');
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	            initialView: 'timeGridWeek',
	            slotDuration: '03:00:00',	
	            headerToolbar:{
	                start: "",
	                center: "title",
	                end: "timeGridWeek dayGridDay",
	            },  
	            titleFormat : function(date) { // title 설정
	            	  return date.date.year +"년 "+(date.date.month +1)+"월"; 
	            	  }, 
	           	dayHeaderContent: function (date) {
	            	  let weekList = ["일", "월", "화", "수", "목", "금", "토"];
	            	  return weekList[date.dow];
	            		},
	            navLinks: true,
	            selectable: true,
	            selectMirror: true,	    
	            allDaySlot: false, // allDay 표시 안함	
	          });
	        calendar.render();
	      });
	
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
            <h1><a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/resources/upload/힐링캠프 logo.png" alt="홈버튼"></a></h1>
           <a href="<%=request.getContextPath()%>/program.do">치료프로그램</a>
            <a href="<%=request.getContextPath()%>/test.do">심리테스트</a>
            <a href="<%=request.getContextPath()%>/community/community_list.do">커뮤니티</a>
            <a href="<%=request.getContextPath()%>/res/findcenter.do">상담 예약</a>
            <a href="<%=request.getContextPath()%>/counseller_board/counseller_board_list.do">상담사 게시판</a>
            <section></section>
        </nav> <!-- fin 상단 네비게이션 -->
    </header> <!--fin header-->
    <main>
        <h1>기관명</h1>
        <div id="cp"> <!--기관 사진-->
            <img src="" alt="">
            <img src="" alt="">
            <img src="" alt="">
            <img src="" alt="">
        </div>
        <div id="res"><!-- 예약 및 일정-->   
	        <c:choose>
			    <c:when test="${mno ne null}">
			     <p id="res1">
			     	<a href='javascript: like_func();'>
			     		<img width="20px" height="20px" src="<%=request.getContextPath()%>/resources/upload/like2	.png" alt = "좋아요 표시">
			     	</a>
			     </p>
			    </c:when>
			    <c:otherwise>
			     <a href='javascript: login_need();'></a>
			    </c:otherwise>
			</c:choose>
		    <a href='#'><img width="20px" height="20px" src="<%=request.getContextPath()%>/resources/upload/dislike.png" alt = "좋아요 표시"></a>［<span id='reply_cnt'></span>］명이 좋아합니다
		    <span id='like_cnt' style='margin-left: 5px;'></span>          
            <p id="res2"><i class="xi-share-alt"></i>공유하기</p><br>
            <p></p><br>   
            <p>기관설명 기관명</p><br>
            <p>주요 상담분야</p><br>
            <p>주소 :</p><br>
            <P>전화 : </P><br>
            <button class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath()%>/res/respage.do'">예약하기</button>
            <button class="btn btn-dark">문의하기</button>
            <div class="cal"> <!--상담사 상담 일정-->
                <p>상담사 : </p>
                <div id='calendar'></div>
            </div><!-- fin 상담사 일정-->
            <div id="test"> <!--상담 및 검사 안내-->
                <table class="table table-striped">
                    <tr><th>상담 종류</th><td><button class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath()%>/res/respage.do'">예약하기</button></td></tr>                    
                    <tr><th>상담 종류</th><td><button class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath()%>/res/respage.do'">예약하기</button></td></tr>                    
                    <tr><th>상담 종류</th><td><button class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath()%>/res/respage.do'">예약하기</button></td></tr>                    
                    <tr><th>상담 종류</th><td><button class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath()%>/res/respage.do'">예약하기</button></td></tr>                    
                </table>
            </div><!-- fin test-->
        </div><!--예약 및 일정-->
        <div id="cenN"><!-- 센터 책갈피-->
            <div>기관 소개</div>
            <div>상담 후기</div>
            <div>상담 안내</div>
        </div>
        <h2>상담사 소개</h2>
        <div class="cou"><!--상담사 설명-->
            <img src="" alt="">
            <p>상담사 명</p>
            <dt>학력
                <dl></dl>
                <dl></dl>
                <dl></dl>
                <dl></dl>
            </dt>
            <dt>자격증
                <dl></dl>
                <dl></dl>
                <dl></dl>
                <dl></dl>
            </dt>
            <dt>논문 및 저서
                <dl></dl>
                <dl></dl>
                <dl></dl>
                <dl></dl>
                <dl></dl>
            </dt>
            <dt>경력
                <dl></dl>
                <dl></dl>
                <dl></dl>
                <dl></dl>
            </dt>
        </div>
        <h2>안내말씀</h2>
        <div id="notice">
            <p>&nbsp;대충 우리기관 사람들 고오오오오급 인력이에요.<br> 
            힐링되고 피가되고 살이되는 말이라는 내용의 말들로 힐링해드리는중<br>
            암튼 오면 잘해드림ㅇㅇㅇ 일단 부담없이 꺼먼꺼먼
            </p>
        </div>
        <h2>상담 후기</h2>
        <div id="review"><!-- 상담후기 -->
            <dt>
                <dl>
                    <p><i class="xi-user xi-2x"></i> 내담자</p>
                    <p>상담이 섬세하고 상담사님이 친절해요.</p>
                </dl>
            </dt>
        </div>
        <h2>예약 안내</h2>
        <div id="resInfo"> <!--예약관련 아내-->
            <dt>01 예약 환불안내
                <dl>100프로 환불 시점 및 그 이후에 관한 안내</dl>
            </dt>
            <dt>02 예약 후 방문 안내
                <dl>예약 후 방문에 관한 안내</dl>
            </dt>
            <dt>03 현장 결제 안내
                <dl>현장 결제시 유의 사항 안내</dl>
            </dt>
            <dt>04 안내
                <dl>뭘 안내?</dl>
            </dt>
        </div>
        <h2>FAQ</h2>
        <div id="faq">
            <div class="faqmenu">전체</div>
            <div class="faqmenu">심리상담</div>
            <div class="faqmenu">예약/결제</div>
            <div class="faqmenu">기타</div>
            <div class="accordion" id="accordionExample">
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                      faq 질문
                    </button>
                  </h2>
                  <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                      <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                      Accordion Item #2
                    </button>
                  </h2>
                  <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                      <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                      Accordion Item #3
                    </button>
                  </h2>
                  <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                      <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                    </div>
                  </div>
                </div>
              </div>           
        </div>
        <h2>오시는 길</h2>
        <div id="map" style="width:550px;height:400px;"></div>	
       		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=387e40e57d47d09b22e39f6b21c6fd82"></script>		
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
	
				var map = new kakao.maps.Map(mapContainer, mapOption);
		
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
		
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});
		
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
		
				var iwContent = '<div style="padding:5px;">Hello World! <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다
		
				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
				    position : iwPosition, 
				    content : iwContent 
				});
			</script>           	
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