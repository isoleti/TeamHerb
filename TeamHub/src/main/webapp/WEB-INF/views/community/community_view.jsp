<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>힐링캠프</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/xpressengine/xeicon@2.3.1/xeicon.min.css">
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/community.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>
    <style>
    main{
        width:1024px;
        margin:0 auto;
        }
    main #write_wrapper{
        display: flex;
        flex-direction: row-reverse;
        }
        #write_btn{
        border-style: none;
        background-color: rgb(183,214,163);
        border-radius: 5px;
        padding:0 15px;
        font-weight: bold;
        height:32px;
        }
        
        #view_wrapper{
        margin-top:10px;
        }
        #title_wrapper{
        border-top:2px solid rgb(112,173,71);
        border-bottom:2px solid rgb(112,173,71);
        width:100%;
        height:100px;
        }
        #title_wrapper #title{
        font-size:25px;
        font-weight:bold;
        padding:10px;
        }
        #write_info_wrapper{
        display: flex;
        }
        #write_info_wrapper #write_info{
        display: flex;
        padding-left:0rem;
        }
        #write_info_wrapper #write_info li{
        padding:0 7px;
        font-size: 14px;;
        list-style:none;
        }
        #write_info_wrapper #write_info li:nth-child(2){
        border-left:2px solid silver;
        border-right:2px solid silver;
        }
        #content_wrapper{
        border-bottom:2px solid rgb(112,173,71);
        margin-bottom:20px;
        width:100%;
        height:500px;
        }
        #content_wrapper #content{
        padding:10px;
        min-height:450px;
        }
        .reply_info_wrapper .reply_info{
        display: flex;
        padding:0rem;
        }
        .reply_info_wrapper .reply_info li{
        padding:0 7px;
        font-size:13px;
        list-style:none;
        }
        .reply_info_wrapper .reply_info li:not(:last-of-type){
        border-right:2px solid silver;
        }
        .reply_view_wrapper{
        margin-left:15px;
        }
       #reply_input{
        margin-top:30px;
       }
       #input_wrapper{
        width:100%;
        border:1px solid;
       }
       #reply_input textarea{
        height:100%;
        width:92%;
        border-style:none;
        outline:none;
        resize: none;
       }
       #reply_input button{
        position:relative;
        bottom:46px;
        right:10px;
        float:right;
        border-style: none;
        background-color: rgb(183,214,163);
        border-radius: 5px;
        padding:5px 15px;
        font-weight: bold;
        height:32px;
       }
        .postbtn{
        border:1px solid silver;
        border-radius:15px;
        display: inline-flex;
        padding:0 5px;
        float:right;
        align-items: center;
       }
       .postbtn div{
        padding:2px;
       }
	   .likebtn img{
	   width:24px;
       height:24px;
       cursor:pointer;
	   }
	   .clip img{
	   cursor:pointer;
	   }
    </style>
    <script>
	
		function offHover(){
			$(".empathy").attr('src','./../resources/upload/like.jpg');
		}
		function onHover(){
			$(".empathy").attr('src','./../resources/upload/like_color_change.jpg');
		}
		
		function offHover2(){
			$(".bookmark").attr('src','./../resources/upload/bookmark.jpg');
		}
		function onHover2(){
			$(".bookmark").attr('src','./../resources/upload/bookmark_color_change.jpg');
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
            <a href="<%=request.getContextPath()%>/test.do">심리테스트</a>
            <a href="<%=request.getContextPath()%>/community/community_list.do">커뮤니티</a>
            <a href="<%=request.getContextPath()%>/res/findcenter.do">상담 예약</a>
            <a href="<%=request.getContextPath()%>/counseller_board/counseller_board_list.do">상담사 게시판</a>
            <section></section>
        </nav>
    </header>
    <main>
        <div id="write_wrapper">
            <button id="write_btn" onclick="location.href='community_list.do'">목록가기</button>
        </div><!--e:#write_wrapper-->

        <div id="view_wrapper">
            <div id="title_wrapper">
                <div id="title">${vo.title}</div>
                <div id="write_info_wrapper">
                    <ul id="write_info">
                        <li id="category">${vo.category}</li>
                        
                        <c:choose>
                    	<c:when test="${vo.hide_id eq '익명' }">
                    		<li class="id">${vo.hide_id }</li>
                    	</c:when>
                    	<c:otherwise>
	                        <li class="id">${vo.id }</li>
                    	</c:otherwise>
                    </c:choose>
                    
                        <li class="wdate">${vo.wdate}</li>
                        <li class="hit">조회수 ${vo.hit}</li>
                    </ul><!--e:#write_info-->
                </div><!--e:#write_info_wrapper-->
            </div><!--e:#title_wrapper-->

            <div id="content_wrapper">
                <div id="content">${vo.content}</div>
                    <div class="postbtn">
                        <div class="likebtn">
                            <img class="empathy" src="<%=request.getContextPath()%>/resources/upload/like.jpg" alt="공감" onclick="likecount();" onmouseover="onHover();" onmouseout="offHover();">
                            <span style="font-size:13px;">공감</span>
                        </div><!--e:.likebtn-->
                        <div class="clip">
                            <img class="bookmark" src="<%=request.getContextPath()%>/resources/upload/bookmark.jpg" alt="북마크" onclick="bookmark();" onmouseover="onHover2();" onmouseout="offHover2();">
                        </div><!--e:.clip-->
                        <div class="other">
                        	<!-- Split dropup button -->
							<div class="btn-group dropup">
							 <button type="button" id="btn" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            	<i style="color:rgb(187,187,187);" class="xi-ellipsis-h xi-x">
                            	</i>
							 </button>						 
							  <ul class="dropdown-menu">
							  <c:if test="${login.id == vo.id}"><!-- 게시글을 작성한 작성자만 수정,삭제 가능 -->
							    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/community/community_modify.do?bidx=${vo.bidx}">수정</a></li>
							    <li><button class="dropdown-item" onclick="document.delfrm.submit()">삭제</button></li>
							    <form name="delfrm" action="community_delete.do" method="post">
							    	<input type="hidden" name="bidx" value="${vo.bidx }">
							    </form>
							  </c:if>
							  <c:if test="${login.id != vo.id}">
							    <li><a class="dropdown-item" href="#">신고하기</a></li>
							  </c:if>
							  </ul>
							</div>
                        </div><!--e:.other-->
                    </div><!--e:.postbtn-->
                </div><!--e:#content_wrapper-->
        </div><!--e:#write_form_wrapper-->
                    
        <div id="reply_wrapper">
            <div class="reply_info_wrapper">
                <ul class="reply_info">
                    <li class="id">작성자</li>
                    <li class="wdate">2023-01-03 12:42</li>
                    <li class="comment">댓글쓰기</li>
                    <li class="report">신고</li>
                </ul><!--e:.write_info-->
            </div><!--e:.write_info_wrapper-->
            <div class="reply_view_wrapper">
                <div class="reply_view">댓글댓글댓글</div>
            </div><!--e:.reply_view_wrapper-->
        </div><!--e:#reply_wrapper-->
        <div id="reply_input">
            <form action="">
                <div id="input_wrapper">
                    <textarea name="reply" id="reply"></textarea>
                </div><!--e:#input_wrapper-->
                <button id="reply_btn">등록</button>
            </form>
        </div><!--e:#reply_input-->
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