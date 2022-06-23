<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
		<div class="main-panel">
        <div class="content-wrapper">
        <div class="d-flex flex-row align-items-center">
	      <i class="menu-icon mdi mdi-codepen icon-lg text-primary"></i>
	      	<h2 style="font-family: inherit;4">
	                           물류관리
	        </h2>
	    </div>
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">재고정보</h3>
                  <p class="card-description">
                   		 재고조정
                  </p>
                  <div class="card">
          		 <div class="card-body">
                  <form name="stock_update_form" action="${path}/stock_update_action.dh" method="post" onsubmit="return signInCheck();"> 
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                  <div class="table-responsive">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                       	  <th>재고번호</th>
                          <th>상품명</th>
                          <th>랙번호</th>
                          <th>수량</th>
                          <th>기존저장위치</th>
                          <th>이동 할 위치</th>
                          <!-- <th>입고날짜</th> -->
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>${dto.product_id}  <input type="hidden" name="product_id" value="${dto.product_id }"></td>
                          <td>${dto.pr_name}</td>
                          <td>${dto.lack_code}</td>  
						  <td>기존 수량 : ${dto.la_qty}<br>변경 할 수량  <input type="number" id="la_qty" name="la_qty" size="5" value="${dto.la_qty}" placeholder="3"></td>
       					 <td>${dto.location} <input type="hidden" name="old_lack_code" value="${dto.lack_code }"></td>
       					 <td width="30%">
	                          	<select class="js-example-basic-single form-control" name="lack_code">
					              <c:forEach var="lack" items="${lack_list}">
					              	<c:if test="${lack.la_qty == 0}">
					                	<option value="${lack.lack_code}">${lack.location}(${lack.product_id}_${lack.la_qty})</option>
					              	</c:if>
					              </c:forEach>
					            </select>
	                          </td>
                        </tr>
		               </tbody>
                    </table>
                    </div>
		              <button type="submit" class="btn btn-outline-primary btn-fw" id="login">
		                	조정완료
		                	<!-- width같은 스타일 주고싶으면 꼭 %로 줘야함 -->
		                	<!-- style="width: 100%" -->
		              </button>
				     </form>  
				  </div>
				 </div>  
               </div>
             </div>
            </div>
           </div>
           </div>
           </div>
        <!-- content-wrapper ends -->
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

