<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>purchase_list</title>
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
			all_list();
			$("#purchase_all_list").click(function(){
				$("#list_name").text('매입매출장');
				all_list();
			});
			$("#purchase_out_list").click(function(){
				$("#list_name").text('매출장');
				out_list();
			});
			$("#purchase_in_list").click(function(){
				$("#list_name").text('매입장');
				in_list();
			});
		});
		
		// 매입매출장 테이블 노출
		function all_list(){
			$.ajax({
				type: "post",
				url: "${path}/purchase_all_list.mh?${_csrf.parameterName}=${_csrf.token}",
				success: function(result){	
					$('#purchase_list_table').html(result);
				},
				error: function(){
					alert("table ajax 오류");
				}
			});
		}
		// 매출장 테이블 노출
		function out_list(){
			$.ajax({
				type: "post",
				url: "${path}/purchase_out_list.mh?${_csrf.parameterName}=${_csrf.token}",
				success: function(result){	
					$('#purchase_list_table').html(result);
				},
				error: function(){
					alert("table ajax 오류");
				}
			});
		}
		// 매입장 테이블 노출
		function in_list(){
			$.ajax({
				type: "post",
				url: "${path}/purchase_in_list.mh?${_csrf.parameterName}=${_csrf.token}",
				success: function(result){	
					$('#purchase_list_table').html(result);
				},
				error: function(){
					alert("table ajax 오류");
				}
			});
		}
	</script>
      
<!-- <script type="text/javascript">
	$(function(){
		$("#purchase_out_list").click(function(){
			window.location="${path}/purchase_out_list.mh";
		});
		$("#purchase_in_list").click(function(){
			window.location="${path}/purchase_in_list.mh";
		});
		$("#purchase_detail").click(function(){
			window.location="${path}/purchase_detail.mh";
		});
	});
</script> -->
<!-- 매입/매출장 목록 -->
	<div class="main-panel">
        <div class="content-wrapper">
        <div class="d-flex flex-row align-items-center">
	      <i class="menu-icon mdi mdi-chart-line icon-lg text-linkedin"></i>
	      	<h2 style="font-family: inherit; padding: 2% 0;">
	                    회계관리
	        </h2>
	    </div>
	<div class="row col-lg-11">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">매입/매출장 관리</h3>
	              <div class="d-sm-flex justify-content-between mb-4">
		                 <p class="card-description">
	                  		 매입/매출장 목록
	                  		 <label class="badge badge-info ms-2" id="list_name">
								매입매출장
							 </label>
		                 </p>
	                 <div class ="btn-group me-3">
	               		<button type="button" class="btn btn-outline-primary" id="purchase_all_list">매입/매출장</button>
						<button type="button" class="btn btn-outline-primary" id="purchase_out_list">매출장</button>
						<button type="button" class="btn btn-outline-primary" id="purchase_in_list">매입장</button>
	                 </div>
	              </div>
                  <div id="purchase_list_table" class="table-responsive">
                    
                  </div>
                  </div>
                  </div>
                  </div>
			</div>
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

