<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>financial_statement</title>
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
</head>
<body>
  <div class="container-scroller"> 
  <!-- 헤더 -->
  <%@ include file="/WEB-INF/views/header.jsp" %>
  
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
    <!-- 레프트메뉴 -->
      <%@ include file="/WEB-INF/views/leftMenu.jsp" %>
<script type="text/javascript">
	$(function(){
		$("#financial_statement").click(function(){
			window.location="${path}/financial_statement.mh";
		});
		
	});
</script>
<!-- 재무상태표 -->
<div class="main-panel">
        <div class="content-wrapper">
        <div class="d-flex flex-row align-items-center">
	      <i class="menu-icon mdi mdi-chart-line icon-lg text-linkedin"></i>
	      	<h2 style="font-family: inherit; padding: 2% 0;">
	                    회계관리
	        </h2>
	    </div>
		<div class="row col-lg-10">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">결산관리</h3>
                  <div class="d-sm-flex justify-content-between">
                  	<p class="card-description">재무제표</p>
                  	<button type="button" class="btn btn-outline-primary btn-sm me-3 mb-3" onclick="window.print()">지출결의서 출력</button>
                  </div>
                  <div class="table-responsive">
                    <table class="table table-hover">
                    	<thead>
	                    	<tr>
	                    		<th colspan="4">재무상태표</th>
	                    	</tr>
                    	</thead>
                    	<tbody>
                    		<tr>
                    			<td class="table-light">문서</td>
                    			<td colspan="3">제 01기 (당)기 2021년 11월 01일</td>
                    		</tr>
                    		<tr class="table-primary">
                    			<td>자 산</td>
                    			<td class="text-danger">50,000,000</td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr class="table-warning">
                    			<td>I. 유 동 자 산</td>
                    			<td class="text-danger">50,000,000</td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">(1)당 좌 자 산</td>
                    			<td class="text-danger">50,000,000</td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">현금 및 현금성자산(보통예금)</td>
                    			<td class="text-danger">4,000,000</td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light text-warning fw-bold">매 출 채 권 (외상매출금)</td>
                    			<td class="text-danger">60,000,000,000</td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">부 가 세 대 급 금</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">9,000,000</td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">(2) 재 고 자 산</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">80,000,000</td>
                    		</tr>
                    		<tr class="table-success">
                    			<td>자 산 총 계</td>
                    			<td class="text-danger">5,000,000</td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<!-- ============================================== -->
                    		<tr class="table-primary">
                    			<td>부채</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">90,000,000</td>
                    		</tr>
                    		<tr class="table-warning">
                    			<td>I. 유 동 부 채</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">90,000,000</td>
                    		</tr>
                    		<tr>
                    			<td class="table-light text-warning fw-bold">매 입 채 무(외상매입금)</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">90,000,000</td>
                    		</tr>
                    		<tr>
                    			<td>부 가 세 예 수 금</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">7,000,000</td>
                    		</tr>
                    		<tr class="table-success">
                    			<td>부 채 총 계</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">90,000,000</td>
                    		</tr>
                    		<!-- =================================================== -->
                    		<tr class="table-primary">
                    			<td>자본</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">50,000,000,000</td>
                    		</tr>
                    		<tr class="table-warning">
                    			<td>I. 자 본 금</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">50,000,000,000</td>
                    		</tr>
                    		<tr>
                    			<td>자 본 금</td>
                    			<td class="text-danger">50,000,000,000</td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr class="table-success">
                    			<td>당기순이익</td>
                    			<td class="text-danger"8,000,000></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="text-danger">당 기 : 84,845,945,156,510 </td>
                    			<td></td>
                    			<td></td>
                    			<td></td>
                    		</tr>
                    	</tbody>
                    </table>
                    <div class="d-sm-flex justify-content-end mt-3">
                    	<button type="button" class="btn btn-outline-primary me-2" id="expenditure_resolution_list"> <i class="mdi mdi-format-list-bulleted"></i> </button>
                  	</div>
                  </div>
                </div>
              </div>
             </div>
             </div>
             </div>
		</div>
    </div>
    	<footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Copyright © 2021. All rights reserved.</span>
          </div>
        </footer>
    <!-- page-body-wrapper ends -->
  </div>
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

