<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" style="--vh:5.02px;">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상담사 찾기</title>
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">
    <style>
        main #map{margin-left:15%; margin-bottom:5%;}
        main .center{width:60%; border:3px solid #dff6e1; border-radius:2ch; margin-left:20%;}
        main dt{width:20%; margin-left:75%; margin-bottom:0.75%;}
        main dt dl{display:inline-block; margin-right:5%;}
        main form{width:30%; margin-left:70%; margin-bottom:1.75%;}
        main div p{margin-left:15%; margin-top:1%;}
        .form-select{width:30%; display:inline-block;}
        button{margin-left:10%;}
    </style>
</head>
<body>
    <header>    <!--header-->
        <div> <!--로그인 관련-->
       <%--<%if(uidx == null) {%>--%>
            <p><a href="">로그인</a></p>
            <p><a href="">회원가입</a></p>
            <p><a href="">고객센터</a></p>
       <%-- <%}else if(usertype.equals("admin") ){ %>--%>
           <!--  
            <p><a href="">로그아웃</a></p>
            <p><a href="">관리자 페이지</a></p>
            <p><a href="">고객센터</a></p>
        <%--<%}else if(usertype.equals("coun")){ %>--%>
        	<p><a href="">로그아웃</a></p>
            <p><a href="">상담사 페이지</a></p>
            <p><a href="">고객센터</a></p>
        <%--<%}else {%>--%>
         	<p><a href="">로그아웃</a></p>
            <p><a href="">마이 페이지</a></p>
            <p><a href="">고객센터</a></p>
         <%--<%} %> --%>   
             -->
          
        </div> <!-- fin 로그인 관련 -->
        <nav class="navbar" style="background-color: #dff6e1;"> <!-- 상단 네비게이션 -->
            <h1><a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/resources/upload/힐링캠프 logo.png" alt="홈버튼"></a></h1>
           <a href="<%=request.getContextPath()%>/program.do">치료프로그램</a>
            <a href="<%=request.getContextPath()%>/test.do">심리테스트</a>
            <a href="">커뮤니티</a>
            <a href="<%=request.getContextPath()%>/res/findcenter.do">상담 예약</a>
            <a href="">상담사 게시판</a>
            <section></section>
        </nav> <!-- fin 상단 네비게이션 -->
    </header> <!--fin header-->
    <main>
        <dt>
            <dl><a href="<%=request.getContextPath()%>/res/findcenter.do">센터 찾기</a></dl>
            <dl><a href="<%=request.getContextPath()%>/res/findcounselor.do">상담사 찾기</a></dl>
        </dt>
        <button class="btn btn-outline-success">위치</button>
        <form>
        <select class="form-select" aria-label="Default select example">
            <option selected>선택</option>
            <option value="">상담 기관</option>
            <option value="">심리 상담사</option>
            <option value="">상담사 등급</option>
        </select>        
        <input type="text">
        <input class="btn btn-outline-success" type="button" value="검색">
        </form>
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
        <div class="center" onclick="location.href='<%=request.getContextPath()%>/res/center.do'">
            <p>상담사 : </p>
            <p>상담사 등급 : </p>
            <p>전문분야 : </p>
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
</body>
</html>