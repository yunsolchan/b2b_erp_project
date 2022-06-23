<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
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
    	  $("#keyword").keyup(function() {
		        var k = $(this).val();
		        console.log(k);
		        $("tbody > tr").hide();
		        var temp = $("tbody > tr > td:contains('" + k + "')");
		        $(temp).parent().show();
			}); 
    	  
    	  arrival_list();
         $("#arrival_list").click(function(){
        	 $("#list_name").text('입하지시목록');
        	 arrival_list();
         });
         $("#arrival_history_list").click(function(){
        	 $("#list_name").text('입하내역');
        	 arrival_history_list();
         });
         $("#warehousing_Request_list").click(function(){
        	 $("#list_name").text('입하요청현황');
        	 warehousing_Request_list();
         });
         $("#warehousing_list").click(function(){
        	 $("#list_name").text('입고내역');
        	 warehousing_list();
         });
      });
      
      //입하지시목록
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
      //입하내역
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
      //입하요청현황
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
     //입고내역 
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
          <div class="row col-lg-11">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">입하/입고</h3>
                  <p class="card-description">
                  		입하/입고 관리
                  <label class="badge badge-info mb-2 ms-2" id="list_name" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
						입하지시목록
				</label>
				</p>
			    <div class="d-sm-flex justify-content-between mb-4">
                <!-- 상단 소 메뉴  S -->
                  <div class ="btn-group">
				     <button type="button" class="btn btn-outline-twitter" id="arrival_list" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">입하지시목록</button>
				     <button type="button" class="btn btn-outline-twitter" id="arrival_history_list" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">입하내역</button>
				     <button type="button" class="btn btn-outline-twitter" id="warehousing_Request_list" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">입고요청현황</button>
				     <button type="button" class="btn btn-outline-twitter" id="warehousing_list" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">입고내역</button>
			    </div>
                <!-- 상단 소 메뉴  S -->
			    <!-- 검색 S -->
			    	<div id="input-form">
	                  	<div class="d-sm-flex">
	                  		<i class="icon-search text-primary pt-1 pe-2 fw-bold fs-5"></i>
					  		<input type="text" id="keyword" class="form-control" placeholder="SEARCH" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;" />
					  	</div>
					 </div>
			    <!-- 검색 E -->
				</div> <!-- class="d-sm-flex justify-content-end mb-4" -->
				
               <div id="arrival_list_table">
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

