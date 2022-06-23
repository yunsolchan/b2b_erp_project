<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>매입/메출장</title>
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
  
<style>
	/* 페이징 css S */	
	.pagination {display: flex; padding-left: 0;list-style: none;justify-content: center;}
	a {color: black;text-decoration: none;cursor: pointer;}
	.disabled{display :none;}
	li.active a{
	    color:#6E7FC5;
	}
	th.hover{
	    color:#6E7FC5;
	}
	a:hover{
		color:#A7AECB;
	}
	/* 페이징 css E */	
</style>
  
</head>
<body>
  <div class="container-scroller"> 
  <!-- 헤더 -->
  <%@ include file="/WEB-INF/views/MENU/header.jsp" %>
  
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
    <!-- 레프트메뉴 -->
    <%@ include file="/WEB-INF/views/MENU/leftMenu.jsp" %>
      <!-- 여기서부터 작성 -->
	<script type="text/javascript">
		$(function(){
			$("#keyword").keyup(function() {
		        var k = $(this).val();
		        console.log(k);
		        $("tbody > tr").hide();
		        var temp = $("tbody > tr > td:contains('" + k + "')");
		        $(temp).parent().show();
			}); 
			
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
        <div class="content-wrapper" style="padding-top:0;">
        <div class="d-flex flex-row align-items-center">
	      <i class="menu-icon mdi mdi-chart-line icon-lg text-linkedin me-2"></i>
	      	<h2 style="font-family:'IBM Plex Sans KR', sans-serif; font-weight:bold;  padding: 2% 0;">
	                    회계관리
	        </h2>
	    </div>
	<div class="row col-lg-11">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">매입/매출장 관리</h3>
                 <p class="card-description">
                 		 매입/매출장 목록
                 	<label class="badge badge-info ms-2" id="list_name" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
						매입매출장
					 </label>
                 </p>
                 <div class="d-sm-flex justify-content-between mb-4">
                 <div class ="btn-group me-3">
               		<button type="button" class="btn btn-outline-twitter" id="purchase_all_list" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">매입/매출장</button>
					<button type="button" class="btn btn-outline-twitter" id="purchase_out_list" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">매출장</button>
					<button type="button" class="btn btn-outline-twitter" id="purchase_in_list" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">매입장</button>
                 </div>
                 <!-- 검색 S -->
                 <div id="input-form">
                  	<div class="d-sm-flex">
                  		<i class="icon-search text-primary pt-1 pe-2 fw-bold fs-5"></i>
				  		<input type="text" id="keyword" class="form-control" placeholder="SEARCH" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;" />
				  	</div>
				 </div>
				 <!-- 검색 E  -->
                 </div>
                  <div id="purchase_list_table" class="table-responsive">
                   <!-- ajax 리콜 result 영역 --> 
                  </div>
                  </div>
                  </div>
                  </div>
			</div>
			</div>
	</div>
    </div>
    	<%@ include file="/WEB-INF/views/MENU/footer.jsp" %>
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

