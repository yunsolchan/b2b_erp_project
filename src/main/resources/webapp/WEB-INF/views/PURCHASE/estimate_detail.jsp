<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>estimate_detail</title>
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
	   $.ajax({
		    type: "post",
		    url: "${path}/estimate_list.sc?${_csrf.parameterName}=${_csrf.token}",
		    success: function(result){   
		    	var e = $(result).find('#estimate_list')
		       $('#estimate_list').html(e);
		    },
		    error: function(){
		       alert("table ajax 오류");
		    }
		 });
      $('#estimate_update').click(function(){
         
         window.location="${path}/estimate_update.sc";
      });
      
      $('#estimate_delete').click(function(){
         
          if (confirm("견적서를 삭제하시겠습니까?")){
             window.location="${path}/estimate_delete.sc";
          }
       });
      
      $('#back').click(function(){
         
          window.history.back();
       });      
      
      $('#estimate_print').click(function(){
         
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
       .btn
       {
           display: none !important;
       }
   }
</style>
</head>
<body>
  <div class="container-scroller"> 
  <!-- 헤더 -->
  <%@ include file="/WEB-INF/views/header.jsp" %>
  
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
    <!-- 레프트메뉴 -->
      <%@ include file="/WEB-INF/views/leftMenu.jsp" %>
      
      <!-- 여기서부터 작성 -->
      <div class="main-panel">
        <div class="content-wrapper">
        <div class="d-flex flex-row align-items-center">
         <i class="mdi mdi-book-minus icon-lg text-success"></i>
            <h2 style="font-family: inherit;4">
                     견적서 상세페이지
           </h2>
       </div>
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card" id="print">
                <div class="card-body">
                  <h3 class="card-title">견적서 상세페이지</h3>
                  <p class="card-description">
                          견적서 상세
                  </p>
                  <div class="table-responsive">
                    <table class="table">
                    <tr>
                          <th>견적서신청서 번호</th>
                             <td>${dto.request_id }</td>
                             
                          <th>요청일자</th>
                             <td>${dto.begin_date }</td>                             
                        </tr>
                        <tr>
                          <th>거래처명</th>
                             <td>${dto.cl_name }</td>
                             
                          <th>거래처 이메일</th>
                             <td>${dto.cl_email }</td>                             
                        </tr>  
                        
                        <tr>
                          <th>대표자명</th>
                             <td>${dto.ceo_name}</td>
                             
                          <th>거래처 연락처</th>
                             <td>${dto.cl_phone }</td>                             
                        </tr>
                        <tr>
                          <th>담당자</th>
                             <td>${dto.em_name }</td>
                             
                          <th>담당자 부서</th>
                             <td>${dto.de_name }</td>                             
                        </tr>   
                        <tr>
                          <th>담당자 연락처</th>
                             <td>${dto.em_phone }</td>
                          <th>담당자 이매일</th>
                             <td>${dto.em_email }</td>                             
                        </tr>                                                                                               
                    </table>
                    <br><br><hr><br>
                    <table class="table table-dark">
                       <tr>
                          <th>상품명</th>
                          <th>상품종류</th>
                          <th>단가</th>
                          <th>수량</th>
                          <th>총액</th>
                       </tr>
                       <c:forEach var="dtol" items="${list }">
                       <tr>
                          <td>${dtol.pr_name }</td>
                          <td>${dtol.category }</td>
                          <td>${dtol.cost }</td>
                          <td>${dtol.re_qty }</td>
                          <td>${dtol.cost * dtol.re_qty }</td>
                       </tr>
                       </c:forEach>
                    </table>
                    <br><br><br>
                  <button type="submit" class="btn btn-outline-primary btn-fw" id="estimate_delete">
                       삭제
                  </button>     
                  
                  <button type="submit" class="btn btn-outline-primary btn-fw" id="back">
                       닫기
                  </button>       
                  
                  <button type="submit" class="btn btn-outline-primary btn-fw" id="estimate_print">
         PDF 다운로드
                  </button>                    
                                         <div id="estimate_list"></div>
                       
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
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