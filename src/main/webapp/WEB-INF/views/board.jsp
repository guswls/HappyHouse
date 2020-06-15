<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:url value="/" var="root" />
<html>
<head>
	<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
 
  <script>
  
  
  function showUpForm(no){
		$('#list1').hide();
		$('#updateform').show(500);
		$.ajax({
			type:'GET',
			url:'${root}api/board/'+no,
			dataType:'json',
			success:function(data){
				console.log(data);
				console.log($('#upform input[name=start_date]'));
				console.log(data.name);
				console.log(data.start_date);
				$('#updateform input[name=no]').val(data.no);
				$('#updateform input[name=subject]').val(data.subject);
				$('#updateform textarea[name=content]').val(data.content);
			}
      });
}//수정폼 보이기

  
  $(document).ready(function(){
	  $('noticeform').hide();
	  $('list').show();
	  listPrint();
	    
	  $('#btn_insert').click(function(){        
		  console.log("sdascdssssscda")
		  	$.ajax({
					type:'POST',
					headers : {
						"Content-Type" : "application/json"
					},
					url:'${root}api/board',
					data:JSON.stringify({
						  no: $("#noticeform2 input[name=no]").val(),
						  subject: $("#noticeform2 input[name='subject']").val(),
						  content: $("#noticeform2 textarea[name='content']").val()
					     }),
					success:function(data){    		
						$('#noticeform').hide();
						$('#list').show();	
						listPrint();
						alert("등록이 완료되었습니다.");
					}
				});
		  });//게시글   
	  
		 $('#bt_update').click(function(){   
	        	
	        	$.ajax({
	    			type:'PUT',
	    			url:'${root}api/board/' +$("#updateform input[name=no]").val(),
	    			headers:{"Content-Type":"application/json"},
	    			data:  JSON.stringify(
	    				 {
	    					  no: $("#updateform input[name=no]").val(),
							  subject: $("#updateform input[name='subject']").val(),
							  content: $("#updateform textarea[name='content']").val()

	    			     })
	    			     ,
	    			success:function(data){    	
	    				$('#updateform').hide();
	    				listPrint();
	    			}
	    		  });
	        });//수정요청
	        
	        
	        
	        $('#bt_del').click(function(){  
	        	$.ajax({
	    			type:"DELETE",
	    			url:"${root}api/board/"+$("#updateform input[name=no]").val(),    			
	    			success:function(result){
	    				if(result.status){
	    					$('#updateform').hide();
		    				listPrint();
	    				}
	    				
	    			}
	    				
	    			
	    		  });	
	        });//삭제요청
		  
	});//ready

 
  
	  function registFun(){
		  $('#list1').hide();
		  $('#noticeform').show();
	  }
		//리스트 출력
	  function listPrint(){
	 	     $.ajax({
	 				type:'GET',
	 				url:'${root}api/board',
	 				dataType:'json',
	 				success:function(data){
	 					var htmlTxt = '<table border="1px solid "><tr><th>번호 </th><th>제목</th><th>날짜</th></tr>';
						$.each(data,function(index, value) {
							htmlTxt += '<tr><td><a href="javascript:showUpForm('
										+ value.no
										+ ')">'
										+ value.no
										+ '</td><td>'
										+ value.subject
										+ '</td><td>'
										+ value.date
										+ '</td></tr>';
						});
						htmlTxt += '</table>'
						$('#list').html(htmlTxt);
	 				}
	 	     });
	       }//목록보기
	     
	       
	       
  </script>
</head>
 
<body>
	<%@ include file="/WEB-INF/views/nav.jsp" %>
<br>
<!-- 리스트 폼 -->
		<div class="col-lg-6" align="center"  style="margin: auto" id ="list1">
			<h2>공지사항 목록</h2>
			<h2>${msg}</h2>
			<table class="table table-bordered table-hover"  id ="list">
				<tr>
					<th>번호</th>
					<th>제목</th>
				
					<th>날짜</th>
				</tr>
				<c:forEach var="notice" items="${notices}"> 
					<tr>
						<td width="30">${notice.no}</a>
						<td width="100">${notice.subject}</td>
						<td width="100">${notice.date}</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${userinfo.userid eq \"admin\"}">
			<br>
			<br>
				<button class="btn btn-primary" id="bt_ins" onclick="registFun()">등록</button>
			</c:if>
		</div>

<div class="container" align="center" style="display: none" id="noticeform" >
	<div class="col-lg-6" align="center">
		<h2>공지사항 등록</h2>
		<form id="noticeform2" method="post" >
		<input type="hidden" name="act" id="act" value="regist">
			<div class="form-group" align="left">
				<label for="subject">제목:</label>
				<input type="text" class="form-control" id="subject" name="subject" required="required">
			</div>
			<div class="form-group" align="left">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="15" id="content" name="content" required="required"></textarea>
			</div>
		
			<div class="form-group" align="center">
				<button type="reset" class="btn btn-warning">초기화</button>
				<button type="submit" class="btn btn-primary" value="등록" id="btn_insert">등록</button>
			</div>
			
		</form>
	</div>
</div>


<div class="container" align="center" style="display: none" id="updateform"  >
	<div class="col-lg-6" align="center">
		
		<form id="updateform" >
		<input type="hidden" name="act" id="act" value="update">
			<div class="form-group" align="left">
				<label for="no">번호:</label>
				<input type="text" class="form-control" id="no" name="no" value="${notice.no}"readonly="readonly">
			</div>
			<div class="form-group" align="left">
				<label for="subject">제목:</label>
				<input type="text" class="form-control" id="subject" name="subject" value="${notice.subject}" required="required" ${ro}>
			</div>
			<div class="form-group" align="left">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="15" id="content" name="content" required="required" value="${notice.content}"> ${notice.content}</textarea>
			</div>
			
		
			<div class="form-group" align="center">
				<c:choose>
					<c:when test="${userinfo.userid ne 'admin'}">
						<button class="btn btn-primary" id="bt_check">확인</button>
					</c:when>
					<%-- <c:when test="${update==null}">
						<a href="${root}/noticeBoard" role="button" class="btn btn-primary">확인</a>
						<a href="${root}/noticeBoard" role="button" class="btn btn-primary">수정</a>
					</c:when> --%>
						
					<c:otherwise>
						<button class="btn btn-primary" id="bt_update" >수정</button>
						<button class="btn btn-primary"  id= "bt_del">삭제</button>
					</c:otherwise>
				</c:choose>
			</div>
			
		</form>
	</div>
</div>
		
	<hr>
  <!-- Footer -->
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-8 mx-auto">
          <ul class="list-inline text-center">
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
          </ul>
          <p class="copyright text-muted">Copyright &copy; Your Website 2020</p>
        </div>
      </div>
    </div>
  </footer>
</body>
</html>
