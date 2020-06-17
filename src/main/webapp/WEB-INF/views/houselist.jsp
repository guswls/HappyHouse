
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
   <script type="text/javascript">
      function pageMove(pg) { 
         document.getElementById("pg").value=pg;
         document.getElementById("pageform").submit();
      }
   </script>
   <style>
      label{padding-right:20px}
   </style>
</head>
<body>
<%@ include file = "/WEB-INF/views/nav.jsp"%>
<br>

<br>
   <%-- <%@ include file="/user/userinfo.jsp"%> --%>
   <h1 align="center">주택 실거래 조회 </h1>
<div class="container" align="center">

<%--    <form name="pageform" id = "pageform" method="GET" action="${root}houselist3"> --%>
<%--       <c:forEach items="${type}" var="t"> --%>
      
      
<%--          <input type="hidden" name="type" value="${t}"> --%>
<%--       </c:forEach> --%>
<%--       <input type="hidden" name="by" id="by" value="${by}"> --%>
<%--       <input type="hidden" name="keyword" id="keyword" value="${keyword}"> --%>
<!--       <input type="hidden" name="pg" id="pg" value=""> -->
<%--       <input type="hidden" name="radio" id="radio" value="${type1}"> --%>
<!--    </form> -->

   
   <form method="get" action="${root}houselist3">
   
   <div id = "searchTypeContain" class="form-group form-check" align="center">
      <label class="form-check-label">
      <input class="form-check-input" type="checkbox" checked="checked" value="0" name="type"   ${check[0]}> 아파트매매   </label>
      <label class="form-check-label">
      <input class="form-check-input" type="checkbox" value="1" name="type" ${check[1]}> 아파트 전월세   </label>
      <label class="form-check-label">
      <input class="form-check-input" type="checkbox" value="2" name="type" ${check[2]}> 다세대 주택 매매    </label>
      <label class="form-check-label">
      <input class="form-check-input" type="checkbox" value="3" name="type" ${check[3]}> 다세대 주택 전월세   </label>
   </div>
   
   <div id ="radioChk" class="form-group form-check" align="center" >
      
      <input type="radio" value="no" name="radio" checked="checked" <c:if test ="${type1.equals('no')}"> checked="checked"</c:if>> 식별 번호 
      
      <input type="radio" value="dong" name="radio" <c:if test ="${type1.equals('dong')}"> checked="checked"</c:if>> 법정동 순
   
      <input type=radio value="AptName" name="radio"  <c:if test ="${type1.equals('AptName')}"> checked="checked"</c:if>> 아파트이름 순
   </div>
   
   <br>
      <input type="hidden" name="pg" id="pg" value="1">
      <select id="by" name="by" required="required">
         <option value="all" <c:if test ="${by.equals('all')}">selected="selected"</c:if>>all
         <option value="dong"<c:if test ="${by.equals('dong')}">selected="selected"</c:if>>동별 검색
         <option value="aptName"<c:if test ="${by.equals('aptName')}">selected="selected"</c:if>>아파트 검색
      </select>
      <input type="text" name="keyword" id="keyword" value="${keyword}">
      <input type="button" value="검색" id="searchApt" onclick="searchByOption()"><br>
   </form>
   <br>
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
</div>
</body>


<script >
function loadHouseDeals() {
      $.ajax({ 
          type : 'GET',
          url : '${root}houselist2',
          dataType : 'json',
          success : function(result) {
             $("#housedeals").empty();

             var htmlTxt = '<table id="employees" class="table table-bordered table-condensed"><tr bgcolor="#e0e0eb"><th>식별번호</th><th>법정동</th><th>아파트 이름</th><th>실거래가</th>'+
             '<th>거래정보</th></tr>' ;
             $.each(result.data, function(index, value) {
              
                htmlTxt += "<tr><td class='item' HouseDealNo='"+value.no+"'><a href =${root}/housedetail/"+value.no+">"+ value.no  +"</td>"
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


function searchByOption() {
   console.log($("#radioChk>:radio:checked").val());
   let searchType = []; 
      $("#searchTypeContain>label>:checked")
         .each(
               (i, e) => { searchType.push(e.value);}
         );
   console.log(searchType);
   console.log( {
       type: searchType,
       radio:  $("#radioChk>:radio:checked").val(),
       by: $("#by").val() ,
       keyword:$("#keyword") .val() 
   }
    );
   
    $.ajax({ 
        type : 'POST',
        url : '${root}houselist3', 
        dataType : 'json',
        contentType: "application/json;charset=UTF8",
        data: JSON.stringify ({ 
           type: searchType,
           radio:  $("#radioChk>:radio:checked").val(),
           by: $("#by").val(),
           keyword:$("#keyword").val() 
           
        }),
        success : function(result) {  
      console.log(result);
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


</script>
</html>