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
    <style>
    main{
    width:1024px;
    margin:0 auto;
    }
	main #menu{
	    display: flex;
	    margin-top:30px;
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
    .community .main .content a{
    font-size:15px;
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
        .community .story{
            justify-content: flex-end;
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
        <div id="search">
            <div id="search_wrapper">
                <form>
                    <select name="searchType" id="searchType">
                        <option>제목</option>
                        <option>작성자</option>
                    </select>
                    <input type="text" name="searchVal" id="searchVal">
                    <button id="search_btn">검색</button>
                    <button id="write_btn" type="button" onclick="location.href='<%=request.getContextPath()%>/counseller_board/counseller_board_write.do'">작성하기</button>
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
            <div class="community">
                <div class="story">
                    <div class="write_day">2023-01-02</div>
                </div><!--e:.story-->
                <div class="main">
                    <div class="title"><a href="">제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목</a></div>
                    <div class="content"><a href="">내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</a></div>
                </div><!--e:.main-->
                <div class="footer">
                    <div class="reaction">
                        <div class="empathy_wrapper">
                            <img class="empathy" src="<%=request.getContextPath()%>/resources/upload/like.jpg" alt="공감">
                        </div><!--e:#empathy_wrapper-->
                        <div class="like">n명이 공감</div>
                        <div class="reply">댓글 n개</div>
                        <div class="hit">조회수 n</div>
                    </div><!--e:.reaction-->
                    <div class="user_id">작성자</div>
                </div><!--e:.footer-->
            </div><!--e:.community-->
    
            <div class="community">
                <div class="story">
                    <div class="write_day">2023-01-02</div>
                </div><!--e:.story-->
                <div class="main">
                    <div class="title"><a href="">제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목</a></div>
                    <div class="content"><a href="">내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</a></div>
                </div><!--e:.main-->
                <div class="footer">
                    <div class="reaction">
                        <div class="empathy_wrapper">
                            <img class="empathy" src="<%=request.getContextPath()%>/resources/upload/like.jpg" alt="공감">
                        </div><!--e:.empathy_wrapper-->
                        <div class="like">n명이 공감</div>
                        <div class="reply">댓글 n개</div>
                        <div class="hit">조회수 n</div>
                    </div><!--e:.reaction-->
                    <div class="user_id">작성자</div>
                </div><!--e:.footer-->
            </div><!--e:.community-->

            <div class="community">
                <div class="story">
                    <div class="write_day">2023-01-02</div>
                </div><!--e:.story-->
                <div class="main">
                    <div class="title"><a href="">제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목</a></div>
                    <div class="content"><a href="">내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</a></div>
                </div><!--e:.main-->
                <div class="footer">
                    <div class="reaction">
                        <div class="empathy_wrapper">
                            <img class="empathy" src="<%=request.getContextPath()%>/resources/upload/like.jpg" alt="공감">
                        </div><!--e:#empathy_wrapper-->
                        <div class="like">n명이 공감</div>
                        <div class="reply">댓글 n개</div>
                        <div class="hit">조회수 n</div>
                    </div><!--e:.reaction-->
                    <div class="user_id">작성자</div>
                </div><!--e:.footer-->
            </div><!--e:.community-->
    
            <div class="community">
                <div class="story">
                    <div class="write_day">2023-01-02</div>
                </div><!--e:.story-->
                <div class="main">
                    <div class="title"><a href="">제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목</a></div>
                    <div class="content"><a href="">내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</a></div>
                </div><!--e:.main-->
                <div class="footer">
                    <div class="reaction">
                        <div class="empathy_wrapper">
                            <img class="empathy" src="<%=request.getContextPath()%>/resources/upload/like.jpg" alt="공감">
                        </div><!--e:.empathy_wrapper-->
                        <div class="like">n명이 공감</div>
                        <div class="reply">댓글 n개</div>
                        <div class="hit">조회수 n</div>
                    </div><!--e:.reaction-->
                    <div class="user_id">작성자</div>
                </div><!--e:.footer-->
            </div><!--e:.community-->
        </div><!--e:.community_wrapper-->

        <!--부트스트랩 페이지네이션-->
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
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