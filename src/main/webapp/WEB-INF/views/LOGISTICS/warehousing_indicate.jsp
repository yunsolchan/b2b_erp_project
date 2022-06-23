<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>입고처리 </title>
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
  <link rel="stylesheet" href="/team_one/resources/css/vendors/select2/select2.min.css">
  <link rel="stylesheet" href="/team_one/resources/css/vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/team_one/resources/css/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/team_one/resources/css/images/favicon.png" />
</head>
<body>
<script>
    $(document).ready(function () {
        $(".form-control").select2();
    });
</script>
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">입고/입하</h3>
                  <p class="card-description">
                   		 입고처리
                  </p>
                  <form name="warehousing_indicate_form" action="${path}/warehousing_indicate_action.dh" method="post"> 
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                  <input type="hidden" name="request_id" value="${param.request_id}">
                  <input type="hidden" name="inbound_id" value="${param.inbound_id}">
	                  <div class="table-responsive">
	                    <table class="table table-hover" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
	                      <thead>
	                        <tr class="table-secondary">
	                          <th>품명</th>
	                          <th>입고수량</th>
	                          <th>location</th>
	                        </tr>
	                      </thead>
	                      <tbody>
	                      	<c:forEach var="product" items="${list}">
	                        <tr>
	                          <td>${product.pr_name} <input type="hidden" name="product_id" value="${product.product_id}"> </td>
	                          <td>${product.re_qty} <input type="hidden" name="qty" value="${product.re_qty}"></td>
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
	                        </c:forEach>
	                      </tbody>
	                    </table>
	                    <div class="d-flex justify-content-end mt-3 mb-3">
		                  <button type="submit" class="btn btn-rounded btn-outline-twitter btn-fw" id="login" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
		                    	입고처리
		                    	<!-- width같은 스타일 주고싶으면 꼭 %로 줘야함 -->
		                    	<!-- style="width: 100%" -->
		                  </button>
		                </div>
				   </div>
			   </form>
			</div>              
          </div>
  <script src="/team_one/resources/css/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="/team_one/resources/css/vendors/chart.js/Chart.min.js"></script>
  <script src="/team_one/resources/css/vendors/select2/select2.min.js"></script>
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

