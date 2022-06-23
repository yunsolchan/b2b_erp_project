<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>수당요청 목록</title>
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
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<style>
		.input1 { width: 150%; border: none; }
		th i { float: right; }
		#input-form { float: left; }
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
		        $("#salary_req > tbody > tr").hide();
		        var temp = $("#salary_req > tbody > tr > td:contains('" + k + "')");
		        $(temp).parent().show();
			}); 
			/* 검색기능 E */
			
			/* 페이징처리 S */
			/* 페이징처리 E */
		});
		
	</script>
</head>
<body>
<div class="content-wrapper" style="padding-top:0;">
        <div class="d-flex flex-row align-items-center">
	      <i class="mdi mdi-human-greeting icon-lg text-facebook me-2"></i>
	      <h2 style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold; padding: 2% 0;">인사관리</h2>
	    </div>
          <div class="row col-lg-11">
            <div class="col-lg-12 d-flex flex-column">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">급여관리</h3>
                  <div class="d-sm-flex justify-content-between mb-4">
                  	<p class="card-description">
                  		수당요청 목록 (사번 : ${param.employee_id})
                  	</p>
                  	
                  	<div id="input-form">
                  	<div class="d-sm-flex">
                  		<i class="icon-search text-primary pt-1 pe-2 fw-bold fs-5"></i>
				  		<input type="text" id="keyword" class="form-control" placeholder="SEARCH" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;" />
				  	</div>
				  </div>
                </div>
                  <div class="table-responsive">
				<form name="salary_list" id="salary_list2" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				 <table class="table table-hover" id="salary_req" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
				   <thead>
				     <tr class="table-secondary">
				        <th>요청내용<i class="mdi mdi-swap-vertical"></i></th>
				        <th>요청일자<i class="mdi mdi-swap-vertical"></i></th>
				        <th>승인여부<i class="mdi mdi-swap-vertical"></i></th>
				     </tr>
				   </thead>
				   <tbody id="tbody">
				   <c:forEach var="dto" items="${list}">
				   		<tr>
				          <td>${dto.re_memo}</td>
				          <td><fmt:formatDate value="${dto.begin_date}" pattern="yyyy-MM-dd" /></td>
				          <td>
				          	<c:if test="${dto.re_status == '신청'}">
				          		<button type="button" class="btn btn-rounded btn-sm btn-outline-success" style="cursor:pointer; font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;" onclick="window.location='salary_request_update.hj?request_id=${dto.request_id}'">
				          			승인
				          		</button>
				          	</c:if>
				          	<c:if test="${dto.re_status == '승인'}">
				          		<label class="badge badge-warning" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">승인완료</label>
				          	</c:if>
				          </td>
				        </tr>
					</c:forEach>
				    </tbody>
				  </table>
				</form>
				<div class="d-flex justify-content-end mt-3 mb-3">
                  <button type="button" class="btn btn-danger btn-rounded fw-bold btn-sm" onclick="window.close();">
                    	CLOSE
                  </button>
                </div>
			</div>
		</div>
      </div>
    </div>
  </div>
</div>
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

