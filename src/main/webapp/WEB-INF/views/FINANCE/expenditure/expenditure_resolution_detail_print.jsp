<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <title>expenditure_request_detail</title>
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
	       .btn, .card-title, .card-description
	       {
	           display: none !important;
	       }
	   }
	</style>
</head>
<body>

<!-- 지출결의서 상세 -->
	<div class="main-panel">
		<div class="row col-lg-10">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">지출관리</h3>
                  <div class="d-sm-flex justify-content-between">
                  	<p class="card-description">지출결의서 상세</p>
                  </div>
                  <div class="table-responsive">
                    <table class="table table-bordered" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
                    	<thead>
	                    	<tr>
	                    		<th colspan="4">지출결의서</th>
	                    	</tr>
                    	</thead>
                    	<tbody>
                    		<tr>
                    			<td class="table-light">문서번호</td>
                    			<td>${resolution_detail.slip_id}</td>
                    			<td class="table-light">작성일자</td>
                    			<td>
                    				<fmt:formatDate pattern="yyyy- MM-dd hh:mm" value="${resolution_detail.sl_register_date}" />
                    			</td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">계정명</td>
                    			<td>${resolution_detail.re_type}</td>
                    			<td class="table-light">지출금액</td>
                    			<td>${resolution_detail.expenses}</td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">부서명</td>
                    			<td>${resolution_detail.de_name}</td>
                    			<td class="table-light">요청 사원명</td>
                    			<td>${resolution_detail.em_name}</td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">지출세부</td>
                    			<td colspan="3">${resolution_detail.re_memo}</td>
                    		</tr>
                    		<tr>
                    			<td colspan="4">
                    				<div class="d-flex align-items-center mb-2">
                                      <h6 class="card-title card-title-dash">지출내용</h6>
                                      <!-- div 하나 더 넣어서 table 중앙으로 보내주기 -->
                                    </div>
                                    <table class="table table-bordered" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
                                    	<thead>
		                                    <tr>
		                                    	<th class="table-light">예금주</th>
		                                    	<th class="table-light">지출내용</th>
		                                    	<th class="table-light">지출금액</th>
		                                    	<th class="table-light">송금계좌</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
	                                   	 <c:forEach var="i" items="${resolution_detail_list}">
	                                        <tr>
		                                    	<td>${i.ac_name}</td>
		                                    	<td>${i.op_abstract}</td>
		                                    	<td>${i.expenses}</td>
		                                    	<td>
		                                    		<label class="badge badge-info" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">${i.bank} ${i.account_number}</label>
		                                    	</td>
		                                    </tr>
		                                  </c:forEach>
                                     	</tbody>
                                     </table>
                    			</td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">승인계좌</td>
                    			<td>
                    			<!-- <button type="button" class="btn btn-outline-primary btn-sm ms-4 mb-3" id="bank_transfer_list"> -->
                    				${account}
                    			</td>
                    			<td class="table-light">승인일자</td>
                    			<td class="text-success">
                    				<fmt:formatDate pattern="yyyy- MM-dd hh:mm" value="${resolution_detail.update_date}" />
                    				<!-- if문으로 2020-05-20 -->
                    			</td>
                    		</tr>
                    	</tbody>
                    </table>
                    <div class="d-sm-flex justify-content-end mb-3 mt-3">
		               <button class="btn btn-outline-facebook btn-text-icon btn-rounded me-2" onclick="window.print()">
		                 	<i class="ti-printer btn-icon-preppend"></i> 지출결의서 출력
		               </button>
		           </div>
                  </div>
                </div>
              </div>
             </div>
             </div>
             </div>

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

