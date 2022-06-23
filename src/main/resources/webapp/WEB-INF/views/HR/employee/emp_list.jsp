<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Star Admin2 </title>
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
	        $("#emp_list > tbody > tr").hide();
	        var temp = $("#emp_list > tbody > tr > td:contains('" + k + "')");
	        $(temp).parent().show();
		}); 
		/* 검색기능 E */
		
		/* 페이징처리 S */
		/* 페이징처리 E */
	});
		$(function(){
			// tr태그 클릭 시 거래처 상세페이지 접근 이벤트 생성
			$('#emp_list tr td').click(function(){
				var click = $(this);
		         var tr = click.parent();
		         var td = tr.children();
			    
				// 사원상세 
				window.location="${path}/emp_detail.hj?employee_id=" + td.eq(0).text();
			});
		});
		
		// 사원추가 open
		function emp_insert() {
			var url = "${path}/emp_insert.hj";
			window.open(url, "emp_insert", "menubar=no, width=1000px, height=800px");  // (url, "별칭", size);
			
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
	      <i class="mdi mdi-account-multiple icon-lg text-success"></i>
	      	<h2 style="font-family: inherit; padding: 2% 0;">
	                           인사관리
	        </h2>
	    </div>
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">인사카드 조회</h3>
                  <div class="table-responsive">
                  <form name="emp_list">
                  <!-- 검색창 -->
                  <div id="input-form">
				  	<input type="text" id="keyword" class="form-control" />
				  </div>
                    <table class="table table-hover" id="emp_list">
                      <thead>
                        <tr>
                          <th>사번<i class="mdi mdi-swap-vertical"></i></th>
                          <th>이름<i class="mdi mdi-swap-vertical"></i></th>
                          <th>전화번호<i class="mdi mdi-swap-vertical"></i></th>
                          <th>이메일<i class="mdi mdi-swap-vertical"></i></th>
                          <th>입사일<i class="mdi mdi-swap-vertical"></i></th>
                          <th>부서명<i class="mdi mdi-swap-vertical"></i></th>
                          <th>직위<i class="mdi mdi-swap-vertical"></i></th>
                          <th>상태<i class="mdi mdi-swap-vertical"></i></th>
                        </tr>
                      </thead>
                      <tbody>
	                      <c:forEach var="dto" items="${list}">
	                        <tr>
	                          <td>${dto.employee_id}</td>
	                          <td>${dto.em_name}</td>
	                          <td>${dto.em_phone}</td>
	                          <td>${dto.em_email}</td>
	                          <td><fmt:formatDate value="${dto.hire_date}" pattern="yyyy-MM-dd" /></td>
	                          <td>${dto.de_name}</td>
	                          <td>${dto.po_name}</td>
	                          <td>${dto.em_status}</td>
	                        </tr>
	                      </c:forEach>
                      </tbody>
                    </table>
                    
                   <div style="padding-top: 2%;">
                   <button type="submit" class="btn btn-outline-primary btn-fw" onclick="emp_insert()">
                    	인사카드추가
                  </button>
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

