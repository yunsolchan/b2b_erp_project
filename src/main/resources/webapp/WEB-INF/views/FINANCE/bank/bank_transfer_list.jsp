<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
</head>
<body>
<!-- 여기서부터 작성 -->
<script type="text/javascript">
	$(function(){
		$('#bank_transfer_list tr').click(function(){
			var click = $(this);
			var tr = click.parent();
			var td = tr.children();
			
			/*
			var tdArr = new Array();	// 클릭한 tr의 요소를 담을 배열선언
			
			// tdArr에 값 입력
			td.each(function(i){
				tdArr.push(td.eq(i).text());
			});
			*/
			window.location="${path}/purchase_detail.mh?sale_slip_id="+ td.eq(1).text();
		});
	});
</script>
       <table id="bank_transfer_list" class="table table-hover" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">
         <thead>
           <tr>
             <th>거래일시</th>
             <th>거래처코드</th>
             <th>거래처</th>
             <th>금액</th>
             <!-- <th>잔액</th> -->
           </tr>
         </thead>
         <tbody>
         	<c:forEach var="i" items="${bank_transfer_list}">
	           <tr>
	             <td>
	            	 ${i.regi_date}
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
	             <%-- <c:if test="${i.balance >= 0}">
					 <td class="text-success">
						<i class="mdi mdi-plus"></i>
						${i.balance}
					</td>
				 </c:if>
				 <c:if test="${i.balance < 0}">
					<td class="text-danger">
						<i class="mdi mdi-minus"></i>
						<c:set var="balance" value="${i.balance}"/>
						${fn:substring(balance, 1, 9999999999999)}
					</td>
				 </c:if> --%>
	           </tr>
	          </c:forEach>
         </tbody>
       </table>
</body>
</html>

