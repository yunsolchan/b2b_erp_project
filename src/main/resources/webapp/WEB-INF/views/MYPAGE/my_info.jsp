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
  
   <script type="text/javascript">
      // 사원수정 open 
      function emp_update() {
         var emp_id = $('#emp_id').val();
         var url = "${path}/emp_update.hj?employee_id=" + emp_id;
         window.open(url, "emp_update", "menubar=no, width=1000px, height=800px");  // (url, "별칭", size);  
      }
      
      // 재직증명서 open
      function emp_pdf() {
         var emp_id = $('#emp_id').val();
         var url = "${path}/emp_pdf.hj?employee_id=" + emp_id;
         window.open(url, "emp_pdf", "menubar=no, width=1000px, height=800px");  // (url, "별칭", size);  
      }
   </script>
</head>
<body>
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
		          <h3 class="card-title">My Information</h3>
		         <div class="table-responsive pt-3">
		           <table class="table table-bordered">
		             <thead>
		             </thead>
		             
		             <tbody>
		             
		               <tr>
		                 <td class="table-light">사진</td>
		                 <td colspan="5"><img src="${dto.photo}" width=200px height=200px/></td>
		               </tr>
		               
		               <tr>
		                 <td class="table-light">이름</td>
		                 <td>${dto.em_name}</td>
		                 <td class="table-light">입사일</td>
		                 <td><fmt:formatDate value="${dto.hire_date}" pattern="yyyy-MM-dd" /></td>
		               </tr>
		               
		               <tr>
		                 <td class="table-light">사번</td>
		                 <td id="emp_id">${dto.employee_id}</td>
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
		                 <td>${dto.em_phone}</td>
		                 <td>${dto.em_address}</td>
		               </tr>
		               
		               <tr>
		                 <td class="table-light">이메일</td>
		                 <td>${dto.em_email}</td>
		                 <td>${dto.em_detail_address}</td>
		               </tr>
		               
		               <tr>
		                 <td class="table-light">계좌번호</td>
		                 <td>${dto.account_number}</td>
		                 <td class="table-light">급여</td>
		                 <td>${dto.salary}</td>
		               </tr>
		               
		               <tr>
		                 <td class="table-light">부서명</td>
		                 <td>${dto.de_name}</td>
		                 <td class="table-light">남은 휴가일수</td>
		                 <td>${dto.annual_count}</td>
		               </tr>
		               
		             </tbody>
		           </table>
		       
		       <!-- 해당 버튼타입은 그룹으로 묶어서 줘야한다 -->
		              <!-- <div class="btn-group col-sm-3" style="display: flex; justify-content: center; padding-top: 4%; margin: 0 auto; ">
		               <button class="btn btn-outline-primary" onclick="window.print()">
		                    재직증명서 출력
		               </button>
		              </div>   -->
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
