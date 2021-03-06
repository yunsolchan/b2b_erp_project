<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>financial_income_statement</title>
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
   .page-body-wrapper { padding-top: 0; }
</style>
</head>
<body>
<script type="text/javascript">
	var date = new Date();
	var year = date.getFullYear();
	var month = (date.getMonth() + 1);
	var date = date.getDate();
	$(function(){
		$("#file_time").html("??? 01??? (???)??? " + year + "??? " + month + "??? " + date + "???");
		
		$("#menu").click(function(){
			window.history.back();
		});
	});
</script>
  <div class="container-scroller"> 
  	<!-- partial -->
    <div class="container-fluid page-body-wrapper">
<!-- ??????????????? -->

<!-- ???????????? -->
<c:set var="take_sales" value="${financial_income.take_sales}"/>

<!-- ????????????????????? -->
<c:set var="beginning_inventory" value="${financial_income.beginning_inventory}"/>
<!-- ????????????????????? -->
<c:set var="current_inventory" value="${financial_income.current_inventory}"/>
<!-- ????????????????????? -->
<c:set var="ending_inventory" value="${financial_income.ending_inventory}"/>
<!-- ???????????? -->
<c:set var="inventory_sales" value="${beginning_inventory + current_inventory - ending_inventory}"/>

<!-- ??????????????? -->
<c:set var="all_sales" value="${take_sales - inventory_sales}"/>

<!-- ???????????? -->
<c:set var="total_salary" value="${financial_income.total_salary}"/>
<!-- ??????????????? -->
<c:set var="travel_expense" value="${financial_income.travel_expense}"/>
<!-- ???????????? -->
<c:set var="consumable_expense" value="${financial_income.consumable_expense}"/>
<!-- ????????? -->
<c:set var="communication_expense" value="${financial_income.communication_expense}"/>
<!-- ????????? -->
<c:set var="entertainment_expense" value="${financial_income.entertainment_expense}"/>
<!-- ??????????????? -->
<c:set var="administrative_expense" value="${financial_income.administrative_expense}"/>
<!-- ??????????????? -->
<c:set var="warehouse_expense" value="${financial_income.administrative_expense}"/>
<!-- ??????????????? -->
<c:set var="total_expense" value="${total_salary + travel_expense + consumable_expense + communication_expense + entertainment_expense + administrative_expense}"/>

<!-- ???????????? -->
<c:set var="operating_profit" value="${all_sales - total_expense}"/>
<!-- ??????????????? -->
<c:set var="non_tax" value="${financial_income.non_tax_sum}"/>
<!-- ???????????? ?????? -->
<c:set var="tax_base" value="${operating_profit - non_tax}"/>

<!-- ????????? -->
<!-- 2????????? 10% or 20% ?????? ???????????? ??? ??????-->
<c:if test="${operating_profit > 200000000}">
	<c:set var="corporation_tax" value="${tax_base * 0.2}"/>
</c:if>
<c:if test="${operating_profit <= 200000000}">
	<c:set var="corporation_tax" value="${tax_base * 0.1}"/>
</c:if>

<!-- ??????????????? -->
<c:set var="net_income" value="${operating_profit - corporation_tax}"/>

<div class="main-panel">
		<div class="row col-lg-10">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">
					  <i class="menu-icon mdi mdi-chart-line icon-md text-linkedin"></i>
			                    ????????????
				  </h3>
                  <div class="d-sm-flex justify-content-between">
                  	<p class="card-description">???????????????</p>
                  </div>
                  <div class="table-responsive">
                    <table class="table table-hover" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
                    	<thead>
	                    	<tr>
	                    		<th colspan="4">???????????????</th>
	                    	</tr>
                    	</thead>
                    	<tbody>
                    		<tr>
                    			<td class="table-light">??????</td>
                    			<td colspan="3">
                    				<div id="file_time"></div>
                    			</td>
                    		</tr>
                    		<tr class="table-primary">
                    			<td>I. ??? ??? ???</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger"><fmt:formatNumber value="${take_sales}" type="number"/></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">??? ??? ??? ???</td>
                    			<td class="text-danger"><fmt:formatNumber value="${take_sales}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr class="table-primary">
                    			<td>II. ??? ??? ??? ???</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger"><fmt:formatNumber value="${inventory_sales}" type="number"/></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light text-danger fw-bold">??? ??? ??? ??? ??? ???</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger"><fmt:formatNumber value="${inventory_sales}" type="number"/></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">?????? ?????? ?????????</td>
                    			<td class="text-danger"><fmt:formatNumber value="${beginning_inventory}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">?????? ?????? ?????????</td>
                    			<td class="text-danger"><fmt:formatNumber value="${current_inventory}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">?????? ?????? ?????????</td>
                    			<td class="text-danger"><fmt:formatNumber value="${ending_inventory}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr class="table-success">
                    			<td>III. ??? ??? ??? ??? ???</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger"><fmt:formatNumber value="${all_sales}" type="number"/></td>
                    		</tr>
                    		<tr class="table-warning">
                    			<td class="fw-bold">IV. ??? ??? ??? ??? ???</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger"><fmt:formatNumber value="${total_expense}" type="number"/></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">??? ??? ??? ???</td>
                    			<td class="text-danger"><fmt:formatNumber value="${total_salary}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">??? ??? ??? ??? ???</td>
                    			<td class="text-danger"><fmt:formatNumber value="${travel_expense}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">??? ??? ???</td>
                    			<td class="text-danger"><fmt:formatNumber value="${entertainment_expense}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">??? ??? ???</td>
                    			<td class="text-danger"><fmt:formatNumber value="${communication_expense}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">??? ??? ??? ??? ???</td>
                    			<td class="text-danger"><fmt:formatNumber value="${administrative_expense}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">??? ??? ??? ???</td>
                    			<td class="text-danger"><fmt:formatNumber value="${consumable_expense}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">??? ??? ??? ??? ???</td>
                    			<td class="text-danger"><fmt:formatNumber value="${warehouse_expense}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr class="table-warning">
                    			<td class="fw-bold">V. ??? ??? ??? ???</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger"><fmt:formatNumber value="${operating_profit}" type="number"/></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">VI. ??? ??? ??? ??? ???</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">-</td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">VII. ??? ??? ??? ??? ???</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">-</td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">VIII. ????????? ?????? ??? ?????????</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger"><fmt:formatNumber value="${operating_profit}" type="number"/></td>
                    		</tr>
                    		<tr class="table-danger">
                    			<td>IX. ??? ??? ???</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">(???????????? ??????) &nbsp; <fmt:formatNumber value="${corporation_tax}" pattern="0"/></td>
                    		</tr>
                    		<tr class="table-success">
                    			<td class="fw-bold">X. ??? ??? ??? ??? ???</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger"><fmt:formatNumber value="${net_income}" type="number"/></td>
                    		</tr>
                    	</tbody>
                    </table>
                    <div class="d-sm-flex justify-content-end mt-3 mb-3">
		               <button class="btn btn-outline-facebook btn-text-icon btn-rounded me-2" onclick="window.print()" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
			                 	<i class="ti-printer btn-icon-preppend"></i> ??????????????? ??????
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

