<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>급여목록</title>
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>
		.input1 { width: 150%; border: none; }
		.month { width: 300px; font-size: 19px; height: 100px; }
	</style> 
	
<script type="text/javascript">
    $(function(){
    	salary_list_today();
		$('#submit').click(function(){
            var input = document.querySelector('input[type="month"]');
            var month = input.value;

            var value = month;
            var name = "month";
            var arr = new Array();
            var obj = new Object();
            obj.name = name;
            obj.value = value;
            arr.push(obj);

            salary_list(arr);
        });
		
        function salary_list_today(arr){
            $.ajax({
                type: "post",
                url: "${path}/salary_list_today.hj?${_csrf.parameterName}=${_csrf.token}",
                dataType: 'text',
                data: arr,
                success: function(result){
                    $('#salary_list').html(result);
                },
                error: function(){
                    alert("salary_list 오류");
                }
            });
        }

        // 급여목록
        function salary_list(arr){
            $.ajax({
                type: "post",
                url: "${path}/salary_list.hj?${_csrf.parameterName}=${_csrf.token}",
                dataType: 'text',
                data: arr,
                success: function(result){
                    $('#salary_list').html(result);
                },
                error: function(){
                    alert("salary_list 오류");
                }
            });
        }
    });
    </script>
	
</head>
<body>
  <div class="container-scroller"> 
  <!-- 헤더 -->
  <%@ include file="/WEB-INF/views/MENU/header.jsp" %>
  
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
    <!-- 레프트메뉴 -->
      <%@ include file="/WEB-INF/views/MENU/leftMenu.jsp" %>
      
      <div class="main-panel">
        <div class="content-wrapper" style="padding-top:0;">
        <div class="d-flex flex-row align-items-center">
	      <i class="mdi mdi-human-greeting icon-lg text-facebook me-2"></i>
	      	<h2 style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;  padding: 2% 0;">
	           	인사관리
	        </h2>
	    </div>
          <div class="row col-lg-11">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">급여관리</h3>
                  <div class="d-sm-flex justify-content-between mb-4">
	                  <p class="card-description">
	                   		 급여목록
	                  </p>
	                  <div id="input-form">
	                  <i class="icon-search text-primary pt-1 pe-2 fw-bold fs-5"></i>
		                  <input type="month" style="border: 0.5px solid #96A7D2; font-family: 'IBM Plex Sans KR', sans-serif; font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold; width: 150px; padding-left: 10px">
		                  <button class="btn btn-outline-linkedin btn-sm ms-2" id="submit" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
			 				조회
			 			  </button>
			 		  </div>
	 				</div>
                  <div id="salary_list">
                  		<!-- table 삽입 div -->
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
    	<%@ include file="/WEB-INF/views/MENU/footer.jsp" %>
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

