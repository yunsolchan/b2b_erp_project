<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>재고현황 </title>
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
<!-- <script type="text/javascript">
   $(function(){
	   $("#stock_update tr td").click(function(){
	       var click = $(this);
	       var tr = click.parent();
	       var td = tr.children();
	       
	       stock_update(td.eq(0).text());
	    });
   });
 
    // 재고조정 팝업 
    function stock_update(product_id) {
       var url = "${path}/stock_update.dh?product_id="+ product_id;
       window.open(url, "stock_update", "menubar=no, width=800px, height=700px");  // (url, "별칭", size);  
    }
</script> -->
<!-- 
<script type="text/javascript">
$(function(){
    // tr태그 클릭 시 거래처 상세페이지 접근 이벤트 생성
    $('#stock_list tr td').click(function(){
       var click = $(this);
       var tr = click.parent();
       var td = tr.children();
      var url="${path}/stock_update.dh?lack_code="+ td.eq(0).text()+"&wh_id=";
      
      window.open(url, "stock_update", "menubar=no, width=1200px, height=600px");  // (url, "별칭", size);
    });
 });
</script>
 -->
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
      <!-- partial:../../partials/_settings-panel.html -->
      
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
                   		 재고현황 - ${wh_name}
                  </p>
                   <form name="stock_list_form" action="${path}/stock_update_action.dh" method="post"> 
         		  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                  <div class="table-responsive">
                    <table class="table table-hover" id="stock_list">
                      <thead>
                        <tr>
                          <th>랙코드</th>
                          <th>상품코드</th>
                          <th>상품명</th>
                          <th>수량</th>
                         <!--  <th>입고일자</th> -->
                          <th>위치</th>
                        </tr>
                      </thead>
                      <tbody>
                       <c:forEach var="stock" items="${list}">
                        <tr onclick="window.open('${path}/stock_update.dh?lack_code=${stock.lack_code}&wh_id=${param.wh_id }', 'stock_update', 'menubar=no, width=1200px, height=600px');">
                          <td>${stock.lack_code}</td>
                          <td>${stock.product_id}</td>
                          <td id="stock_update" style="cursor:pointer">${stock.pr_name}</td>
                          <td>${stock.la_qty}</td>
                          <%-- <td>${stock.inbound_date}</td> --%>
                          <td>${stock.location}</td>
                        </tr>
                        </c:forEach>
                      </tbody>
                    </table>
					</div>
					</form>    
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
      </div>
      <!-- main-panel ends -->
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

