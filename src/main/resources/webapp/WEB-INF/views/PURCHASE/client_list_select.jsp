<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
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
	$("#client_list2 li").click(function(){
		
		var ul = $(this).parent();
		var li = ul.children();
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
		
		self.close();    
	});
});
</script>

<div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">거래처 목록</h3>
                  <p class="card-description">
                         거래처 목록 선택
                  </p>
                  <div class="card">
          <div class="card-body">
            <form class="forms-sample" name= "joinform" method="post" enctype="Multipart/form-data" action="client_insert_action.sc?${_csrf.parameterName}=${_csrf.token}">
            <div id="result">
              <div class="form-group">
				   <table class="table table-hover" id="client_list2">
				   		<tr>
				   			<td><div class="dropdown">
                          <button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuIconButton1" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="ti-world"></i>
                          </button>
                          <div class="dropdown-menu" aria-labelledby="dropdownMenuIconButton1" style="">
                            <h6 class="dropdown-header">Settings</h6>
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                          </div>
                        </div></td>
				   			<td>거래처주인 ${dto.cl_email }</td>
				   			<td>선택</td>
				   		</tr>
						<c:forEach var="dto" items="${list }">		   		
				   		<tr>
				   			<td>${dto.cl_name }</td>
				   			<td>${dto.ceo_name }</td>
				   			<td>
				   				<ul>
				   					<li><button type="button" class="btn btn-primary me-2" class="client_list">선택</button></li>
				   					<li>${dto.cl_name }</li>
				   					<li>${dto.ceo_name }</li>
				   					<li>${dto.cl_email }</li>
				   					<li>${dto.cl_zip_code }</li>
				   					<li>${dto.cl_address }</li>
				   					<li>${dto.cl_detail_address }</li>
				   					<li>${fn:substring(dto.cl_phone,0,3)}</li>
				   					<li>${fn:substring(dto.cl_phone,3,6)}</li>
				   					<li>${fn:substring(dto.cl_phone,6,9)}</li>
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
