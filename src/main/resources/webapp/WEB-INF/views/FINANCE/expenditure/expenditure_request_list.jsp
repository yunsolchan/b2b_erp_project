<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <title>expenditure_request_list</title>
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
<script type="text/javascript">
	$(function(){
		// 지출결의서 목록접근
		$("#expenditure_resolution_list").click(function(){
			window.location="${path}/expenditure_resolution_list.mh";
		});
		
		$("#expenditure_request_list tr td").click(function(){
			var click = $(this);
			var tr = click.parent();
			var td = tr.children();
			
			expenditure_request_detail(td.eq(0).text());
		});
		function expenditure_request_detail(request_code) {
		      var url = "${path}/expenditure_request_detail.mh?request_code=" + request_code;
		      window.open(url, "expenditure_request_detail", "menubar=no, width=800px, height=700px");  // (url, "별칭", size);  
		}
	});
</script>
<!-- 지출요청 승인처리 -->
	<div class="main-panel">
        <div class="content-wrapper">
        <div class="d-flex flex-row align-items-center">
	      <i class="menu-icon mdi mdi-chart-line icon-lg text-linkedin"></i>
	      	<h2 style="font-family: inherit; padding: 2% 0;">
	                    회계관리
	        </h2>
	    </div>
	<div class="row col-lg-10">
            <div class="col-lg-12 ">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">지출관리</h3>
                  <div class="d-sm-flex justify-content-between">
                  	<p class="card-description">지출요청 목록</p>
                  	<button type="button" class="btn btn-outline-primary btn-sm ms-4 mb-3" id="expenditure_resolution_list">지출결의서 목록</button>
                  </div>
                  <div class="table-responsive">
		<table id="expenditure_request_list" class="table table-hover" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">
			<thead>
				<tr>
					<th>요청코드</th>
					<th>부서명</th>
					<th>계정명</th>
					<th>적요</th>
					<th>비용</th>
					<th>발행일자</th>
					<th>승인일자</th>
					<th>승인여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" items="${expenditure_request_list}">
					<tr>
						<td>${i.request_id}</td>
						<td>
							<c:if test="${i.department_id == 100}">
								인사과
							</c:if>
							<c:if test="${i.department_id == 200}">
								회계과
							</c:if>
							<c:if test="${i.department_id == 300}">
								구매과
							</c:if>
							<c:if test="${i.department_id == 400}">
								영업과
							</c:if>
							<c:if test="${i.department_id == 500}">
								물류과
							</c:if>
							<c:if test="${i.department_id < 100}">
								기타부서
							</c:if>
							<c:if test="${i.department_id > 500}">
								기타부서
							</c:if>
						</td>
						<td>${i.re_type}</td>
						<td>${i.re_memo}</td>
						<td>${i.expenses}</td>
						<td>
							<fmt:formatDate pattern="yyyy- MM-dd hh:mm" value="${i.begin_date}" />
						</td>
						<c:if test="${i.end_date == null}">
							<td>
								-
							</td>
						</c:if>
						<c:if test="${i.end_date != null}">
							<td class="text-success">
								<fmt:formatDate pattern="yyyy- MM-dd hh:mm" value="${i.end_date}" />
							</td>
						</c:if>
						<td>
							<c:if test="${i.re_status eq '신청'}">
								<label class="badge badge-danger">
									승인대기
								</label>
							</c:if>
							<c:if test="${i.re_status eq '승인'}">
								<label class="badge badge-info">
									승인완료
								</label>
							</c:if>
							<c:if test="${i.re_status eq '보류'}">
								<label class="badge badge-warning">
									승인보류
								</label>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		<%-- <img src="${path}/resources/image/finance/회계관리_2-일반전표조회.PNG" width=1500px/>
		<button type="button" class="btn btn-outline-warning" id="expenditure_request_detail">지출요청 상세</button>
		<button type="button" class="btn btn-outline-warning" id="expenditure_resolution_list">지출결의서 목록</button> --%>
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

