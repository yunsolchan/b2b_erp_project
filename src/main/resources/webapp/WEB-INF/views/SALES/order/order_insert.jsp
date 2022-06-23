<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>order_insert</title>
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
  
  <style type="text/css">
  	h2 { text-align: center; padding: 2% 0;}
  </style>
<script src="https://unpkg.com/vue@2.6.6/dist/vue.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
/** 우편번호 찾기 */
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
  <div class="container-scroller"> 
  <!-- 헤더 -->
  <%@ include file="/WEB-INF/views/header.jsp" %>
  
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
    <!-- 레프트메뉴 -->
      <%@ include file="/WEB-INF/views/leftMenu.jsp" %>
      
		<div class="card">
          <div class="card-body">
            <h4 class="card-title">주문서 등록</h4>
            
            <p class="card-description">주문서 등록</p>
            <form class="forms-sample" name= "joinform" method="post" enctype="Multipart/form-data" action="accountAdd.test?${_csrf.parameterName}=${_csrf.token}">
            <div id="result">

	          <!-- 이름 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;거래처명</label>
                <input type="text" class="form-control" id="exampleInputName1" name="name" required />
              </div>
              
	          <!-- 이름 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;대표자</label>
                <input type="text" class="form-control" id="exampleInputName1" name="name" required />
              </div>   
              
              <!-- 이메일 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;거래처 이메일</label>
                <input type="email" class="form-control" id="exampleInputName1" name="email" required />
              </div>
              
              <!-- 우편번호 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;우편번호</label>
                	<div class="col-sm-2 row" style="flex-wrap: nowrap; padding-left: 1%;">
		                <input type="text" class="form-control" id="zip_code" name="zip_code" required readonly />
		                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                <div style="width:20%">
		                <button type="button" onclick="execDaumPostcode()" class="button btn btn-secondary"><i class="icon-search"></i></button>
		                </div>
              		</div>
              </div>
              
              <!-- 주소 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;거래처 주소</label>
                <input type="text" class="form-control" size="auto" id="address" name="address" required />
              </div>
              
              <!-- 상세주소 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;상세주소</label>
                <input type="text" class="form-control" size="auto" id="detail_address" name="detail_address" required />
              </div>
              
	           <!-- 권한 -->
	           <div class="form-group">
	             <label><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;구분</label>
	             <select class="js-example-basic-single form-control" name="authority" required>
	               <option value="">법인</option>
	               <option value="">회계업무</option>
	               <option value="">영업/구매/물류업무</option>
	             </select>
	           </div>                 
              
              <!-- 연락처 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;거래처 연락처</label>
                <div class="col-sm-3 row" style="flex-wrap: nowrap; padding-left: 1%;">
	                <input type="text" class="form-control" size="3" name="phone1" required /> 
	       			&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
	          		<input type="text" class="form-control" size="4" name="phone2" required />
	          		&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
	          		<input type="text" class="form-control" size="4" name="phone3" required />
          		</div>
              </div>               
              
	          <!-- 이름 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;담당자</label>
                <input type="text" class="form-control" id="exampleInputName1" name="name" required />
              </div>              
              
              <!-- 연락처 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;담당자 연락처</label>
                <div class="col-sm-3 row" style="flex-wrap: nowrap; padding-left: 1%;">
	                <input type="text" class="form-control" size="3" name="phone1" required /> 
	       			&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
	          		<input type="text" class="form-control" size="4" name="phone2" required />
	          		&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
	          		<input type="text" class="form-control" size="4" name="phone3" required />
          		</div>
              </div>
              
	           <!-- 권한 -->
	           <div class="form-group">
	             <label><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;담당자 부서</label>
	             <select class="js-example-basic-single form-control" name="authority" required>
	               <option value="">법인</option>
	               <option value="">회계업무</option>
	               <option value="">영업/구매/물류업무</option>
	             </select>
	           </div>
	           
              <!-- 이메일 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;담당자 이메일</label>
                <input type="email" class="form-control" id="exampleInputName1" name="email" required />
              </div>	                    
	            
              <button type="submit" class="btn btn-primary me-2">Submit</button>
              <button class="btn btn-light">Cancel</button>
              
            </div>
            
	   		<script>
			  var uploadApp = new Vue({
			    el: '#result',
			    data: {
			      fileList: []
			    }
			  })
			  $("#uploadFile").change(function(event){
			    console.log($(this)[0].files);
			    var files = $(this)[0].files;
			    uploadApp.fileList = [];
			    $.each(files, function(i, item){
			      var fileReader = new FileReader();
			      fileReader.onload = function(e){
			        var img = {
			          url: e.target.result,
			          name: item.name,
			          size: item.size
			        };
			        uploadApp.fileList.push(img);
			      }
			      fileReader.readAsDataURL(item);
			    });
			  });
			</script>
			
            </form>
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
