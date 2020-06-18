<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/" var="root" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<%@ include file = "/WEB-INF/views/nav.jsp"%>
<h1> <img src="/resources/img/heart.png" width="50px"> 관심 거래 목록 리스트</h1>

   <form>
   <div id="housedeals">

   </div>
         <table>
           <tr>
           <br>
        
           <td>
              ${navigation.navigator}
           </td>
           </tr>
           </table>
      
   </form>

<button id="rank" onclick="getRank()" type="button" class="btn btn-default"><img src="/resources/img/crown.png" width="50px"><h3>인기순위 확인하기</h3></button><br>
   <form>
   <div id="hds">

   </div>
         <table>
           <tr>
           <br>
        
           <td>
              ${navigation.navigator}
           </td>
           </tr>
           </table>
      
   </form>

</body>
<script >


function getRank() {
    $.ajax({ 
        type : 'GET',
        url:'/rank',
		dataType : 'json',
        success : function(result) {  
			
			 $("#hds").empty();
			 var count = 1;
	           var htmlTxt = '<table id="rank" class="table table-bordered table-condensed"><tr bgcolor="#e0e0eb"><th>순위</th><th>식별번호</th><th>법정동</th><th>아파트 이름</th><th>실거래가</th>'+
	           '<th>거래정보</th></tr>' ;
	           $.each(result.data, function(index, value) {
	            
	              htmlTxt += "<tr><td class='item'  HouseDealNo='"+value.no+"'><a href =${root}/housedetail/"+value.no+">"+ (count++)  +"</td>"
	             			+"<td class='item' HouseDealNo='"+value.no+"' ><a href =${root}/housedetail/"+value.no+">"+ value.no +"</td>"
	                       +"<td class='item' HouseDealNo='"+value.no+"' >"+ value.dong  +"</td>"
	                       +"<td class='item' HouseDealNo='"+value.no+"'  >"+ value.aptName  +"</td>"
	                       +"<td class='item' HouseDealNo='"+value.no+"'  >"+ value.dealAmount   +"</td>"
	                       +"<td class='item' HouseDealNo='"+value.no+"'  >"+ value.type   +"</td></tr>";
	               
	           });
	           htmlTxt += '</table>';
	           $('#hds').html(htmlTxt);
	           
        },
        error: function (e) { 
           console.log(e.responseText);
               alert("통신 Error" + e);
           } 
     });
  
}


function loadHouseDeals() {
    $.ajax({ 
        type : 'GET',
        url : '/myfavlist2/'+'${userinfo.userid}',
        dataType : 'json',
        success : function(result) {  
   	
           $("#housedeals").empty();
			
           var htmlTxt = '<table id="employees" class="table table-bordered table-condensed"><tr bgcolor="#e0e0eb"><th>식별번호</th><th>법정동</th><th>아파트 이름</th><th>실거래가</th>'+
           '<th>거래정보</th></tr>' ;
           $.each(result.data, function(index, value) {
            
              htmlTxt += "<tr><td class='item'  HouseDealNo='"+value.no+"'><a href =${root}/housedetail/"+value.no+">"+ value.no  +"</td>"
                       +"<td class='item' HouseDealNo='"+value.no+"' >"+ value.dong  +"</td>"
                       +"<td class='item' HouseDealNo='"+value.no+"'  >"+ value.aptName  +"</td>"
                       +"<td class='item' HouseDealNo='"+value.no+"'  >"+ value.dealAmount   +"</td>"
                       +"<td class='item' HouseDealNo='"+value.no+"'  >"+ value.type   +"</td></tr>";
               
           });
           htmlTxt += '</table>';
           $('#housedeals').html(htmlTxt);
        },
        error: function (e) { 
           console.log(e.responseText);
               alert("통신 Error" + e);
           } 
     });
  
}
loadHouseDeals();

</script>
</html>