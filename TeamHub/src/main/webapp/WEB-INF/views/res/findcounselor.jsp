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
    <title>상담사 찾기</title>
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/map.css" rel="stylesheet">
    <style>
        main #map{margin-left:20%; margin-bottom:5%;}
        main .map_wrap{margin-bottom:3%;}
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
        <dt>
            <dl><a href="<%=request.getContextPath()%>/res/findcenter.do">센터 찾기</a></dl>
            <dl><a href="<%=request.getContextPath()%>/res/findcounselor.do">상담사 찾기</a></dl>
        </dt>
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
        <div class="map_wrap">
		    <div id="map" style="width:45%;height:100%;position:relative;overflow:hidden;"></div>
		
			    <div id="menu_wrap" class="bg_white">
			        <div class="option">
			            <div>
			                <form onsubmit="searchPlaces(); return false;">
			                    키워드 : <input type="text" value="심리상담" id="keyword" size="15"> 
			                    <button class="btn btn-outline-success" type="submit">검색하기</button> 
			                </form>
			            </div>
			        </div>
			        <hr>
			        <ul id="placesList"></ul>
			        <div id="pagination"></div>
			    </div>
		</div>
        	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=387e40e57d47d09b22e39f6b21c6fd82&libraries=services"></script>
				<script>
					// 마커를 담을 배열입니다
					var markers = [];
					
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = {
					        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };  
					
					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
					
					// 장소 검색 객체를 생성합니다
					var ps = new kakao.maps.services.Places();  
					
					// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow({zIndex:1});
					
					// 키워드로 장소를 검색합니다
					searchPlaces();
					
					// 키워드 검색을 요청하는 함수입니다
					function searchPlaces() {
					
					    var keyword = document.getElementById('keyword').value;
					
					    if (!keyword.replace(/^\s+|\s+$/g, '')) {
					        alert('키워드를 입력해주세요!');
					        return false;
					    }
					
					    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
					    ps.keywordSearch( keyword, placesSearchCB); 
					}
					
					// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
					function placesSearchCB(data, status, pagination) {
					    if (status === kakao.maps.services.Status.OK) {
					
					        // 정상적으로 검색이 완료됐으면
					        // 검색 목록과 마커를 표출합니다
					        displayPlaces(data);
					
					        // 페이지 번호를 표출합니다
					        displayPagination(pagination);
					
					    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
					
					        alert('검색 결과가 존재하지 않습니다.');
					        return;
					
					    } else if (status === kakao.maps.services.Status.ERROR) {
					
					        alert('검색 결과 중 오류가 발생했습니다.');
					        return;
					
					    }
					}
					
					// 검색 결과 목록과 마커를 표출하는 함수입니다
					function displayPlaces(places) {
					
					    var listEl = document.getElementById('placesList'), 
					    menuEl = document.getElementById('menu_wrap'),
					    fragment = document.createDocumentFragment(), 
					    bounds = new kakao.maps.LatLngBounds(), 
					    listStr = '';
					    
					    // 검색 결과 목록에 추가된 항목들을 제거합니다
					    removeAllChildNods(listEl);
					
					    // 지도에 표시되고 있는 마커를 제거합니다
					    removeMarker();
					    
					    for ( var i=0; i<places.length; i++ ) {
					
					        // 마커를 생성하고 지도에 표시합니다
					        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
					            marker = addMarker(placePosition, i), 
					            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
					
					        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
					        // LatLngBounds 객체에 좌표를 추가합니다
					        bounds.extend(placePosition);
					
					        // 마커와 검색결과 항목에 mouseover 했을때
					        // 해당 장소에 인포윈도우에 장소명을 표시합니다
					        // mouseout 했을 때는 인포윈도우를 닫습니다
					        (function(marker, title) {
					            kakao.maps.event.addListener(marker, 'mouseover', function() {
					                displayInfowindow(marker, title);
					            });
					
					            kakao.maps.event.addListener(marker, 'mouseout', function() {
					                infowindow.close();
					            });
					
					            itemEl.onmouseover =  function () {
					                displayInfowindow(marker, title);
					            };
					
					            itemEl.onmouseout =  function () {
					                infowindow.close();
					            };
					        })(marker, places[i].place_name);
					
					        fragment.appendChild(itemEl);
					    }
					
					    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
					    listEl.appendChild(fragment);
					    menuEl.scrollTop = 0;
					
					    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
					    map.setBounds(bounds);
					}
					
					// 검색결과 항목을 Element로 반환하는 함수입니다
					function getListItem(index, places) {
					
					    var el = document.createElement('li'),
					    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
					                '<div class="info">' +
					                '   <h5>' + places.place_name + '</h5>';
					
					    if (places.road_address_name) {
					        itemStr += '    <span>' + places.road_address_name + '</span>' +
					                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
					    } else {
					        itemStr += '    <span>' +  places.address_name  + '</span>'; 
					    }
					                 
					      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
					                '</div>';           
					
					    el.innerHTML = itemStr;
					    el.className = 'item';
					
					    return el;
					}
					
					// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
					function addMarker(position, idx, title) {
					    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
					        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
					        imgOptions =  {
					            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
					            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
					            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
					        },
					        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
					            marker = new kakao.maps.Marker({
					            position: position, // 마커의 위치
					            image: markerImage 
					        });
					
					    marker.setMap(map); // 지도 위에 마커를 표출합니다
					    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
					
					    return marker;
					}
					
					// 지도 위에 표시되고 있는 마커를 모두 제거합니다
					function removeMarker() {
					    for ( var i = 0; i < markers.length; i++ ) {
					        markers[i].setMap(null);
					    }   
					    markers = [];
					}
					
					// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
					function displayPagination(pagination) {
					    var paginationEl = document.getElementById('pagination'),
					        fragment = document.createDocumentFragment(),
					        i; 
					
					    // 기존에 추가된 페이지번호를 삭제합니다
					    while (paginationEl.hasChildNodes()) {
					        paginationEl.removeChild (paginationEl.lastChild);
					    }
					
					    for (i=1; i<=pagination.last; i++) {
					        var el = document.createElement('a');
					        el.href = "#";
					        el.innerHTML = i;
					
					        if (i===pagination.current) {
					            el.className = 'on';
					        } else {
					            el.onclick = (function(i) {
					                return function() {
					                    pagination.gotoPage(i);
					                }
					            })(i);
					        }
					
					        fragment.appendChild(el);
					    }
					    paginationEl.appendChild(fragment);
					}
					
					// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
					// 인포윈도우에 장소명을 표시합니다
					function displayInfowindow(marker, title) {
					    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
					
					    infowindow.setContent(content);
					    infowindow.open(map, marker);
					}
					
					 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
					function removeAllChildNods(el) {   
					    while (el.hasChildNodes()) {
					        el.removeChild (el.lastChild);
					    }
					}
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