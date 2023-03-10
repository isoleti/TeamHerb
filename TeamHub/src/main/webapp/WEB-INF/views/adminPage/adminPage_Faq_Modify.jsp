<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
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
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/images/icons8-clover-16.png">
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>   
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <style>
       
        main{
            width:80%;
            margin:0 auto;
            min-height: 500px
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
        #category_type{
            height:32px;
            border-radius:5px;
        }
        #form_wrapper{
	        display:flex;
	        flex-direction: column;
        }
        #write_form_wrapper{
            margin-top:10px;
        }
        #write_form_wrapper form{
            width:100%;
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
     <header>    <!--header-->
        <div id="loginBar"> <!--로그인 관련-->
          <c:if test = "${login != null}">
          <i id="xeicon" class="xi-profile-o"></i>
          <p id="loginId">${login.id }님 환영합니다.</p>
          </c:if>    
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
                <li><a href="<%=request.getContextPath() %>/adminPage/adminPage_Faq_List.do" style="font-weight:bold;">FAQ 관리</a></li>
                <li><a href="<%=request.getContextPath() %>/adminPage/adminPage_Reserve_List.do">예약 내역 관리</a></li>
            </ul>
		</div><!--e:#left_nav-->
		<div id="form_wrapper">
		<form id="write_form" action="adminPage_Faq_Modify.do" method="post" onsubmit="return submitPost();">
			<div id="category_wrapper">
				<select id="category_type" name="category">
				<c:forEach items="categoryList" var="categoryList ">
					<!--해당하는 카테고리 선택됨 -->
					<option value="${cboardVO.category}" <c:if test="${categoryList == cboardVO.category}">selected</c:if>>${cboardVO.category}</option>
				</c:forEach>
					<option>선택</option>
					<option>심리상담</option>
					<option>예약/결제</option>
					<option>기타</option>
				</select><!--e:#category_type-->
			</div><!--e:#category_wrapper-->
			<div id="write_form_wrapper">
			<input type="hidden" name="bidx" value="${cboardVO.bidx}">   
				<div id="title_wrapper">
					<input id="title" type="text" name="title" placeholder="제목을 입력하세요." value="${cboardVO.title}">
				</div><!--e:#title_wrapper-->
				<div id="content_wrapper">
					<textarea id="content" name="content">${cboardVO.content}</textarea>
				</div><!--e:#content_wrapper-->
				<button id="writeAction_btn">수정하기</button>
			</div><!--e:#write_form_wrapper-->
		</form><!--e:#write_form-->
		</div><!--e:#form_wrapper-->    
    </main>
    
     <script>
        	let oEditors = []
        	
        	smartEitor = function(){
	     		console.log("smarteditor!!");
        		
	        	nhn.husky.EZCreator.createInIFrame({
	        	   oAppRef: oEditors,
	        	   elPlaceHolder: "content",
	        	   sSkinURI: "<%=request.getContextPath()%>/resources/smarteditor/SmartEditor2Skin.html",
	        	   fCreator: "createSEditor2",
	        	      htParams : {
	        	         // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	        	         bUseToolbar : true,
	        	         // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	        	         bUseVerticalResizer : false,
	        	         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	        	         bUseModeChanger : true, 
	        	      }
	        		
	        		});
        	};
        	
        	$(document).ready(function(){
        		smartEitor();
        	});

        	function submitPost()
        	{ 
        		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD",[]);
        		let content = document.getElementById("content").value ;
        		let title = $("#title").val();
        		let category = $("select[name='category']").val();
        		
        		if(category == "선택"){
        			alert("카테고리를 선택해주세요.");
        			return false;
        		}else if(title == ""){
        			alert("제목을 입력해주세요.");
        			return false;
        		}else if(content == "<p>&nbsp;</p>"){ 
        			alert("내용을 입력해주세요.");
        			oEditors.getById["content"].exec("FOCUS");
        			return false;
        		}
        		return true;
        	}
        

        </script>
    
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