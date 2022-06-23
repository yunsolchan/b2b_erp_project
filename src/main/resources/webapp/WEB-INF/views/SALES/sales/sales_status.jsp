<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>sales_status</title>
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
      $('#sales_print').click(function(){
    	  
          window.print();
       });  
      
      $('#sales_list').click(function(){
     	  
          window.location="${path}/sales_list.jh";
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

<script>

$(document).ready(function() {
	/* 오름-내림차룬 정렬 기능 S */
	$('th').each(function (column) {
	      $(this).click(function() {
              if($(this).is('.asc')) {
                  $(this).removeClass('asc');
                  $(this).addClass('desc');
                  sortdir=-1;                
              } else {
                 $(this).addClass('asc');
                 $(this).removeClass('desc'); 
                 sortdir=1;
              }
              $(this).siblings().removeClass('asc');
              $(this).siblings().removeClass('desc');
             var rec = $('table').find('tbody>tr').get();
             rec.sort(function (a, b) {
                  var val1 = $(a).children('td').eq(column).text().toUpperCase();
                  var val2 = $(b).children('td').eq(column).text().toUpperCase();
                  return (val1 < val2)?-sortdir:(val1>val2)?sortdir:0;
             });
             $.each(rec, function(index, row) {
                  $('tbody').append(row);
               });
         });
	});
	/* 오름-내림차룬 정렬 기능 E */

	/* 검색기능 S */
 	$("#keyword").keyup(function() {
        var k = $(this).val();
        console.log(k);
        $("#info_table > tbody > tr").hide();
        var temp = $("#info_table > tbody > tr > td:contains('" + k + "')");
        $(temp).parent().show();
	}); 
	/* 검색기능 E */
	
	/* 페이징처리 S */
	/* 페이징처리 E */
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
      <div class="main-panel">
        <div class="content-wrapper">
        <div class="d-flex flex-row align-items-center">
         <i class="mdi mdi-database-plus icon-lg text-success"></i>
            <h2 style="font-family: inherit;4">
                     판매 관리
           </h2>
       </div>
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card" id="print">
                <div class="card-body">
                  <h3 class="card-title">판매 현황</h3>
                  <p class="card-description">
                          회사명 : (주)team_one
                  </p>
                  <div class="table-responsive">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>일자</th>
                          <th>품명 및 규격</th>
                          <th>수량</th>
                          <th>단가</th>
                          <th>공급가액</th>
                          <th>부가세</th>
                          <th>합계</th>
                          <th>판매처이름</th>
                        </tr>
                      </thead>
                      <tbody id="sales_list">
                        <tr>
                          <td>210</td>
                          <td>나이키코리아</td>
                          <td>220-23-23123</td>
                          <td>황동혁</td>
                          <td>010-5164-2211</td>
                          <td>서울 강남구 대해란로 152</td>
                          <td>22년 04월 20일 화</td>
                          <td>220-23-23123</td>
                        </tr>
                        <tr>
                          <td>210</td>
                          <td>나이키코리아</td>
                          <td>220-23-23123</td>
                          <td>황동혁</td>
                          <td>010-5164-2211</td>
                          <td>서울 강남구 대해란로 152</td>
                          <td>22년 04월 20일 화</td>
                          <td>220-23-23123</td>
                        </tr>
                        <tr>
                          <td>210</td>
                          <td>나이키코리아</td>
                          <td>220-23-23123</td>
                          <td>황동혁</td>
                          <td>010-5164-2211</td>
                          <td>서울 강남구 대해란로 152</td>
                          <td>22년 04월 20일 화</td>
                          <td>220-23-23123</td>
                        </tr>
                        <tr>
                          <td>210</td>
                          <td>나이키코리아</td>
                          <td>220-23-23123</td>
                          <td>황동혁</td>
                          <td>010-5164-2211</td>
                          <td>서울 강남구 대해란로 152</td>
                          <td>22년 04월 20일 화</td>
                          <td>220-23-23123</td>
                        </tr>
                        <tr>
                          <td>210</td>
                          <td>나이키코리아</td>
                          <td>220-23-23123</td>
                          <td>황동혁</td>
                          <td>010-5164-2211</td>
                          <td>서울 강남구 대해란로 152</td>
                          <td>22년 04월 20일 화</td>
                          <td>220-23-23123</td>
                        </tr>
                      </tbody>
                    </table>
                    
                    <br><br><br>
                    
                  <button type="submit" class="btn btn-outline-primary btn-fw" id="sales_print">
                       판매현황 목록다운로드
                  </button>
                  
                  <button type="submit" class="btn btn-primary" id="sales_list">
                       판매조회
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
