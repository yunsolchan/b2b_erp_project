<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>근태승인</title>
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
  	        $("#attend_req > tbody > tr").hide();
  	        var temp = $("#attend_req > tbody > tr > td:contains('" + k + "')");
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
	      <i class="mdi mdi-human-greeting icon-lg text-facebook me-2"></i>
	      	<h2 style="font-family:'IBM Plex Sans KR', sans-serif; font-weight:bold;  padding: 2% 0;">
	             	인사관리
	        </h2>
	    </div>
          <div class="row col-lg-11">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">근태관리</h3>
                  <div class="d-sm-flex justify-content-between mb-4">
	                  <p class="card-description">
	                   		 근태신청목록
	                  </p>
	                  <div id="input-form">
	                  	<div class="d-sm-flex">
	                  		<i class="icon-search text-primary pt-1 pe-2 fw-bold fs-5"></i>
					  		<input type="text" id="keyword" class="form-control" placeholder="SEARCH" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;" />
					  	</div>
					  </div>
				  </div>
                  <div class="table-responsive">
                  <form name="attend_update" method="post" action="attend_update_action.hj?${_csrf.parameterName}=${_csrf.token}">
                    <table class="table table-hover" id="attend_req" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
                      <thead>
                        <tr class="table-secondary">
                          <th><i class="mdi mdi-calendar-check" style="float: none"></i></th>
                          <th>근태코드</th>
                          <th>시작일</th>
                          <th>종료일</th>
                          <th>사유</th>
                          <th>사번</th>
                          <th>휴가일수</th>
                          <th>근태상태</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="dto" items="${list}">
                      <input type="hidden" name="employee_id" value="${dto.employee_id}">
                        <tr>
                          <td>
                          <div class="todo-list todo-list-rounded">
                          	<div class="d-block">
                          		<div class="form-check">
                          			<label class="form-check-label">
		                       	  	<input type="checkbox" class="checkbox" name="attendance_id" value="${dto.attendance_id}">
		                          </label>
                          		</div>
                          	</div>
                          </div>
                          </td>
                          <td>${dto.attendance_id}</td>
                          <td><fmt:formatDate value="${dto.at_start_date}" pattern="yyyy-MM-dd" /></td>
                          <td><fmt:formatDate value="${dto.at_end_date}" pattern="yyyy-MM-dd" /></td>
                          <td>
                          	<c:if test="${dto.at_reason == null}">
                          		<label class="badge badge-success">개인사유</label>
                          	</c:if>
                          	<c:if test="${dto.at_reason != null}">
                          		${dto.at_reason}
                          	</c:if>
                          </td>
                          <td>${dto.employee_id}</td>
                          <td>${dto.annual_count}</td>
                          <td><label class="badge badge-danger">${dto.attendance_status}</label></td>
                        </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                    
				<div class ="d-flex justify-content-end mt-3 mb-3">
	                  <button type="submit" id="btnConf" class="btn btn-rounded btn-outline-twitter btn-text-icon" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
	                    	<i class="mdi mdi-calendar-check btn-icon-prepend"></i>
	                    	휴가승인
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

