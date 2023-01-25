<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신고하기</title>
    <link href="<%=request.getContextPath()%>/resources/css/reset.css" rel="stylesheet">
    <style>
        body{
            width:550px;
            height:569px;
        }
        #report_form .pop_title{
            padding:15px 0 15px 13px;
            background-color: #666;
            color:white;
            font-weight:bold;
            font-size:15px;
        }
        .pop_content{
            padding:0 20px 20px 20px;
        }
        .pop_content h2{
            padding:20px 10px;
            font-size:25px;
            font-weight:bold;
        }
        .report_view{
            border:1px solid silver;
            padding:20px;
        }
        #reply_wrapper{
            padding-bottom: 10px;
        }
        .reply_info{
            display: flex;
        }
        .reply_info li{
            padding-right:10px;
            margin-bottom:10px;

        }
        .reply_info li:nth-child(2){
            padding-left:10px;
            border-left:2px solid silver;
        }
        .reply_view_wrapper{
            padding-left:10px;
        }
        .reply_info_wrapper .reply_info{
            display: flex;
            padding:0rem;
        }
        .reply_info_wrapper .reply_info li{
            padding:0 7px;
            font-size:13px;
        }
        #report_wrapper{
            border-top:1px solid silver;
            padding:10px 10px 0 10px;
        }
        #report_wrapper tr:nth-child(2){
            line-height: 30px;
        }
        #report_wrapper tr td:nth-child(1){
            font-weight: bold;
            text-align: right;
        }
        #report_wrapper tr td:nth-child(2){
            padding:0 10px;
        }        
        .pop_footer{
            background-color: #EEE;
            height:40px;
            padding: 10px 0 0 40px;
            text-align: center;
        }
    </style>
	</head>
	<body>
	    <form id="report_form">
	        <div class="pop_title">신고 댓글</div>
	        <div class="pop_content">
	            <h2>제목 : 신고당한 댓글의 글 제목</h2>
	            <div class="report_view">
	                <div id="reply_wrapper">
	                    <div class="reply_info_wrapper">
	                        <ul class="reply_info">
	                            <li class="id">작성자</li>
	                            <li class="wdate">2023-01-03 12:42</li>
	                        </ul><!--e:.write_info-->
	                 </div><!--e:.write_info_wrapper-->
	                 <div class="reply_view_wrapper">
	                     <div class="reply_view">댓글댓글댓글</div>
	                 </div><!--e:.reply_view_wrapper-->
	             </div><!--e:#reply_wrapper-->
	             <div id="content_wrapper">
	                 <div id="report_wrapper">
	                     <table>
	                         <tr>
	                             <td>신고한 아이디 : </td>
	                             <td>singoja</td>
	                         </tr>
	                         <tr>
	                             <td>신고일시 : </td>
	                             <td>2023-01-04 11:51</td>
	                         </tr>
	                         <tr>
	                             <td>신고내용 : </td>
	                             <td>욕설/인신공격</td>
	                         </tr>
	                     </table>
	                 </div><!--e:#report_wrapper-->
	             </div><!--e:#content_wrapper-->
	         </div><!--e:.report_view-->
	     </div><!--e:.pop_content-->
	     <div class="pop_footer">
	         <button>삭제</button>
	         <button>취소</button>
	     </div><!--e:.pop_footer-->
	 </form><!--e:#report_form-->
	</body>
</html>