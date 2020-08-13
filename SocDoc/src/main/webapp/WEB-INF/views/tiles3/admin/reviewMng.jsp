	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

	th {
		text-align: center;
	}
	
	#reviewList {
		width: 1000px;
		margin-left: auto;
		margin-right: auto;
	}
	
	#reviewList:after {
		content: '';
		clear: both;
		display: block;
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
		
		<div id="reviewList">
			<h2>후기관리</h2>
				
		   <form name="searchFrm">		
	           <button class="searchBtn" onclick="goSearch()">검색</button>
	            <input type="text" class="searchWord" id="searchWord" name="searchWord" placeholder="검색어를 입력하세요">
	            <select name="searchType" id="searchType">
	                <option selected="selected" value="">기관명</option>
	                <option value="userid">작성자</option>
	            </select>
            </form>
            
            <p>전체 후기: ${totalCount}개</p>
			
			<table class="table table-hover" style="text-align: center;">
                <thead>
                     <tr>
                        <th>선택</th>
                        <th>기관명</th>
                        <th>내용</th>
                        <th>별점</th>
                        <th>작성자</th>
                        <th>작성일</th>
                     </tr>
                </thead>
				<c:forEach var="reviewvo" items="${reviewvoList}">
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td>${reviewvo.name}</td>
                        <td>${reviewvo.content}</td>
                        <td>${reviewvo.rating}</td>
                        <td>${reviewvo.userid}</td>
                        <td>${reviewvo.regDate}</td>
                    </tr>
				</c:forEach>

            </table>
            
            <button id="ckAll">전체선택</button>
            <button id="deleteBtn">삭제</button>
            
		</div>
		
            <div align="center">
				${pageBar}
			</div>
	
	</div>
	
	
	
<script type="text/javascript">
	
	$(document).ready(function(){
		
		$("#searchWord").keydown(function(event){
			if(event.keyCode == 13) {
				goSearch();
			}
		});
		
		if(${paraMap != null}) {
			$("#searchType").val("${paraMap.searchType}");
			$("#searchWord").val("${paraMap.searchWord}");
		}
		
	});
	
	
	function goSearch() {
		var frm = document.searchFrm;
			frm.method = "GET";
			frm.action = "<%= request.getContextPath()%>/reviewMng.sd";
			frm.submit();
	}

</script>		