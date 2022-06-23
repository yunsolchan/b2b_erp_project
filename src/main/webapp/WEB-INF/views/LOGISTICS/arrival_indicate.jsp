<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>입하지시 </title>
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
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">입하/입고</h3>
                  <p class="card-description">
                   		 입하지시서
                  </p> 
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                  <div class="table-responsive">
                    <table class="table table-bordered" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
			          <thead>
			            <tr>
			              <th colspan="6" class="th1 table-secondary" style="text-align:center">입하요청서</th>
			            </tr>
			          </thead>
			          
			          <tbody>
			          
			            <tr>
			              <th class="table-light" rowspan="5" width="5%" style="border:1px">입고창고정보</th>
			              <th class="right" rowspan="5" >
			              	창고명 : ${dto.wa_name}<br><br>
			              	우편번호 : ${dto.wa_zip_code} <br><br>
			              	주소  : ${dto.wa_address}<br><br>
			              	상세주소 : ${dto.wa_detail_address} <br><br>
			              </th>
			              <td class="table-light">주문번호</td>
			              <td class="right">${dto.inbound_id}</td>
			              <th class="table-light" rowspan="5" width="5%" style="border:1px">거래처정보</th>
			              <th class="right" rowspan="5" >
			              	거래처명 : ${dto.cl_name}<br><br>
			              	사업자 번호 : ${dto.register_num}<br><br>
			              	연락처 : ${dto.cl_phone}<br><br>
			              	주소 : ${dto.cl_address}<br><br>
			              	대표자명 : ${dto.ceo_name}
			              </th>
			            </tr>
			            
			            <tr>
			              <td class="table-light">주문 일자</td>
			              <td class="right"><fmt:formatDate value="${dto.begin_date}" pattern="yyyy-MM-dd" /></td>
			            </tr>
			            
			            <tr>
			              <td class="table-light">입고예정일</td>
			              <td class="right"><fmt:formatDate value="${dto.inbound_date}" pattern="yyyy-MM-dd" /></td>
			            </tr>
			            
			            <tr>
			              <td class="table-light">담당자</td>
			              <td class="right">${dto.em_name}</td>
			            </tr>
			            
			            <tr>
			              <td class="table-light">담당자 연락처</td>
			              <td class="right">${dto.em_phone}</td>
			            </tr>
			            </tbody>
			        </table> 
			            
			        <table class="table table-bordered" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
			          <thead>
			            <tr>
			              <th colspan="6" class="th1 table-secondary" style="text-align:center">물품목록</th>
			            </tr>
			          </thead>
						<tr>
							<td class="table-light" >제품코드</td>
							<td class="table-light">제품명</td>
							<td class="table-light">카테고리</td>
							<td class="table-light">입고수량</td>
							<td class="table-light" colspan="2">적요</td>
						</tr>
						<c:forEach var="dtos" items="${list }">
						<tr>
							<td>${dtos.product_id}</td>
							<td>${dtos.pr_name }</td>
							<td>${dtos.category }</td>
							<td>${dtos.re_qty }</td>
							<td colspan="2">${dtos.re_memo }</td>
						</tr>
			            </c:forEach>
			          </tbody>
			        </table>
		             <div class="d-flex justify-content-end mt-3 mb-3 me-2">
		                <button type="button" class="btn btn-rounded btn-outline-twitter btn-fw" onclick="window.location='arrival_indicate_action.dh?request_id=${dto.request_id}'" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold; width: 150px">
			              	입하확인
		         		</button>
		         	</div>
					         </div>
					      </div>	  
					   </div>	   
        <!-- content-wrapper ends -->
      <!-- main-panel ends -->
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

