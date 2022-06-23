<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>salary_specification_detail</title>
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
		$('#salary_specification_detail_list tr').click(function(){
			var tr = $(this);	// 현재 클릭한 tr
			var td = tr.children();	// 클릭한 tr의 요소(td)
			/*
			var tdArr = new Array();	// 클릭한 tr의 요소를 담을 배열선언
			
			// tdArr에 값 입력
			td.each(function(i){
				tdArr.push(td.eq(i).text());
			});
			*/
			window.location="${path}/salary_specification_detail.mh?slip_code="+ td.eq(0).text();
		});
	});
</script>
<!-- 부서별 거래명세서 목록 -->
	<div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">급여명세서 목록</h3>
                  <p class="card-description">
                   	 급여명세서 목록
                  </p>
                  <div id="salary_specification_list" class="table-responsive">
					<table id="salary_specification_detail_list" class="table table-hover" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">
						<thead>
							<tr>
								<th>지급코드</th>
								<th>지급연월</th>
								<th>부서명</th>
								<th>사원명</th>
								<th>지급합계</th>
								<th>공제합계</th>
								<th>실수령액</th>
								<th>송금일자</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>102</td>
								<td class="text-danger">2022-01</td>
								<td>인사과</td>
								<td>김친구</td>
								<td>500000000</td>
								<td>4000000</td>
								<td>80000</td>
								<td>
									<label class="badge badge-success">2022-05-01</label>
								</td>
							</tr>
							<tr>
								<td>102</td>
								<td class="text-danger">2022-01</td>
								<td>인사과</td>
								<td>김친구</td>
								<td>500000000</td>
								<td>4000000</td>
								<td>80000</td>
								<td>
									<label class="badge badge-success">2022-05-01</label>
								</td>
							</tr>
							<tr>
								<td>102</td>
								<td class="text-danger">2022-01</td>
								<td>인사과</td>
								<td>김친구</td>
								<td>500000000</td>
								<td>4000000</td>
								<td>80000</td>
								<td>
									<label class="badge badge-success">2022-05-01</label>
								</td>
							</tr>
							<tr>
								<td>102</td>
								<td class="text-danger">2022-01</td>
								<td>인사과</td>
								<td>김친구</td>
								<td>500000000</td>
								<td>4000000</td>
								<td>80000</td>
								<td>
									<label class="badge badge-success">2022-05-01</label>
								</td>
							</tr>
							<tr>
								<td>102</td>
								<td class="text-danger">2022-01</td>
								<td>인사과</td>
								<td>김친구</td>
								<td>500000000</td>
								<td>4000000</td>
								<td>80000</td>
								<td>
									<label class="badge badge-success">2022-05-01</label>
								</td>
							</tr>
							<tr>
								<td>102</td>
								<td class="text-danger">2022-01</td>
								<td>인사과</td>
								<td>김친구</td>
								<td>500000000</td>
								<td>4000000</td>
								<td>80000</td>
								<td>
									<label class="badge badge-success">2022-05-01</label>
								</td>
							</tr>
						</tbody>
					</table>
					<div style="border: 1px solid black">
			<pre>
				인사탭에서 급여지급을 완료한 부서의 급여명세서를 등록일자순으로 노출
				부서명, 사원명, 지급합계, 공제합계, 실수령액, 송금일자
				
				부서명 / 지급합계 / 공제합계 / 실수령합계액
				
				SQL :
				
				SELECT d.name 부서명
					 , SUM(t.basic_salary + (SELECT SUM(t.*)-t.taxtion_id FROM taxtion t WHERE t.taxtion_id = s.taxtion_id)
								    + (SELECT SUM(n.*)-n.non_taxtion_id FROM non_taxtion n WHERE n.non_taxtion_id = s.non_taxtion_id) 지급합계
					 , SUM((SELECT SUM(tax.*)-tax.tax_id FROM tax tax WHERE tax.tax_id = s.tax_id))) 공제합계
					 , SUM(t.basic_salary + (SELECT SUM(t.*)-t.taxtion_id FROM taxtion t WHERE t.taxtion_id = s.taxtion_id)
								    + (SELECT SUM(n.*)-n.non_taxtion_id FROM non_taxtion n WHERE n.non_taxtion_id = s.non_taxtion_id)
									- (SELECT SUM(tax.*)-tax.tax_id FROM tax tax WHERE tax.tax_id = s.tax_id)) 실수령액
			      FROM salary s, employee e, department d
			     GROUP BY d.name
			     WHERE s.employee_id = e.employee_id
		  	      AND e.department_id = d.department_id
			      AND payday IS NOT NULL 
			    ORDER BY s.payday DESC;
			</pre>	
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

