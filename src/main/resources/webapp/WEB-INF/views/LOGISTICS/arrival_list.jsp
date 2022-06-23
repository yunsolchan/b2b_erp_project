<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>입하지시목록 </title>
  
<script type="text/javascript">
$(function(){
    // tr태그 클릭 시 거래처 상세페이지 접근 이벤트 생성
    $('#arrival_list tr td').click(function(){
       var click = $(this);
       var tr = click.parent();
       var td = tr.children();
  
      var url="${path}/arrival_indicate.dh?request_id="+ td.eq(0).text();
      
      window.open(url, "arrival_indicate", "menubar=no, width=1500px, height=700px");  // (url, "별칭", size);
    });
 });
</script> 
</head>
<body>
			     <p class="card-description">
                  		 입하지시목록
                 </p>
				<div id="arrival_list_table">
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
                          <th>입하지시</th>
                        </tr>
                      </thead>
                      <tbody>
                       <c:forEach var="arrival" items="${list}">
                        <tr>
                          <td>${arrival.request_id}</td>
                          <td>${arrival.cl_name}</td>
                          <td><fmt:formatDate value="${arrival.begin_date}" pattern="yyyy-MM-dd" /></td>
                          <td><fmt:formatDate value="${arrival.inbound_date}" pattern="yyyy-MM-dd" /></td>
                          <td>${arrival.wa_name}</td>
                          <td>${arrival.re_qty}</td>
                          <td id="arrival_indicate" style="cursor:pointer">${arrival.re_status}</td>
                        </tr>
                        </c:forEach>
                      </tbody>
                    </table>                
			      </div>
				</div>        
    <!-- page-body-wrapper ends -->
  <!-- container-scroller -->
</body>

</html>

