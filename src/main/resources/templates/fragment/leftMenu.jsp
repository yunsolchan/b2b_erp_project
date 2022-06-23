<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
   <title>main</title>

    <!-- <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sidebars/">

<script type="text/javascript">
	$(function(){
		$('#GoMain').click(function(){
			window.location="${path}/main.test";
		});
	});
</script>

    Bootstrap core CSS
<link href="/team_one/resources/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .white { color: #fff; }
    </style>

    
    Custom styles for this template
    <link href="/team_one/resources/css/sidebars.css" rel="stylesheet"> -->
  </head>
  
  <body>
  

<%-- <main>
  <h1 class="visually-hidden">Sidebars examples</h1>

  <div class="flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 280px; overflow-y: scroll; height: 100vh;">
    <!-- <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none"> -->
    <a href="#" class="nav-link text-white">
      <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
      <span class="fs-4" id="GoMain">MAIN</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a href="#" class="nav-link white" aria-current="page">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"/></svg>
          	인사
        </a>
    </li>
    <li>
    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">	
      <li><a href="dept_list.hj" class="link-dark rounded white">부서</a></li>
      <li><a href="emp_list.hj" class="link-dark rounded white">인사카드</a></li>
      <li><a href="attend_list.hj" class="link-dark rounded white">근태관리</a></li>
      <li><a href="salary_list.hj" class="link-dark rounded white">급여관리</a></li>
    </ul>
    </li>
      <li>
        <a href="#" class="nav-link text-white">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
          회계
        </a>
      </li>
      <li>
      <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
        <li><a href="client_list.mh" class="link-dark rounded white">거래처 목록</a></li>
        <li><a href="purchase_list.mh" class="link-dark rounded white">매입/매출장 관리</a></li>
        <li><a href="bank_list.mh" class="link-dark rounded white">계좌 관리</a></li>
        <li><a href="salary_specification_list.mh" class="link-dark rounded white">급여명세서</a></li>
        <li><a href="expenditure_request_list.mh" class="link-dark rounded white">지출 관리</a></li>
      	<li><a href="financial_closing.mh" class="link-dark rounded white">결산 관리</a></li>
      </ul>
      </li>
      <li>
        <a href="#" class="nav-link text-white">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"/></svg>
          물류
        </a>
      </li>
      <li>
      <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
        <li><a href="warehouse_list.dh.test" class="link-dark rounded white">창고정보</a></li>
        <li><a href="stock_list.dh.test" class="link-dark rounded white">재고정보</a></li>
        <li><a href="warehousing_Request_list.dh.test" class="link-dark rounded white">입고/입하</a></li>
        <li><a href="release_Request_list.dh.test" class="link-dark rounded white">출고/출하</a></li>
      </ul>
      </li>
      <li>
        <a href="#" class="nav-link text-white">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#grid"/></svg>
          영업/판매
        </a>
      </li>
      <li>
      <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
        <li><a href="${path }/client_list.jh" class="link-dark rounded white">거래처관리</a></li>
        <li><a href="${path }/estimate_list.jh" class="link-dark rounded white">견적서관리</a></li>
        <li><a href="${path }/order_list.jh" class="link-dark rounded white">주문서관리</a></li>
      </ul>
      </li>
      <li>
        <a href="#" class="nav-link text-white">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"/></svg>
          구매
        </a>
      </li>
      <li>
	      <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	        <li><a href="${path }/client_list.test" class="link-dark rounded white">거래처</a></li>
	        <li><a href="${path }/estimate_list.test" class="link-dark rounded white">견적서</a></li>
	        <li><a href="${path }/order_list.test" class="link-dark rounded white">주문서</a></li>
	      </ul>
	  </li>
	  <li class="nav-item">
        <a href="#" class="nav-link white" aria-current="page">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"/></svg>
          	근태
        </a>
    </li>
    <li>
    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">	
      <li><a href="attendance.is" class="link-dark rounded white">출/퇴근 입력</a></li>
      <li><a href="attendance_list.is" class="link-dark rounded white">출퇴근현황</a></li>
      <li><a href="attendance_request.is" class="link-dark rounded white">근태신청</a></li>
      <li><a href="leave_request.is" class="link-dark rounded white">휴가신청</a></li>
      <li><a href="request_list.is" class="link-dark rounded white">신청현황</a></li>
    </ul>
    </li>
    </ul>
  </div> --%>
<main>
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
              <i class="menu-icon mdi mdi-account-multiple"></i>
              <span class="menu-title">인사관리</span>
              <i class="menu-arrow"></i> 
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
				<li class="nav-item"> <a class="nav-link" href="dept_list.hj">부서</a></li>
                <li class="nav-item"> <a class="nav-link" href="emp_list.hj">인사카드</a></li>
                <li class="nav-item"> <a class="nav-link" href="attend.hj">근태관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="salary.hj">급여관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="salary_chart.hj">급여통계</a></li>
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
		      	<li class="nav-item"><a class="nav-link" href="financial_closing.mh" class="link-dark rounded white">결산 관리</a></li>
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
		        <li class="nav-item"><a class="nav-link" href="sales_list.jh" class="link-dark rounded white">판매관리</a></li>      
		        <li class="nav-item"><a class="nav-link" href="sales_invoice.jh" class="link-dark rounded white">영업관리현황</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#icons" aria-expanded="false" aria-controls="icons">
              <i class="menu-icon mdi mdi-buffer"></i>
              <span class="menu-title">구매관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="icons">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"><a class="nav-link" href="${path }/client_list.sc" class="link-dark rounded white">거래처관리</a></li>
		      	<li class="nav-item"><a class="nav-link" href="${path }/estimate_application_list.sc" class="link-dark rounded white">견적서신청관리</a></li>
		        <li class="nav-item"><a class="nav-link" href="${path }/estimate_list.sc" class="link-dark rounded white">견적서관리</a></li>
		        <li class="nav-item"><a class="nav-link" href="${path }/order_list.sc" class="link-dark rounded white">주문서관리</a></li>
		      	<li class="nav-item"><a class="nav-link" href="${path }/purchase_status.sc" class="link-dark rounded white">구매관리</a></li>
		      	<li class="nav-item"><a class="nav-link" href="${path }/purchase_request.sc" class="link-dark rounded white">구매관리현황</a></li>
              </ul>
            </div>
          </li>
          <!-- 
          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="menu-icon mdi mdi-account-circle-outline"></i>
              <span class="menu-title">근태</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                  <li class="nav-item"><a class="nav-link" href="attendance.is" class="link-dark rounded white">출/퇴근 입력</a></li>
			      <li class="nav-item"><a class="nav-link" href="attendance_list.is" class="link-dark rounded white">출퇴근현황</a></li>
			      <li class="nav-item"><a class="nav-link" href="attendance_request.is" class="link-dark rounded white">근태신청</a></li>
			      <li class="nav-item"><a class="nav-link" href="leave_request.is" class="link-dark rounded white">휴가신청</a></li>
			      <li class="nav-item"><a class="nav-link" href="request_list.is" class="link-dark rounded white">신청현황</a></li>
              </ul>
            </div>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="http://bootstrapdash.com/demo/star-admin2-free/docs/documentation.html">
              <i class="menu-icon mdi mdi-file-document"></i>
              <span class="menu-title">Documentation</span>
            </a>
          </li>
           -->
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
</main>
<!-- 

    <script src="/team_one/resources/js/bootstrap.bundle.min.js"></script>

      <script src="/team_one/resources/js/sidebars.js"></script> -->
  </body>
</html>
