<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>출고내역  </title>
</head>
<body>
  <div class="container-scroller">     
      <!-- 여기서부터 작성 -->
      <!-- partial:../../partials/_settings-panel.html -->
  		<p class="card-description">
         		 출고내역
         </p>
         <div class="table-responsive">
           <table class="table table-hover">
             <thead>
               <tr>
                 <th>물품코드</th>
                 <th>수량</th>
                 <th>구매처</th>
                 <th>출고완료일</th>
                 <th>출고창고</th>
               </tr>
             </thead>
             <tbody>
             <c:forEach var="release_history" items="${list}">
               <tr>
                 <td>${release_history.product_id}</td>
                 <td>${release_history.re_qty}</td>
                 <td>${release_history.cl_name}</td>
                 <td><fmt:formatDate value="${release_history.outbound_date}" pattern="yyyy-MM-dd" /></td>
                 <td>${release_history.wa_name}</td>
               </tr>
               </c:forEach>           
                </tbody>
              </table> 
		</div>
	</div>

</body>

</html>

