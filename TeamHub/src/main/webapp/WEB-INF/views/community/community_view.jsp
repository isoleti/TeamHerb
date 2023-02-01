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
        .reply_box{
        border-bottom:1px solid #e5e7eb;
        padding:15px 0;
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
        .re_reply_box{
       	border-bottom: 1px solid #e5e7eb;
	    padding: 15px 25px;
	    background-color: #FCFCFC;
        }
        .reply_ico{
       	float:left;
       	margin-left:-7px;
       	opacity:.5;
        }
        .delete, .commentModify, .cancel, .report, .re_reply, .re_reply_btn{
       	cursor:pointer;
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
                            <span style="font-size:13px;">${vo.likes}공감</span>
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
							    <li><button id="deleteBtn" class="dropdown-item" onclick="document.delfrm.submit()">삭제</button></li>
							    <form name="delfrm" action="community_delete.do" method="post">
							    	<input type="hidden" name="bidx" value="${vo.bidx }">
							    </form>
							  </c:if>
							  <c:if test="${login.id != vo.id}">
							    <li><a class="dropdown-item" id="reportBtn" href="#">신고하기</a></li>
							  </c:if>
							  </ul>
							</div>
                        </div><!--e:.other-->
                    </div><!--e:.postbtn-->
                </div><!--e:#content_wrapper-->
        </div><!--e:#write_form_wrapper-->
                    
        <div id="reply_wrapper">
        	
        </div><!--e:#reply_wrapper-->
        
        <div id="reply_input">
            <form id="commentForm" method="post" onsubmit="return false">
            <input type="hidden" name="bidx" value=${vo.bidx }>
            <input type="hidden" name="uidx" value=${login.uidx }>
            <input type="hidden" name="board_type" value="0">
                <div id="input_wrapper">
                    <textarea name="reply_Content" id="reply"></textarea>
                </div><!--e:#input_wrapper-->
                <button type="button" id="reply_btn">등록</button>
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

<script>

    	//게시글 삭제여부
    	$("#deleteBtn").on("click",function(){
    		if(confirm("정말 삭제하시겠습니까?") == true){
    		alert("게시물이 삭제되었습니다.");   		
    		return;
    		}else{
    			location.href="<%=request.getContextPath()%>/community/community_view.do?bidx="+${vo.bidx};
    		}
    	});
    	
    	//신고팝업창 띄우기
    	$(function(){	
	    	let popuptestbtn = document.querySelector("#reportBtn");
	    	popuptestbtn.onclick = function(){
	    		let popOption = "width = 568px, height=558px, scrollbars=no";
	    		let openUrl = "<%=request.getContextPath()%>/community/popup.do";
	    		window.open(openUrl,"",popOption);
	    	}
    	});
    	
   		//로그인 정보
    	var login = "${login}";
   		
   		//현재 로그인한아이디
   		var id = '<%=session.getAttribute("id")%>'; 
   		
   		//로그인한 회원만 이용가능
   		var target = document.getElementById("btn");
   		if(login == ""){
   			target.disabled = true;
   		}
    	
    		
   		// 댓글 작성 버튼 클릭
   		$(document).on("click","#reply_btn",function(){
   			//댓글 입력값
   			var reply = $("textarea[name=reply_Content]").val();
   			//로그인 여부
   			if(login == ""){
    			alert("로그인 후 이용해주세요");
    			return false;
   			}
   			//댓글 작성여부
   			else if(reply == ""){
   				alert("댓글을 입력해주세요.");
   				return false;
   			}
   			
   			//댓글작성
   			$.ajax({
	    		type:"post",
	    		url:"community_reply_insert.do",
	    		data:$("#commentForm").serialize(),
	    		dataType:"text",
	    		success:function(data){
	    			if(data == "success"){
		    			$("#reply").val("");
	    				getCommentList();
	    			}
	    		},error:function(){
	    			alert("error");
	    		}
	    	});
   		});
   		
   		//초기페이지 로딩시 댓글 불러오기
   		$(function(){
   			getCommentList();
   		});
   		
   		//댓글목록
   		function getCommentList(){
   			
   			//작성하려는 댓글의 게시물 번호
   			var bidx = $("input[name=bidx]").val();
   			
   			$.ajax({
   				type:"post",
   				url:"community_view.do",
				data:"bidx="+bidx,
   				success : function(result){
   					var html="";
   					if(result.length > 0){
   						for(i = 0; i < result.length; i++){
   						
	   					var reply_Idx = result[i].reply_Idx; //댓글번호
	   					var bidx = result[i].bidx; // 댓글이 달린  게시글 번호
	   					var reply_Content = result[i].reply_Content; //댓글 내용
	   					var writer = result[i].id //댓글 작성자
	   					var rdepth = result[i].rdepth //댓글깊이 
	   					var rparent = result[i].rparent; 
	   					console.log(rdepth);
	   					
		   					if(rdepth == 0){//댓글일때
	   							html += "<div class='reply_box'>";
	   							html += "<div class='reply_box_wrapper"+reply_Idx+"'><div class='reply_info_wrapper'>";
	   							html += "<ul class='reply_info'>";
	   							html += "<li class='id'>"+result[i].id+"</li>";
	   							html += "<li class='wdate'>"+result[i].reply_Wdate+"</li>";
	   							
	   							if(id == result[i].id){
		   							html += "<li class='commentModify' onclick='commentModify("+reply_Idx+",\""+reply_Content+"\",\""+writer+"\");'>댓글수정</li>";
	   							}else{
	   								html += "<li class='re_reply' onclick='re_reply("+reply_Idx+","+bidx+")'>댓글쓰기</li>";
	   							}
	   							
	   							if(id == result[i].id){
	   								html += "<li class='delete' onclick='deleteReply("+reply_Idx+","+bidx+");'>삭제</li></ul></div>";
	   							}else{
		   							html += "<li class='report' onclick='reportReply()'>신고</li></ul></div>";
	   							}
	   							
	   							html += "<div class='reply_view_wrapper'>";
	   							html += "<div class='reply_view'>"+result[i].reply_Content+"</div></div>";
	   							html += "</div></div>";
	   							html += "<div class='re_reply_area"+reply_Idx+"'></div>"
		   						
		   					}else{//대댓글일때
		   						html += "<div class='re_reply_area"+reply_Idx+"'>";
		   						html += "<div class='re_reply_box'>";
	   		   					html += "<span class='reply_ico'>└</span>";
	   		   					html += "<div class='reply_info_wrapper' >";
	   		   					html += "<ul class='reply_info'>";
	   		   					html += "<li class='id'>"+result[i].id+"</li>";
		   		   				html += "<li class='wdate'>"+result[i].reply_Wdate+"</li>";
	   							
	   							if(id == result[i].id){
		   							html += "<li class='commentModify' onclick='commentModify("+reply_Idx+",\""+reply_Content+"\",\""+writer+"\");'>댓글수정</li>";
	   							}else{
	   								html += "<li class='re_reply' onclick='re_reply("+reply_Idx+","+bidx+")'>댓글쓰기</li>";
	   							}
	   							
	   							if(id == result[i].id){
	   								html += "<li class='delete' onclick='deleteReply("+reply_Idx+","+bidx+");'>삭제</li></ul></div>";
	   							}else{
		   							html += "<li class='report' onclick='reportReply()'>신고</li></ul></div>";
	   							}
   							
	   		   					html += "<div class='reply_view_wrapper'>";
	   		   					html += "<div class='reply_view'>"+result[i].reply_Content+"</div></div>";
	   		   					html += "</div></div>";
		   					}
   						}
   					}else{
   						html += "<div>등록된 댓글이 없습니다.</div>";
   					}
   					
   					$("#reply_wrapper").html(html);
   					
   				},error:function(){
   					alert("error");
   				}
   			});
   		}
   		
   		//댓글 삭제
   		function deleteReply(reply_Idx,bidx){
   			var ans = confirm("선택하신 댓글을 삭제하시겠습니까?");
   			if(!ans){return false;}
   			
   			$.ajax({
   				type:"post",
   				url:"community_reply_delete.do",
   				data:{"reply_Idx":reply_Idx,"bidx":bidx},
   				success:function(data){
   					if(data == 1){
   						alert("삭제가 완료되었습니다.");
   						location.reload();
   					}
   				},error:function(){
   					alert("댓글 삭제 실패");
   				}
   			});
   		}
   		
   		//댓글 수정창
		function commentModify(reply_Idx,reply_Content,writer){
			
			var comment = ""
				comment += "<div class='reply_info_wrapper' >";
				comment += "<ul class='reply_info'>";
				comment += "<li class='id'>"+writer+"</li>";
				comment += "<li class='commentModify' onclick='updateBtn("+reply_Idx+",\""+reply_Content+"\");'>댓글수정</li>";
				comment += "<li class='cancel' onclick='getCommentList();'>취소</li></ul></div>"; //취소버튼 클릭시 댓글 목록리스트 함수 실행
				comment += "<div class='reply_view_wrapper'>";
				comment += "<textarea id='reply_Edit_Content' name='reply_Content' style='width:100%;'>"+reply_Content+"</textarea></div>";
			
			$(".reply_box_wrapper"+reply_Idx).replaceWith(comment);
		}
   		
   		//댓글 수정
   		function updateBtn(reply_Idx,reply_Content){
   			var reply_Content = $("textarea[name='reply_Content']").val(); //수정된 댓글 내용
   			
   			if(reply_Content == ""){
   				alert("내용을 입력해주세요.");
   			}else{
	   			$.ajax({
	   				url:"community_reply_update.do",
	   				type:"post",
	   				data:JSON.stringify({ "reply_Idx":reply_Idx ,"reply_Content":reply_Content}),
	   				dataType:"json",
	   				contentType : "application/json;charset=UTF-8",
	   				success:function(result){
	   					if(result == 1){
		   					alert("댓글 수정이 완료되었습니다.");
		   					getCommentList();//댓글 수정완료시 댓글 목록리스트 함수 실행
	   					}
	   				},error:function(){
	   					alert("error");
	   				}
	   			});
   			}
   		}
   		
   		//댓글 신고팝업창 띄우기
   		function reportReply(reply_Idx){
   			if(login == ""){
   				alert("로그인 후 이용해주세요.");
   			}else{
	   			let popOption = "width = 568px, height=558px, scrollbars=no";
	   			let openUrl = "<%=request.getContextPath()%>/community/reply_popup.do";
	   			window.open(openUrl,"",popOption);
	   		}
   		}
   		
   		//대댓글
   		function re_reply(reply_Idx,bidx){
   			if(login == ""){
   				alert("로그인 후 이용해주세요.");
   			}else{
   				var reply = "";
   					reply += "<div class='re_reply_box'>";
   					reply += "<span class='reply_ico'>└</span>";
   					reply += "<div class='reply_info_wrapper' >";
   					reply += "<ul class='reply_info'>";
   					reply += "<li class='id'>"+id+"</li>";
   					reply += "<li class='re_reply_btn' onclick='re_reply_btn("+reply_Idx+","+bidx+");'>댓글등록</li>";
   					reply += "<li class='cancel' onclick='getCommentList();'>취소</li></ul></div>"; //취소버튼 클릭시 댓글 목록리스트 함수 실행
   					reply += "<div class='reply_view_wrapper'>";
   					reply += "<textarea id='reply_Edit_Content' name='reply_Content' style='width:100%;'></textarea>";
   					reply += "<input type='hidden' name='rparent' value="+reply_Idx+"></div>";
   					reply += "</div>";
	   				$(".re_reply_area"+reply_Idx).html(reply);
   			}
   			
   			//display 여부에 따라 show,hide
   			if($(".re_reply_area"+reply_Idx).css("display") == "none"){
   				$(".re_reply_area"+reply_Idx).show();
   			}else{
   				$(".re_reply_area"+reply_Idx).hide();
   			}
   		}
   		
   		//대댓글 등록
   		function re_reply_btn(reply_Idx,bidx){
   			var reply_Content = $("textarea[name='reply_Content']").val();
   			var rparent = $("input[name=rparent]").val();
   			
   			if(reply_Content == ""){
   				alert("내용을 입력해주세요.");
   			}else{
	   			$.ajax({
	   				url:"community_re_reply.do",
	   				type:"post",
	   				data:JSON.stringify({"reply_Content":reply_Content, "bidx":bidx,"rparent":rparent}), //rparent:대댓글 다는 댓글의 idx
	   				dataType:"json",
	   				contentType:"application/json; charset=UTF-8",
	   				success:function(result){
	   					getCommentList();
	   					//getReplyList(bidx); //대댓글 입력 성공시 대댓글 리스트함수 호출
	   					
	   				},error:function(){
	   					alert("error");
	   				}
	   			});
   			}
   		}
			
//    		$(function(){
// 			//var rparent = $("input[name=rparent]").val();
// 			var bidx = $("input[name=bidx]").val();
			
//    			getReplyList(bidx);
//    		});
   		
//    		//대댓글 리스트
//    		function getReplyList(bidx){
//    			//console.log(rparent);
//    			console.log(bidx);
//    			$.ajax({
//    				type:"get",
//    				url:"community_re_replyList.do",
//    				data:{"bidx":bidx},
//    				success:function(result){
//    					console.log(result);
   					
//    					var reply = "";
//    					if(result.length > 0){
//    						for(i = 0; i <result.length; i++){
//    						var rparent = result[i].rparent; //댓글번호
//    							reply += "<div class='re_reply_box'>";
//    		   					reply += "<span class='reply_ico'>└</span>";
//    		   					reply += "<div class='reply_info_wrapper' >";
//    		   					reply += "<ul class='reply_info'>";
//    		   					reply += "<li class='id'>"+result[i].id+"</li>";
//    		   					reply += "<li class='re_reply_btn'>댓글수정</li>";
//    		   					reply += "<li class='cancel'>삭제</li></ul></div>"; //취소버튼 클릭시 댓글 목록리스트 함수 실행
//    		   					reply += "<div class='reply_view_wrapper'>";
//    		   					reply += "<div class='reply_view'>"+result[i].reply_Content+"</div></div>";
//    		   					reply += "</div>";
   							
//    						}
//    					}
// 	   				$(".re_reply_area"+rparent).html(reply);
   					
//    				},error:function(){
//    					alert("error");
//    				}
//    			});
//    		}
   		
   			
   		
    </script>

</html>