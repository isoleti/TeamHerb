<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="ko" style="--vh:5.02px;">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>치료 프로그램</title>
    <!--부트스트랩, header footer css 연결-->
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">
    <style>
        .table-success{margin: auto; width:70%; height:auto;}
        table .title{width:12%; text-align: center;}
        table th{width:7.5%; text-align: center;}
        table tr{margin:5%, auto;}
        body main .table-success th,
        body main .table-success td{background-color:#dff6f1;}
    </style>
</head>
<body>
    <header>        
       <div> <!--로그인 관련-->
             
          <c:if test = "${login == null}">   
            <p><a href="<%=request.getContextPath() %>/user/login.do">로그인</a></p>
            <p><a href="<%= request.getContextPath() %>/joinMain.do">회원가입</a></p>
            <p><a href="<%=request.getContextPath() %>/customerService/customerNotice.do">고객센터</a></p>
         </c:if><!-- 로그아웃 or 로그인x -->
         
        <c:if test = "${login != null}">
            
               <p><a href="">로그아웃</a></p>
               <c:if test = "${login.usertype eq 'a'}">
               <p><a href="">관리자 페이지</a></p>
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
    </header>
    <main>
        <table class="table table-success">
            <tr>
                <th rowspan="6">개인상담<br> 프로그램</th>
                <td class="title">놀이치료</td>
                <td>&nbsp;놀이치료는 아이들에게 가장 편안하고 익숙한 놀이를 통해서 정서적 사회적 욕구를 충족시키고, 심리적인 상처를 표현함으로써 아동이 스스로의 문제를 해결하고 건강한 성장과 발달을 이룰 수 있도록 돕는 심리치료입니다.
                    <br>주요대상 : 다양한 문제행동을 표출하는 아동, 주의가 산만하고 집중을 못하는 아동, 자신감이 부족하고 위축되어있는 아동, 컴퓨터 게임에 빠져있는 아동, 또래관계 형성에 어려움을 보이는 아동, 학습의욕이 없거나 학습장애가 있는 아동에게 도움을 줄 수 있습니다. </td>
            </tr>
            <tr>
                <td class="title">미술치료</td>
                <td>&nbsp;미술치료는 매체를 바라보고 선택하고 미술활동을 하는 과정에서 무의식적인 감정이나 생각을 다양하게 표출하고 의식화하는 작업 속에서 자신의 억압된 감정표현이나 내면의 갈등이 해소되도록 돕는 심리치료입니다. 미술에 대한 특별한 재능을 필요로 하는 것이 아니라 자발적인 표현활동을 통해 성장할 수 있도록 돕는 치료입니다.
                    <br>주요대상 : 주의집중을 잘하지 못하는 아동, 의사표현이 부족한 아동, 공격적인 행동을 하는 아동, 감정조절이 어려운 아동 뿐 아니라 심리 문제를 다루길 원하는 성인에게도 도움을 줄 수 있습니다.</td>
            </tr>
            <tr>
                <td class="title">모래놀이치료</td>
                <td>&nbsp;모래상자를 이용하여 자유롭게 자신의 감정을 발산하고 내면세계를 스스로 표현함으로써 자신을 통찰할 수 있는 기회를 갖고, 치료과정에서 나쁜 감정을 표현한 후 긍정적인 면들을 인식하고 자존감을 고취시켜 정서적인 성장을 이룰 수 있도록 돕는 치료입니다.
                    <br>주요대상 : 학교에 적응을 못하는 아동, 따돌림 당하는 아동, 우울증을 보이는 아동, 자신감이 없어서 쉽게 포기하는 아동, 비행행동을 보이는 아동 뿐 아니라 심리 문제를 다루길 원하는 성인에게도 도움을 줄 수 있습니다.</td>
            </tr>
            <tr>
                <td class="title">음악치료</td>
                <td>&nbsp;언어발달지체 및 언어장애를 치료하기 위하여 적절한 치료와 교육을 실시하고, 보호자 상담 및 교육을 통하여 일상생활에서 언어발달을 촉진할 수 있도록 돕는 치료입니다.
                    <br>주요대상 : 언어발달 지체와 언어발달 장애를 지닌 아동에게 도움을 줄 수 있습니다.</td>
            </tr>
            <tr>
                <td class="title">언어치료</td>
                <td>&nbsp;음악이라는 매개를 이용하여 다양한 음악활동을 통해 마음속에 억압된 불만이나 증오를 표현하여 발산하고, 음악을 통해 스스로를 지지 및 격려하여 건강한 성장과 발달을 이룰 수 있도록 돕는 치료입니다.
                    <br>주요대상 : 부모와의 애착이나 학교 적응에 어려움을 보이는 아동, 학습장애를 가진 아동, 창의성과 자기표현, 정서개발의 욕구를 가진 아동을 위한 심리치료입니다.</td>
            </tr>
            <tr>
                <td class="title">인지학습치료</td>
                <td>&nbsp;인지기능이 현저하게 떨어지거나 불균형이 나타나는 등의 다양한 학습장애를 보이는 아동의 인지기능을 개선하도록 돕는 치료입니다.
                    <br>주요대상 : 인지장애(정신지체, 발달지체), 주의력결핍과잉행동장애를 가진 아동, 학습장애를 지닌 아동, 언어발달 지체와 언어발달 장애를 지닌 아동에게 도움을 줄 수 있습니다.</td>
            </tr>
            <tr>
                <th rowspan="2">집단상담<br> 프로그램</th>
                <td class="title">사회성 기술 훈련</td>
                <td>&nbsp;대인관계 과정을 경험하여 효과적인 사회적 기술을 배우고, 자신과 타인이 느끼는 감정을 서로 주고 받음으로 자신의 대인관계 패턴을 알며 자기이해 및 자기 수용을 배울 수 있습니다.
                    <br>주요대상 : 학교생활 적응이 어려운 아동, 친구관계에 어려움이 있는 아동, 자기중심적인 아동</td>
            </tr>
            <tr>
                <td class="title"> 자존감 향상 프로그램</td>
                <td>&nbsp;자신의 긍정적인 면을 인식하여, 소중한 자신을 깨달아 긍정적 자신감 배양을 배움으로써 사회성을 증진시키고 자존감을 향상시킬 수 있습니다.
                    <br>주요대상 : 또래관계가 원만하지 못한 아동, 자신감이 부족하거나 자립능력이 결핍되어있는 아동</td>
            </tr>
        </table>
    </main>
    <footer> <!-- footer -->
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
</footer> <!-- end footer -->
</body>
</html>