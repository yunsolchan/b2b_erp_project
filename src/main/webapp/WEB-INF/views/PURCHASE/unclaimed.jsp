<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>unclaimed</title>
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
	   $('#provision').click(function(){
	         
	         window.location="${path}/provision.sc";
	      });
	      
	      $('#purchase_request').click(function(){
	         
	    	  window.location="${path}/purchase_request.sc";
	       });
      $('#unclaimed_print').click(function(){
          window.print();
       });      
   });
</script>
<script type="text/javascript">
   $(function(){
      // tr태그 클릭 시 거래처 상세페이지 접근 이벤트 생성
      $('#client_list tr').click(function(){
         var tr = $(this);   // 현재 클릭한 tr
         var td = tr.children();   // 클릭한 tr의 요소(td)
         
         window.location="${path}/client_detail.sc";
      });
   });
</script>
<script>
    
    var initBodyHtml;

    function beforePrint() {
        initBodyHtml = document.body.innerHTML;
        document.body.innerHTML = document.getElementById('print').innerHTML;
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
       .btn
       {
           display: none !important;
       }
   }
</style>
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
      <div class="main-panel">
        <div class="content-wrapper">
        <div class="d-flex flex-row align-items-center">
         <i class="mdi mdi-square-inc-cash icon-lg text-success"></i>
            <h2 style="font-family: inherit;4">
             	구매관리현황
           </h2>
       </div>
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card" id="print">
                <div class="card-body">
                  <h3 class="card-title">미청구현황</h3>
                  <p class="card-description">
                         미청구현황
                  </p>
                  <div class="table-responsive">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>일자</th>
                          <th>거래처명</th>
                          <th>품목코드</th>
                          <th>품목명</th>
                          <th>수량</th>
                          <th>단가</th>
                          <th>공급가액</th>
                          <th>부가세</th>
                        </tr>
                      </thead>
                      <tbody id="client_list">
                        <tr>
                          <td>210</td>
                          <td>나이키코리아</td>
                          <td>220-23-23123</td>
                          <td>황동혁</td>
                          <td>황동혁</td>
                          <td>황동혁</td>
                          <td>황동혁</td>
                          <td>황동혁</td>
                        </tr>
                        <tr>
                          <td>210</td>
                          <td>나이키코리아</td>
                          <td>220-23-23123</td>
                          <td>황동혁</td>
                          <td>황동혁</td>
                          <td>황동혁</td>
                          <td>황동혁</td>
                          <td>황동혁</td>
                        </tr>
                        <tr>
                          <td>210</td>
                          <td>나이키코리아</td>
                          <td>220-23-23123</td>
                          <td>황동혁</td>
                          <td>황동혁</td>
                          <td>황동혁</td>
                          <td>황동혁</td>
                          <td>황동혁</td>
                        </tr>
                        <tr>
                          <td>210</td>
                          <td>나이키코리아</td>
                          <td>220-23-23123</td>
                          <td>황동혁</td>
                          <td>황동혁</td>
                          <td>황동혁</td>
                          <td>황동혁</td>
                          <td>황동혁</td>
                        </tr>
                        <tr>
                          <td>210</td>
                          <td>나이키코리아</td>
                          <td>220-23-23123</td>
                          <td>황동혁</td>
                          <td>황동혁</td>
                          <td>황동혁</td>
                          <td>황동혁</td>
                          <td>황동혁</td>
                        </tr>
                      </tbody>
                    </table>
                    <button type="button" class="btn btn-primary" id="provision">지급현황</button>
                    <button type="button" class="btn btn-primary" id="purchase_request">매입청구서현황</button>
                  <button type="submit" class="btn btn-outline-primary btn-fw" id="unclaimed_print">
                       매입청구서현황 다운로드
                  </button>                               
                  
                  
                  <ul class="">
                  <!-- 클래스명 없어도된다 -->
                  <li class="nav-item dropdown d-none d-lg-block">
            <a class="nav-link dropdown-bordered dropdown-toggle dropdown-toggle-split" id="messageDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false"> Select Category </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0" aria-labelledby="messageDropdown">
              <a class="dropdown-item py-3" >
                <p class="mb-0 font-weight-medium float-left">Select category</p>
              </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <p class="preview-subject ellipsis font-weight-medium text-dark">Bootstrap Bundle </p>
                  <p class="fw-light small-text mb-0">This is a Bundle featuring 16 unique dashboards</p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <p class="preview-subject ellipsis font-weight-medium text-dark">Angular Bundle</p>
                  <p class="fw-light small-text mb-0">Everything you’ll ever need for your Angular projects</p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <p class="preview-subject ellipsis font-weight-medium text-dark">VUE Bundle</p>
                  <p class="fw-light small-text mb-0">Bundle of 6 Premium Vue Admin Dashboard</p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <p class="preview-subject ellipsis font-weight-medium text-dark">React Bundle</p>
                  <p class="fw-light small-text mb-0">Bundle of 8 Premium React Admin Dashboard</p>
                </div>
              </a>
            </div>
          </li>
          </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
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