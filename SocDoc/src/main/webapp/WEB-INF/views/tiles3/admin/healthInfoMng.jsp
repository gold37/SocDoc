<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%
	String ctxPath = request.getContextPath();
%>

<style type="text/css">

	h2 {
		font-weight: bold;
		padding-top: 30px;
	}
	
    .searchWord {
        font-size: 12px;
        width: 150px;
        height: 10px;
        padding: 10px;
        border: solid 1.3px #1b5ac2;
        float: right;
        margin-left: 5px;
    }

    .searchBtn {
        width: 40px;
        height: 23px;
        border: 0px;
        float: right;
        color: #ffffff;
        background-color: #1b5ac2;
    }
	
    select {
        float: right;
		margin: 15px 10px 20px 0px;
	}
    
    table {
		width: 100%;
		border-collapse: collapse;
		margin-top: 25px;
	}
	
    th {
		font-size: 14px;
	    font-weight: bold;
	    color: #222222;
	    text-align: center;
	    padding: 17px 3px;
	    border-top: 1px solid #333333;
	    border-bottom: 1px solid #333333;
	}
	
	td {
		font-size: 14px;
	    color: #666666;
	    text-align: center;
	    padding: 17px 0;
	    border-bottom: 1px solid #dddddd;
	    line-height: 1.8;
	
	}
	
	.healthTitle:hover {
		cursor: pointer;
	}
	
	#healthInfoList {
		width: 1000px;
		margin-left: auto;
		margin-right: auto;
	}
	
	#healthInfoList:after {
		content: '';
		clear: both;
		display: block;
	}

	th {
		text-align: center;
	}
	
	#ckAll {
	  	margin-top: 30px;
	  	background-color: #efefef;
      	cursor: pointer;   
      	float: left;
      	border: 1px solid #dddddd;       
      	padding: 0.25em .75em;    
      	border-radius: .25em;       
      	font-weight: 500;
      	font-size: 10pt;   
      	margin-right: 1		
    }

	#writeBtn {
		float: right;
		margin-top: 30px;
        margin-right: 20px;
        background-color: #0080ff;
      	color:#fff;
      	cursor: pointer;   
      	border: 1px solid #dddddd;       
      	padding: 0.25em .75em;    
      	border-radius: .25em;       
      	font-weight: 500;
      	font-size: 10pt;  
	}
	
	#deleteBtn {
		float: right;
		margin-top: 30px;
        background-color: #efefef;
        cursor: pointer;   
      	border: 1px solid #dddddd;       
      	padding: 0.25em .75em;    
      	border-radius: .25em;       
      	font-weight: 500;
      	font-size: 10pt;  
	}
	

</style>


	<div id="container" style="min-height: 70vh;">
		
		<div id="healthInfoList">
			<h2>건강정보관리</h2>
			 
            <p>전체 글 : ${totalCount}개</p>
           
            
            <table class="table table-hover" style="text-align: center;">
                <thead>
                     <tr>
                        <th>선택</th>
                        <th>No.</th>
                        <th>제목</th>
                        <th>등록일</th>
                     </tr>
                </thead>

                <c:forEach var="healthvo" items="${healthvoList}">
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td>${healthvo.infoSeq}</td>
                        <td><span class="healthTitle" onclick="goView('${healthvo.infoSeq}')">${healthvo.subject}</span></td>
                        <td>${healthvo.regDate}</td>
                    </tr>
                </c:forEach>

            </table>
            
            <button id="ckAll">전체선택</button>
            <button id="deleteBtn">삭제</button>
            <button id="writeBtn" onclick="location.href='<%= ctxPath%>/healthWrite.sd'">글쓰기</button>
            
        </div>
            <div align="center">
				${pageBar}
			</div>
			
			<form name="goViewFrm">
				<input type="hidden" name="infoSeq" />
            </form>
		</div>

		


<script type="text/javascript">
	<%-- 
	$(".healthTitle").click(function(){ 
		
	    location.href='<%= ctxPath%>/healthView.sd';
	    
	});
	 --%>
	
	$(document).ready(function($){	 
		
		
	});	 // end of $(document).ready(function($){}) ----------------------------
		
	
	function goView(infoSeq) {
 		var frm = document.goViewFrm;
		frm.infoSeq.value = infoSeq; 
		
		frm.method = "GET";
		frm.action = "<%=ctxPath%>/healthView.sd";
		frm.submit();
	}
		
	
</script>   		