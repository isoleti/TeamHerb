<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*" %>
<%@ page import="project.healingcamp.vo.Community_BoardVO" %>
<%@ page session="true" %>
<% List<Community_BoardVO> list = (List<Community_BoardVO>)request.getAttribute("datalist"); %>
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
	main #menu{
	    display: flex;
	    margin-top:30px;
	}  
	#menu #category{
	    display:flex;
	    flex-wrap: wrap;
	    justify-content: center;
	}
    #menu #category li{
    padding:5px 11px 7px;
    margin:0px 16px 16px 0px;
    text-align: center;
    border:1px solid rgb(112,173,71);
    border-radius:5px;
    width:100px;
    cursor:pointer;
    list-style:none;
    }
    #menu #category li:hover{
    background-color: #F6F6F6;
    }

    #search{
    display:flex;
    justify-content: space-between;
    align-items: center;
    width:100%;
    }
    #search #searchType{
    height:32px;
    border-radius:5px;
    }
    #search #searchVal{
    height:32px;
    width:250px;
    border-radius:5px;
    }
    #search #search_btn{
    height:32px;
    border-style: none;
    padding:0 20px;
    background-color: rgb(183,214,163);
    border-radius: 5px;
    font-weight: bold;
    }
    #search #write_btn{
    border-style: none;
    background-color: rgb(183,214,163);
    border-radius: 5px;
    padding:0 15px;
    font-weight: bold;
    height:32px;
    }

    #filter_option{
    display:flex;
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


    .community_wrapper{
    width:100%;
    display:flex;
    flex-wrap: wrap;
    border-top:1px solid silver;
    margin:20px 0;
    }
    .community{
    padding:15px;
    width:50%;
	}
    .community:nth-child(2n-1){
    border-bottom:1px solid silver;
    border-right:1px solid silver;    
    }
    .community{
    border-bottom:1px solid silver;
    }
    .community .story{
    display: flex;
    justify-content: space-between;
    }
    .community .main{
    margin-top:8px;
    padding:5px;
    min-height: 125px;
    }
    .community .main .title{
    margin-bottom:8px;
    max-height: 36px;
    word-break: break-all;
    overflow: hidden;
    display: -webkit-box;
    }
    .community .main .title a{
    font-size:20px;
    font-weight:bold;
    color:#484848;
    text-decoration:none;
    }
    .community .main .content{
    max-height: 75px;
    word-break: break-all;
    overflow: hidden;
    display: -webkit-box;
    }
    .community .main .content a  *{
    font-weight:normal;
    font-size:15px;
    font-weight:normal;
    color:rgb(102, 102, 102);
    text-decoration:none;
    }
    .community .footer{
    display: flex;
    justify-content: space-between;
    font-size: 14px;
    }
    .community .footer .reaction{
    display: flex;
    }
    .community .footer .reaction>div{
    padding:0 5px;
    }
    .community .footer .reaction img{
    width:24px;
    height:24px;
    }
    .page-link {
	 color: #000; 
	 background-color: #fff;
	 border: 1px solid #ccc; 
	}
	
	.page-item.active .page-link {
	 z-index: 1;
	 color: #555;
	 font-weight:bold;
	 background-color: #f1f1f1;
	 border-color: #ccc;
	 
	}
	
	.page-link:focus, .page-link:hover {
	  color: #000;
	  background-color: #fafafa; 
	  border-color: #ccc;
	}
    </style>
	<script>
	
		function offHover(){
			$(".empathy").attr('src','./../resources/upload/like.jpg');
		}
		function onHover(){
			$(".empathy").attr('src','./../resources/upload/like_color_change.jpg');
		}
	</script>
