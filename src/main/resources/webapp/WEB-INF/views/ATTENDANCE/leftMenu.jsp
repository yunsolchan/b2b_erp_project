<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
   <title>main</title>
  </head>
  
  <body>
<main>
	<nav class="sidebar sidebar-offcanvas" id="sidebar">
  	<ul class="nav">
        <li class="nav-item">
          <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
            <i class="menu-icon mdi mdi-account"></i>
            <span class="menu-title">내 정보 관리</span>
            <i class="menu-arrow"></i> 
          </a>
          <div class="collapse" id="ui-basic">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link" href="my_info.gh">내 정보 조회</a></li>
              <li class="nav-item"> <a class="nav-link" href="update_info.gh">내 정보 수정</a></li>
              <li class="nav-item"> <a class="nav-link" href="pw_update.gh">비밀번호 변경</a></li>
            </ul>
          </div>
        </li>
         <li class="nav-item">
          <a class="nav-link" data-bs-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
            <i class="menu-icon mdi mdi-database"></i>
            <span class="menu-title">내 급여 관리</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="form-elements">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"><a class="nav-link" href="my_salary_list.gh" class="link-dark rounded white">급여목록</a></li>
              <li class="nav-item"><a class="nav-link" href="#" class="link-dark rounded white">급여계산기</a></li>
              <li class="nav-item"><a class="nav-link" href="#" class="link-dark rounded white">비용청구</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
            <i class="menu-icon mdi mdi-briefcase"></i>
            <span class="menu-title">근태 관리</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="auth">
            <ul class="nav flex-column sub-menu">
          <li class="nav-item"><a class="nav-link" href="commute_main.is" class="link-dark rounded white">출/퇴근 입력</a></li>
	      <li class="nav-item"><a class="nav-link" href="#" class="link-dark rounded white">출퇴근현황</a></li>
	      <li class="nav-item"><a class="nav-link" href="#" class="link-dark rounded white">근태신청</a></li>
	      <li class="nav-item"><a class="nav-link" href="attendance.is" class="link-dark rounded white">휴가관리</a></li>
	      <li class="nav-item"><a class="nav-link" href="#" class="link-dark rounded white">신청현황</a></li>
            </ul>
          </div>
        </li>
      </ul>
	</nav>
	</main>
	</body>
	
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
	
	
</html>
