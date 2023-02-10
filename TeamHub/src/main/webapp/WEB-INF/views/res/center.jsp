<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page import="project.healingcamp.vo.ReserveVO" %>
<%List<ReserveVO> centerlist = (List<ReserveVO>)request.getAttribute("centerlist");  %>
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
        main #map{margin-left:25%; }
        main .cal #calendar tr{height:45px;}
    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
		function respage(){
			alert("로그인 후 사용하세요");
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
        <h1>${reserveVO.centername}</h1>
        <div id="cp"> <!--기관 사진-->
            <img src="" alt="">
        </div>
        <div id="res"><!-- 예약 및 일정-->   
            <p></p><br>   
            <p>기관명 : ${reserveVO.centername }</p><br>            
            <p>주소 : ${reserveVO.centeraddr }</p><br>
            <P>전화 : ${reserveVO.centercall }</P><br>
            <c:if test = "${login == null}"> 
            	<button class="btn btn-outline-success" onclick="respage()">로그인 후 사용하세요</button>
            </c:if>
            <c:if test = "${login != null}"> 
            	<button class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath()%>/res/respage.do?cnoidx=${reserveVO.cnoidx }'">예약하기</button>
            </c:if>
            <div class="cal"> <!--상담사 상담 일정-->
                <div id='calendar'></div>
            </div><!-- fin 상담사 일정-->
            <div id="test"> <!--상담 및 검사 안내-->
            <c:if test = "${login == null}">   
                <table class="table table-striped">
                <c:forEach items="${centerlist}" var="vo" varStatus="status">
                <c:if test="${not empty vo.con1}">
                    <tr><th>${vo.con1 }</th><td><button class="btn btn-outline-success" onclick="respage()">로그인 후 사용하세요</button></td></tr>
                </c:if>   
                <c:if test="${not empty vo.con2}">                 
                    <tr><th>${vo.con2 }</th><td><button class="btn btn-outline-success" onclick="respage()">로그인 후 사용하세요</button></td></tr>                    
                </c:if>
                <c:if test="${not empty vo.con3}">    
                    <tr><th>${vo.con3 }</th><td><button class="btn btn-outline-success" onclick="respage()">로그인 후 사용하세요</button></td></tr>                    
                </c:if>
                <c:if test="${not empty vo.con4}">    
                    <tr><th>${vo.con4 }</th><td><button class="btn btn-outline-success" onclick="respage()">로그인 후 사용하세요</button></td></tr>                    
                </c:if>
                <c:if test="${not empty vo.con5}">    
                    <tr><th>${vo.con5 }</th><td><button class="btn btn-outline-success" onclick="respage()">로그인 후 사용하세요</button></td></tr>                    
                </c:if>
                </c:forEach>
                </table>
            </c:if>    
            <c:if test = "${login != null}">
            	<c:forEach items="${centerlist}" var="vo" varStatus="status">   
                <table class="table table-striped">
                	<c:if test="${not empty vo.con1}">
                    <tr><th>${vo.con1 }</th><td><button class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath()%>/res/respage.do?cnoidx=${reserveVO.cnoidx }'">예약하기</button></td></tr>                    
                    </c:if>
                     <c:if test="${not empty vo.con2}">
                    <tr><th>${vo.con2 }</th><td><button class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath()%>/res/respage.do?cnoidx=${reserveVO.cnoidx }'">예약하기</button></td></tr>                    
                    </c:if>
                    <c:if test="${not empty vo.con3}">
                    <tr><th>${vo.con3 }</th><td><button class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath()%>/res/respage.do?cnoidx=${reserveVO.cnoidx }'">예약하기</button></td></tr>                    
                    </c:if>
                     <c:if test="${not empty vo.con4}">
                    <tr><th>${vo.con4 }</th><td><button class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath()%>/res/respage.do?cnoidx=${reserveVO.cnoidx }'">예약하기</button></td></tr>
                    </c:if>
                    <c:if test="${not empty vo.con5}">
                    <tr><th>${vo.con5 }</th><td><button class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath()%>/res/respage.do?cnoidx=${reserveVO.cnoidx }'">예약하기</button></td></tr>
                    </c:if>
                </table>
                </c:forEach>
            </c:if>
            </div><!-- fin test-->
        </div><!--예약 및 일정-->
        <div id="cenN"><!-- 센터 책갈피-->
            <div>기관 소개</div>
            <div>상담 후기</div>
            <div>상담 안내</div>
        </div>
        <c:forEach items="${centerlist}" var="vo" varStatus="status">
        <h2>상담사 소개</h2>
        <div class="cou"><!--상담사 설명-->
            <h3>${vo.name }</h3>
            <dt>
            	<h3>학력</h3>
                <dl>${vo.grade }</dl>
            </dt>
            <dt>
            	<h3>자격증</h3>
	            <c:if test="${not empty vo.certi1}">
	                <dl>${vo.certi1 }</dl>
	            </c:if>
	            <c:if test="${not empty vo.certi2}">
	                <dl>${vo.certi2 }</dl>
	            </c:if>
	            <c:if test="${not empty vo.certi3}">
	                <dl>${vo.certi3 }</dl>
	            </c:if>
	            <c:if test="${not empty vo.certi4}">
	                <dl>${vo.certi4 }</dl>
	            </c:if>
            </dt>
            <dt>
              <h3>논문 및 저서</h3>
               <c:if test="${not empty vo.article1}">
                <dl>${vo.article1 }</dl>
               </c:if>
               <c:if test="${not empty vo.article2}">
                <dl>${vo.article2 }</dl>
               </c:if>
               <c:if test="${not empty vo.article3}">
                <dl>${vo.article3 }</dl>
               </c:if>
               <c:if test="${not empty vo.article4}">
                <dl>${vo.article4 }</dl>
               </c:if>
            </dt>            
        </div>
        </c:forEach>
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
                <dl>더 궁금하신 상황이 있으시다면 문의 전화를 주시기 바랍니다.</dl>
            </dt>
        </div>
        <h2>오시는 길</h2>
        <div id="map" style="width:550px;height:400px;"></div>	
       		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=387e40e57d47d09b22e39f6b21c6fd82&libraries=services"></script>		
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 

				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places(); 

				// 키워드로 장소를 검색합니다
				ps.keywordSearch('${reserveVO.centername}' , placesSearchCB); 
				
				// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({zIndex:1});
				
				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB (data, status, pagination) {
				    if (status === kakao.maps.services.Status.OK) {

				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				        // LatLngBounds 객체에 좌표를 추가합니다
				        var bounds = new kakao.maps.LatLngBounds();

				        for (var i=0; i<data.length; i++) {
				            displayMarker(data[i]);    
				            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
				        }       

				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				        map.setBounds(bounds);
				    } 
				}

				// 지도에 마커를 표시하는 함수입니다
				function displayMarker(place) {
				    
				    // 마커를 생성하고 지도에 표시합니다
				    var marker = new kakao.maps.Marker({
				        map: map,
				        position: new kakao.maps.LatLng(place.y, place.x) 
				    });

				    // 마커에 클릭이벤트를 등록합니다
				    kakao.maps.event.addListener(marker, 'click', function() {
				        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
				        infowindow.open(map, marker);
				    });
				}
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