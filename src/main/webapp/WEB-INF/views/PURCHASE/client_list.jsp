<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>거래처 목록</title>
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

<script type="text/javascript">
$(document).ready(function() {
    /* 오름-내림차룬 정렬 기능 S */
    $('th').each(function (column) {
          $(this).click(function() {
               if($(this).is('.asc')) {
                   $(this).removeClass('asc');
                   $(this).addClass('desc');
                   sortdir=-1;                
               } else {
                  $(this).addClass('asc');
                  $(this).removeClass('desc'); 
                  sortdir=1;
               }
               $(this).siblings().removeClass('asc');
               $(this).siblings().removeClass('desc');
              var rec = $('table').find('tbody>tr').get();
              rec.sort(function (a, b) {
                   var val1 = $(a).children('td').eq(column).text().toUpperCase();
                   var val2 = $(b).children('td').eq(column).text().toUpperCase();
                   return (val1 < val2)?-sortdir:(val1>val2)?sortdir:0;
              });
              $.each(rec, function(index, row) {
                   $('tbody').append(row);
                });
          });
    });
    /* 오름-내림차룬 정렬 기능 E */
    /* 검색기능 S */
     $("#keyword").keyup(function() {
         var k = $(this).val();
         console.log(k);
         $("#client_list > tbody > tr").hide();
         var temp = $("#client_list > tbody > tr > td:contains('" + k + "')");
         $(temp).parent().show();
    }); 
    /* 검색기능 E */
    /* 페이징처리 S */
    /* 페이징처리 E */
 });

   $(function(){
      $('#client_insert').click(function(){
    	  var id = "${sessionScope.sessionID}";
    	  if(id == ""){
    		  swal("로그인이 되어있지 않습니다", {
    		       icon: "error" 
    		  })
    		  return;
    	  }
    	  var url = "${path}/client_insert.sc"
    	      window.open(url, "insert","menubar=no, width=580px, height=800px");
      });
      
      $('#client_delete').click(function(){
    	  var chkArray = new Array();
		    $("input[name='client_id']:checked").each(function() { 
		      var tmpVal = $(this).val(); 
		      chkArray.push(tmpVal);
		    });
		    if( chkArray.length < 1 ){
		    	swal("체크박스를 선택해주세요", {
	    		       icon: "error" 
	    		  })
	            return;
		    }
          else{ 
        	  if(confirm("거래처를 삭제하시겠습니까?")){
        	  	location.href="${path}/client_delete.sc?client_id="+chkArray;
          }
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
<style>
	tr:last-child th{
		border: none;
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
          <div class="row col-lg-11" id="print">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body"  >
                 <h3 class="card-title">거래처관리</h3>
                <div class="d-sm-flex justify-content-between mt-2 mb-4">
                     <p class="card-description">거래처 목록 </p>
                     <div id="input-form">
                     <div class="d-sm-flex">
                        <i class="icon-search text-primary pt-1 pe-2 fw-bold fs-5"></i>
                    	<input type="text" id="keyword" class="form-control" placeholder="SEARCH" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;" />
		              </div>
		           </div>
              </div>
              <div>
              <div class="table-responsive" id="client_list3">
                    <table class="table table-hover" id="client_list" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
                      <thead>
                        <tr class="table-secondary">
                          <th><i class="mdi mdi-check fw-bold"></i></th>
                          <th>거래처 번호<i class="mdi mdi-swap-vertical"></i></th>
                          <th>회사명<i class="mdi mdi-swap-vertical"></i></th>
                          <th>사업자번호<i class="mdi mdi-swap-vertical"></i></th>
                          <th>대표자명<i class="mdi mdi-swap-vertical"></i></th>
                          <th>전화번호<i class="mdi mdi-swap-vertical"></i></th>
                          <th>주소<i class="mdi mdi-swap-vertical"></i></th>
                          <th>등록일<i class="mdi mdi-swap-vertical"></i></th>
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
                                     <input type="checkbox" class="checkbox" name="client_id" value="${dto.client_id}">
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
                          <td><fmt:formatDate value="${dto.cl_register_date}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                       	</c:forEach>
                      </tbody>
                    </table>
                   <div class="d-flex justify-content-between mt-3 mb-3">
		                  <button type="submit" class="btn btn-rounded btn-icon-text btn-outline-google btn-fw" id="client_delete" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
		                      	<i class="mdi mdi-link-off btn-icon-preppend"></i>
		                      	거래처 삭제
		                  </button>  
		                  <div>
		                  <button type="submit" class="btn btn-rounded btn-icon-text btn-outline-twitter btn-fw  me-2" id="client_insert" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
		                       	<i class="mdi mdi-library-plus btn-icon-preppend"></i>
		                       	거래처 등록
		                  </button> 
		                  <button type="button" class="btn btn-outline-facebook btn-icon-text btn-rounded" id="client_print" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
                   		   	 거래처 목록 출력<i class="ti-printer btn-icon-append"></i>
                 	 		</button>  
                 	 		</div>                       
                  	</div>
                  </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
      </div>
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