<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="project.healingcamp.vo.Community_BoardVO" %>
<%@ page session="true" %>
<%List<Community_BoardVO> counseller_board_list = (List<Community_BoardVO>)request.getAttribute("counseller_board_list");%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>힐링캠프</title>
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>
  	<style>
       
        main{
            width:1024px;
            margin:0 auto;
        }
        main #left_nav{
            background-color: rgb(183,214,163);
            border-radius: 10px;
            padding:20px;
            display: inline-flex;
            flex-direction: column;
            float:left;
            margin-right:30px;
        }
        main #left_nav h3{
            font-weight: bold;
        }
        main #left_nav ul{
            margin-bottom:0rem;
        }
        main #left_nav li{
            padding:10px 0;
            font-size: 17px;
        }
        #search_wrapper{
            display: flex;
            margin-bottom:15px;
        }
        #search_wrapper #searchType{
        height:32px;
        border-radius:5px;
        }
        #search_wrapper #searchVal{
        height:32px;
        width:300px;
        border-radius:5px;
        }
        #search_wrapper #search_btn{
        height:32px;
        border-style: none;
        padding:0 20px;
        background-color: rgb(183,214,163);
        border-radius: 5px;
        font-weight: bold;
        }
        #filter{
        display:flex;
        flex-direction: row-reverse;
        }
        #filter_option{
        margin-bottom:0rem;
        padding-left:0rem;
        display:inline-flex;
        font-size:14px;
        }
        #filter_option li{
        padding:0 10px;
        list-style:none;
        }
        #filter_option li:nth-child(2){
        border-left:1px solid gray;
        border-right:1px solid gray;
        }
        #filter_option button{
		border-style:none;
		background:none;
		}
        #list{
        display:flex;
        margin-top:15px;
        }
        #list table{
        text-align: center;
        background-color: #EBF1E9;
        margin-bottom:20px;
        }
        #list table tr{
        border-bottom:1px solid white;
        }
        #list table tr th{
        font-weight:bold;
        }
        #list table tr th,td{
        padding:5px;
        }
        #delete_btn_wrapper{
        display: flex;
        flex-direction: row-reverse;
        }
        #deleteBtn{
        height:32px;
        border-style: none;
        padding:0 20px;
        background-color: rgb(183,214,163);
        border-radius: 5px;
        font-weight: bold;
        }
        .sortActive{
        font-weight: bold;
        }
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
            
               <p><a href="<%=request.getContextPath()%>/user/logout.do">로그아웃</a></p>
               <c:if test = "${login.usertype eq 'a'}">
               <p><a href="<%=request.getContextPath() %>/adminPage/adminPage_Member_List.do">관리자 페이지</a></p>
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
       <div id="left_nav">
            <h3>관리자 페이지</h3>
            <ul>
                <li><a href="<%=request.getContextPath() %>/adminPage/adminPage_Member_List.do">회원관리</a></li>
                <li><a href="<%=request.getContextPath() %>/adminPage/adminPage_Counseller_List.do">상담사관리</a></li>
                <li><a href="<%=request.getContextPath() %>/adminPage/adminPage_Community_List.do">커뮤니티관리</a></li>
                <li><a href="<%=request.getContextPath() %>/adminPage/adminPage_Counseller_Board_List.do">상담사 게시판 관리</a></li>
                <li><a href="<%=request.getContextPath() %>/adminPage/adminPage_Notice_List.do">공지사항 관리</a></li>
                <li><a href="<%=request.getContextPath() %>/adminPage/adminPage_Faq_List.do">FAQ 관리</a></li>
                <li><a href="<%=request.getContextPath() %>/adminPage/adminPage_Report_List.do">신고내역관리</a></li>
            </ul>
       </div><!--e:#left_nav-->
        <div id="search_wrapper">
                <form action="adminPage_Counseller_Board_List.do" method="get">
                    <select name="searchType" id="searchType">
                        <option value="title" <c:if test="${param.searchType eq 'title' }">selected</c:if>>제목</option>
                        <option value="id" <c:if test="${param.searchType eq 'id' }">selected</c:if>>아이디</option>
                    </select>
                    <input type="text" name="searchVal" id="searchVal" value="${param.searchVal }">
                    <button id="search_btn">검색</button>
                </form>
            </div><!--e:#seasrch_wrapper-->
        <div id="filter">
          <ul id="filter_option">
                <li>
                <button class="<c:if test="${searchVO.sort eq 'edate' }">sortActive</c:if>" type="button" onclick="location.href='<%=request.getContextPath()%>/adminPage/adminPage_Counseller_Board_List.do?&searchType=${searchVO.searchType}&searchVal=${searchVO.searchVal}&sort=edate'">
                 	최신순
                </button>
                </li>
                <li>
                <button class="<c:if test="${searchVO.sort eq 'id' }">sortActive</c:if>" type="button" onclick="location.href='<%=request.getContextPath()%>/adminPage/adminPage_Counseller_Board_List.do?&searchType=${searchVO.searchType}&searchVal=${searchVO.searchVal}&sort=id'">
                 	아이디오름차순
                </button>
                </li>
                <li>
                <button class="<c:if test="${searchVO.sort eq 'title' }">sortActive</c:if>" type="button" onclick="location.href='<%=request.getContextPath()%>/adminPage/adminPage_Counseller_Board_List.do?&searchType=${searchVO.searchType}&searchVal=${searchVO.searchVal}&sort=title'">
                 	제목 오름차순
                </button>
                </li>
           </ul><!--e:#filter_option-->
        </div><!--e:#filter-->

        <div id="list">
            <table style="width: 100%;">
                <tr>
                    <th style="width:5%;">NO</th>
                    <th style="width:5%;"><input type="checkbox" id="check_all" name="check_all"></th>
                    <th style="width:50%;">제목</th>
                    <th>아이디</th>
                    <th>작성일</th>
                    <th style="width:7%;">신고</th>
                </tr>
                
         <form action="community_delete.do" method="post">
         <input type="hidden" name="board_type" value="1">
                <c:forEach items="${counseller_board_list}" var="vo" varStatus="status">
	                <tr>
	                    <td>${pageVO.total-(pageVO.total-((pageVO.pageNum-1)*10+status.index)-1) }</td>
	                    <td><input type="checkbox" class="checkbox" name="bidx" value="${vo.bidx }"></td>
	                    <td><a href="<%=request.getContextPath()%>/counseller_board/counseller_board_view.do?bidx=${vo.bidx}">${vo.title }</a></td>
	                    <td>${vo.id }</td>
	                    <td>${vo.wdate }</td>
	                    <td>0</td>
	                </tr>
                </c:forEach>
            </table>
        </div><!--e:#list-->
        <div id="delete_btn_wrapper">
            <button type="submit" id="deleteBtn" class="btn">삭제</button>
        </div>
        </form>
       

        <!--부트스트랩 페이지네이션-->
	        <nav aria-label="Page navigation example">
	            <ul style="margin-left:251px;" class="pagination justify-content-center">
	            
	<!--          이전버튼 활성화 -->
	              <c:if test="${pageVO.prev }">
		              <li class="page-item">
		                <a class="page-link" href="<%=request.getContextPath() %>/adminPage/adminPage_Counseller_Board_List.do?pageNum=${pageVO.startPage-1}&amount=${pageVO.amount}<c:if test='${searchVO.sort != null}'>&sort=${searchVO.sort}</c:if>" aria-label="Previous">
		                  <span aria-hidden="true">&laquo;</span>
		                </a>
		              </li>
		            </c:if>
	              
	<!--          페이지 번호 -->
	              <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">
		              <li class="page-item">
		              <a class="page-link ${pageVO.pageNum == num ? "active":"" }" href="<%=request.getContextPath() %>/adminPage/adminPage_Counseller_Board_List.do?pageNum=${num}&amount=${pageVO.amount}&searchType=${searchVO.searchType}&searchVal=${searchVO.searchVal}<c:if test='${searchVO.sort != null}'>&sort=${searchVO.sort}</c:if>">${num}
		              </a>
		              </li>
		            </c:forEach>
	              
	<!--          다음버튼 활성화 -->
	              <c:if test="${pageVO.next }">
		              <li class="page-item">
		                <a class="page-link" href="<%=request.getContextPath() %>/adminPage/adminPage_Counseller_Board_List.do?pageNum=${pageVO.endPage+1}&amount=${pageVO.amount}<c:if test='${searchVO.sort != null}'>&sort=${searchVO.sort}</c:if>" aria-label="Next">
		                  <span aria-hidden="true">&raquo;</span>
		                </a>
		              </li>
					</c:if>			
	            </ul>
	          </nav>
	          
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

