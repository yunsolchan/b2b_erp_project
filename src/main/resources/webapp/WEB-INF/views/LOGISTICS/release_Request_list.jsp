<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>출고요청현황 </title>
<!-- <script type="text/javascript">
   $(function(){
      $("#release_indicate").click(function(){
    	  release_indicate();
      });
   });
   
    //  출고처리 팝업
    function release_indicate() {
       var url = "${path}/release_indicate.dh";
       window.open(url, "release_indicate", "menubar=no, width=600px, height=800px");  // (url, "별칭", size);  
    }
</script> -->
</head>
<body>
	  <p class="card-description">
               		 출고요청현황
      </p>
         <div class="table-responsive">
         <table class="table table-hover" id="release_indicate">
           <thead>
             <tr>
               <th>요청코드</th>
               <th>구매처</th>
               <th>요청일</th>
               <th>출하예정일</th>
               <th>출하예정창고</th>
               <th>품목수</th>
             </tr>
           </thead>
           <tbody>
          <c:forEach var="release" items="${list}">
             <tr onclick="window.open('release_indicate.dh?request_id=${release.request_id}&wh_id=${release.wh_id}&outbound_id=${release.outbound_id}', 'release_indicate', 'menubar=no, width=1000px, height=500px')">
               <td>${release.request_id}</td>
               <td>${release.cl_name}</td>
               <td><fmt:formatDate value="${release.begin_date}" pattern="yyyy-MM-dd" /></td>
               <td><fmt:formatDate value="${release.outbound_date}" pattern="yyyy-MM-dd" /></td>
               <td>${release.wa_name}</td>
               <td>${release.re_qty}</td>
             </tr>
           </c:forEach>
   		 </tbody>
	</table>
</div>
</body>

</html>

