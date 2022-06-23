<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>거래처 상세</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="/team_one/resources/css/vendors/feather/feather.css">
  <link rel="stylesheet" href="/team_one/resources/css/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="/team_one/resources/css/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="/team_one/resources/css/vendors/typicons/typicons.css">
  <link rel="stylesheet" href="/team_one/resources/css/vendors/simple-line-icons/css/simple-line-icons.css">
  <link rel="stylesheet" href="/team_one/resources/css/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <link rel="stylesheet" href="/team_one/resources/css/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="/team_one/resources/css/js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/team_one/resources/css/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/team_one/resources/css/images/favicon.png" />
<script type="text/javascript">
   $(function(){
	   $('#request_list').click(function(){
			
		    $.ajax({
		        type: "post",
		        url: "${path}/request_list.sc?${_csrf.parameterName}=${_csrf.token}&client_id=${dto.client_id}",
		        success: function(result){   
		           var e = $(result).find('#request_list2')
		           $('#request_list2').html(e);
		           console.log(e);
		           if(e.length == 0){
		        	   swal("거래내역이 존재하지 않습니다", {
		        	       icon: "error" 
		        	     })
		        	     .then((willDelete) => {
		        	     });
		           }
		        },
		        error: function(){
		           alert("table ajax 오류");
		        }
		     }); 
		 });
	   $('#client_update').click(function(){
	    	  var url = "${path}/client_update.sc?client_id=${dto.client_id}"
	    	      window.open(url, "insert","menubar=no, width=500px, height=700px");
	   });
      
      $('#client_delete').click(function(){
         
          if (confirm("거래처를 삭제하시겠습니까?")){
             window.location="${path}/client_delete.sc";
          }
       });
      
      $('#back').click(function(){
         
          window.history.back();
       });      
      
      $('#client_print').click(function(){
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
                  <h3 class="card-title">거래처관리</h3>
                  <div class="d-sm-flex justify-content-between mb-4">
                     <p class="card-description">
                        	거래처 상세
                     </p>
	                     <button type="button" class="btn btn-outline-facebook btn-rounded btn-icon-text" id="client_print" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
	                  	   거래처 상세 다운로드<i class="ti-printer btn-icon-append"></i>
	         		  	</button>
             <!--         <div id="input-form">
                     <div class="d-sm-flex">
             		 </div>
              		</div> -->
              </div>
                  <div class="table-responsive">
                    <table class="table table-bordered" style="font-family: 'IBM Plex Sans KR', sans-serif;">
                    
                        <tr>
                          <th class="table-light">거래처 번호</th>
                             <td>
                             	${dto.client_id }
                             </td>
                             
                          <th class="table-light">구분</th>
                             <td>${dto.cl_type}</td>                             
                        </tr>
                        
                        <tr>
                          <th class="table-light">대표자명</th>
                             <td>${dto.ceo_name}</td>
                             
                          <th class="table-light">거래처 연락처</th>
                             <td>
                             	${fn:substring(dto.cl_phone,0,3)} - 
                             	${fn:substring(dto.cl_phone,3,7)} - 
                             	${fn:substring(dto.cl_phone,7,11)}
                             </td>                             
                        </tr>
                        
                        <tr>
                          <th class="table-light">거래처 주소</th>
                             <td>${dto.cl_address}</td>
                             
                          <th class="table-light">사업자 번호</th>
                             <td>
								${fn:substring(dto.register_num,0,3)} - 
                             	${fn:substring(dto.register_num,3,5)} - 
                             	${fn:substring(dto.register_num,5,10)}
							</td>                             
                        </tr>  
                        
                        <tr>
                          <th class="table-light">등록일</th>
                             <td colspan="3"><fmt:formatDate value="${dto.cl_register_date}" pattern="yyyy-MM-dd" /></td>
                        </tr>                                                                      

                    </table>
                    <br><br><hr> 
                     <table class="table table-bordered" style="font-family: 'IBM Plex Sans KR', sans-serif;">
                       <tr class="table-secondary">
                          <th>상품명</th>
                          <th>상품종류</th>
                          <th>공급단가</th>
                          <th>상품 등록일</th>
                       </tr>
                       <c:forEach var="dto" items="${list}">
                       <tr>
                          <td>${dto.pr_name }</td>
                          <td>${dto.category }</td>
                          <td>${dto.cost }</td>
                          <td><fmt:formatDate value="${dto.pr_register_date }" pattern="yyyy-MM-dd" />
                          </td>
                       </tr>
                       </c:forEach>
                       
                       
                    </table>
                    <div class="btn-group mt-3">
	                <button type="button" class="btn btn-outline-warning btn-text-icon btn-fw" id="client_update" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
	                     <i class="mdi mdi-lead-pencil btn-icon-preppend"></i> 수정
	                  </button>
	                  <button type="button" class="btn btn-outline-danger btn-text-icon btn-fw" onclick="location.href='${path}/client_delete.sc?client_id=${dto.client_id}'" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
	                     <i class="mdi mdi-delete btn-icon-preppend"></i> 삭제
	                  </button>  
	                  <button type="button" class="btn btn-outline-twitter btn-text-icon btn-fw" id="back" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
	                     <i class="mdi mdi-format-list-bulleted btn-icon-preppend"></i> 거래처목록
	                  </button>
 				</div>
           <div class="d-flex justify-content-end mt-3 mb-3">
              <button type="button" class="btn btn-rounded btn-outline-twitter btn-fw" id="request_list" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
                       거래내역
                  </button>
           </div>       
                  <br><br><br>       
                  
            <div id="request_list2"></div>                                                  
                  </div>
                  
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