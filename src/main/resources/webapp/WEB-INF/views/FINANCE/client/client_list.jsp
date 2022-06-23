<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <title>client_list</title>
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
		// tr태그 클릭 시 거래처 상세페이지 접근 이벤트 생성
		$('#client_list tr td').click(function(){
			var click = $(this);
			var tr = click.parent();
			var td = tr.children();
			// var tr = $(this);	// 현재 클릭한 tr
			// var td = tr.children();	// 클릭한 tr의 요소(td)
			/*
			var tdArr = new Array();	// 클릭한 tr의 요소를 담을 배열선언
			
			// tdArr에 값 입력
			td.each(function(i){
				tdArr.push(td.eq(i).text());
			});
			*/
			window.location="${path}/client_transaction.mh?client_id="+ td.eq(0).text();
			
			// var client_id = td.eq(0).text();
			// client_transaction(client_id);
		});
		
		
	/* function client_transaction(client_id){
		$.ajax({
			type: "post",
			url: "${path}/client_transaction.mh?${_csrf.parameterName}=${_csrf.token}&client_id=" + client_id,
			success: function(result){	
				$('#client_transaction').html(result);
			},
			error: function(){
				alert("table ajax 오류");
			}
		});
	} */
		/* $("#client_transaction").click(function(){
			window.location="${path}/client_transaction.mh";
		}); */
	});
</script>
<!-- 거래처거래내역 리스트 -->
	<!-- <div class="content"> -->
	<div class="main-panel">
        <div class="content-wrapper">
        <div class="d-flex flex-row align-items-center">
	      <i class="menu-icon mdi mdi-chart-line icon-lg text-linkedin"></i>
	      	<h2 style="font-family: inherit; padding: 2% 0;">
	                    회계관리
	        </h2>
	    </div>
	<div class="row col-lg-11">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">거래처목록</h3>
                  <p class="card-description">
                   		전체 거래처 목록
                  </p>
                  <div class="table-responsive">
		<table id="client_list" class="table table-hover" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">
			<thead>
				<tr>
					<th>거래처코드</th>
					<th>거래처유형</th>
					<th>거래처명</th>
					<th>대표자</th>
					<th>사업자등록번호</th>
					<th>주소지</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" items="${client_list}">
					<tr>
						<td>${i.client_id}</td>
						<td>
						<label class="badge badge-success">
							${i.cl_type}
						</label>
						</td>
						<td>${i.cl_name}</td>
						<td>${i.ceo_name}</td>
						<td>${i.register_num}</td>
						<td>${i.cl_address}</td>
						<td>${i.cl_phone}</td>
						<td>${i.cl_email}</td>
						<td>
							<c:set var="register_date" value="${i.cl_register_date}"/>
							${fn:substring(register_date, 0, 10)}
							<%-- <fmt:formatDate pattern="yyyy- MM-dd hh:mm" value="${i.cl_register_date}" /> --%>
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

