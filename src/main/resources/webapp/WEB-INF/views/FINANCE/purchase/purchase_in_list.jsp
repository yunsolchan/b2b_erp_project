<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <title>purchase_in_list</title>

	<script type="text/javascript">
		$('#purchase_in_list tr td').click(function(){
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
			window.location="${path}/purchase_detail.mh?sale_slip_id="+ td.eq(0).text();
		});
	</script>
</head>
<body>
<!-- 매입집계표 목록 -->
<table id="purchase_in_list" class="table table-hover" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">
		<thead>
			<tr>
				<th>전표번호</th>
				<th>계정과목</th>
				<th>거래처</th>
				<th>적요</th>
				<th>공급가액</th>
				<th>세액</th>
				<th>합계액</th>
				<th>발행일자</th>
				<th>승인일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${purchase_in_list}">
				<tr>
					<td>${i.sale_slip_id}</td>
					<td>
						<c:if test="${i.sa_type eq '매출'}">
							<label class="badge badge-primary">
								${i.sa_account_title}${i.sa_type}
							</label>
						</c:if>
						<c:if test="${i.sa_type eq '매입'}">
							<label class="badge badge-warning">
								${i.sa_account_title}${i.sa_type}
							</label>
						</c:if>
					</td>
					<td>${i.cl_name}</td>
					<td>${i.sa_abstract}</td>
					<td>
						<c:set var="supply" value="${i.supply_amount}"/>
						<c:set var="tax" value="${i.tax_amount}"/>
						<c:set var="total" value="${supply + tax}"/>
						${supply}
					</td>
					<td>${tax}</td>
					<c:if test="${i.sa_type eq '매출'}">
						<td class="text-info">
							${total}
							<i class="ti-arrow-up"></i>
						</td>
					</c:if>
					<c:if test="${i.sa_type eq '매입'}">
						<td class="text-danger">
							${total}
							<i class="ti-arrow-down"></i>
						</td>
					</c:if>
					<td>
						<fmt:formatDate pattern="yyyy- MM-dd" value="${i.sl_register_date}" />
					</td>
					<c:if test="${i.state eq '승인'}">
						<td>
							<label class="badge badge-success">
								<fmt:formatDate pattern="yyyy- MM-dd" value="${i.update_date}" />
							</label>
						</td>
					</c:if>
					<c:if test="${i.state eq '신청'}">
						<td>
							<label class="badge badge-danger">
								승인대기
							</label>
						</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>

