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
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">
    <style>
        main{
            width:1024px;
            margin:0 auto;
            }
            #write_form_wrapper{
            margin-top:10px;
            }
            #title_wrapper{
            border-top:2px solid rgb(112,173,71);
            border-bottom:2px solid rgb(112,173,71);
            }
            #title_wrapper #title{
            width:100%;
            height:70px;
            border-style:none;
            font-size: 20px;
            }
            #title_wrapper #title:focus{
            outline:none;
            }
            #content_wrapper{
            border-bottom:2px solid rgb(112,173,71);
            margin-bottom:20px;
            }
            #content_wrapper #content{
            width:100%;
            height:500px;
            border-style:none;
            resize: none;
            }
            #content_wrapper #content:focus{
            outline:none;
            }
            #write_form_wrapper #writeAction_btn{
            border-style: none;
            background-color: rgb(183,214,163);
            border-radius: 5px;
            padding:0 15px;
            font-weight: bold;
            height:32px;
            float:right;    
            }
    </style>
    
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
        <div id="write_form_wrapper">
            <form id="write_form">
                <div id="title_wrapper">
                    <input id="title" type="text" placeholder="제목을 입력하세요.">
                </div><!--e:#title_wrapper-->
                <div id="content_wrapper">
                    <textarea id="content"></textarea>
                </div><!--e:#content_wrapper-->
                <button id="writeAction_btn">수정하기</button>
            </form><!--e:#write_form-->
        </div><!--e:#write_form_wrapper-->
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