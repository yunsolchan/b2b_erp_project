<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>bank_update</title>
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
  </style>
</head>
<body>
<!-- 계좌 수정 화면 -->
<div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">계좌정보 수정</h3>
                  <p class="card-description">
                   		 계좌정보 입력
                  </p>
                  <div class="card">
          <div class="card-body">
          
            <form class="forms-sample" name= "bankform" method="post" action="bank_update_action.mh?${_csrf.parameterName}=${_csrf.token}">
            <div id="result">
	          <!-- 계좌번호 -->  
              <div class="form-group text-linkedin fw=bold">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;계좌번호</label>
                <div class="input-group">
                	<input type="text" class="form-control" id="exampleInputName1" value="${bank_detail.account_number}" disabled/>
              		<input type="hidden" name="account_number" value="${bank_detail.account_number}">
              	</div>
              </div>
              
              <!-- 은행 -->  
              <div class="form-group text-linkedin fw=bold">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;은행명</label>
                <input type="text" class="form-control" id="exampleInputName1" value="${bank_detail.bank}" disabled/>
              	<input type="hidden" name="bank" value="${bank_detail.bank}">
              </div>
              
              <!-- 예금주 -->  
              <div class="form-group text-linkedin fw=bold">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;예금주</label>
                <input type="text" class="form-control" id="exampleInputName1" value="${bank_detail.ac_name}" disabled/>
              	<input type="hidden" name="name" value="${bank_detail.ac_name}">
              </div>
              
              <!-- 송금비밀번호 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;송금 비밀번호 변경</label>
                <input type="password" class="form-control" id="exampleInputName1" name="bank_password" placeholder="송금 비밀번호를 입력해주세요!" required/>
              </div>
              
              <!-- 계좌메모 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;계좌메모 변경</label>
                <input type="text" class="form-control" id="exampleInputName1" name="purpose" placeholder="계좌 사용 용도를 입력해주세요!" value="${bank_detail.purpose}" required />
              </div>
              
              <!-- 초기 잔액 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;변경 잔액</label>
                <input type="number" class="form-control" id="exampleInputName1" name="balance" placeholder="계좌의 변경 잔액을 입력해주세요!" value="${bank_detail.balance}" required />
              </div>
              
              <!-- 계좌명 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;계좌명</label>
                <input type="text" class="form-control" id="exampleInputName1" name="account_name" placeholder="ex) 급여계좌" value="${bank_detail.account_name}" required />
              </div>
              
              <!-- 사용여부 -->
            <div class="form-group">
              <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;사용여부</label>
              <select class="js-example-basic-single form-control" name="account_enable" required>
                <option value="Y">활성화</option>
                <option value="N">비활성화</option>
                <option value="A">자주사용</option>
              </select>
            </div>
              
              <button type="submit" class="btn btn-primary me-3" style="width:45%">변경</button>
              <button type="reset" class="btn btn-light" style="width:45%">초기화</button>
            </div>
            </form>
          </div>
        </div>
		<%-- <img src="${path}/resources/image/finance/스크린샷 2022-04-15 오후 4.29.00.png" width=1500px/>
		<button type="button" class="btn btn-outline-warning" id="bank_update_action">계좌정보 수정처리</button>
		<button type="button" class="btn btn-outline-warning" id="bank_list">계좌 관리 매뉴진입</button> --%>
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

