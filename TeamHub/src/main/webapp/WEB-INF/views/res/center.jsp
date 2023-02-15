<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page import="project.healingcamp.vo.ReserveVO" %>
<%List<ReserveVO> centerlist = (List<ReserveVO>)request.getAttribute("centerlist");  %>
<%List<ReserveVO> reslist = (List<ReserveVO>)request.getAttribute("reslist");  %>
<%List<ReserveVO> reviewlist = (List<ReserveVO>)request.getAttribute("reviewlist");  %>
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
        main #cp img{width:75%;}
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
        main #cenN{width:50%; margin-left:13%; margin-top:5%; margin-bottom:5%; font-weight:bold;}
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
	    	var name= document.getElementById("cn").innerHTML;
	    	
	        var calendarEl = document.getElementById('calendar');
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	            initialView: 'timeGridWeek',
	            slotDuration: '03:00:00',
	            minTime: '09:00:00',
	            maxTime: '21:00:00',	
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
	            navLinks: true,  // can click day/week names to navigate views
	            selectable: true,
	            selectMirror: true,	    
	            allDaySlot: false, // allDay 표시 안함
	            
	         
	            droppable : true,
	        	editable : true,
	        	events : [
	                    <%if (reslist != null) {%>
	                    <%for (ReserveVO vo : reslist) {%>
	                    	{
	                    	title : '<%=vo.getCouns() %>',
	                        start : '<%=vo.getStart() %>',
	                        end : '<%=vo.getEnd() %>',
	                        color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
	                     	},
	        			<%}
	        			}%>
	        				]
	        				
	        			
	          });
	        calendar.render();
	      });
		function respage(){
			alert("로그인 후 사용하세요");
		}
		function admin(){
			alert("페이지 관리 잘 부탁드립니다.");
		}
		function couns(){
			alert("좋은 상담해주세요.");
		}
		function nextpage(){
			var fm = document.frm;
			
			fm.action= "<%=request.getContextPath()%>/res/respage.do"
			fm.submit();
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
        <h1 id="cn">${reserveVO.centername}</h1>
        <div id="cp"> <!--기관 사진-->
            <img src="<%=request.getContextPath()%>/resources/images/상담소2.jpg" alt="상담소 이미지">
        </div>
        <div id="res"><!-- 예약 및 일정-->   
            <p></p><br>   
            <p>기관명 : ${reserveVO.centername }</p><br>            
            <p>주소 : ${reserveVO.centeraddr }</p><br>
            <P>전화 : ${reserveVO.centercall }</P><br>
            <c:if test = "${login == null}"> 
            	<button class="btn btn-outline-success" onclick="respage()">로그인 후 사용하세요</button>
            </c:if>
            <c:if test = "${login.usertype eq 'u'}"> 
            	<button class="btn btn-outline-success" onclick="nextpage()">예약하기</button>
            </c:if>
            <c:if test = "${login.usertype eq 'a'}"> 
            	<button class="btn btn-outline-success" onclick="admin()">예약하기</button>
            </c:if>
            <c:if test = "${login.usertype eq 'c'}"> 
            	<button class="btn btn-outline-success" onclick="couns()">예약하기</button>
            </c:if>
            <div class="cal"> <!--상담사 상담 일정-->
                <div id='calendar'></div>
            </div><!-- fin 상담사 일정-->
            <div id="test"> <!--상담 및 검사 안내-->
            <c:if test = "${login == null}">   
                <table class="table table-striped">
                <c:if test="${not empty reserve.con1}">
                    <tr><th>${reserve.con1 }</th><td><button class="btn btn-outline-success" onclick="respage()">로그인 후 사용하세요</button></td></tr>
                </c:if>
                </table>
            </c:if>    
            <c:if test = "${login.usertype eq 'u'}">
            	   
                <table class="table table-striped">
                	<c:if test="${not empty reserve.con1}">
                    <tr><th>${reserve.con1 }</th><td><button class="btn btn-outline-success" onclick="nextpage()">예약하기</button></td></tr>                    
                    </c:if>
                     <c:if test="${not empty reserve.con2}">
                    <tr><th>${reserve.con2 }</th><td><button class="btn btn-outline-success" onclick="nextpage()">예약하기</button></td></tr>                    
                    </c:if>
                    <c:if test="${not empty reserve.con3}">
                    <tr><th>${reserve.con3 }</th><td><button class="btn btn-outline-success" onclick="nextpage()">예약하기</button></td></tr>                    
                    </c:if>
                </table>              
            </c:if>
            <c:if test = "${login.usertype eq 'a'}">
            	   
                <table class="table table-striped">
                	<c:if test="${not empty reserve.con1}">
                    <tr><th>${reserve.con1 }</th><td><button class="btn btn-outline-success" onclick="admin()">예약하기</button></td></tr>                    
                    </c:if>
                     <c:if test="${not empty reserve.con2}">
                    <tr><th>${reserve.con2 }</th><td><button class="btn btn-outline-success" onclick="admin()">예약하기</button></td></tr>                    
                    </c:if>
                    <c:if test="${not empty reserve.con3}">
                    <tr><th>${reserve.con3 }</th><td><button class="btn btn-outline-success" onclick="admin()">예약하기</button></td></tr>                    
                    </c:if>
                </table>              
            </c:if>
            <c:if test = "${login.usertype eq 'c'}">
            	   
                <table class="table table-striped">
                	<c:if test="${not empty reserve.con1}">
                    <tr><th>${reserve.con1 }</th><td><button class="btn btn-outline-success" onclick="couns()">예약하기</button></td></tr>                    
                    </c:if>
                     <c:if test="${not empty reserve.con2}">
                    <tr><th>${reserve.con2 }</th><td><button class="btn btn-outline-success" onclick="couns()">예약하기</button></td></tr>                    
                    </c:if>
                    <c:if test="${not empty reserve.con3}">
                    <tr><th>${reserve.con3 }</th><td><button class="btn btn-outline-success" onclick="couns()">예약하기</button></td></tr>                    
                    </c:if>
                </table>              
            </c:if>
            </div><!-- fin test-->
        </div><!--예약 및 일정-->
        <div id="cenN"><!-- 센터 책갈피-->
            <div><a href="#review2">상담후기</a></div>
            <div><a href="#resInfo2">예약 안내</a></div>
        </div>
        <c:forEach items="${centerlist}" var="vo" varStatus="status">
        <h2>상담사 소개</h2>
        <div class="cou"><!--상담사 설명-->
            <h3>${vo.name }</h3>
            <br>
            <dt>
            	<h4>학력</h4><br>
                <dl>${vo.grade }</dl>
            </dt><br>
            <dt>
            	<h4>자격증</h4><br>
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
            </dt><br>
            <dt>
              <h4>논문 및 저서</h4><br>
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
            <p>&nbsp; 마음에 안식을 드리고픈 ${reserveVO.centername }입니다.<br> 
            세상에 살면서 몸이 힘든 것만 아니라 정신이 힘든 것, 사람 때문에 힘든 것도 상처입니다.<br>
            상담이 필요하시다면 부담 갖지 말고 상담신청해주세요.
            </p>
        </div>
        <h2 id="review2">상담 후기</h2>
        <div id="review"><!-- 상담후기 -->
             <c:forEach items="${reviewlist}" var="vo" varStatus="status">
            <dt>
            	<c:if test="${not empty vo.rcontent}">
                <dl>
                    <p><i class="xi-user xi-2x"></i> 익명</p>
                    <p>${vo.rcontent }</p>
                </dl>
                </c:if>
            </dt>
            </c:forEach>
        </div>
        <h2 id="resInfo2">예약 안내</h2>
        <div id="resInfo"> <!--예약관련 아내-->
            <dt>
            	<h4>01 예약 환불안내</h4><br>
                <dl>100% 환불 : 상담 전날까지</dl>
                <dl>당일 환불 : 50%환불</dl>
                <dl>예약 후 상담 시간에 오지 않으실 경우 환불이 불가하오니 주의하여 주시기 바랍니다</dl>
                <dl>현장 결제 당일 노쇼의 경우, 사이트 이용에 불이익이 생길 수 있으니 주의하시기 바랍니다.</dl>
            </dt><br>
            <dt>
            	<h4>02 예약 후 방문 안내</h4><br>
                <dl>예약 후 방문은 상담소로 오시면 되며, 궁금하신 사항이 있으신 경우 전화로 문의하실 수 있습니다.</dl>
            </dt><br>
            <dt>
            	<h4>03 현장 결제 안내</h4><br>
                <dl>현장 결제시 예약시간과 상담사님을 말해주시고 결제바랍니다.</dl>
            </dt><br>
            <dt>
            	<h4>04 안내</h4><br>
                <dl>더 궁금하신 상황이 있으시다면 상담소로 문의 전화를 주시기 바랍니다.</dl>
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
			<form name="frm" method="post">
				<input type="hidden" name="centername" value="${reserveVO.centername }">
				<input type="hidden" name="cnoidx" value="${reserveVO.cnoidx }">
			</form>		
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