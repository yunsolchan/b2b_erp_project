<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>입고내역 </title>
</head>
<body>
	 <p class="card-description">
           		입고내역
          </p>
          <div class="table-responsive">
            <table class="table table-hover" id="arrival_list">
              <thead>
                <tr>
                  <th>물품코드</th>
                  <th>수량</th>
                  <th>구매처</th>
                  <th>입고완료일</th>
                  <th>입고창고</th>
                </tr>
              </thead>
              <tbody>
               <c:forEach var="warehousing" items="${list}">
                <tr>
                  <td>${warehousing.product_id}</td>
                  <td>${warehousing.re_qty}</td>
                  <td>${warehousing.cl_name}</td>
                  <td><fmt:formatDate value="${warehousing.inbound_date}" pattern="yyyy-MM-dd" /></td>
                  <td>${warehousing.wa_name}</td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
		</div>
</body>

</html>

