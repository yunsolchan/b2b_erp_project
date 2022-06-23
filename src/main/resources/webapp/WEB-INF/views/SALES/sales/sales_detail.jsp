<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>sales_detail</title>
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
      $('#sales_delete').click(function(){
    	  
          if (confirm("판매내역을 삭제하시겠습니까?")){
        	  window.location="${path}/sales_delete.jh";
          }
       });
      
      $('#back').click(function(){
    	  
          window.history.back();
       });      
      
      $('#sales_print').click(function(){
    	  
          window.print();
       });      
      
      
      $.ajax({
          type: "post",
          url: "${path}/sales_list.jh?${_csrf.parameterName}=${_csrf.token}",
          success: function(result){   
             var e = $(result).find('#sales_list2')
             $('#sales_list').html(e);
          },
          error: function(){
             alert("table ajax 오류");
          }
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
         <i class="mdi mdi-city icon-lg text-success"></i>
            <h2 style="font-family: inherit;4">
                     판매조회 상세페이지
           </h2>
       </div>
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card" id="print">
                <div class="card-body">
                  <h3 class="card-title">판매내역 상세페이지</h3>
                  <p class="card-description">
                          판매내역 상세
                  </p>
                  <div class="table-responsive">
                    <table class="table">
                    
                        <tr>
                          <th>일자-No.</th>
                          	<td>일자-No.</td>
                          	
                          <th>거래처명</th>
                          	<td>거래처명</td>                          	
                        </tr>
                        
                        <tr>
                          <th>품목명</th>
                          	<td>품목명</td>
                          	
                          <th>금액합계</th>
                          	<td>금액합계</td>                          	
                        </tr>
                        
                        <tr>
                          <th>출하창고명</th>
                          	<td>출하창고명</td>
                          	
                          <th>인쇄</th>
                          	<td>인쇄</td>                          	
                        </tr>  
                        
                        <tr>
                          <th>불러온 전표</th>
                          	<td>불러온 전표</td>
                        </tr>                                                                      

                    </table>
                    
                    <br><br><br>
                  
                  <button type="submit" class="btn btn-outline-primary btn-fw" id="sales_delete">
                       삭제
                  </button>     
                  
                  <button type="submit" class="btn btn-outline-primary btn-fw" id="back">
                       닫기
                  </button>       
                  
                  <button type="submit" class="btn btn-outline-primary btn-fw" id="sales_print">
			PDF 다운로드
                  </button>
                  
                  <br><br><br>       
                  
				<div id="sales_list"></div>                                                                        
                  
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
