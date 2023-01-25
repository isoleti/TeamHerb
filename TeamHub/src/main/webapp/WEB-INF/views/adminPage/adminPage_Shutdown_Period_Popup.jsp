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
            overflow:hidden;
        }
        #period_form .pop_title{
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
        .period_type{
            border:1px solid silver;
            padding:20px;
            height:122px;
        }
        .period_type h3{
            margin-bottom:20px;
            font-size:14px;
        }
        .period_type li{
            padding-bottom:10px;
            width:50%;
            float:left;
            list-style:none;
        }
        .period_type li label{
            font-size:13px;
        }
        .pop_footer{
            background-color: #EEE;
            padding: 20px 0;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="period_form">
        <div class="pop_title">댓글 권한 정지하기</div>
        <div class="pop_content">
            <p>댓글 정지기간을 선택해주세요.</p>
            <div class="period_type">
                <h3>정지기간</h3>
                <ul>
                    <li>
                        <input type="radio" name="period_code">
                        <label for="">7일</label>
                    </li>
                    <li>
                        <input type="radio" name="period_code">
                        <label for="">15일</label>
                    </li>
                    <li>
                        <input type="radio" name="period_code">
                        <label for="">30일</label>
                    </li>
                    <li>
                        <input type="radio" name="period_code">
                        <label for="">해제</label>
                    </li>                    
                </ul>
            </div><!--e:.period_type-->
        </div><!--e:.pop_content-->
        <div class="pop_footer">
            <button>등록</button>
            <button onclick="closePopup();">취소</button>
        </div><!--e:.pop_footer-->
    </form><!--e:#report_form-->
</body>

	<script>
    	function closePopup(){
    		window.close();
    	}
	</script>
</html>