<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
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
    .btn, .card-title, .card-description{display: none !important;}
    .page-body-wrapper { padding-top: 0; }
  }
   
</style>
</head>
<body>
  <div class="container-scroller"> 
  	<!-- partial -->
    <div class="container-fluid page-body-wrapper">
<script type="text/javascript">
	var date = new Date();
	var year = date.getFullYear();
	var month = (date.getMonth() + 1);
	var date = date.getDate();
	
	$(function(){
		$("#file_time").html("제 01기 (당)기 " + year + "년 " + month + "월 " + date + "일");
		
		$("#menu").click(function(){
			window.history.back();
		});
		
	});
</script>
<!-- 재무상태표 -->

<!-- 보통예금(예산) -->
<c:set var="bank_assets" value="${financial_statement.bank_assets}"/>
<!-- 매출채권 -->
<c:set var="trade_receivable" value="${financial_statement.trade_receivable}"/>
<!-- 부가세대급금 -->
<c:set var="vat_payment" value="${financial_statement.vat_payment}"/>
<!-- 당좌자산 -->
<c:set var="current_assets" value="${bank_assets + trade_receivable + vat_payment}" />
<!-- 재고자산 -->
<c:set var="inventory" value="${financial_statement.current_inventory}" />
<!-- 자산총계 -->
<c:set var="asset" value="${current_assets + inventory}" />

<!-- 매입채무 -->
<c:set var="trade_payable" value="${financial_statement.trade_payable}"/>
<!-- 부가세예수금 -->
<c:set var="vat_deposit" value="${financial_statement.vat_deposit}"/>
<!-- 부채총계 -->
<c:set var="liability" value="${trade_payable + vat_deposit}" />

<!-- 자본금 -->
<c:set var="capital_stock" value="30000000" />
<!-- 자본총계 -->
<c:set var="owner_equity" value="${asset - liability}" />
<!-- 이익잉여금 -->
<c:set var="retained_earnings" value="${owner_equity - capital_stock}" />

<div class="main-panel">
		<div class="row col-lg-10">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">
                  	<i class="menu-icon mdi mdi-chart-line icon-md text-linkedin"></i>
			                    회계관리
			      </h3>
                  <div class="d-sm-flex justify-content-between">
                  	<p class="card-description">재무제표</p>
                  </div>
                  <div class="table-responsive">
                    <table class="table table-hover" id="financial_statement" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
                    	<thead>
	                    	<tr class="table-secondary">
	                    		<th colspan="4">재무상태표</th>
	                    	</tr>
                    	</thead>
                    	<tbody>
                    		<tr>
                    			<td class="table-light">문서</td>
                    			<td colspan="3">
                    				<div id="file_time"></div>
                    			</td>
                    		</tr>
                    		<tr class="table-primary">
                    			<td>자 산</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr class="table-warning">
                    			<td>I. 유 동 자 산</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">${asset}</td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">(1)당 좌 자 산</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">${current_assets}</td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">현금 및 현금성자산(보통예금)</td>
                    			<td class="text-danger">${bank_assets}</td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light text-warning fw-bold">매 출 채 권 (외상매출금)</td>
                    			<td class="text-danger">${trade_receivable}</td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">부 가 세 대 급 금</td>
                    			<td class="text-danger">${vat_payment}</td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">(2) 재 고 자 산</td>
                    			<td class="text-danger">${inventory}</td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">상품</td>
                    			<td class="text-danger">${inventory}</td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr class="table-success">
                    			<td>자 산 총 계</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">${asset}</td>
                    		</tr>
                    		<!-- ============================================== -->
                    		<tr class="table-primary">
                    			<td>부채</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr class="table-warning">
                    			<td>I. 유 동 부 채</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">${liability}</td>
                    		</tr>
                    		<tr>
                    			<td class="table-light text-warning fw-bold">매 입 채 무(외상매입금)</td>
                    			<td class="text-danger">${trade_payable}</td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">부 가 세 예 수 금</td>
                    			<td class="text-danger">${vat_deposit}</td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr class="table-success">
                    			<td>부 채 총 계</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">${liability}</td>
                    		</tr>
                    		<!-- =================================================== -->
                    		<tr class="table-primary">
                    			<td>자 본</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr class="table-warning">
                    			<td>I. 자 본 금</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">${capital_stock}</td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">자 본 금</td>
                    			<td class="text-danger">${capital_stock}</td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr class="table-warning">
                    			<td>II.이 익 잉 여 금</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">${retained_earnings}</td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">이 익 잉 여 금</td>
                    			<td class="text-danger">${retained_earnings}</td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr class="table-success">
                    			<td>자 본 총 계</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">${owner_equity}</td>
                    		</tr>
                    	</tbody>
                    </table>
                    <div class="d-sm-flex justify-content-end mt-3 mb-3">
		               <button class="btn btn-outline-facebook btn-text-icon btn-rounded me-2" onclick="window.print()" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
			                 	<i class="ti-printer btn-icon-preppend"></i> 재무상태표 출력
			           </button>
		           </div>
                  </div>
                </div>
              </div>
             </div>
             </div>
             </div>
		</div>
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

