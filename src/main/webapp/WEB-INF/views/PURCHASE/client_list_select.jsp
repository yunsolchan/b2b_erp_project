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
	
	// 거래처 목록의 버튼을 클릭했을 떄 실행된다
	$("#client_list2 li").click(function(){
		
		// 누른 버튼의 부모 즉 ul을 가져온다
		var ul = $(this).parent();
		
		// 그 ul의 자식 값을 li에 담아준다
		var li = ul.children();
		
		// li에 입력된 값을 부모창의 인풋으로 값을 넘겨준다
		window.opener.document.estimate_form.client_name.value = li.eq(1).text();
		window.opener.document.estimate_form.ceo_name.value = li.eq(2).text();
		window.opener.document.estimate_form.client_email.value = li.eq(3).text();
		window.opener.document.estimate_form.zip_code.value = li.eq(4).text();
		window.opener.document.estimate_form.address.value = li.eq(5).text();
		window.opener.document.estimate_form.detail_address.value = li.eq(6).text();
		window.opener.document.estimate_form.cl_phone1.value = li.eq(7).text();
		window.opener.document.estimate_form.cl_phone2.value = li.eq(8).text();
		window.opener.document.estimate_form.cl_phone3.value = li.eq(9).text();
		window.opener.document.estimate_form.client_id.value = li.eq(10).text();
		
		// 현재 팝업창을 닫아준다
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
				   			<td>거래처명</td>
				   			<td>대표자명</td>
				   			<td>선택</td>
				   		</tr>
						<c:forEach var="dto" items="${list }">		   		
				   		<tr>
				   			<td>${dto.cl_name }</td>
				   			<td>${dto.ceo_name }</td>
				   			<td>
				   				<ul>
				   					<!-- db에서 받아온 정보를 li에 담아준다 -->
				   					<li><button type="button" class="btn btn-primary me-2" class="client_list">선택</button></li>
				   					<li>${dto.cl_name }</li>
				   					<li>${dto.ceo_name }</li>
				   					<li>${dto.cl_email }</li>
				   					<li>${dto.cl_zip_code }</li>
				   					<li>${dto.cl_address }</li>
				   					<li>${dto.cl_detail_address }</li>
				   					<li>${fn:substring(dto.cl_phone,0,3)}</li>
				   					<li>${fn:substring(dto.cl_phone,3,7)}</li>
				   					<li>${fn:substring(dto.cl_phone,7,11)}</li>
				   					<li>${dto.client_id }</li>
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
