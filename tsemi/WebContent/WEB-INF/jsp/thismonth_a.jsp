<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%><%@ taglib prefix="q" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>;;; - 이달의 활동왕</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:300);
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

html, body {
    margin: 0;
    padding: 0;
}

.headers {
    font-family: 'Hanna', fantasy;
    font-size: 40px;
    margin: 0 10px;
    height: 50px;
    border-bottom: 2px #00CC00 solid;
}

.menu_font {
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: bold;
    font-size: 17px;
    margin-left: 7px; 
    color: #0D5718;
}

.menu {
    width: 20%;
    height: 920px;
    float: left;
    background-color: #4CE564;
    margin: 10px 0px 0px 0px;
    border-radius: 0 10px 0 0;
}

.top_menu {
    background-color: #4CE564;
    margin-top: 50px;
    margin-left: 5px; 
}

.middle_menu {
    background-color: #4CE564;
    margin-top: 20px;
    margin-left: 5px; 
}

.bottom_menu {
    background-color: #4CE564;
    margin-top: 50px;
    margin-left: 5px; 
}

.point_menu {
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 17px;
    background-color: green; 
    padding: 10px; 
    color: #FDFFF2;
    font-weight: bold;
    margin-top: 20px;
    /* margin-left: 5px; */
    box-shadow: 0 0 10px green;
}

.content {
    width: 80%;
    height: 920px;
    float: right;
    background-color: #FDFFF2;
    margin: 10px 0px 0px 0px;
}

.con_menu_font {
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: bold;
    font-size: 20px;
    color: #0D5718;
    margin-left: 25px; 
}

.this_list {
    margin-left: 25px;
    width: 94%;
    height: 80%;
    background-color: #FDFFF2;
    font-family: 'Noto Sans KR', sans-serif;
}

.this_list2 {
    margin-left: 25px;
    width: 94%;
    margin-bottom: 10px;
    font-family: 'Noto Sans KR', sans-serif;
}

.con1 {
    display: flex;
}

.list {
    padding: 13px 10px;
    border: 1px solid #FFDD3D;
    border-left: 3px solid #00CC00;
    border-right: 3px solid #00CC00;
    font-family: 'Noto Sans KR', sans-serif;
    color: green;
}

.a_king {
    width: 20%;
    /*border: 3px solid #FFDD3D;*/
    margin-right: auto;
    margin-left: auto;
}

.q_king {
    width: 70%;
    /*border: 3px solid #FFDD3D;*/
    margin-right: auto;
    margin-left: auto;
}

.a_king_top {
    width: 20%;
    margin-right: auto;
    margin-left: auto;
    margin-top: 10px;
    font-weight: bold;
    color: green;
}

.q_king_top {
    width: 70%;
    margin-right: auto;
    margin-left: auto;
    margin-top: 10px;
    font-weight: bold;
    color: green;
}

a {
    text-decoration: none;
    color: green;
}

.wrapper {
  display: flex;
  ovreflow: hidden;
}

.this_q {
    height:746px;  overflow: auto;
}

.this_q::-webkit-scrollbar {
    background-color: #FDFFF2;
}

/*
.this_q::-webkit-scrollbar-thumb {
    background-color: #FFDD3D;
    border-radius: 10px;
    background-clip: padding-box;
    border: 3px solid transparent;
}

.this_q::-webkit-scrollbar-track {
    background-color: #FDFFF2;
}
*/

/* 로그아웃 버튼 */
.logout {    
    margin-top: 21px;
    margin-right: 10px;
    /* margin-left: auto; */
    /* float: right; */
    font-family: 'Noto Sans KR', sans-serif;
    text-transform: uppercase;
    outline: 0;
    background: #FDFFF2;
    border: 0;
    padding: 5px 10px;
    color: black;
    -webkit-transition: all 0.3 ease;
    transition: all 0.3 ease;
    cursor: pointer;
    border-radius: 5px 5px 0 0;
}

.logout:hover,.logout:active,.logout:focus {
  background: #00CC00;
  font-color: #FDFFF2;
}

.hi {
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 17px;
    margin-top: auto;
    margin-bottom: 5px;
    margin-left: auto;
    font-weight: bold;
    color: #0D5718;
}

</style>
<script src="https://ajax.googleapis.com/aja/libs/jquery/3.2.0/jquery.min.js"></script>
</head>
<body>
	<header class="headers con1">
        <a style="color: #0D5718; margin-left: 10px; margin-top: auto; font-size: 50px;" href="home.do">;;;</a>
        <div class="hi" style="margin-top: auto;">
            Hi ${username }
            <button style="color: #0D5718; margin-left: 15px;" class="logout" onclick="location.href='login.do';">로그아웃</button>
        </div>
    </header>
    <div class="wrapper">
        <div class="menu">
            <!-- <div class="menu_font">Triple<br/>semicolon</div>  -->
            <div class="menu_font"></div>
            <div style="position:sticky; top:50px;">
               <div class="bottom_menu menu_font" style="cursor: pointer;" onclick="location.href='mypage.do';">마이페이지</div>
                
	            <div class="top_menu menu_font" style="cursor: pointer;" onclick="location.href='notice.do';">공지사항</div>
	            <div class="middle_menu menu_font" style="cursor: pointer;" onclick="location.href='qna_list.do';">Q & A</div>
	            <div class="middle_menu menu_font" style="cursor: pointer;" onclick="location.href='com_list.do';">잡담</div>
	            
	            <div style="background-color: green;">
	                <div class="point_menu" style="cursor: pointer;" onclick="location.href='month_act.do';">이달의 활동왕</div>
	            </div>
	            
	            <div class="bottom_menu menu_font" style="cursor: pointer;" onclick="window.open('https://github.com/');">Go to Github</div>
            </div>
        </div>
        <div class="content">
            <h4 class="con_menu_font">이달의 활동왕</h4>
            <div class="this_list2 con1">
                <div class="a_king_top">이달의 답변왕</div>
				<div class="q_king_top">이달의 질문</div>
		                <!--<div class="q_king_top" style="cursor: pointer;" onclick="location.href='qna.do?no=${list.no}';">이달의 질문</div>
						-->
            </div>
            <div class="this_list con1">
                <div class="a_king" style="text-align: center;">
                	<q:forEach items="${ans_ls}" end="14" var="t">
                		<div class="list">
                			<a href="mypage.do?username=${t.username}">${t.username}</a>
                		</div>
                	</q:forEach>
                </div>
                
                <div class="q_king">
                    <div class="list this_q" style="color: black; padding: 10px 20px;">
                    	<q:choose>
                        	<q:when test="${!(empty list)}">
		                        <div style="font-weight: bold; font-size: 20px;">
		                        	<a href="qna.do?no=${list.no}">${list.title}</a>
		                        </div>
		                        
			                    <div style="color: black; padding: 10px 20px;">
				                	${list.content}
			                    </div>
							</q:when>
							<q:otherwise>
								<div style="padding: 20px 10px 10px 10px;">좀 더 분발하시길~,~</div>
							</q:otherwise>
						</q:choose>	
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>