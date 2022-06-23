<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>client_product_list</title>
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
  <style type="text/css">
     h2 { text-align: center; padding: 2% 0;}
     
     input::-webkit-inner-spin-button{
       display: none;
       }
     ul{
		   list-style:none;
		   padding-left:0px;
		   margin: 0px;
		   font-size: 0px;
	   }
  </style>
</head>
<body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
$(function(){
	$("#product_list2 li").on("click", function(){
		var ul = $(this).parent();
		var li = ul.children();
		
		var name = li.eq(1).text();
		var cost = li.eq(2).text();
		var qty = li.eq(3).text();
		var id = li.eq(4).text();
		   window.opener.rowAdd(name, cost, qty, id);
		   self.close();
	});
});
</script>

<div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">상품 목록</h3>
                  <p class="card-description">
                         거래처 주문상품 목록 선택
                  </p>                  
                  <div class="card">
          <div class="card-body">
            <form class="forms-sample" name= "joinform" method="post" action="estimate_insert_action.test?${_csrf.parameterName}=${_csrf.token}">
            <div id="result">
              <div class="form-group">
				   <table class="table table-hover" id="product_list2">
				   		<tr>
				   			<td>상품명</td>
				   			<td>카테고리</td>
				   			<td>상품단가</td>
				   			<td>재고수량</td>
				   			<td>선택</td>
				   		</tr>
						<c:forEach var="dto" items="${list }">		   		
				   		<tr>
				   			<td>${dto.pr_name }</td>
				   			<td>${dto.category }</td>
				   			<td>${dto.cost }</td>
				   			<c:if test="${dto.la_qty <= 0 }">
		   					<td>0</td>
		   					</c:if>
		   					<c:if test="${dto.la_qty > 0 }">
		   					<td>${dto.la_qty }</td>
		   					</c:if>
				   			<td>
				   				<ul>
				   					<c:if test="${dto.la_qty <= 0 }">
				   					<li><label class="badge badge-dark">재고없음</label></li>
				   					</c:if>
				   					<c:if test="${dto.la_qty > 0 }">
				   					<li class="product_insert" ><button type="button" class="btn btn-primary me-2" class="product_list">선택</button></li>
				   					</c:if>
				   					<li>${dto.pr_name }</li>
				   					<li>${dto.cost }</li>
				   					<li>${dto.la_qty }</li>
				   					<li>${dto.product_id }</li>
				   				</ul>
				   			</td>
				   		</tr>
				   		</c:forEach>	
				   </table>
				
			  </div>
			</div>         
            </form>
          </div>
        </div>
   </div>
   </div>
    </div>
       <%@ include file="/WEB-INF/views/MENU/footer.jsp" %>
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
