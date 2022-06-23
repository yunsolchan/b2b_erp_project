<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <title>financial_closing</title>
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
		$('#financial_statement').click(function(){
			window.location="${path}/financial_statement.mh";
		});
		
		$('#financial_income_statement').click(function(){
			window.location="${path}/financial_income_statement.mh";
		});
	});
	
	//변수선언 
	var areaData_labels = ${areaData_labels};
	var areaData_data= ${areaData_data};
	
	//차트 변수 설정 S
	//월별매출 (areaTable)
	var areaData = {
    labels: areaData_labels,
    datasets: [{
      label: '매출액 추이',
      data: areaData_data,
      backgroundColor: [
        'rgba(255, 99, 132, 0.2)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(255, 206, 86, 0.2)',
        'rgba(75, 192, 192, 0.2)',
        'rgba(153, 102, 255, 0.2)',
        'rgba(255, 159, 64, 0.2)'
      ],
      borderColor: [
        'rgba(255,99,132,1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(75, 192, 192, 1)',
        'rgba(153, 102, 255, 1)',
        'rgba(255, 159, 64, 1)'
      ],
      borderWidth: 1,
      fill: true, // 3: no fill
    }]
  };
	// 차트 변수 설정 E
</script>
<!-- 결산 차트(매출기준) -->
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
                  <h3 class="card-title">결산차트</h3>
                  <p class="card-description">
                   		 전체결산차트
                  </p>
				<div class="btn-group mb-3">
					<button type="button" class="btn btn-outline-primary" id="financial_statement">재무상태표</button>
					<%-- <button type="button" class="btn btn-outline-primary" id="financial_statement" onclick = "window.location='${path}/financial_statement.mh'">재무상태표</button> --%>
					<button type="button" class="btn btn-outline-primary" id="financial_income_statement">손익계산서</button>		
				</div>
				<div class="row">
					<div class="col-lg-6 grid-margin stretch-card">
		              <div class="card">
		                <div class="card-body statistics-details d-flex align-items-center justify-content-between">
		               		<div>
		               		
	                            <p class="statistics-title">매출</p>
	                            <h3 class="rate-percentage">955000</h3>
	                            <p class="text-danger d-flex"><i class="mdi mdi-menu-down"></i><span>-0.5%</span></p>
	                          </div>
	                          <div>
	                            <p class="statistics-title">비용</p>
	                            <h3 class="rate-percentage">955000</h3>
	                            <p class="text-danger d-flex"><i class="mdi mdi-menu-down"></i><span>-0.5%</span></p>
	                          </div>
	                         <!-- <div>
	                             <p class="statistics-title"></p>
	                            <h3 class="rate-percentage"></h3>
	                            <p class="text-success d-flex"><i class="mdi mdi-menu-up"></i><span></span></p>
	                          </div> -->
	                          <div>
	                            <p class="statistics-title">거래처 증감</p>
	                            <h3 class="rate-percentage">13</h3>
	                            <p class="text-danger d-flex"><i class="mdi mdi-menu-down"></i><span>6</span></p>
	                          </div>
	                          <div>
	                            <p class="statistics-title">당기순이익</p>
	                            <h3 class="rate-percentage">13000</h3>
	                            <p class="text-success d-flex"><i class="mdi mdi-menu-up"></i><span>6</span></p>
	                          </div>
		               	</div>
		               </div>
		            </div>
					<div class="col-lg-6 grid-margin stretch-card">
		              <div class="card">
		              	<div class="card-body">
		              		<!-- <button type="button" class="btn btn-outline-primary btn-sm mb-5" id="financial_statement">재무상태표</button> -->
		                	<h4 class="text-center mb-3" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">월별 매출</h4>
		                  	<canvas id="areaChart"></canvas>
		                </div>
		              </div>
		            </div>
		        </div>
		        <div class="row">
		          <div class="col-lg-6 grid-margin stretch-card">
		              <div class="card">
		                <div class="card-body">
		                	<h4 class="text-center mb-3" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">거래처별 매출</h4>
		                  <canvas id="barChart"></canvas>
		                </div>
		              </div>
		            </div>
		          <div class="col-lg-6 grid-margin grid-margin-lg-0 stretch-card">
		              <div class="card">
		                <div class="card-body">
		                  <h4 class="text-center mb-3" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">품목별 매출</h4>
		                  <canvas id="pieChart"></canvas>
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
    </div>
  </div>
  <!-- container-scroller -->
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
  <script src="/team_one/resources/css/js/chart.js"></script>
  <!-- End custom js for this page-->
</body>

</html>