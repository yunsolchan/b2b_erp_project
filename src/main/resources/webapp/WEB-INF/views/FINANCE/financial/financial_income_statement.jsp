<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>financial_income_statement</title>
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
		$("#financial_income_statement").click(function(){
			window.location="${path}/financial_income_statement.mh";
		});
		
	});
</script>
<!-- 손익계산서 -->
	<div class="content">
		<img src="${path}/resources/image/finance/회계관리_11-손익계산서.PNG" width=1500px/>
		<button type="button" class="btn btn-outline-warning" id="financial_income_statement">1월</button>	
		<button type="button" class="btn btn-outline-warning" id="financial_income_statement">2월</button>	
		<button type="button" class="btn btn-outline-warning" id="financial_income_statement">3월</button>	
		<button type="button" class="btn btn-outline-warning" id="financial_income_statement">4월</button>	
		<button type="button" class="btn btn-outline-warning" id="financial_income_statement">5월</button>	
		<div style="border: 1px solid black">
			<pre>
				당월이 기준이 되어야한다.
				월별 데이터가 있을경우, 버튼을 리스트로 만들어서 보여준다
				리스트로 출력한 버튼을 통해 각 월별 손익계산서를 열람 및 출력할 수 있도록한다.
				=> 회계 연산들어가야하는 부분
				매출 - 매출원가 = 매출총이익
				판매 / 일반관리비 => 급여 + 비용
				영업손익, 영업외비용, 이자비용 
				=== 당기순이익
				
				SQL : select client
				
				매출액			총 포괄매출액
					상품매출(R)
				매출원가
					기초상품재고액
					당기상품매입액
					+
								기말상품재고액
								-
				매출총이익
				
				판매비 / 관리비
				비용계정별 합계금
					직원급여
					복리후생비
					여비/교통비
					접대비
					통신비
					수도광열비
					사무용품비
					소모품비
				영업이익
								영업이익
				영업외비용
					이자비용
					기부금
				법인세비용 차감전 순이익
								이익도출
					법인세비용
				당기순이익			=>  결과도출
				
				
				
			</pre>	
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

