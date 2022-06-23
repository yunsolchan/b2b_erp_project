<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>입고요청현황 </title>


</head>
<body>
	  <p class="card-description">
       		 입고요청목록
       </p>
        <div class="table-responsive">
          <table class="table table-hover" id="arrival_list">
            <thead>
              <tr>
                <th>요청코드</th>
                <th>구매처</th>
                <th>요청일</th>
                <th>입하예정일</th>
                <th>입하예정창고</th>
                <th>품목수</th>
              </tr>
            </thead>
            <tbody>
             <c:forEach var="arrival" items="${list}">
              <tr onclick="window.open('warehousing_indicate.dh?request_id=${arrival.request_id}&wh_id=${arrival.wh_id}&inbound_id=${arrival.inbound_id}', 'arrival_indicate', 'menubar=no, width=1000px, height=500px')">
                <td>${arrival.request_id}</td>
                <td>${arrival.cl_name}</td>
                <td><fmt:formatDate value="${arrival.begin_date}" pattern="yyyy-MM-dd" /></td>
                <td><fmt:formatDate value="${arrival.inbound_date}" pattern="yyyy-MM-dd" /></td>
                <td>${arrival.wa_name}</td>
                <td>${arrival.re_qty}</td>
              </tr>
              </c:forEach>
           </tbody>
      </table>
</div>
    <!-- page-body-wrapper ends -->
  <!-- container-scroller -->
</body>

</html>

