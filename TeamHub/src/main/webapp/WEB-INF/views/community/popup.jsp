<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신고하기</title>
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>
    <style>
        body{
            width:550px;
            height:569px;
            overflow:hidden;
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
        .pop_content p{
            padding:20px 10px;
            font-size:14px;
            font-weight:bold;
        }
        .report_type{
            border:1px solid silver;
            padding:20px;
        }
        .report_type h3{
            margin-bottom:20px;
            font-size:14px;
        }
        .report_type ul{
        	padding-left:0;
        }
        .report_type li{
            padding-bottom:10px;
            width:50%;
            float:left;
            list-style:none;
        }
        .report_type li label{
            font-size:13px;
        }
        .report_type textarea{
            width:97%;
            height:70px;
            background-color:#F8F9FA;
            border:1px solid #EDEEEF;
            padding:5px;
        }
        .report_type textarea:focus{
            outline:none;
        }
        .pop_footer{
            background-color: #EEE;
            padding: 20px 0;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="report_form">
        <div class="pop_title">글 신고하기</div>
        <div class="pop_content">
            <p>신고사유를 선택해주세요.</p>
            <div class="report_type">
                <h3>신고사유</h3>
                <ul>
                    <li>
                        <input type="radio" name="reason_code">
                        <label for="">영리목적/홍보성</label>
                    </li>
                    <li>
                        <input type="radio" name="reason_code">
                        <label for="">불법정보</label>
                    </li>
                    <li>
                        <input type="radio" name="reason_code">
                        <label for="">음란성/선정성</label>
                    </li>
                    <li>
                        <input type="radio" name="reason_code">
                        <label for="">욕설/인신공격</label>
                    </li>
                    <li>
                        <input type="radio" name="reason_code">
                        <label for="">개인정보노출</label>
                    </li>
                    <li>
                        <input type="radio" name="reason_code">
                        <label for="">같은 내용의 반복 게시(도배)</label>
                    </li>
                    <li>
                        <input type="radio" name="reason_code">
                        <label for="">기타</label>
                    </li>
                    <li>
                        <input type="radio" name="reason_code">
                        <label for="">불법촬영물등 유통 신고</label>
                    </li>
                    <textarea></textarea>
                </ul>
            </div><!--e:.report_type-->
        </div><!--e:.pop_content-->
        <div class="pop_footer">
            <button>등록</button>
            <button onclick="closePopup();" id="cancel">취소</button>
        </div><!--e:.pop_footer-->
    </form><!--e:#report_form-->
    
</body>
    <script>
    	function closePopup(){
    		window.close();
    	}
    </script>
</html>