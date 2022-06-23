<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>client_insert</title>
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

   }
  </style>
  <script>
   /* 우편번호 찾기 */
   function execDaumPostcode() {
       daum.postcode.load(function(){
           new daum.Postcode({
               oncomplete: function(data) {
                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                  document.querySelector("#zip_code").value = data.zonecode;
                  document.querySelector("#address").value =  data.address;
               }
           }).open();
       });
   }
</script>
</head>
<body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
$(function(){
	
	// 선택 버튼을 누르면 실행되는 함수
	$("#client_list2 li").on("click", function(){
		// 누른 버튼의 부모 즉 ul값을 받아온다
		var ul = $(this).parent();
		
		// 그 ul의 자식 값을 li에 담아준다
		var li = ul.children();
		
		// 그 li의 값을 각 변수에 담아준다
		var name = li.eq(1).text();
		var id = li.eq(2).text();
		// 부모창의 rowAdd 함수를 호출하며 변수의 값을 넘겨준다.
		   window.opener.rowAdd(name, id);
		// 팝업창을 닫아준다.
		   self.close();
	});
});


</script>

<div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">거래처 목록</h3>
                  <div class="card">
          <div class="card-body">
            <form class="forms-sample" name= "joinform" method="post" enctype="Multipart/form-data" action="client_insert_action.sc?${_csrf.parameterName}=${_csrf.token}">
            <div id="result">
              <div class="form-group">
				   <table class="table table-hover" id="client_list2">
				   		<tr>
				   			<td>상품명</td>
				   			<td>카테고리</td>
				   			<td>선택</td>
				   		</tr>
						<c:forEach var="dto" items="${list }">		   		
				   		<tr>
				   			<td>${dto.pr_name }</td>
				   			<td>${dto.category }</td>
				   			<td>
				   				<ul>
				   					<li><button type="button" class="btn btn-primary me-2" class="client_list">선택</button></li>
				   					<li>${dto.pr_name }</li>
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
