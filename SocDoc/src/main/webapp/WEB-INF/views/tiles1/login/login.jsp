<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>속닥 로그인</title>

<style type="text/css">

/* 	body {
		font-family: Arial, "MS Trebuchet", sans-serif;
		width: 1100px;
		margin: 0 auto;
	} */
   
	form {
		width: 100%;
	}

	.container { 
		width: 35%;
		height: 500px;
		margin: 100px auto 200px auto;
		padding: 0;
		border: solid 1px red;
	}
   
	#box {
		width: 60%;
		margin: 50px auto;
		padding: 0;
		border: solid 1px blue;
	}
   
	/* 탭(개인회원/병원회원) */
	#tab {
		display: flex;
		flex-direction: row;
	}
   
	/* 버튼 클릭 안됐을 때 */
	.buttonOff {
		flex:1;
    	padding: 15px 0;
   		font-size: 14pt;
   		font-weight: bold;
   		background-color: white;
   		color: #ccc;
   		border: solid 1px #f4f4f1;
   		border-bottom: solid 3px #58ACFA;
	}
	
 	/* 버튼 클릭 됐을 때 */
	.buttonOn {
		flex:1;
	    padding: 15px 0;
    	font-size: 14pt;
    	font-weight: bold;
    	background-color: #58ACFA;
    	color: #fff;	
    	border: solid 0px black;
	} 
   
	/* -------------------------------- 上 끝 ---------------------------------- */
   
	/* 아디비번 입력 */
	.formGroup {   
		padding-top: 20px;
		box-sizing: border-box;
	}
   
	.formControl {
		float:left;
		width: 70%;
		height: 35px;
		padding-left: 10px;
	}

	#btnLogin {
		display: inline-block;
		width: 25.7%;
		height: 82px;
		padding: 0 10px;
		background-color: #58ACFA;
		border: solid 1px #ccc;
		color: white;
		font-weight: bold; 
	}
   
	#bottomBtn > ul li {
		display: inline-block;
		padding-right: 10px;
	}
	
	a {
		text-decoration: none;
	}
    
	.bottom {
		list-style: none;
		padding-left: 0;
	}
    
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(window).ready(function(){
		
		// 개인회원가입 버튼을 눌렀을 때
		$("#memTab").click(function(){
			
			// 탭 색깔 바꾸기
			$("#tab > a").removeClass();
		    $(this).addClass("buttonOn");
		    $("#hpMemTab").addClass("buttonOff");
		    
			$(".individualMember").show();
			$(".hospitalMember").hide();
			
		});	
		$("#memTab").trigger("click");
		
		// 병원회원가입 버튼을 눌렀을 때
		$("#hpMemTab").click(function(){
			
			// 탭 색깔 바꾸기
			$("#tab > a").removeClass();
		    $(this).addClass("buttonOn");
		    $("#memTab").addClass("buttonOff");
		    
			$(".hospitalMember").show();
			$(".individualMember").hide();
		});	
	});	
</script>	
	
	
<script type="text/javascript">

	window.onload = function() {
		$("#btnJoin").click(function(){
	         goLogin(); // 로그인 시도한다.
		});
	      
		$("#loginPwd").keydown(function(event){
	         if(event.keyCode == 13) { // 암호입력란에 엔터를 했을 경우 
	            goLogin(); // 로그인 시도한다.
			} 
		});
	}	
	
	/* === 로그인 처리 함수 === */
	function goLogin() {
   
		var loginUserid = $("#loginUserid").val().trim();
		var loginPwd = $("#loginPwd").val().trim();
      
		if(loginUserid == "") {
			alert("아이디를 입력하세요!!");
			$("#loginUserid").val("");
			$("#loginUserid").focus();
			return; 
      	}
      
      	if(loginPwd == "") {
        	alert("암호를 입력하세요!!");
        	$("#loginPwd").val("");
         	$("#loginPwd").focus();
         	return;  
      	}
      
      	var frm = document.loginFrm;
      	frm.method = "post";
      	frm.action = "<%=request.getContextPath()%>/final/login";
      	frm.submit();
	}
</script>



</head>
<div class="container">
   

   <h2 class="textPrimary">로그인</h2>
   
   <div id="tab" align="center">	
        <a href="#" class="buttonOn" id="memTab" role="button" title="개인회원 로그인">개인회원</a>
        <a href="#" class="buttonOff" id="hpMemTab" role="button" title="병원관계자 로그인">병원회원</a>
   </div>   
   
   <!-- -------------------------------- 上 끝 ---------------------------------- --> 
   
	<form name="loginFrm">
		<div id="box">
			<div class="checkbox">
				<label><input type="checkbox" name="rememberEmail">아이디저장</label>
			</div>
	         
			<div class="formGroup">
	            <div class="input">
					<label for="userid"></label>
					<input type="text" class="formControl" name="loginUserid" id="userid" value="" placeholder="아이디" /> 
				</div>
	             
	            <div class="input">
	                <label for="pwd"></label>
					<input type="password" class="formControl" name="pwd" id="loginPwd" value="" placeholder="비밀번호"/> 
	            </div>
	
		        <div class="btnJoin">
					<input type="button" id="btnLogin" value="로그인" onClick="goRegister();" /> 
		        </div>
			</div>
	         
			<div id="bottomBtn">
				<ul id="input" class="bottom" style="width: 100%; font-size: 8pt;">
					<li><a href="/MyMVC/final/register.html" class="bottom btnJoin" style="font-weight: bold;">회원가입</a></li>
					<li>|</li>
					<li><a href="/MyMVC/final/idFind.html" class="bottom btnSearchId">아이디 찾기</a></li>
					<li>|</li>
					<li><a href="/MyMVC/final/pwdFind.html" class="bottom btnSearchPasswd">비밀번호 찾기</a></li>
				</ul>
			</div>
		</div>
	</form>
    
</div>
