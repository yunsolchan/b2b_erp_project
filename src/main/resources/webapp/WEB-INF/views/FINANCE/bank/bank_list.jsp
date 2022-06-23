<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>bank_list</title>
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
		$("#bank_insert").click(function(){
			bank_insert();
		});
	});
	
    // 계좌등록 팝업 
    function bank_insert() {
       var url = "${path}/bank_insert.mh";
       window.open(url, "bank_insert", "menubar=no, width=500px, height=700px");  // (url, "별칭", size);  
    }
	$(function(){
		// tr태그 클릭 시 거래처 상세페이지 접근 이벤트 생성
		$('#bank_list tr td').click(function(){
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
			
			window.location="${path}/bank_detail.mh?account_number="+ td.eq(3).text();
		});
	});
</script>
<!-- 계좌관리 목록 -->
<%-- 
		<img src="${path}/resources/image/finance/스크린샷 2022-04-15 오후 4.28.49.png" width=1500px/>
		<button type="button" class="btn btn-outline-warning" id="bank_insert">신규 출금계좌등록</button>
		<button type="button" class="btn btn-outline-warning" id="bank_transfer_list">계좌 거래내역</button>
		<button type="button" class="btn btn-outline-warning" id="bank_update">계좌 수정버튼</button>
 --%>		
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
                  <h3 class="card-title">계좌관리</h3>
                  <div class="d-sm-flex justify-content-between mb-4">
	                  <p class="card-description">
	                   		출금 계좌목록
	                  </p>
                  	  <button type="button" class="btn btn-outline-primary me-3" id="bank_insert">신규 계좌등록</button>
                  </div>
                  <div class="table-responsive">
		<table id="bank_list" class="table table-hover" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">
			<thead>
				<tr>
					<th>사용여부</th>
					<th>계좌명</th>
					<th>은행</th>
					<th>계좌번호</th>
					<th>잔액</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" items="${bank_list}">
					<tr>
						<td>
							<c:if test="${fn:contains(i.ac_enable, 'Y')}">
								<label class="badge badge-info">
									<i class="mdi mdi-check"></i>
								</label>
							</c:if>
							<c:if test="${fn:contains(i.ac_enable, 'N')}">
								<label class="badge badge-danger">
									<i class="mdi mdi-window-close"></i>
								</label>
							</c:if>
							<c:if test="${fn:contains(i.ac_enable, 'A')}">
								<label class="badge badge-warning">
									<i class="mdi mdi-star"></i>
								</label>
							</c:if>
						</td>
						<td>${i.ac_name}</td>
						<td>${i.bank}</td>
						<td>${i.account_number}</td>
						<c:if test="${i.balance >= 0}">
							<td class="text-success">
								<i class="mdi mdi-plus"></i>
								${i.balance}
							</td>
						</c:if>
						<c:if test="${i.balance < 0}">
							<td class="text-danger">
								<i class="mdi mdi-minus"></i>
								<c:set var="balance" value="${i.balance}"/>
								${fn:substring(balance, 1, 9999999999999)}
							</td>
						</c:if>
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

