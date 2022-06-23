<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>근태승인</title>
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
  
<script type="text/javascript">
      $(function(){
         $("#attend_list").click(function(){
        	 window.location="${path}/attend_list.hj";
         });
      });
</script>
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
      <!-- partial:../../partials/_settings-panel.html -->
      
      <div class="main-panel">
        <div class="content-wrapper">
        <div class="d-flex flex-row align-items-center">
	      <i class="mdi mdi-account-multiple icon-lg text-success"></i>
	      	<h2 style="font-family: inherit; padding: 2% 0;">
	                           근태관리
	        </h2>
	    </div>
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">근태승인</h3>
                  <p class="card-description">
                   		 휴가승인
                  </p>
                  <div class="table-responsive">
                  <form name="attend_update" method="post" action="attend_update_action.hj?${_csrf.parameterName}=${_csrf.token}">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>근태코드</th>
                          <th>시작일</th>
                          <th>종료일</th>
                          <th>사유</th>
                          <th>사번</th>
                          <th>휴가일수</th>
                          <th>근태상태</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="dto" items="${list}">
                      <input type="hidden" name="attendance_id" value="${dto.attendance_id}">
                      <input type="hidden" name="employee_id" value="${dto.employee_id}">
                        <tr>
                          <td>
                          <div class="todo-list todo-list-rounded">
                          	<div class="d-block">
                          		<div class="form-check">
                          			<label class="form-check-label">
		                       	  	<input type="checkbox" class="checkbox" value="${dto.attendance_id}">
		                          </label>
                          		</div>
                          	</div>
                          </div>
                          </td>
                          <td>${dto.attendance_id}</td>
                          <td><fmt:formatDate value="${dto.at_start_date}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                          <td><fmt:formatDate value="${dto.at_end_date}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                          <td>${dto.at_reason}</td>
                          <td>${dto.employee_id}</td>
                          <td>${dto.annual_count}</td>
                          <td><label class="badge badge-danger">${dto.attendance_status}</label></td>
                        </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                    
                    
                  <!-- 해당 버튼타입은 그룹으로 묶어서 줘야한다 -->
                  <div class ="btn-group">
	                  <button type="submit" id="btnConf" class="btn btn-outline-primary btn-fw">
	                    	휴가승인
	                    	<!-- style="width: 100%" -->
	                  </button>
	                  <!-- <button class="btn btn-outline-primary" type="button" id="attend_list">
	                    	근태조회
	                    	style="width: 100%"
	                  </button> -->
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
   
   
   
   
    </div>
    	<footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Copyright © 2021. All rights reserved.</span>
          </div>
        </footer>
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

