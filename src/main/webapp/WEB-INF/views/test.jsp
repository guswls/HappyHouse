
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/" var="root" />
<!DOCTYPE html>
<html>
<head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file = "/WEB-INF/views/nav.jsp"%>

  <div id="housedeals">
   </div>

<script >
function HouseLoadPage(nowPage,cntPerPage) {
    $.ajax({ 
        type : 'GET',
        url : '${root}boardList?nowPage='+nowPage+'&cntPerPage='+cntPerPage,
        dataType : 'json',
        success : function(result) {
         console.log(result);
        	   $("#housedeals").empty();
               var htmlTxt = '<table id="employees" class="table table-bordered table-condensed"><tr bgcolor="#e0e0eb"><th>식별번호</th><th>법정동</th><th>아파트 이름</th><th>실거래가</th>'+
               '<th>거래정보</th></tr>' ;
             
               console.log("data : ",result);
               console.log(result.housedeals);
               $.each(result.housedeals, function(index, value) {
                
                  htmlTxt += "<tr><td class='item' HouseDealNo='"+value.no+"'>"+ value.no  +"</td>"
                           +"<td class='item' HouseDealNo='"+value.no+"' >"+ value.dong  +"</td>"
                           +"<td class='item' HouseDealNo='"+value.no+"'  ><a href =${root}/housedetail/"+value.no+">"+ value.aptName  +"</td>"
                           +"<td class='item' HouseDealNo='"+value.no+"'  >"+ value.dealAmount   +"</td>"
                           +"<td class='item' HouseDealNo='"+value.no+"'  >"+ value.type   +"</td></tr>";
                   
               });
               htmlTxt += '</table><br>';
       
               var tt= '<div style="display: block; text-align: center;">';
               
               if(result.paging.startPage !=1){
            	   tt += "<button onclick ='HouseLoadPage("+(result.paging.startPage-1)+","+result.paging.cntPerPage+")'>"+ '<' +"</button>";
               }
               for(var i = result.paging.startPage; i<result.paging.endPage; i++){
            	
            	  if(i ==  result.paging.startPage){
            		  tt += '<b> ' + "<button > "+ i + ' </button></b>';
            	  }else{
            		  tt += '<b>' + "<button onclick ='HouseLoadPage("+i+","+result.paging.cntPerPage+")'>"+ i + "</button>";
                 	   }
               }
               
               if(result.paging.startPage != result.paging.lastPage){
            	   
            	   tt += "<button onclick ='HouseLoadPage("+(result.paging.endPage+1)+","+result.paging.cntPerPage+")'> "+ '>' +"</button>";
               }
            
               tt +='<h1>되는거2</h1>'
               + '</div>';
               console.log(tt + "ddasdfasd");

               
               $('#housedeals').html(htmlTxt + tt);
        },
        error: function (e) { 
           console.log(e);
               alert("통신 Error" + e);
           } 
     });
  
}

function loadHouseDeals() {
    $.ajax({ 
        type : 'GET',
        url : '${root}houselist2',
        dataType : 'json',
        success : function(result) {
           $("#housedeals").empty();
           var htmlTxt = '<table id="employees" class="table table-bordered table-condensed"><tr bgcolor="#e0e0eb"><th>식별번호</th><th>법정동</th><th>아파트 이름</th><th>실거래가</th>'+
           '<th>거래정보</th></tr>' ;
           console.log("dd");
           console.log("data : ",result);
           console.log(result.housedeals);
           $.each(result.housedeals, function(index, value) {
            
              htmlTxt += "<tr><td class='item' HouseDealNo='"+value.no+"'>"+ value.no  +"</td>"
                       +"<td class='item' HouseDealNo='"+value.no+"' >"+ value.dong  +"</td>"
                       +"<td class='item' HouseDealNo='"+value.no+"'  ><a href =${root}/housedetail/"+value.no+">"+ value.aptName  +"</td>"
                       +"<td class='item' HouseDealNo='"+value.no+"'  >"+ value.dealAmount   +"</td>"
                       +"<td class='item' HouseDealNo='"+value.no+"'  >"+ value.type   +"</td></tr>";
               
           });
           htmlTxt += '</table><br>';
   
           var tt= '<div style="display: block; text-align: center;">';
           
           if(result.paging.startPage !=1){
        	   tt += "<button onclick ='HouseLoadPage("+(result.paging.startPage-1)+","+result.paging.cntPerPage+")'>"+ '<' +"</button>";
           }
           for(var i = result.paging.startPage; i<result.paging.endPage; i++){
        	
        	  if(i ==  result.paging.startPage){
        		  tt += '<b> ' + "<button > "+ i + ' </button></b>';
        	  }else{
        		  tt += '<b>' + "<button onclick ='HouseLoadPage("+i+","+result.paging.cntPerPage+")'>"+ i + "</button>";
             	   }
           }
           
           if(result.paging.startPage != result.paging.lastPage){
        	   
        	   tt += "<button onclick ='HouseLoadPage("+(result.paging.endPage+1)+","+result.paging.cntPerPage+")'> "+ '>' +"</button>";
        	   
        	 }
        
           tt +='<h1>되는거2</h1>'
           + '</div>';
           console.log(tt + "ddasdfasd");

           
           $('#housedeals').html(htmlTxt + tt);
        },
        error: function (e) { 
           console.log(e.responseText);
               alert("통신 Error" + e);
           } 
     });
  
}
loadHouseDeals(); 


</script>

</body>
</html>