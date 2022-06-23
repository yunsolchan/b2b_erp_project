<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>salary_specification_detail</title>
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

	<style type="text/css">
	.th1 { text-align: center; font-weight: bold; }
	.right { text-align: right; }
  </style>

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
   
    size: A4 landscape;
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
  <div class="container-scroller"> 
  <!-- 헤더 -->
  <%@ include file="/WEB-INF/views/header.jsp" %>
  
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
    <!-- 레프트메뉴 -->
      <%@ include file="/WEB-INF/views/leftMenu.jsp" %>
      
      <!-- 여기서부터 작성 -->
      
      

<!-- 급여명세서상세 -->
	<div class="col-lg-12 stretch-card">
	  <div class="card">
	    <div class="card-body">
	      <h4 class="card-title" style="text-align:center">급여명세서</h4>
	      <div class="table-responsive pt-3">
	        <form name="salary_detail">
	        <table class="table table-bordered">
	          <thead>
	            <tr>
	              <th colspan="4" class="th1 table-secondary">지급내역</th>
	            </tr>
	          </thead>
	          
	          <tbody>
	          
	            <tr>
	              <td class="table-light">기본급</td>
	              <td class="right">111,111</td>
	              <td class="table-light">직급수당</td>
	              <td class="right">111,111</td>
	            </tr>
	            
	            <tr>
	              <td class="table-light">초과수당</td>
	              <td class="right">111,111</td>
	              <td class="table-light">식대</td>
	              <td class="right">111,111</td>
	            </tr>
	            
	            <tr>
	              <td class="table-light">상여금</td>
	              <td class="right">111,111</td>
	              <td class="table-light">자가운전보조금</td>
	              <td class="right">111,111</td>
	            </tr>
	            오후 3:22 2022-04-24
	            <tr>
	              <td class="table-light">여비교통비</td>
	              <td class="right">111,111</td>
	              <td class="table-light">육아수당</td>
	              <td class="right">111,111</td>
	            </tr>
	            
	            <tr>
	              <td class="table-light">주휴수당</td>
	              <td class="right">111,111</td>
	              <td></td>
	              <td></td>
	            </tr>
	            
	            <tr>
					<td colspan="4" class="th1 table-secondary">공재내역</td>
				</tr>
				<tr>
					<td class="table-light">소득세</td>
					<td class="right">111,111</td>
					<td class="table-light">건강보험</td>
					<td class="right">111,111</td>
				</tr>
				
				<tr>
					<td class="table-light">지방소득세</td>
					<td class="right">111,111</td>
					<td class="table-light">고용보험</td>
					<td class="right">111,111</td>
				</tr>
				
				<tr>
					<td class="table-light">국민연금</td>
					<td class="right">111,111</td>
					<td class="table-light">장기요양보험</td>
					<td class="right">111,111</td>
				</tr>
				
				<tr>
					<td class="th1" colspan="3">지급총액</td>
					<td class="right">111,111</td>
				</tr>
				
				<tr>
					<td class="th1" colspan="3">공제총액</td>
					<td class="right">111,111</td>
				</tr>
				<tr>
					<td class="th1" colspan="3">실지급액</td>
					<td class="right">111,111</td>
				</tr>
	            
	          </tbody>
	        </table>
	        <div class="btn-group col-sm-3" style="display: flex; justify-content: center; padding-top: 4%; margin: 0 auto;">
               <button class="btn btn-outline-primary" onclick="window.print()">
                 	급여명세서 출력
               </button>
              </div>
            </form>
	      </div>
	    </div>
	  </div>
	</div>
		<div style="border: 1px solid black">
			<pre>
				급여명세서 상세 확인 팝업창으로 보여주고, + 출력처리하는 기능
				
				SQL : 
				
				<%-- SELECT s.*
				     , t.*
				     , n.*
				     , tax.*
				 FROM salary s, taxtion t, non_taxtion n, tax tax 
				WHERE s.taxtion_id = t.taxtion_id
				  AND s.non_taxtion_id = n.non_taxtion_id
				  AND s.tax_id = tax.tax_id
				e.employee_id IN #{} --%>
				
			</pre>	
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

