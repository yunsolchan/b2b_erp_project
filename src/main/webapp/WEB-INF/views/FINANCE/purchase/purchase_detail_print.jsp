<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>매입/매출장 상세 출력</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="/team_one/resources/css/vendors/feather/feather.css">
  <link rel="stylesheet" href="/team_one/resources/css/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="/team_one/resources/css/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="/team_one/resources/css/vendors/typicons/typicons.css">
  <link rel="stylesheet" href="/team_one/resources/css/vendors/simple-line-icons/css/simple-line-icons.css">
  <link rel="stylesheet" href="/team_one/resources/css/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="/team_one/resources/css/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="/team_one/resources/css/js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/team_one/resources/css/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/team_one/resources/css/images/favicon.png" />
  <script>

    function beforePrint() {
        initBodyHtml = document.body.innerHTML;
        document.body.innerHTML = document.getElementById('print').innerHTML;
    }
    function afterPrint() {
        document.body.innerHTML = initBodyHtml;
    }

    window.onbeforeprint = beforePrint;
    window.onafterprint = afterPrint;
    
</script>
<style type="text/css">
   @media print {
     #print{
   
       width: 210mm;
       height: 297mm;
       margin: 30mm 45mm 30mm 45mm;
   }
   @page {
   
    size: A4 portrait;
     margin:0;
   }
   @media print
   {
       .btn
       {
           display: none !important;
       }
   }
