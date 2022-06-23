<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">
$(function(){
    // tr태그 클릭 시 거래처 상세페이지 접근 이벤트 생성
    $('#deliver_list tr td').click(function(){
       var click = $(this);
       var tr = click.parent();
       var td = tr.children();
  
      var url="${path}/deliver_indicate_detail.dh?request_id="+ td.eq(0).text();
      
      window.open(url, "deliver_indicate", "menubar=no, width=1500px, height=700px");  // (url, "별칭", size);
    });
 });
</script>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>출하내역  </title>
</head>
<body>
	 <p class="card-description">
               		 출하내역
        </p>
        <div class="table-responsive">
          <table class="table table-hover" id="deliver_list">
            <thead>
               <tr>
                 <th>요청코드</th>
                 <th>판매처</th>
                 <th>요청일</th>
                 <th>출하예정일</th>
                 <th>출하예정창고</th>
                 <th>품목수</th>
                 <th>출고여부</th>
               </tr>
            </thead>
            <tbody>
            <c:forEach var="deliver" items="${list}">
	            <tr>
	              <td>${deliver.request_id}</td>
	              <td>${deliver.cl_name}</td>
	              <td><fmt:formatDate value="${deliver.begin_date}" pattern="yyyy-MM-dd" /></td>
	              <td><fmt:formatDate value="${deliver.outbound_date}" pattern="yyyy-MM-dd" /></td>
	              <td>${deliver.wa_name}</td>
	              <td>${deliver.re_qty}</td>
	              <td>
	              	<c:if test="${deliver.outbound_status == '출고대기'}">
	              		<label class="badge badge-danger">${deliver.outbound_status}</label>
	              	</c:if>
	              	<c:if test="${deliver.outbound_status == '출고완료'}">
	              		<label class="badge badge-info">${deliver.outbound_status}</label>
	              	</c:if>
	              </td>
	            </tr>
            </c:forEach>
            </tbody>
          </table>     
	</div>      
</body>

</html>

