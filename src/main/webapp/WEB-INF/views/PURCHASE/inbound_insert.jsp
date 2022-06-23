<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>입고 요청</title>
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
</script>

 <div class="main-panel">
        <div class="content-wrapper">
        <div class="d-flex flex-row align-items-center">
          <i class="mdi mdi-note-plus-outline icon-lg  text-twitter me-2"></i>
            <h2 style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;  padding: 2% 0;">
                 구매관리
           </h2>
       </div>
          <div class="row col-lg-11">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">창고 목록</h3>
                  <div class="d-sm-flex justify-content-between mb-4">
                     <p class="card-description">
                      		  입고요청 창고선택
                     </p>
                     <div id="input-form">
                     <div class="d-sm-flex">          
              </div>
              </div>
              </div>
            <form class="forms-sample" name= "joinform" method="post" action="inbound_insert_action.sc?${_csrf.parameterName}=${_csrf.token}">
            <div id="result">
              <div class="form-group">
				   <table class="table table-hover" >
				   		<tr>
				   			<td>상품명</td>
				   			<td>수량</td>
				   		</tr>
						<c:forEach var="dto" items="${list }">		   		
				   		<tr>
				   			<td>${dto.pr_name }
				   			<input type="hidden" name="request_id" value="${dto.request_id }">
				   			</td>
				   			<td>${dto.re_qty }</td>
				   		</tr>
				   		</c:forEach>	
				   </table>
				   
				   <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;창고선택</label>
	              <select class="js-example-basic-single form-control" name="wh_id" required>
	   					<c:forEach var="dtow" items="${listw }">
	   						<option value="${dtow.wh_id }">${dtow.wa_name }</option>
	   					</c:forEach>
	  	   			</select>
	  	   			<br><br>
	  	   			<div class="d-flex justify-content-end mt-3 mb-3">
				   	<button type="submit" class="btn btn-rounded btn-outline-twitter btn-fw" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">등록</button>
				   </div>
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