</style>
</head>
<body>
<!-- 매입/매출장 상세 -->
	<div class="main-panel">
	<div class="row col-lg-10">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <div class="table-responsive">
	                    <table class="table table-bordered" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
	                    	<thead>
		                    	<tr class="table-light">
		                    		<c:if test="${purchase_detail.sa_type eq '매출'}">
										<th colspan="4">매출전표</th>
									</c:if>
		                    		<c:if test="${purchase_detail.sa_type eq '매입'}">
										<th colspan="4">매입전표</th>
									</c:if>
		                    	</tr>
	                    	</thead>
	                    	<tbody>
	                    		<tr>
	                    			<td class="fw-bold table-secondary">문서번호</td>
	                    			<td>${purchase_detail.slip_id}</td>
	                    			<td class="fw-bold table-secondary">작성일자</td>
	                    			<td><fmt:formatDate pattern="yyyy-MM-dd " value="${purchase_detail.sl_register_date}" /></td>
	                    		</tr>
	                    		<tr>
	                    			<td class="fw-bold table-secondary">계정과목(거래유형)</td>
	                    			<td>${purchase_detail.sa_account_title}</td>
	                    			<td class="fw-bold table-secondary">거래처명</td>
	                    			<td>${purchase_detail.cl_name}</td>
	                    		</tr>
	                    		<tr>
	                    			<td class="fw-bold table-secondary">공급가액</td>
	                    			<td>
	                    				<c:set var="supply" value="${purchase_detail.supply_amount}"/>
	                    				${supply}
	                    			</td>
	                    			<td class="fw-bold table-secondary">세액</td>
	                    			<td>
	                    				<c:set var="tax" value="${purchase_detail.tax_amount}"/>
	                    				${tax}
	                    			</td>
	                    		</tr>
	                    		<tr>
	                    			<td class="fw-bold table-secondary">부서명</td>
	                    			<td>${purchase_detail.de_name}</td>
	                    			<td class="fw-bold table-secondary">요청 사원명</td>
	                    			<td>${purchase_detail.em_name}</td>
	                    		</tr>
	                    		<tr>
	                    			<td class="fw-bold table-secondary">요청내용</td>
	                    			<td colspan="3">${purchase_detail.sa_abstract}</td>
	                    		</tr>
	                    		<tr>
	                    			<td colspan="4">
	                                    <div class="d-flex align-items-center">
	                                      <h6 class="card-title card-title-dash">상품목록</h6>
	                                      <!-- div 하나 더 넣어서 table 중앙으로 보내주기 -->
	                                    </div>
	                                    <table class="table table-bordered" style="font-family: 'IBM Plex Sans KR', sans-serif;">
	                                    	<thead>
			                                    <tr>
			                                    	<th class="table-light">상품명</th>
			                                    	<th class="table-light">가격</th>
			                                    	<th class="table-light">구매수량</th>
			                                    	<th class="table-light">비용</th>
			                                    </tr>
			                                </thead>
			                                <tbody>
		                                   	 <c:forEach var="i" items="${request_det_list}">
		                                        <tr>
			                                    	<td>${i.pr_name}</td>
			                                    	<td>
			                                    		<c:if test="${purchase_detail.sa_type eq '매출'}">
			                                    			<c:set var="p_price" value="${i.price}"/>
			                                    			${p_price}
			                                    		</c:if>
			                                    		<c:if test="${purchase_detail.sa_type eq '매입'}">
			                                    			<c:set var="p_price" value="${i.cost}"/>
			                                    			${p_price}
			                                    		</c:if>
			                                    	</td>
			                                    	<td>
			                                    		<c:set var="p_qty" value="${i.re_qty}"/>
			                                    		${p_qty}
			                                    	</td>
			                                    	<td>
			                                    		<c:set var="p_total" value="${p_price * p_qty}"/>
			                                    		${p_total}
			                                    	</td>
			                                    </tr>
			                                  </c:forEach>
	                                     	</tbody>
	                                     </table>
	                    			</td>
	                    		</tr>
	                    		<tr>
	                    			<td class="fw-bold table-secondary">승인금액</td>
	                    			<td>
	                    				<c:set var="s_total" value="${supply + tax}"/>
	                    				${s_total}
	                    			</td>
	                    			<td class="fw-bold table-secondary">승인일자</td>
	                    			<td style="text-align:center">
	                    				<c:if test="${purchase_detail.state eq '신청'}">
	                    					<input type="hidden" value="${purchase_detail.slip_id}" name="slip_id">
		                    				<input type="hidden" value="${s_total}" name="money">
		                    				<input type="hidden" value="${purchase_detail.client_id}" name="client_id">
		                    				<input type="hidden" value="${purchase_detail.sa_abstract}" name="memo">
		                    				<c:if test="${purchase_detail.sa_type eq '매입'}">
		                    					<button id="purchase_in_confirm" type="button" class="btn btn-outline-facebook btn-rounded btn-icon">
				                    			<i class="mdi mdi-check"></i>
				                    			</button>
		                    				</c:if>
		                    				<c:if test="${purchase_detail.sa_type eq '매출'}">
			                    				<button id="purchase_out_confirm" type="button" class="btn btn-outline-facebook btn-rounded btn-icon">
				                    			<i class="mdi mdi-check"></i>
				                    			</button>
			                    			</c:if>
	                    				</c:if>
	                    				<c:if test="${purchase_detail.state eq '승인'}">
	                    					<fmt:formatDate pattern="yyyy- MM-dd" value="${purchase_detail.update_date}" />
	                    				</c:if>
	                    			</td>
	                    		</tr>
	                    	</tbody>
	                    </table>
	                    
	                    <div class="d-sm-flex justify-content-end mt-3 mb-3">
			               <button class="btn btn-outline-twitter btn-text-icon btn-rounded me-2" onclick="window.print()" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
			                 	<i class="ti-printer btn-icon-preppend"></i> 전표 출력
			               </button>
			              </div>
                  </div>
                </div>
              </div>
            </div>
            </div>
            </div>
    <!-- page-body-wrapper ends -->
  <!-- container-scroller -->

  <!-- plugins:js -->
  <script src="/team_one/resources/css/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="/team_one/resources/css/vendors/chart.js/Chart.min.js"></script>
  <script src="/team_one/resources/css/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
  <script src="/team_one/resources/css/vendors/progressbar.js/progressbar.min.js"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="/team_one/resources/css/js/off-canvas.js"></script>
  <script src="/team_one/resources/css/js/hoverable-collapse.js"></script>
  <script src="/team_one/resources/css/js/template.js"></script>
  <script src="/team_one/resources/css/js/settings.js"></script>
  <script src="/team_one/resources/css/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="/team_one/resources/css/js/dashboard.js"></script>
  <script src="/team_one/resources/css/js/Chart.roundedBarCharts.js"></script>
  <!-- End custom js for this page-->
</body>
</html>