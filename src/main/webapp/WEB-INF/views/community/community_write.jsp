<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>힐링캠프</title>
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>
    <style>
        main{
            width:1024px;
            margin:0 auto;
            }
        main #select_form{
            display: flex;
            }
            #category_wrapper{
            margin-right:10px;
            }
            #category_type{
            height:32px;
            border-radius:5px;
            }
            #checkbox_wrapeer{
            display:flex;
            align-items: center;
            }
            #checkbox_wrapeer input[type="checkbox"]{
            height:28px;
            width:28px;
            margin-right:5px;
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
        <div><p><a href="">로그인</a></p><p><a href="">회원가입</a></p><p><a href="">고객센터</a></p></div>
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
        <div id="form_wrapper">
            <form id="select_form">
                <div id="category_wrapper">
                    <select id="category_type">
                        <option>육아</option>
                        <option>취업/진로</option>
                        <option>연애</option>
                        <option>대인관계</option>
                        <option>가족</option>
                        <option>학업</option>
                        <option>중독</option>
                        <option selected>자유</option>
                        <option>이별/이혼</option>
                        <option>따돌림</option>
                        <option>정신건강</option>
                        <option>투병</option>
                        <option>신체</option>
                        <option>LGBT</option>
                        <option>직장</option>
                    </select><!--e:#category_type-->
                </div><!--e:#category_wrapper-->
                <div id="checkbox_wrapeer">
                    <input type="checkbox" name="hide_name"><label>익명작성여부</label>
                </div><!--e:#check_box-->
            </form>
        </div><!--e:#form_wrapper-->

        <div id="write_form_wrapper">
            <form id="write_form">
                <div id="title_wrapper">
                    <input id="title" type="text" placeholder="제목을 입력하세요.">
                </div><!--e:#title_wrapper-->
                <div id="content_wrapper">
                    <textarea id="content" name="content"></textarea>
                </div><!--e:#content_wrapper-->
                <button id="writeAction_btn" type="button" onclick="submitPost()">등록하기</button>
            </form><!--e:#write_form-->
        </div><!--e:#write_form_wrapper-->
        <script>
        //에디터 설정
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
        		
        		})
        	}
        	
        	$(document).ready(function(){
        		smartEitor()
        	})

        	//에디터 입력창에 입력 후 버튼 클릭
        	submitPost = function(){
        		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD",[])
        		let content = document.getElementById("content").value 
        		let title = document.getElementById("title").value
        		
        		if(title == ""){
        			alert("제목을 입력해주세요.")
        			return
        		}else if(content == "<p>&nbsp;</p>"){ 
        			alert("내용을 입력해주세요.")
        			oEditors.getById["content"].exec("FOCUS")
        			return
        		}else{
        			console.log(content) //콘솔창에 입력값 확인
        		}
        	}
        

        </script>
    </main>
</body>
</html>