<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
   <title>left-menu</title>
  </head>
  
  <body>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
  	<ul class="nav">
        <!-- 
          <li class="nav-item">
            <a class="nav-link" href="index.html">
              <i class="mdi mdi-grid-large menu-icon"></i>
              <span class="menu-title">MAIN</span>
            </a>
          </li>
           -->
          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="menu-icon mdi mdi-human-greeting"></i>
              <span class="menu-title">인사관리</span>
              <i class="menu-arrow"></i> 
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
				<li class="nav-item"> <a class="nav-link" href="dept_list.hj">부서관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="emp_list.hj">인사카드</a></li>
                <li class="nav-item"> <a class="nav-link" href="attend.hj">근태관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="salary.hj">급여관리</a></li>
              </ul>
            </div>
          </li>
           <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
              <i class="menu-icon mdi mdi-chart-line"></i>
              <span class="menu-title">회계관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="form-elements">
              <ul class="nav flex-column sub-menu">
                	<li class="nav-item"><a class="nav-link" href="client_list.mh" class="link-dark rounded white">거래처 목록</a></li>
		        <li class="nav-item"><a class="nav-link" href="purchase_list.mh" class="link-dark rounded white">매입/매출장 관리</a></li>
		        <li class="nav-item"><a class="nav-link" href="bank_list.mh" class="link-dark rounded white">계좌 관리</a></li>
		        <li class="nav-item"><a class="nav-link" href="salary_specification_list.mh" class="link-dark rounded white">급여명세서</a></li>
		        <li class="nav-item"><a class="nav-link" href="expenditure_request_list.mh" class="link-dark rounded white">지출 관리</a></li>
		      	<li class="nav-item"><a class="nav-link" href="financial_document.mh" class="link-dark rounded white">결산 관리</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
              <i class="menu-icon mdi mdi-codepen"></i>
              <span class="menu-title">물류관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="charts">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"><a class="nav-link" href="warehouse_info.dh" class="link-dark rounded white">창고정보</a></li>
		        <li class="nav-item"><a class="nav-link" href="stock_list_wh.dh" class="link-dark rounded white">재고정보</a></li>
		        <li class="nav-item"><a class="nav-link" href="warehousing_arrival_info.dh" class="link-dark rounded white">입하/입고</a></li>
		        <li class="nav-item"><a class="nav-link" href="release_deliver_info.dh" class="link-dark rounded white">출하/출고</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
              <i class="menu-icon mdi mdi-briefcase"></i>
              <span class="menu-title">영업/판매</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="tables">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"><a class="nav-link" href="client_list.jh" class="link-dark rounded white">거래처관리</a></li>
		        <li class="nav-item"><a class="nav-link" href="estimate_list.jh" class="link-dark rounded white">견적서관리</a></li>
		        <li class="nav-item"><a class="nav-link" href="order_list.jh" class="link-dark rounded white">주문서관리</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#icons" aria-expanded="false" aria-controls="icons">
              <i class="menu-icon mdi mdi-note-plus-outline"></i>
              <span class="menu-title">구매관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="icons">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"><a class="nav-link" href="${path }/client_list.sc" class="link-dark rounded white">거래처관리</a></li>
		      	<li class="nav-item"><a class="nav-link" href="${path }/estimate_application_list.sc" class="link-dark rounded white">견적서신청관리</a></li>
		        <li class="nav-item"><a class="nav-link" href="${path }/estimate_list.sc" class="link-dark rounded white">견적서관리</a></li>
		        <li class="nav-item"><a class="nav-link" href="${path }/order_list.sc" class="link-dark rounded white">주문서관리</a></li>
              </ul>
            </div>
          </li>
        </ul>
</nav>
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
<!-- 

    <script src="/team_one/resources/js/bootstrap.bundle.min.js"></script>

      <script src="/team_one/resources/js/sidebars.js"></script> -->
  </body>
</html>
