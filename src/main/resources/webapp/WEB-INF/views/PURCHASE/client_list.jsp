<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>client_list</title>
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
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">


   $(function(){
      $('#client_insert').click(function(){
    	  var url = "${path}/client_insert.sc"
    	      window.open(url, "insert","menubar=no, width=500px, height=700px");
      });
      
      $('#client_delete').click(function(){
         
          if (confirm("거래처를 삭제하시겠습니까?")){
        		    var chkArray = new Array();

        		    $("input[name='product_id']:checked").each(function() { 
        		      var tmpVal = $(this).val(); 
        		      chkArray.push(tmpVal);
        		    });

        		    if( chkArray.length < 1 ){
        		      alert("체크박스를 선택해주시기 바랍니다.");
        		      return;
        		    }
        		    location.href="${path}/client_delete.sc?client_id="+chkArray;
          }
       });
      
      $('#client_print').click(function(){
         
          window.print();
       });      
   });
   
</script>
<script type="text/javascript">
   $(function(){
	   
      // tr태그 클릭 시 거래처 상세페이지 접근 이벤트 생성
      $('#client_list tr td').click(function(){
         var td = $(this);   // 현재 클릭한 tr
         var tr = td.parent();   // 클릭한 tr의 요소(td)
         console.log(tr);
         var tdd = tr.children();
         
          
         window.location="${path}/client_detail.sc?client_id="+ tdd.eq(1).text();
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
      <div class="main-panel" id="client_List">
        <div class="content-wrapper">
        <div class="d-flex flex-row align-items-center">
         <i class="mdi mdi-city icon-lg text-success"></i>
            <h2 style="font-family: inherit;4">
                     거래처 목록
           </h2>
       </div>
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card" id="print">
                <div class="card-body">
                  <h3 class="card-title">거래처 목록</h3>
                  <p class="card-description">
                          거래처 목록
                  </p>
                  <div class="table-responsive" id="client_list3">
                    <table class="table table-hover" id="client_list2">
                      <thead>
                        <tr>
                          <th></th>
                          <th>거래처 번호</th>
                          <th>회사명</th>
                          <th>사업자번호</th>
                          <th>대표자명</th>
                          <th>전화번호</th>
                          <th>주소</th>
                          <th>등록일</th>
                        </tr>
                      </thead>
                      <tbody id="client_list">
                      <c:forEach  var="dto" items="${list}">
                        <tr>
                          <th>
                          <div class="todo-list todo-list-rounded">
                             <div class="d-block">
                                <div class="form-check">
                                   <label class="form-check-label">
                                     <input type="checkbox" class="checkbox" name="product_id" value="${dto.client_id }">
                                </label>
                                </div>
                             </div>
                          </div>
                          </th>
                          <td>${dto.client_id }</td>
                          <td>${dto.cl_name }</td>
                          <td>${dto.register_num }</td>
                          <td>${dto.ceo_name}</td>
                          <td>${dto.cl_phone }</td>
                          <td>${dto.cl_address }</td>
                          <td>${dto.cl_register_date }</td>
                        </tr>
                       	</c:forEach>
                      </tbody>
                    </table>
                    
                    
                  <button type="submit" class="btn btn-outline-primary btn-fw" id="client_insert">
                       거래처 등록
                  </button>
                  
                  <button type="submit" class="btn btn-outline-primary btn-fw" id="client_delete">
                       거래처 삭제
                  </button>     
                  
                  <button type="submit" class="btn btn-outline-primary btn-fw" id="client_print">
                       거래처 목록다운로드
                  </button>                               
                  
                  
                  <ul class="">
                  <!-- 클래스명 없어도된다 -->
                  <li class="nav-item dropdown d-none d-lg-block">
            <a class="nav-link dropdown-bordered dropdown-toggle dropdown-toggle-split" id="messageDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false"> Select Category </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0" aria-labelledby="messageDropdown">
              <a class="dropdown-item py-3" >
                <p class="mb-0 font-weight-medium float-left">Select category</p>
              </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <p class="preview-subject ellipsis font-weight-medium text-dark">Bootstrap Bundle </p>
                  <p class="fw-light small-text mb-0">This is a Bundle featuring 16 unique dashboards</p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <p class="preview-subject ellipsis font-weight-medium text-dark">Angular Bundle</p>
                  <p class="fw-light small-text mb-0">Everything you’ll ever need for your Angular projects</p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <p class="preview-subject ellipsis font-weight-medium text-dark">VUE Bundle</p>
                  <p class="fw-light small-text mb-0">Bundle of 6 Premium Vue Admin Dashboard</p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <p class="preview-subject ellipsis font-weight-medium text-dark">React Bundle</p>
                  <p class="fw-light small-text mb-0">Bundle of 8 Premium React Admin Dashboard</p>
                </div>
              </a>
            </div>
          </li>
          </ul>
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