<script>
	 	$(function(){	 		
		   //전체선택
	 		$("#check_all").click(function(){ //전체 체크 클릭시
					if($("#check_all").prop("checked")){ //체크된 경우
						$("input[name=bidx]").prop("checked",true); //전체 선택
					}else{
						$("input[name=bidx]").prop("checked",false); //전체 해제
					}
	 		});
	 	});
	 	
	 	$(function(){
		   //게시물 삭제
	     	var checkboxes = document.querySelectorAll(".checkbox");
	    	$("#deleteBtn").click(function(){
	    		var flag = false;
	    		for(var i = 0; i < checkboxes.length; i++)
	    		{
	    			if(checkboxes[i].checked == true) //체크박스에 체크된 경우
	    			{
	    				flag = true; //flag true
	    			}
	    		}    
	    		if( flag == false ) //flag false 일경우
	    		{
	    			alert("삭제할 게시물을 선택해주세요.");
	    			return false;
	    		}
	    		
	    		pw = prompt("관리자 비밀번호를 입력해주세요.");
	    		if(pw == ""){
	    			alert("비밀번호를 입력해주세요.");
	    			return false;
	    		}else if(pw != '${login.pw}'){
	    			alert("비밀번호가 일치하지 않습니다.");
	    			return false;
	    		}else{
		   			alert("게시물 삭제가 완료되었습니다.");   		
		    		return true;
	    		}
	    	});
	 	});
     	
    </script>

</html>