<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Star Admin2 </title>
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
        document.body.innerHTML = document.getElementById('printTbl').innerHTML;
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
   		.btn{
   		display : none;
   		}
   }
</style>
</head>
<body>
  <div class="container-scroller"> 
  <!-- 헤더 -->
  <%@ include file="/WEB-INF/views/MYPAGE/header.jsp" %>
  
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
    <!-- 레프트메뉴 -->
      <%@ include file="/WEB-INF/views/MYPAGE/leftMenu.jsp" %>
      
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-12 stretch-card">
			  <div class="card">
			    <div class="card-body" id="printTbl">
			      <h4 class="card-title" style="text-align:center">${dto.payday} 급여명세서</h4>
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
			              <td class="right">${dto.basic_salary}</td>
			              <td class="table-light">직급수당</td>
			              <td class="right">${dto.position_pay}</td>
			            </tr>
			            
			            <tr>
			              <td class="table-light">초과수당</td>
			              <td class="right">${dto.overtime_pay}</td>
			              <td class="table-light">식대</td>
			              <td class="right">${dto.meel_fee}</td>
			            </tr>
			            
			            <tr>
			              <td class="table-light">상여금</td>
			              <td class="right">${dto.bonus_pay}</td>
			              <td class="table-light">자가운전보조금</td>
			              <td class="right">${dto.drive_fee}</td>
			            </tr>
			            
			            <tr>
			              <td class="table-light">여비교통비</td>
			              <td class="right">${dto.transportation_fee}</td>
			              <td class="table-light">육아수당</td>
			              <td class="right">${dto.child_fee}</td>
			            </tr>
			            
			            <tr>
			              <td class="table-light">주휴수당</td>
			              <td class="right">${dto.holyday_pay}</td>
			              <td></td>
			              <td></td>
			            </tr>
			            
			            <tr>
							<td colspan="4" class="th1 table-secondary">공제내역</td>
						</tr>
						<tr>
							<td class="table-light">소득세</td>
							<td class="right">${dto.income_tax}</td>
							<td class="table-light">건강보험</td>
							<td class="right">${dto.health_insurance}</td>
						</tr>
						
						<tr>
							<td class="table-light">지방소득세</td>
							<td class="right">${dto.local_income_tax}</td>
							<td class="table-light">고용보험</td>
							<td class="right">${dto.employment_insurance}</td>
						</tr>
						
						<tr>
							<td class="table-light">국민연금</td>
							<td class="right">${dto.national_pension}</td>
							<td class="table-light">장기요양보험</td>
							<td class="right">${dto.long_term_care}</td>
						</tr>
						
						<tr>
							<td class="th1" colspan="3">지급총액</td>
							<td class="right">${dto.amount_pay}</td>
						</tr>
						
						<tr>
							<td class="th1" colspan="3">공제총액</td>
							<td class="right">${dto.tax}</td>
						</tr>
						<tr>
							<td class="th1" colspan="3">실지급액</td>
							<td class="right">${dto.net_pay}</td>
						</tr>
			            
			          </tbody>
			        </table>
			        <div class="btn-group col-sm-3" style="display: flex; justify-content: center; padding-top: 4%; margin: 0 auto;">
		               <button class="btn btn-outline-primary" onclick="print();">
		                 	급여명세서 출력
		               </button>
		              </div>
		            </form>
			      </div>
			    </div>
			  </div>
			</div>
          </div>
        </div>
        <!-- content-wrapper ends -->
      </div>
      <!-- main-panel ends -->
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

