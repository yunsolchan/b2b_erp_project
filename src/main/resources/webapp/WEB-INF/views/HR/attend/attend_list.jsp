<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>근태조회</title>
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
   th i, #input-form { float: right; }
  </style>
		
	 <script type="text/javascript">
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
		        $("#attend_list > tbody > tr").hide();
		        var temp = $("#attend_list > tbody > tr > td:contains('" + k + "')");
		        $(temp).parent().show();
			}); 
			/* 검색기능 E */
			
			/* 페이징처리 S */
			/* 페이징처리 E */
		});
	 
      $(function(){
         $("#attend_update").click(function(){
        	 window.location="${path}/attend_update.hj";
         });
      });
   </script>
</head>
<body>
  
<div class="table-responsive">
                  
                  <div id="attend_update_table"></div>
                  <!-- <form name="attend_list"> -->
                  <div id="input-form">
				  	<input type="text" id="keyword" class="form-control" />
				  </div>  
                  <table class="table table-hover" id="attend_list">
                      <thead>
                        <tr>
                          <th>사번<i class="mdi mdi-swap-vertical"></i></th>
                          <th>이름<i class="mdi mdi-swap-vertical"></i></th>
                          <th>시작일<i class="mdi mdi-swap-vertical"></i></th>
                          <th>종료일<i class="mdi mdi-swap-vertical"></i></th>
                          <th>근태상태<i class="mdi mdi-swap-vertical"></i></th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="dto" items="${list}">
                        <tr>
                          <td>${dto.employee_id}</td>
                          <td>${dto.em_name}</td>
                          <td><fmt:formatDate value="${dto.at_start_date}" pattern="yyyy-MM-dd hh:mm:ss" /></td> 
                          <td><fmt:formatDate value="${dto.at_end_date}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                          <td>
	                          <c:if test="${dto.attendance_status == '조퇴'}"><label class="badge badge-danger">${dto.attendance_status}</label></c:if>
	                          <c:if test="${dto.attendance_status == '지각'}"><label class="badge badge-danger">${dto.attendance_status}</label></c:if>
	                          <c:if test="${dto.attendance_status == '출근'}"><label class="badge badge-warning">${dto.attendance_status}</label></c:if>
	                          <c:if test="${dto.attendance_status == '퇴근'}"><label class="badge badge-success">${dto.attendance_status}</label></c:if>
	                          <c:if test="${dto.attendance_status == '휴가'}"><label class="badge badge-info">${dto.attendance_status}</label></c:if>
	                          <c:if test="${dto.attendance_status == '휴가요청'}"><label class="badge badge-danger">${dto.attendance_status}</label></c:if>
	                          <c:if test="${dto.attendance_status == '출근전'}"><label class="badge badge-danger">${dto.attendance_status}</label></c:if>
	                      </td>
                        </tr>
                      </c:forEach>
                      </tbody>
                    </table>
                  </div>
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

