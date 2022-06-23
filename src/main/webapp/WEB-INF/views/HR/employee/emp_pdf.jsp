<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>재직증명서</title>
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
	.th1 { text-align: center; font-weight: bold; }
	.right { text-align: right; }
	.table td img { width: 140px; height: 130; }
  </style>
  
  <script>

    function beforePrint() {
        initBodyHtml = document.body.innerHTML;
        document.body.innerHTML = document.getElementById('print').innerHTML;
    }
    function afterPrint() {
        document.body.innerHTML = initBodyHtml;
    }

    window.onbeforeprint = beforePrint;
    window.onafterprint = afterPrint;
    
</script>
<style type="text/css">
   @media print {
     #print{
   
       width: 210mm;
       height: 297mm;
       margin: 30mm 45mm 30mm 45mm;
   }
   @page {
   
    size: A4 portrait;
     margin:0;
   }
   @media print
   {
       .btn
       {
           display: none !important;
       }
   }
   
   .table-light {
   	text-align:center;
   	}
   
</style>

</head>
<body>

	<div class="col-lg-12 stretch-card">
	  <div class="card">
	    <div class="card-body">
	      <h4 class="card-title" style="text-align:center">재직증명서</h4>
	      <div class="table-responsive pt-3">
	        <table class="table table-bordered">
	          <thead>
	          </thead>
	          
	          <tbody>
	          
	            <tr>
	              <td rowspan="3" class="table-light">사진</td>
	              <td rowspan="3"><img src="${dto.photo}"/></td>
	              <td class="table-light">사번</td>
	              <td>${dto.employee_id}</td>
	            </tr>
	            
	            <tr>
	              <td class="table-light">부서</td>
	              <td>${dto.de_name}</td>
	            </tr>
	            
	            <tr>
	              <td class="table-light">계좌번호</td>
	              <td>${dto.bank}&nbsp;&nbsp;${dto.account_number}</td>
	            </tr>
	            
	            <tr>
	              <td class="table-light">이름</td>
	              <td>${dto.em_name}</td>
	              <td class="table-light">입사일</td>
	              <td><fmt:formatDate value="${dto.hire_date}" pattern="yyyy-MM-dd" /></td>
	            </tr>
	            
	            <tr>
	              <td class="table-light">부서</td>
	              <td>${dto.de_name}</td>
	              <td class="table-light">직급</td>
	              <td>${dto.po_name}</td>
	            </tr>
	            
	            <tr>
	              <td class="table-light">주민번호</td>
	              <td>${dto.register_number}</td>
	              <td class="table-light" rowspan="3">주소</td>
	              <td>${dto.em_zip_code}</td>
	            </tr>
	            
	            <tr>
	              <td class="table-light">전화번호</td>
	              <td>010-9801-3029</td>
	              <td>${dto.em_address}</td>
	            </tr>
	            
	            <tr>
	              <td class="table-light">이메일</td>
	              <td>${dto.em_email}</td>
	              <td>${dto.em_detail_address}</td>
	            </tr>
	            
	          </tbody>
	        </table>
	    
	    <!-- 해당 버튼타입은 그룹으로 묶어서 줘야한다 -->
              <div class="d-sm-flex justify-content-end mb-3 mt-3">
               <button class="btn btn-outline-facebook btn-text-icon btn-rounded me-2" onclick="window.print()" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
                 	<i class="ti-printer btn-icon-preppend"></i> 재직증명서 출력
               </button>
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