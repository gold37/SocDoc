<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();
%>
    
    
<style type="text/css" >

	.container { 
		width: 60%;
		margin: auto;
		padding: 0;
	}

	.textPrimary {
		margin-bottom: 50px;
	}
	
	h2 {
        font-weight: bold;
		padding-top: 30px;
	}

	th {
		text-align: center;
	}
	
	#hospitalList {
		width: 800px;
		margin-left: auto;
		margin-right: auto;
	}
    
    table {
		width: 80%;
		border-collapse: collapse;
	}
	
	thead > tr > th {
		font-size: 18px;
	    color: #222;
	    text-align: left;
	    padding: 20px 0px 20px 10px;
	    border-top: 1px solid #333333;
	    border-bottom: 1px solid #333333;
	}
	
	input.input_title {
		height: 30px;
		padding-left: 10px;
	}
	
	tbody > tr > td {
		font-size: 16px;
	    color: #222222;
	    text-align: left;
	    padding: 10px 10px 10px 10px;
	    border-bottom: 1px solid #dddddd;
	    line-height: 1.8;
	
	}
	
	div#notice_button_wrap {
		display: inline-block;
		width: 850px;	
	}
	
	p#notice_button {
		display: inline-block;
		border-radius: 3px;
	    height: 45px;
	    width: 84px;
	    background: #666666;
		color: white;
		float: right;
		margin: 30px 20px 50px 0px;
	}
	
	a.notice_write {
		display: inline-block;
	    font-size: 14px;
	    color: #fff;
	    text-align: center;
	    height: 45px;
	    line-height: 45px;
	    width: 100%;
	    text-decoration: none;
	}
	
	a.delete, a.create, a.list {
		cursor: pointer;
	}
    
	.th {
		font-size: 16px;
	    font-weight: bold;
	    color: #222222;
		background: #f4f4f2;
	}
	
	a {
      text-decoration: none;
    }
</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>


<div class="container">

	<header>
		<h2 class="textPrimary">공지사항 글수정</h2>
	</header>
			
	<section>
		<form name="editNoticeFrm">
			<table>
				<thead>
					<tr>
						<th>
							<input type="hidden" name="noticeSeq" value="${noticevo.noticeSeq}" />
							<input type="text" id="subject" name="subject" value="${noticevo.subject}" size="116" class="input_title" style="margin: 0px; width: 854px;" placeholder="제목"/>
						</th>
					</tr>
				</thead>
					
				<tbody>
					<tr>
						<td>
							<textarea id="content" name="content" rows="20" cols="119" style="margin: 0px; width: 854px; height: 293px;" placeholder="내용" >${noticevo.content}</textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</form>	
		<div id="notice_button_wrap">
			<p id="notice_button">
				<a type="button" id="btnNoticeUpdate" class="create notice_write">수정</a> 
			</p>
			<p id="notice_button">
				<a type="reset" class="delete notice_write">취소</a> 
			</p>
		</div>		
		
		<br/><br/><br/>
	</section>
</div>


<script type="text/javascript">
	$(document).ready(function(){
		
		$("#btnNoticeUpdate").click(function(){
			goUpdate();
		});
	
	});
	
	
	function goUpdate() {
		var subject = $("#subject").val().trim();
		var content = $("#content").val().trim();
		
		if (subject == "") {
			alert("제목을 입력해주세요");
			return "admin/adminNoticeEdit.sd";
		}
		
		if (content == "") {
			alert("내용을 입력해주세요");
			return;	
		}
		
		var frm = document.editNoticeFrm;
		frm.action = "<%= ctxPath%>/editNoticeEnd.sd";
		frm.method = "POST";
		frm.submit();
	}

</script>
