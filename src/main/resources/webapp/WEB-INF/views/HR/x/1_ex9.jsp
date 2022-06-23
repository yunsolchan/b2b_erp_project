<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
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
      
      
<script type="text/javascript">
   $(function(){
      $("#salary_list").click(function(){
         window.location="${path}/salary_list.hj";
      });
   });
</script>
	<div class="content">
      <img src="${path}/resources/image/HR/급여상세.png" width=1500px/>
      <button type="button" class="btn btn-outline-warning" id="salary_list">급여목록</button>
      <div style="border: 1px solid black">
         <pre>
			회원별 급여정보를 보여준다.
            
            SQL : SELECT e.EMPLOYEE_ID
		       , s.BASIC_SALARY
		       , NVL(ta.OVERTIME_PAY, 0) OVERTIME_PAY
		       , NVL(ta.BONUS_PAY, 0) BONUS_PAY
		       , NVL(ta.TRANSPORTATION_FEE, 0) TRANSPORTATION_FEE
		       , NVL(ta.HOLYDAY_PAY, 0) HOLYDAY_PAY
		       , NVL(ta.POSITION_PAY, 0) POSITION_PAY
		       , NVL(nta.MEEL_FEE, 0) MEEL_FEE
		       , NVL(nta.DRIVE_FEE, 0) DRIVE_FEE
		       , NVL(nta.CHILD_FEE, 0) CHILD_FEE
		       , NVL(t.INCOME_TAX, 0) INCOME_TAX
		       , NVL(t.LOCAL_INCOME_TAX, 0) LOCAL_INCOME_TAX
		       , NVL(t.NATIONAL_PENSION, 0) NATIONAL_PENSION
		       , NVL(t.HEALTH_INSURANCE, 0) HEALTH_INSURANCE
		       , NVL(t.EMPLOYMENT_INSURANCE, 0) EMPLOYMENT_INSURANCE
		       , NVL(t.LONG_TERM_CARE, 0) LONG_TERM_CARE
		    FROM SALARY s
		    JOIN TAX t
		      ON s.TAX_ID = t.TAX_ID
		    JOIN TAXTION ta
		      ON s.TAXTION_ID = ta.TAXTION_ID
		    JOIN NON_TAXTION nta
		      ON s.NON_TAXTION_ID = nta.NON_TAXTION_ID
		    JOIN EMPLOYEE e
		      ON s.EMPLOYEE_ID = e.EMPLOYEE_ID
		   WHERE e.employee_id = '220417_01';
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

