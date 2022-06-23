<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>사원상세</title>
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
  
  <style>
  	.table td img { width: 150px; height: 140px; }
  	
  	.content-wrapper {
  	padding-top:0
  	}
  	
  	/* 글자체 */
  	table{
  	font-family: 'IBM Plex Sans KR', sans-serif; 
  	font-weight:bold;
  	}
  	
   	.table-light {
   	text-align:center;
   	}
  	
  </style>
  
	<script type="text/javascript">
		// 사원수정 open 
		function emp_update() {
			var emp_id = $('#emp_id').val();
			var url = "${path}/emp_update.hj?employee_id=" + emp_id;
			window.open(url, "emp_update", "menubar=no, width=600px, height=800px");  // (url, "별칭", size);  
		}
		
		// 재직증명서 open
		function emp_pdf() {
			var emp_id = $('#emp_id').val();
			var url = "${path}/emp_pdf.hj?employee_id=" + emp_id;
			window.open(url, "emp_pdf", "menubar=no, width=1000px, height=600px");  // (url, "별칭", size);  
		}
	</script>
</head>
<body>
  <div class="container-scroller"> 
  <!-- 헤더 -->
  <%@ include file="/WEB-INF/views/MENU/header.jsp" %>
  
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
    <!-- 레프트메뉴 -->
      <%@ include file="/WEB-INF/views/MENU/leftMenu.jsp" %>
      
      <!-- 여기서부터 작성 -->
      <!-- partial:../../partials/_settings-panel.html -->
      
      <div class="main-panel">
        <div class="content-wrapper" style="padding-top:0;">
        <div class="d-flex flex-row align-items-center">
	      <i class="mdi mdi-human-greeting icon-lg text-facebook me-2"></i>
	      	<h2 style="font-family: inherit; padding: 2% 0;">
	                           인사관리
	        </h2>
	    </div>
          <div class="row">
            <div class="col-lg-12 stretch-card">
	  <div class="card">
	    <div class="card-body">
          <h3 class="card-title">인사카드상세</h3>
        <p class="card-description">
         		 인사카드상세
        </p>
	      <div class="table-responsive pt-3">
   				<div class="btn-group mb-3" >
					<button type="button" class="btn btn-outline-twitter" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;" onclick="emp_update()" value="${dto.employee_id}" id="emp_id">사원정보수정</button>
					<button type="button" class="btn btn-outline-twitter" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;" onclick="emp_pdf()">재직증명서</button>		
				</div>
	        <table class="table table-bordered">
	          <thead>
	          </thead>
	          
	          <tbody>
	          
	            <tr>
	              <td class="table-light" rowspan="3">사진</td>
	              <td rowspan="3"><img src="${dto.photo}"></td>
	              <td class="table-light">사번</td>
	              <td id="emp_id">${dto.employee_id}</td>
	              <td class="table-light">이름</td>
	              <td>${dto.em_name}</td>
	            </tr>
	            
	            <tr>
	              <td class="table-light">입사일</td>
	              <td><fmt:formatDate value="${dto.hire_date}" pattern="yyyy-MM-dd" /></td>
	              <td class="table-light">계좌번호</td>
	              <td>${dto.bank}&nbsp;&nbsp;${dto.account_number}</td>
	            </tr>
	            
	            <tr>
	              <td class="table-light">직급</td>
	              <td>${dto.po_name}</td>
	              <td class="table-light">급여</td>
	              <td>${dto.salary}</td>
	            </tr>
	            
	            <tr>
	              <td class="table-light">주민번호</td>
	              <td>${dto.register_number}</td>
	              <td class="table-light" rowspan="3">주소</td>
	              <td>${dto.em_zip_code}</td>
	              <td class="table-light">부서명</td>
	              <td>${dto.de_name}</td>
	            </tr>
	            
	            <tr>
	              <td class="table-light">전화번호</td>
	              <td>${dto.em_phone}</td>
	              <td>${dto.em_address}</td>
	              <td class="table-light">권한</td>
	              <td>
		              <c:if test="${dto.authority == 'ROLE_HR'}">인사업무</c:if>
		              <c:if test="${dto.authority == 'ROLE_FINANCE'}">회계업무</c:if>
		              <c:if test="${dto.authority == 'ROLE_USER'}">영업/구매/물류업무</c:if>
	              </td>
	            </tr>
	            
	            <tr>
	              <td class="table-light">이메일</td>
	              <td>${dto.em_email}</td>
	              <td>${dto.em_detail_address}</td>
	              <td class="table-light">휴가일수</td>
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
   
   
   
   
    </div>
    	<%@ include file="/WEB-INF/views/MENU/footer.jsp" %>
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

