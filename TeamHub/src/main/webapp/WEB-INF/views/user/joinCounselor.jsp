<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="<%= request.getContextPath() %>/resources/css/css2.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>

<script>/*아이디 중복체크 */
var checkIdFlag = false; //아이디를 체크했는지에 대한 flag, 중복체크하면 true 안하면 false
var checkIdVal = ""; //아이디 값을 저장하는 변수
function checkId() {
	var idval = $("#id").val(); //id의 값을 가져와 idval에 저장

	$.ajax({ 
		url:"checkId.do",
		type: "post",
		data:"id="+idval,
		success:function(data){
			if(data == 1){ //중복인경우에는 
				alert("중복된 아이디입니다.");
				checkIdFlag = false;
				checkIdVal = ""; //id를 지움
			}else if($("#id").val() == ""){
				alert("아이디를 입력하세요.");
				checkIdFlag = false;
				checkIdVal = "";
			}
			else { //중복이 아닌경우에 
				alert("사용할 수 있는 아이디입니다.");
				checkIdFlag = true;
				checkIdVal = idval;
			
				}
				
			}
		
	});
	

}

$(function(){ //회원가입페이지가 로드됐을때 function실행 
	$("form").submit(function(){ //event가 일어났을 때 실행 (이때는 onblur가 실행할때 일어남 )
		if($("#name").val() == ""){
			alert("이름을 입력하세요.");
			return false;
		}
		else if(!checkIdFlag){
			alert("아이디 중복확인을 하세요.");
			return false; //false를 return하면 submit을 취소함 
		}
		else if(checkIdFlag && !checkMailFlag){
			alert("이메일 중복확인을 하세요.");
			return false;
		}
		else if(checkIdFlag && checkMailFlag && $("#phone").val() == ""){
			alert("연락처를 입력하세요.");
			return false;
		}
		else if(checkIdFlag && checkMailFlag && $("#pw").val() == ""){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		else if(checkIdFlag && checkMailFlag && $("#pw2").val() == ""){
			alert("비밀번호 확인을 입력하세요.");
			return false;
		}
		else if(checkIdFlag && checkMailFlag && $("#pw").val() != $("#pw2").val()){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		else if(checkIdFlag && checkMailFlag && $("#agree1").is(":checked") == false){
            alert("이용 약관에 동의 하셔야 회원가입이 가능합니다.");
            return false;
        }else if(checkIdFlag && checkMailFlag && $("#agree2").is(":checked") == false){
            alert("개인정보 수집 이용에 동의 하셔야 회원가입이 가능합니다.");
            return false;
        }else if(checkIdFlag && checkMailFlag && $("#agree3").is(":checked") == false){
            alert("위치서비스 이용에 동의 하셔야  회원가입이 가능합니다.");
            return false;
        }
		else{
			return true;
		}
		
	});
})

function blurId(obj){ 
	var val = obj.value;
	
	console.log(val);
	console.log(checkIdVal); 
	console.log()
	
	if(checkIdFlag && val != checkIdVal){ 
		checkIdFlag = false; //위의 조건이 아니면 아이디 중복체크를 무효화 
		
	}
}

</script>

<script>/*이메일 중복체크 */
var checkMailFlag = false; //아이디를 체크했는지에 대한 flag, 중복체크하면 true 안하면 false
var checkMailVal = ""; //아이디 값을 저장하는 변수
function checkMail() {
	var mailval = $("#mail").val(); //id의 값을 가져와 idval에 저장

	$.ajax({ 
		url:"checkMail.do",
		type: "post",
		data:"mail="+mailval,
		success:function(data){
			if(data == 1){ //중복인경우에는 
				alert("중복된 이메일입니다.");
				checkMailFlag = false;
				checkMailVal = ""; //id를 지움
			}
			else if($("#mail").val() == ""){
				alert("이메일을 입력하세요.");
				checkMailFlag = false;
				checkMailVal = "";
			}
			else{ //중복이 아닌경우에 
				alert("사용할 수 있는 이메일입니다.");
				checkMailFlag = true;
				checkMailVal = mailval;
				}
		}
	});
	

}


function blurMail(obj){ 
	var val = obj.value;
	
	console.log(val);
	console.log(checkMailVal); 
	console.log()
	
	if(checkMailFlag && val != checkMailVal){ 
		checkMailFlag = false; //위의 조건이 아니면 아이디 중복체크를 무효화 
		
	}
}

</script>

<script> /*전체 동의하면 전체 표시 , 상세보기 구현*/ 

$(document).ready(function() {
	$("#agree_all").click(function() {
		
		if($("#agree_all").is(":checked")) $("input[name=agree]").prop("checked", true);
		else $("input[name=agree]").prop("checked", false);
	});
	
	
});

$(function(){ 

	  $("#button1").click(function(){
	    $(".modal1").fadeIn();
	  });
	  
	  $(".modal_content1").click(function(){
	    $(".modal1").fadeOut();
	  });
	  
	
	
	$("#button2").click(function(){
	    $(".modal2").fadeIn();
	  });
	  
	  $(".modal_content2").click(function(){
	    $(".modal2").fadeOut();
	  });
	  
	$("#button3").click(function(){
		  $(".modal3").fadeIn();
	 });
		  
	 $(".modal_content3").click(function(){
		$(".modal3").fadeOut();
		 });
	
	 $("#button4").click(function(){
		    $(".modal4").fadeIn();
		  });
		  
		  $(".modal_content4").click(function(){
		    $(".modal4").fadeOut();
		  });
		
	
		});
</script>

<style>
		
     main{margin:0 auto;  width:1160px; }
        main h2{font-size:20px; margin:20px 250px; }
        input::placeholder {color:#7777; font-size:15px;}
        #frm {width:800px;margin-left:300px; }
        
        .t input{width:350px; height:30px; margin:10px; border:1px solid #e4e4e4; border-radius:10px;  padding-left:5px;}
        span{color:red;}
        .btn{width:100px; height:35px; border-radius:5px; border: none; background:#70ad47; color:white; 
                font-weight:bold; margin-left:40px; cursor: pointer;}
        .m input{margin-left:10px;}
        .b input:nth-child(1){width:100px; height:30px; margin:10px; border:1px solid #e4e4e4; border-radius:10px;}
        .b input:nth-child(2){width:40px; height:30px; margin:10px; border:1px solid #e4e4e4; border-radius:10px;}
        .b input:nth-child(3){width:40px; height:30px; margin:10px; border:1px solid #e4e4e4; border-radius:10px;}
        
         #agree input{margin-bottom:20px;}
        #agree h2{position:relative; left:-300px;}
        #agree button{ font-size:15px;}
        #agree a{display:inline-block; border-bottom:1px solid black; margin-left:10px; cursor: pointer;}
        .btn2{margin-left:30px; margin-top: 30px; width:300px; height:40px;  border: none; border-radius:5px;
        background:#70ad47; color:white; font-weight:bold; cursor: pointer;}
        #agree button{width:65px; height:22px; background:white; border:none; font-size:16px; border-bottom:1px solid black;
        }
        .modal1, .modal2, .modal3, .modal4{ 
		  position:absolute; width:120%; height:180%;  top:-350px; left:-200px; display:none; background: rgba(0, 0, 0, 0.3);
		}
		
		.modal_content1, .modal_content2, .modal_content3, .modal_content4{
		  width:600px; height:500px; padding:10px;
		  background:#fff; border-radius:10px;
		  position:relative; top:50%; left:50%;
		  margin-top:-100px; margin-left:-200px;
		  text-align:center;
		  box-sizing:border-box; padding:74px 0;
		  line-height:23px; cursor:pointer;
		
		}
</style>
</head>
<body>
	 <header>       
        <div >
        <p><a href="">로그인</a></p>
        <p><a href="">회원가입</a></p>
        <p><a href="">고객센터</a></p>
        </div><!-- 로그인 및 고객센터 관련 버튼--> 
        <nav class="navbar" > <!-- 네비게이션 -->
            <h1><a href=""><img src="../resources/upload/힐링캠프 logo.png" alt="홈버튼"></a></h1>
           
            <section></section>
        </nav>
    </header> 


    <main>
        <h2>회원가입</h2>
        <form id="frm" action="joinCounselor.do" method="post">
            <div class="t">
             <input type="hidden" name="usertype" id="usertype" value="c" > 
            <a>이름 <span>*</span><br> <input type="text" name="name" id="name" placeholder=" 이름" ></a><br> 
            <a>아이디  <span>*</span><br> <input type="text" name="id" id="id" onblur="blurId(this)" placeholder=" 아이디"  ></a><button class="btn" type="button" onclick="checkId()">중복확인</button>
            <br>
            <a>이메일 주소  <span>*</span><br> <input type="email" name="mail" id="mail" onblur="blurMail(this)" placeholder=" abc@naver.com"></a><button class="btn" type="button" onclick="checkMail()">중복확인</button> <br>
            <a>연락처  <span>*</span><br> <input type="number" name="phone" id="phone" placeholder=" 010-0000-0000"></a><button class="btn" type="button" onclick="requestCert()">인증요청</button><br>
            <a>인증번호  <span>*</span><br><input type="text" name="number" id="number" placeholder=" 인증번호"></a><button class="btn" type="button" onclick="checkCert()">인증하기</button><br>
            <a>비밀번호  <span>*</span><br> <input type="password" name="pw" id="pw" placeholder=" 비밀번호"></a><br>
            <a>비밀번호 확인  <span>*</span><br> <input type="password" name="pw2" id="pw2" placeholder=" 비밀번호 확인"></a><br>
            </div>
           
            <br><br>
            </div> 
           
        
        

        <div id="agree">
      <input type="checkbox" id="agree_all" value="agree_all"> 전체 동의 <br>
        <input type="checkbox" name="agree" id="agree1" value="1">  <span>*</span> 이용약관 동의 
        <button type="button" id="button1">상세보기</button>

			<div class="modal1">
			  <div class="modal_content1" 
			       title="(필수)이용약관 동의">
			   <strong>내담자 회원 가입 및 이용 약관</strong><br>
			    1. 이용자는 "회사"가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로써 회원가입을 신청합니다.<br>

                2. "회사"는 제 1 항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.<br>

                (1) 가입신청자가 이 약관 제 7 조 제 3 항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제 7 조 제 3 항에 의한 회원자격 상실 후 3 년이 경과한 자로서 "회사"의 회원 재가입 승낙을 얻은 경우에는 예외로 합니다.<br>

                (2) 등록 내용에 허위, 기재누락, 오기가 있는 경우<br>

                (3) 기타 회원으로 등록하는 것이 "회사"의 기술상 현저히 지장이 있다고 판단되는 경우<br>

                3. 회원가입의 성립시기는 "회사"의 승낙이 회원에게 도달한 시점으로 합니다.<br>

                4. 회원은 제 1 항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 및 기타 방법으로 "회사"에 그 변경사항을 알려야 합니다.<br>
			  </div>
			</div>
        <br>
        <input type="checkbox" name="agree" id="agree2" value="2">  <span>*</span> 개인정보 수집 이용 동의  <button type="button" id="button2">상세보기</button>

			<div class="modal2">
			  <div class="modal_content2" 
          	title="개인정보 수집 이용 동의">
			<strong>개인정보의 이용 및 보유기간</strong><br>
                고객의 동의 하에 수집된 개인정보는 회사가 고객에게 서비스를 제공하는 기간에 한하여 보유 또는 이용되며, 고객이 해지를 요청하는 경우에는 아래 '개인정보의 파기절차 및 방법'에 따라 파기됩니다. <br>
                다만, 회사는 고객의 개별 동의를 받은 경우, 고객이 요금을 미납한 경우, 개인정보 도용 등으로 인한 고객 피해발생시 피해자 보호, 
                소비자의 불만 및 분쟁 처리 등 관계법령의 규정에 따라 보존의 필요성이 있는 경우에는 아래와 같은 개인정보에 대하여 명시한 기간 동안 보존하는 것으로 합니다.<br><br>

                ① 회사와 고객간 민원, 소송 등 분쟁 과정 중 법률로 정한 보유기간이 경과한 경우

                - 분쟁 해결시까지 보존<br>

                ② 회사가 개별적으로 고객의 동의를 받은 경우<br>

                - 해당 동의 받은 기간까지 보존<br>

                ③ 관련 법령에 의한 개인정보 보유 기간<br>

                - 회원 가입 및 관리 기록: 1년<br>
         </div>
			</div>
        <br>
        <input type="checkbox" name="agree" id="agree3" value="3">  <span>*</span> 위치서비스 이용 동의 <button type="button" id="button3">상세보기</button>
        
        <div class="modal3">
			  <div class="modal_content3" 
          	title="위치서비스 이용 동의">
            <strong>개인위치정보의 이용 또는 제공</strong><br>
               1. 회사는 개인위치정보를 이용하여 서비스를 제공하고자 하는 경우에는 미리 이용약관에 명시한 후 개인위치정보주체의 동의를 얻어야 합니다.<br>

               2. 회원 및 법정대리인의 권리와 그 행사방법은 제소 당시의 이용자의 주소에 의하며, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다.<br>
                               다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.<br>

               3. 회사는 타사업자 또는 이용 고객과의 요금정산 및 민원처리를 위해 위치정보 이용·제공․사실 확인자료를 자동 기록·보존하며, 해당 자료는 1년간 보관합니다.<br>

               4. 회사는 개인위치정보를 회원이 지정하는 제3자에게 제공하는 경우에는 개인위치정보를 수집한 당해 통신 단말장치로 매회 회원에게 제공받는 자, 제공일시 및 제공목적을 즉시 통보합니다.<br><br>
               
                             단, 아래 각 호의 1에 해당하는 경우에는 회원이 미리 특정하여 지정한 통신 단말장치 또는 전자우편주소로 통보합니다.<br>

               (1) 개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우 <br>

               (2) 회원이 온라인 게시 등의 방법으로 통보할 것을 미리 요청한 경우

 
            </div>
			</div>
        <br>
        
        <input type="checkbox" name="agree" value="4"> 마케팅 정보 활용 동의  <button type="button" id="button4">상세보기</button><br>
         <div class="modal4">
			  <div class="modal_content4" 
          	title="마케팅 정보 활용 동의 ">
          	<strong>(선택)마케팅 정보 활용 동의</strong><br>
			서비스 관련 정보, 이벤트 및 광고성 정보 제공, 서비스의 유효성 확인 및 기타 서비스 개선을 위한 활동 등 정보를 전송합니다. <br>
			SMS, 이메일, 전화, 앱푸시, 카카오톡 알림 등의 방법으로 회원에게<br> 전송될 수 있습니다.<br><br>
			마케팅 정보 수신 여부 및 마케팅을 위한 개인정보 수집이용을 거부하실 수 있으며, 거부 시에도 바른상담실 상담:인 서비스를 이용하실 수 있으나, 동의를 거부한 경우 각종 소식 및 이벤트 참여에 제한이 있을 수 있습니다.
          	
        </div>  	
    	</div>
    	</div>
        <button class="btn2">가입완료</button>
       </form>
    </div>
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