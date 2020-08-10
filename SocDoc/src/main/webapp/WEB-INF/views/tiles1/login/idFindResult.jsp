<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>속닥 아이디 찾기 결과</title>

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
		height: 150%;
		margin: 100px auto 200px auto;
		padding: 0;
		border: solid 0px red;
	}
   	
   	.bowl {
   		//border: solid 1px #ccc;
   	}
   	
	/* -------------------------------- 上 끝 ---------------------------------- */
	
	.description {
		margin-top: 10px;
		font-size: 9pt;
	}
   
	#bottomBtn > ul li {
		display: inline-block;
		padding-right: 10px;
	}
   
   	table {
	    width: 100%;
	    margin: 40px auto;
	    border-collapse: collapse;
	}
	
	thead {
		background-color: #F8F8F8;
	}
	
	th {
		padding: 17px 3px;
	    font-size: 14px;
	    font-weight: bold;
	    color: #222222;
	    text-align: center;
	    border-top: 1px solid #333333;
	    border-bottom: 1px solid #333333;
	}
	
	td {
	    padding: 17px 0;
	    text-align: center;
	    font-size: 14px;
	    line-height: 1.8;
	    color: #666666;
	    border-bottom: 1px solid #dddddd;
	}
   
	.btnJoin {
   		margin-top: 50px;
   		text-align: center;		
	}
    
	#btnLogin {
	    width: 200px;
	    height: 60px;
	    font-size: 20px;
	    font-weight: bold;
	    color: #fff;
	    background-color: #58ACFA;
	    border: solid 1px #ccc;
	}
   
	#btnFind {
	    width: 200px;
	    height: 60px;
	    font-size: 20px;
	    font-weight: bold;
	    color: black;
	    background-color: #fff;
	    border: solid 1px #ccc;
	}
    
        
	a {
		text-decoration: none;
    }
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<script type="text/javascript">
	$(window).ready(function(){

	});
</script>



</head>

<div class="container">
   
	<div class="bowl">
	
		<h2 class="textPrimary">아이디 찾기</h2>   
		<hr>
	    <div class="description"> 아이디 조회 결과 입력하신 정보와 일치하는 아이디는 아래와 같습니다. </div> 
	    
		<!-- -------------------------------- 上 끝 ---------------------------------- --> 
		    
		<form name="findFrm">
			<div id="box">
				<table>
					<thead>
				      	<tr>
				      		<td>구분</td>
				      		<td>아이디</td>
				      		<td>가입일</td>
				      	</tr>
		      		</thead>
		      		
		      		<tbody>
			      		<tr>
			      			<td>일반회원</td>
			      			<td>leess</td>
			      			<td>2020-02-02</td>
			      		</tr>
					</tbody>
				</table>
			      
				<div class="btnJoin">
					<input type="button" id="btnLogin" value="로그인" onClick="goRegister();" />
					<input type="button" id="btnFind" value="비밀번호 찾기" onClick="goRegister();" />
				</div> 
			</div>	    
		</form>
	</div>
</div>