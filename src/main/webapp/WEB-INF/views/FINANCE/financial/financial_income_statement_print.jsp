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
		$("#file_time").html("제 01기 (당)기 " + year + "년 " + month + "월 " + date + "일");
		
		$("#menu").click(function(){
			window.history.back();
		});
	});
</script>
  <div class="container-scroller"> 
  	<!-- partial -->
    <div class="container-fluid page-body-wrapper">
<!-- 손익계산서 -->

<!-- 매출총액 -->
<c:set var="take_sales" value="${financial_income.take_sales}"/>

<!-- 기초상품재고액 -->
<c:set var="beginning_inventory" value="${financial_income.beginning_inventory}"/>
<!-- 당기상품재고액 -->
<c:set var="current_inventory" value="${financial_income.current_inventory}"/>
<!-- 기말상품재고액 -->
<c:set var="ending_inventory" value="${financial_income.ending_inventory}"/>
<!-- 매출원가 -->
<c:set var="inventory_sales" value="${beginning_inventory + current_inventory - ending_inventory}"/>

<!-- 매출총이익 -->
<c:set var="all_sales" value="${take_sales - inventory_sales}"/>

<!-- 급여총액 -->
<c:set var="total_salary" value="${financial_income.total_salary}"/>
<!-- 여비교통비 -->
<c:set var="travel_expense" value="${financial_income.travel_expense}"/>
<!-- 소모품비 -->
<c:set var="consumable_expense" value="${financial_income.consumable_expense}"/>
<!-- 통신비 -->
<c:set var="communication_expense" value="${financial_income.communication_expense}"/>
<!-- 접대비 -->
<c:set var="entertainment_expense" value="${financial_income.entertainment_expense}"/>
<!-- 수도광열비 -->
<c:set var="administrative_expense" value="${financial_income.administrative_expense}"/>
<!-- 창고관리비 -->
<c:set var="warehouse_expense" value="${financial_income.administrative_expense}"/>
<!-- 판매관리비 -->
<c:set var="total_expense" value="${total_salary + travel_expense + consumable_expense + communication_expense + entertainment_expense + administrative_expense}"/>

<!-- 영업이익 -->
<c:set var="operating_profit" value="${all_sales - total_expense}"/>
<!-- 비과세소득 -->
<c:set var="non_tax" value="${financial_income.non_tax_sum}"/>
<!-- 과세표준 산출 -->
<c:set var="tax_base" value="${operating_profit - non_tax}"/>

<!-- 법인세 -->
<!-- 2억기준 10% or 20% 이외 상황발생 시 추가-->
<c:if test="${operating_profit > 200000000}">
	<c:set var="corporation_tax" value="${tax_base * 0.2}"/>
</c:if>
<c:if test="${operating_profit <= 200000000}">
	<c:set var="corporation_tax" value="${tax_base * 0.1}"/>
</c:if>

<!-- 당기순이익 -->
<c:set var="net_income" value="${operating_profit - corporation_tax}"/>

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
                  	<p class="card-description">손익계산서</p>
                  </div>
                  <div class="table-responsive">
                    <table class="table table-hover" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
                    	<thead>
	                    	<tr>
	                    		<th colspan="4">손익계산서</th>
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
                    			<td>I. 매 출 액</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger"><fmt:formatNumber value="${take_sales}" type="number"/></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">상 품 매 출</td>
                    			<td class="text-danger"><fmt:formatNumber value="${take_sales}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr class="table-primary">
                    			<td>II. 매 출 원 가</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger"><fmt:formatNumber value="${inventory_sales}" type="number"/></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light text-danger fw-bold">상 품 매 출 원 가</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger"><fmt:formatNumber value="${inventory_sales}" type="number"/></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">기초 상품 재고액</td>
                    			<td class="text-danger"><fmt:formatNumber value="${beginning_inventory}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">당기 상품 매입액</td>
                    			<td class="text-danger"><fmt:formatNumber value="${current_inventory}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">기말 상품 재고액</td>
                    			<td class="text-danger"><fmt:formatNumber value="${ending_inventory}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr class="table-success">
                    			<td>III. 매 출 총 이 익</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger"><fmt:formatNumber value="${all_sales}" type="number"/></td>
                    		</tr>
                    		<tr class="table-warning">
                    			<td class="fw-bold">IV. 판 매 관 리 비</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger"><fmt:formatNumber value="${total_expense}" type="number"/></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">직 원 급 여</td>
                    			<td class="text-danger"><fmt:formatNumber value="${total_salary}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">여 비 교 통 비</td>
                    			<td class="text-danger"><fmt:formatNumber value="${travel_expense}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">접 대 비</td>
                    			<td class="text-danger"><fmt:formatNumber value="${entertainment_expense}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">통 신 비</td>
                    			<td class="text-danger"><fmt:formatNumber value="${communication_expense}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">수 도 광 열 비</td>
                    			<td class="text-danger"><fmt:formatNumber value="${administrative_expense}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">소 모 품 비</td>
                    			<td class="text-danger"><fmt:formatNumber value="${consumable_expense}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">창 고 관 리 비</td>
                    			<td class="text-danger"><fmt:formatNumber value="${warehouse_expense}" type="number"/></td>
                    			<td></td>
                    			<td class="text-danger"></td>
                    		</tr>
                    		<tr class="table-warning">
                    			<td class="fw-bold">V. 영 업 이 익</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger"><fmt:formatNumber value="${operating_profit}" type="number"/></td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">VI. 영 업 외 수 익</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">-</td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">VII. 영 업 외 비 용</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">-</td>
                    		</tr>
                    		<tr>
                    			<td class="table-light">VIII. 법인세 차감 전 순이익</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger"><fmt:formatNumber value="${operating_profit}" type="number"/></td>
                    		</tr>
                    		<tr class="table-danger">
                    			<td>IX. 법 인 세</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger">(과세표준 기준) &nbsp; <fmt:formatNumber value="${corporation_tax}" pattern="0"/></td>
                    		</tr>
                    		<tr class="table-success">
                    			<td class="fw-bold">X. 당 기 순 이 익</td>
                    			<td class="text-danger"></td>
                    			<td></td>
                    			<td class="text-danger"><fmt:formatNumber value="${net_income}" type="number"/></td>
                    		</tr>
                    	</tbody>
                    </table>
                    <div class="d-sm-flex justify-content-end mt-3 mb-3">
		               <button class="btn btn-outline-facebook btn-text-icon btn-rounded me-2" onclick="window.print()" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
			                 	<i class="ti-printer btn-icon-preppend"></i> 손익계산서 출력
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

