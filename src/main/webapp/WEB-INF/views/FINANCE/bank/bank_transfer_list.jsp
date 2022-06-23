<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
</head>
<body>
<!-- 여기서부터 작성 -->
<!-- <script type="text/javascript">
	$(document).ready(function() {
		$("#keyword").keyup(function() {
		    var k = $(this).val();
		    console.log(k);
		    $("#bank_transfer_list > tbody > tr").hide();
		    var temp = $("#bank_transfer_list > tbody > tr > td:contains('" + k + "')");
		    $(temp).parent().show();
		}); 
	});
</script>
<div class="d-sm-flex justify-content-end mb-2">
	<div id="input-form">
          <div class="d-sm-flex">
             <i class="icon-search text-primary pt-1 pe-2 fw-bold fs-5"></i>
	  		<input type="text" id="keyword" class="form-control" placeholder="SEARCH" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;" />
	  	</div>
	  </div>
</div> -->
       <table id="bank_transfer_list" class="table table-hover" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">
         <thead>
           <tr class="table-secondary" id="bank_transfer">
             <th>거래일시</th>
             <th>거래처코드</th>
             <th>거래처</th>
             <th>금액</th>
           </tr>
         </thead>
         <tbody>
         	<c:forEach var="i" items="${bank_transfer_list}">
	           <tr>
	             <td>
	             	<fmt:formatDate value="${i.regi_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
	             </td>
	             <td>${i.client_id}</td>
	             <td>${i.cl_name}</td>
	             <c:if test="${i.subject eq '입금'}">
		             <td class="text-info">
						${i.money}
						<i class="ti-arrow-up"></i>
					 </td>
				 </c:if>
				 <c:if test="${i.subject eq '출금'}">
		             <td class="text-danger">
						${i.money}
						<i class="ti-arrow-down"></i>
					 </td>
				 </c:if>
	           </tr>
	          </c:forEach>
         </tbody>
       </table>
</body>
</html>

