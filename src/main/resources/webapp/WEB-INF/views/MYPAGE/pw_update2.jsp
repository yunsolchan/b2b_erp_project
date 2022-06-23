<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Star Admin2 </title>
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

</head>
<body>

<script type="text/javascript"> 
$(function(){ 
	$("#alert-success").hide(); $("#alert-danger").hide(); 
	$("input").keyup(function(){ 
		var pwd1=$("#pwd1").val(); 
		var pwd2=$("#pwd2").val(); 
		if(pwd1 != "" || pwd2 != ""){ 
			if(pwd1 == pwd2){ 
				$("#alert-success").show(); 
				$("#alert-danger").hide(); 
				$("#submit").removeAttr("disabled"); 
			}else{ 
				$("#alert-success").hide(); 
				$("#alert-danger").show(); 
				$("#submit").attr("disabled", "disabled"); 
			} 
		} 
	}); 
}); 
</script>



  <div class="container-scroller"> 
  <!-- 헤더 -->
  <%@ include file="/WEB-INF/views/MYPAGE/header.jsp" %>
    <div class="container-fluid page-body-wrapper">
    <!-- 레프트메뉴 -->
      <%@ include file="/WEB-INF/views/MYPAGE/leftMenu.jsp" %>
      
      
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-12 stretch-card">
		     <div class="card">
		       <div class="card-body">
		          <h3 class="card-title">비밀번호 변경</h3>
		         <div class="table-responsive pt-3">
		         
		         	<form action="pw_update_action.gh" method="post">
		         		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				         <table class="table table">
				         	<tr>
				         		<th colspan="2">변경하실 비밀번호를 입력해주세요.</th>
				         	</tr>
				         	<tr>
				         		<td style="width:50%">비밀번호</td>
				         		<td style="width:50%"><input type="password" name="password" id="pwd1"></td>
				         	</tr>
				         	<tr>
				         		<td>비밀번호 확인</td>
				         		<td><input type="password" name="rePassword" id="pwd2"></td>
				         	</tr>
				         	<tr>
				         		<td>
				         			<label class="badge badge-success" id="alert-success">비밀번호가 일치합니다.</label>
					     			<label class="badge badge-warning" id="alert-danger">비밀번호가 일치하지 않습니다.</label>
					     		</td>
					     		<td>
				         			<button type="submit" class="btn btn-primary btn-md">비밀번호 변경</button>
				         		</td>
				         	</tr>
				         </table>
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
