<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>창고등록  </title>
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

<style type="text/css">
     h2 { text-align: center; padding: 2% 0;}
     
     input::-webkit-inner-spin-button{
       display: none;
   }
  </style>
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
                  <h3 class="card-title">창고정보</h3>
                  <p class="card-description">
                   		 창고등록
                  </p>
         <div class="card">
          <div class="card-body">
         <form name="warehouse_insert_form" action="${path}/warehouse_insert_action.dh?${_csrf.parameterName}=${_csrf.token}" method="post" onsubmit="return ();"> 
        
        	<!-- 창고 코드 -->  
  		    <div class="form-group" style="width:30%">
              <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;창고번호</label>
              <input type="number" class="form-control" id="exampleInputName1" name="wh_id" required />
            </div>
            
          <!-- 창고명 -->  
  		    <div class="form-group" style="width:30%">
              <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;창고명</label>
              <input type="text" class="form-control" id="exampleInputName1" name="wa_name" required />
            </div>

            <div class="form-group" style="width:50%">
              <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;우편번호</label>
              	<div class="input-group" style="flex-wrap: nowrap; padding-left: 1%;">
		                <input type="text" class="form-control" size="30" id="zip_code" name="wa_zip_code" required/>
		                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                <div>
		                <button  type="button" onclick="execDaumPostcode()" class="button btn btn-primary btn-sm"><i class="icon-search"></i></button>
               		</div>
        		</div>
            </div>
            
             <!-- 주소 -->  
            <div class="form-group" style="width:70%">
              <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;주소</label>
              <input type="text" class="form-control" size="auto" id="address" name="wa_address" required />
            </div>
            
            <!-- 상세주소 -->  
            <div class="form-group" style="width:70%">
              <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;상세주소</label>
              <input type="text" class="form-control" size="auto" id="detail_address" name="wa_detail_address" />
            </div>  
             
             <!-- 랙 등록 -->  
  		    <div class="form-group" style="width:40%">
  		    <table>
  		    <tr>
              <th><label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;랙등록</label></th>
     		<tr>
            <td>가로<input type="number" class="form-control" id="exampleInputName1" name="weight" required /></td>
            <td>세로<input type="number" class="form-control" id="exampleInputName1" name="length" required /></td>
            <td>높이<input type="number" class="form-control" id="exampleInputName1" name="height" required /></td>
            </tr>
          
            <!-- 용적-->
             <tr>  
              <td><label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;용적</label>
              <input type="number" class="form-control" name="volume" required /></td>
              </tr>
            </table>
            </div>   
          <button type="submit" class="btn btn-outline-primary btn-fw" id="login">
			                    	등록완료
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