</head>
<body>
    <header>        
    	<c:if test="${login == null }">
	        <div><p><a href="<%=request.getContextPath() %>/user/login.do">로그인</a></p><p><a href="">회원가입</a></p><p><a href="">고객센터</a></p></div>
    	</c:if>
    	<c:if test="${login != null }">
	        <div><p><a href="<%=request.getContextPath() %>/user/logout.do">로그아웃</a></p><p><a href="">마이페이지</a></p><p><a href="">고객센터</a></p></div>
    	</c:if>
        <nav class="navbar" style="background-color: #dff6e1;">
            <h1><a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/resources/upload/힐링캠프 logo.png"  alt="홈버튼"></a></h1>
            <a href="<%=request.getContextPath()%>/program.do">치료프로그램</a>
            <a href="<%=request.getContextPath()%>/test.do"">심리테스트</a>
            <a href="<%=request.getContextPath()%>/community/community_list.do">커뮤니티</a>
            <a href="<%=request.getContextPath()%>/res/findcenter.do">상담 예약</a>
            <a href="<%=request.getContextPath()%>/counseller_board/counseller_board_list.do">상담사 게시판</a>
            <section></section>
        </nav>
    </header>
    <main>
        <div id="menu">
            <ul id="category">
                <li><a href="<%=request.getContextPath()%>/community/community_list.do">전체보기</a></li>
                <li>육아</li>
                <li><a href="<%=request.getContextPath()%>/community/community_list.do">취업/진로</a></li>
                <li><a href="<%=request.getContextPath()%>/community/community_list.do">연애</a></li>
                <li><a href="<%=request.getContextPath()%>/community/community_list.do">대인관계</a></li>
                <li><a href="<%=request.getContextPath()%>/community/community_list.do">가족</a></li>
                <li><a href="<%=request.getContextPath()%>/community/community_list.do">학업</a></li>
                <li><a href="<%=request.getContextPath()%>/community/community_list.do">중독</a></li>
                <li><a href="<%=request.getContextPath()%>/community/community_list.do">자유</a></li>
                <li><a href="<%=request.getContextPath()%>/community/community_list.do">이별/이혼</a></li>
                <li><a href="<%=request.getContextPath()%>/community/community_list.do">따돌림</a></li>
                <li><a href="<%=request.getContextPath()%>/community/community_list.do">정신건강</a></li>
                <li><a href="<%=request.getContextPath()%>/community/community_list.do">투병</a></li>
                <li><a href="<%=request.getContextPath()%>/community/community_list.do">신체</a></li>
                <li><a href="<%=request.getContextPath()%>/community/community_list.do">LGBT</a></li>
                <li><a href="<%=request.getContextPath()%>/community/community_list.do">직장</a></li>
            </ul><!--e:#category-->
        </div><!--e:#menu-->

        <div id="search">
            <div id="search_wrapper">
                <form action="community_list.do" method="get">
                    <select name="searchType" id="searchType">
                        <option value="title" <c:if test="${param.searchType eq 'title'}" >selected</c:if>>제목</option>
                        <option value="content" <c:if test="${param.searchType eq 'content'}" >selected</c:if>>내용</option>
                        <option value="id" <c:if test="${param.searchType eq 'id'}">selected</c:if>>작성자</option>
                    </select>
                    <input type="text" name="searchVal" id="searchVal" value="${param.searchVal}">
                    <button id="search_btn">검색</button>
                    <c:if test="${login != null }">
	                    <button id="write_btn" type="button" onclick="location.href='<%=request.getContextPath()%>/community/community_write.do'">작성하기</button>
                    </c:if>
                </form>
            </div><!--e:#seasrch_wrapper-->

            <div id="filter">
               <ul id="filter_option">
                    <li>최신순</li>
                    <li>조회순</li>
                    <li>공감순</li>
               </ul><!--e:#filter_option-->
            </div><!--e:#filter-->
        </div><!--e:#search-->
        <div class="community_wrapper">
            <c:forEach items="${datalist}" var="vo">
            <div class="community">
                <div class="story">
                    <div class="category_name">${vo.category}</div>
                    <c:set var="wdate" value="${vo.wdate }"/><!-- 년월일시만 노출하기 위해 wdate 변수설정 -->
                    <div class="write_day">${fn:substring(wdate,0,11)}</div>
                </div><!--e:.story-->
                <div class="main">
                    <div class="title"><a href="community_view.do?bidx=${vo.bidx}">${vo.title}</a></div>
                    <div class="content"><a href="community_view.do?bidx=${vo.bidx}">${vo.content}</a></div>
                </div><!--e:.main-->
                <div class="footer">
                    <div class="reaction">
                    
                        <div class="empathy_wrapper">
                            <img class="empathy" src="<%=request.getContextPath()%>/resources/upload/like.jpg" alt="공감" onmouseover="onHover();" onmouseout="offHover();">
                        </div><!--e:#empathy_wrapper-->
                        
                        <div class="like">${vo.likes }명이 공감</div>
                        <div class="reply">댓글 n개</div>
                        <div class="hit">조회수 ${vo.hit}</div>
                    </div><!--e:.reaction-->
                    
                    <c:choose>
                    	<c:when test="${vo.hide_id  eq '익명'}">
                    		<div class="user_id">${vo.hide_id }</div>
                    	</c:when>
                    	<c:otherwise>
		                    <div class="user_id">${vo.id }</div>
                    	</c:otherwise>
                    </c:choose>
                    
                </div><!--e:.footer-->
            </div><!--e:.community-->
            </c:forEach>
        </div><!--e:.community_wrapper-->

        <!--부트스트랩 페이지네이션-->
	        <nav aria-label="Page navigation example">
	            <ul class="pagination justify-content-center">
	            
	            <!-- 이전버튼 활성화 -->
	            <c:if test="${pageVO.prev }">
	              <li class="page-item">
	                <a class="page-link" href="<%=request.getContextPath() %>/community/community_list.do?pageNum=${pageVO.startPage-1}&amount=${pageVO.amount}" aria-label="Previous">
	                  <span aria-hidden="true">&laquo;</span>
	                </a>
	              </li>
	            </c:if>
	            
	            <!-- 페이지번호 -->
	            <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">
	              <li class="page-item"><a class="page-link ${pageVO.pageNum == num ? "active":"" }" href="<%=request.getContextPath() %>/community/community_list.do?pageNum=${num}&amount=${pageVO.amount}&searchType=${searchVO.searchType}&searchVal=${searchVO.searchVal}">${num}</a></li>
	            </c:forEach>
	
				<!-- 다음버튼 활성화 -->
				<c:if test="${pageVO.next }">
	              <li class="page-item">
	                <a class="page-link" href="<%=request.getContextPath() %>/community/community_list.do?pageNum=${pageVO.endPage+1}&amount=${pageVO.amount}" aria-label="Next">
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
</html>