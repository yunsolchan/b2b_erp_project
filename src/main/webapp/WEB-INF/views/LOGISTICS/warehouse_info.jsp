<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>창고관리 </title>
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
	//페이지 로딩
	$(function(){
	  warehouse_list();
	   $("#warehouse_list").click(function(){
	      warehouse_list();
	   });
	});
      
	//메서드 정의

        
      
      function warehouse_list(){
         $.ajax({
            type: "post",
            url: "${path}/warehouse_list.dh?${_csrf.parameterName}=${_csrf.token}",
            success: function(result){   
               $('#warehouse_list_table').html(result);
            },
            error: function(){
               alert("table ajax 오류");
            }
         });
      }
      function warehouse_detail(code){
          $.ajax({
             type: "post",
             url: "${path}/warehouse_detail.dh?${_csrf.parameterName}=${_csrf.token}&wh_id="+code,
             success: function(result){   
                $('#warehouse_detail_table').html(result);
             },
             error: function(){
                alert("table ajax 오류");
             }
          });
       }
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
      
      <!-- 여기서부터 작성 -->
      <!-- partial:../../partials/_settings-panel.html -->
      
      <div class="main-panel">
        <div class="content-wrapper" style="padding-top:0;">
        <div class="d-flex flex-row align-items-center">
         <i class="menu-icon mdi mdi-codepen icon-lg text-primary me-2"></i>
            <h2 style="font-family:'IBM Plex Sans KR', sans-serif; font-weight:bold;  padding: 2% 0;">
                             물류관리
           </h2>
       </div>
          <div class="row col-lg-12">
            <div class="col-lg-7 d-flex flex-column">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">창고관리</h3>  
                  <div class="table-responsive" id="warehouse_list_table">     
               </div>
                  </div>        
                  </div>
                </div>
                <div class="col-lg-5 d-flex flex-column">
               <div class="card">
                  <div class="card-body collapse" id="warehouse_detail_table" style="display:none">
                     
                  </div>
               </div>
            </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
      </div>
      <!-- main-panel ends -->
    <div id="warehouse_detail_table">
    
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