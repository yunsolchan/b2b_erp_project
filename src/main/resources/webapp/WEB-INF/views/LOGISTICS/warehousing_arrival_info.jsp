<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>입하/입고 </title>
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
    	  arrival_list();
         $("#arrival_list").click(function(){
        	 arrival_list();
         });
         $("#arrival_history_list").click(function(){
        	 arrival_history_list();
         });
         $("#warehousing_Request_list").click(function(){
        	 warehousing_Request_list();
         });
         $("#warehousing_list").click(function(){
        	 warehousing_list();
         });
      });
      function arrival_list(){
         $.ajax({
            type: "post",
            url: "${path}/arrival_list.dh?${_csrf.parameterName}=${_csrf.token}",
            success: function(result){   
               $('#arrival_list_table').html(result);
            },
            error: function(){
               alert("table ajax 오류");
            }
         });
      }
      function arrival_history_list(){
         $.ajax({
            type: "post",
            url: "${path}/arrival_history_list.dh?${_csrf.parameterName}=${_csrf.token}",
            success: function(result){   
               $('#arrival_list_table').html(result);
            },
            error: function(){
               alert("table ajax 오류");
            }
         });
      }
      function warehousing_Request_list(){
          $.ajax({
             type: "post",
             url: "warehousing_Request_list.dh?${_csrf.parameterName}=${_csrf.token}",
             success: function(result){   
                $('#arrival_list_table').html(result);
             },
             error: function(){
                alert("table ajax 오류");
             }
          });
      }
     function warehousing_list(){
         $.ajax({
            type: "post",
            url: "${path}/warehousing_list.dh?${_csrf.parameterName}=${_csrf.token}",
            success: function(result){   
               $('#arrival_list_table').html(result);
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
	      <i class="menu-icon mdi mdi-codepen icon-lg text-primary"></i>
	      	<h2 style="font-family: inherit;4">
	                          물류관리
	        </h2>
	    </div>
	  
	     <div class ="btn-group">
		     <button class="btn btn-outline-primary" type="button" id="arrival_list">입하지시목록</button>
		     <button class="btn btn-outline-primary" type="button" id="arrival_history_list">입하내역</button>
		     <button class="btn btn-outline-primary" type="button" id="warehousing_Request_list">입고요청현황</button>
		     <button class="btn btn-outline-primary" type="button" id="warehousing_list">입고내역</button>
	    </div>
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">입하/입고</h3>
                  <div id="arrival_list_table">
                   <!--<div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>구매처</th>
                          <th>요청일</th>
                          <th>입하예정일</th>
                          <th>품목수</th>
                          <th>입하지시</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>Jacob</td>
                          <td>53275531</td>
                          <td>12 May 2017</td>
                          <td>100</td>
                          <td>입하지시</td>
                        </tr>
                        <tr>
                          <td>Messsy</td>
                          <td>53275532</td>
                          <td>15 May 2017</td>
                          <td>100</td>
                          <td>입하지시</td>
                        </tr>
                        <tr>
                          <td>John</td>
                          <td>53275533</td>
                          <td>14 May 2017</td>
                          <td>100</td>
                          <td>입하지시</td>
                        </tr>
                        <tr>
                          <td>Peter</td>
                          <td>53275534</td>
                          <td>16 May 2017</td>
                          <td>100</td>
                          <td>입하지시</td>
                        </tr>
                        <tr>
                          <td>Dave</td>
                          <td>53275535</td>
                          <td>20 May 2017</td>
                          <td>100</td>
                          <td>입하지시</td>
                        </tr>
                      </tbody>
                    </table> -->
                    
                    
                   <div class="content">
			      <%-- <button type="button" class="btn btn-outline-warning" id="warehouse_detail" onclick="window.location='${path}/warehousing_indicate.dh.test'">입고 처리</button>   --%>
			      <div style="border: 1px solid black">
			         <pre>
			            
			            SQL : 
			            		SELECT c.name
								      , r.begin_date
								      , i.inbound_date
								      , d.qty
								   FROM request r
								   JOIN client c
								     ON r.client_id = c.client_id
								   JOIN inbound i
								     ON r.request_id = i.request_id
								   JOIN request_detail d
								     ON d.request_id = r.request_id
								WHERE r.request_id = i.request_id
								  AND r.status = '입하지시';
			         </pre>   
			      </div>
			   </div>
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

