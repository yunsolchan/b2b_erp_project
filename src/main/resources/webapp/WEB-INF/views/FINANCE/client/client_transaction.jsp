<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <title>client_transaction</title>
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
		// tr태그 클릭 시 거래처 상세페이지 접근 이벤트 생성
		$('#client_list tr td').click(function(){
			var click = $(this);
			var tr = click.parent();
			var td = tr.children();
			/*
			var tdArr = new Array();	// 클릭한 tr의 요소를 담을 배열선언
			
			// tdArr에 값 입력
			td.each(function(i){
				tdArr.push(td.eq(i).text());
			});
			*/
			window.location="${path}/purchase_detail.mh?sale_slip_id="+ td.eq(0).text();
		});
		
		/* $("#client_transaction").click(function(){
			window.location="${path}/client_transaction.mh";
		}); */
	});
	$(function(){
		$("#client_list").click(function(){
			window.location="${path}/client_list.mh";
		});
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

<!-- 거래처거래내역 리스트 -->
	<div class="main-panel">
        <div class="content-wrapper">
        <div class="d-flex flex-row align-items-center">
	      <i class="menu-icon mdi mdi-chart-line icon-lg text-linkedin"></i>
	      	<h2 style="font-family: inherit; padding: 2% 0;">
	                    회계관리
	        </h2>
	    </div>
	<div class="row col-lg-10">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">거래처 목록</h3>
                   	<p class="card-description">
                   		거래처 거래목록
                    </p>
                   	<div class="dropdown">
	                   	<button class="btn btn-primary btn-sm dropdown-toggle fw-bold" type="button" id="dropdownMenuSizeButton3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                       	${client_detail.cl_name}
	                    </button>
	                    <c:if test="${client_detail.cl_type eq '구매'}">
	                  	   <label class="badge badge-warning">
							  ${client_detail.cl_type}거래처
						   </label>
					    </c:if>
					    <c:if test="${client_detail.cl_type eq '영업'}">
	                  	   <label class="badge badge-info">
							  ${client_detail.cl_type}거래처
						   </label>
					    </c:if>
					    <c:if test="${client_detail.cl_status eq '거래중'}">
					  	   <label class="badge badge-success">
							  거래승인
						   </label>
					    </c:if>
					    <c:if test="${client_detail.cl_status eq '거래안함'}">
					  	   <label class="badge badge-danger">
							   거래보류
						   </label>
					    </c:if>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuSizeButton3" style="position: absolute; inset: auto auto 0px 0px; margin: 0px; transform: translate(0px, -32px);" data-popper-placement="bottom-start">
                        <table class="table">
                        	<thead>
	                        	<tr>
	                        		<th>사업자명</th>
	                        		<th>E-MAIL</th>
	                        		<th>연락처</th>
	                        		<th>주소지</th>
	                        		<th>사업자등록번호</th>
	                        	</tr>
                        	</thead>
                        	<tbody>
	                        	<tr class="table-light">
	                        		<td>${client_detail.ceo_name}</td>
	                        		<td>${client_detail.cl_email}</td>
	                        		<td>${client_detail.cl_phone}</td>
	                        		<td>${client_detail.cl_address}</td>
	                        		<td>${client_detail.register_num}</td>
	                        	</tr>
                        	</tbody>
                        </table>
                    </div>
                  </div>
                  
                  <div class="table-responsive">
		<table id="client_transaction" class="table table-hover mb-3" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">
			<thead>
				<tr>
					<th>전표코드</th>
					<th>거래처명</th>
					<th>거래내용</th>
					<th>금액</th>
					<th>승인일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" items="${client_transaction_list}">
					<tr>
						<td>${i.sale_slip_id}</td>
						<td>${i.cl_name}</td>
						<td>${i.sa_abstract}</td>
						<!-- core태그로 if체크 -->
						<c:if test="${i.sa_type eq '매출'}">
							<td class="text-success">
								${i.supply_amount}
								<i class="ti-arrow-up"></i>
							</td>
						</c:if>
						<c:if test="${i.sa_type eq '매입'}">
							<td class="text-danger">
								${i.supply_amount}
								<i class="ti-arrow-down"></i>
							</td>
						</c:if>
						<td>
							<c:if test="${update_date != null}">
								<label class="badge badge-linkedin">
									${i.update_date}
								</label>
							</c:if>
							<c:if test="${update_date == null}">
								<label class="badge badge-warning">
									승인대기
								</label>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="d-sm-flex justify-content-end">
        	<button type="button" class="btn btn-outline-primary btn-md me-1" id="client_list"><i class="mdi mdi-format-list-bulleted"></i></button>
        </div>
	</div>
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

