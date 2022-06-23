<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>견적서신청서 상세</title>
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
   $(function(){
      $('#estimate_application_update').click(function(){
         window.location="${path}/estimate_application_update.sc";
      });
      
      $('#estimate_application_delete').click(function(){
         
          if (confirm("견적신청서를 삭제하시겠습니까?")){
             window.location="${path}/estimate_application_delete.sc";
          }
       });
      
      $('#back').click(function(){
    	  window.location="${path}/estimate_application_list.sc";
       });      
      
      $('#estimate_application_print').click(function(){
         
          window.print();
       });      
   });
</script>
<script>
    
    var initBodyHtml;

    function beforePrint() {
        initBodyHtml = document.body.innerHTML;
        document.body.innerHTML = document.getElementById('print').innerHTML;
    }
    function afterPrint() {
        document.body.innerHTML = initBodyHtml;
        location.reload()
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
   
    size: A4 landscape;
     margin:0;
   }
   @media print
   {
       .btn,.card-title,.form-control, .icon-search, .todo-list-rounded, .mdi-check
       {
           display: none !important;
       }
   }
</style>
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
       <!-- 여기서부터 작성 -->
      <div class="main-panel">
        <div class="content-wrapper" style="padding-top:0;">
        <div class="d-flex flex-row align-items-center">
          <i class="mdi mdi-note-plus-outline icon-lg text-twitter me-2"></i>
            <h2 style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;  padding: 2% 0;">
                 	구매관리
           </h2>
       </div>
          <div class="row col-lg-11">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body" id="print">
                  <h3 class="card-title">견적서 신청 관리</h3>
                  <div class="d-sm-flex justify-content-between mb-4">
                     <p class="card-description">
                     	   견적 신청서 상세
                     </p>
                	  <div class="d-flex justify-content-end mt-3 mb-3">
		                     <button type="button" class="btn btn-outline-facebook btn-rounded btn-icon-text" id="estimate_application_print" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
		                       	견적서신청 상세다운로드<i class="ti-printer btn-icon-append"></i>
	                  		</button>
	                  </div>     

              </div>
                  <div class="table-responsive">
	                    <table class="table table-bordered" style="font-family: 'IBM Plex Sans KR', sans-serif;">
                    
                        <tr>
                          <th class="table-light">견적서신청서 번호</th>
                             <td>${dto.request_id }</td>
                             
                          <th class="table-light">요청일자</th>
                             <td><fmt:formatDate value="${dto.begin_date }" pattern="yyyy-MM-dd" /></td>                             
                        </tr>
                        <tr>
                          <th class="table-light">거래처명</th>
                             <td>${dto.cl_name }</td>
                             
                          <th class="table-light">거래처 이메일</th>
                             <td>${dto.cl_email }</td>                             
                        </tr>  
                        
                        <tr>
                          <th class="table-light">대표자명</th>
                             <td>${dto.ceo_name}</td>
                             
                          <th class="table-light">거래처 연락처</th>
                             <td>${fn:substring(dto.cl_phone,0,3)} - 
                             	${fn:substring(dto.cl_phone,3,7)} - 
                             	${fn:substring(dto.cl_phone,7,11)}
                             </td>                             
                        </tr>
                        <tr>
                          <th class="table-light">담당자</th>
                             <td>${dto.em_name }</td>
                             
                          <th class="table-light">담당자 부서</th>
                             <td>${dto.de_name }</td>                             
                        </tr>   
                        <tr>
                          <th class="table-light">담당자 연락처</th>
                             <td>${dto.em_phone }</td>
                          <th class="table-light">담당자 이매일</th>
                             <td>${dto.em_email }</td>                             
                        </tr>                                                                       
                    </table>
                    <br><br><hr><br>
                    <table class="table table-dark">
                       <tr>
                          <th>상품명</th>
                          <th>상품종류</th>
                          <th>수량</th>
                       </tr>
                       <c:forEach var="dtol" items="${list }">
                       <tr>
                          <td>${dtol.pr_name }</td>
                          <td>${dtol.category }</td>
                          <td>${dtol.re_qty }</td>
                       </tr>
                       </c:forEach>
                    </table>
                    <br>
   
                  <div class="d-flex justify-content-end mt-3 mb-3">
                  <button type="submit"  class="btn btn-rounded btn-outline-twitter btn-fw" id="back" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
                       닫기
                  </button>  &nbsp;&nbsp;                   
                  </div>
                  </div>
                  <div id="estimate_application_list"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
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