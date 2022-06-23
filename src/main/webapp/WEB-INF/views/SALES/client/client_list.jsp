<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>(판매부)거래처 목록</title>
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
   $(function(){
	   // 거래처 목록 출력하기 버튼을 누르면 실행되는 함수
      $('#client_print').click(function(){
    	  // 자바의 명령어를 이용해 pdf, 인쇄를 할 수 있다
          window.print();
       });      
      
      $('#client_insert').click(function(){
    	  
    	  var id = "${sessionScope.sessionID}";
    	    if(id == ""){
    	       swal("로그인이 되어있지 않습니다", {
    	            icon: "error" 
    	       })
    	       return;
    	    }
    	    
	      var url = "${path}/client_insert.jh";
	      
	      window.open(url, "client_insert", "menubar=no, width=580px, height=800px");  // (url, "별칭", size);  
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
                 location.href="${path}/client_delete.jh?client_id="+chkArray;
           	  }
           }
        });
      
      
      $('#client_out').click(function(){
    	  
       }); 
      
   }); 
</script>
<script type="text/javascript">
   $(function(){
      
      // tr태그 클릭 시 거래처 상세페이지 접근 이벤트 생성
      $('#client_list td').click(function(){
         var td = $(this);   // 현재 클릭한 tr
         var tr = td.parent();   // 클릭한 tr의 요소(td)
         console.log(tr);
         var tdd = tr.children();
          
         window.location="${path}/client_detail.jh?client_id="+ tdd.eq(1).text();
      });
   });
</script>
<script>
    
    // body의 정보를 담아주기 위해 변수를 선언
    var initBodyHtml;

    // 프린트 명령어를 실행시키기 전에 실행되는 함수
    function beforePrint() {
    	// 현재 body에 담겨있는 정보를 initBodyHtml를 담아준다
    	initBodyHtml = document.body.innerHTML;
    	// body안에 id가 print인 div만 출력시킨다
        document.body.innerHTML = document.getElementById('print').innerHTML;
    }
 	// 프린트 명령어를 실행시키고 난 뒤 실행되는 함수
    function afterPrint() {
 		// body에 다시 원래 있던 정보를 담아준다
        document.body.innerHTML = initBodyHtml;
 		// 현재 페이지를 새로고침한다
        location.reload()
    }

 	// beforePrint를 프린트 함수를 실행시키기 전에 실행하겠다는 선언
    window.onbeforeprint = beforePrint;
 	// afterPrint를 프린트 함수를 실행시키고 난 뒤 실행하겠다는 선언
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
<style>
	#client_list2 tr:last-child th{
		border: none;
	}
</style>
<script>
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
        $("tbody > tr").hide();
        var temp = $("tbody > tr > td:contains('" + k + "')");
        $(temp).parent().show();
	}); 
	/* 검색기능 E */
	
	/* 페이징처리 S */
	/* 페이징처리 E */
});
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
      
<div class="main-panel">
        <div class="content-wrapper" style="padding-top:0;">
        <div class="d-flex flex-row align-items-center">
         <i class="menu-icon mdi mdi-briefcase icon-lg text-twitter me-2"></i>
            <h2 style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;  padding: 2% 0;">
                	 영업/판매 관리
           </h2>
       </div>
          <div class="row col-lg-11">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">거래처 관리</h3>
                  <div class="d-sm-flex justify-content-between mt-2 mb-4">
                     <p class="card-description">
                        	거래처 목록
                     </p>
	                  <!-- 검색 S -->
	                 <div id="input-form">
	                  	<div class="d-sm-flex">
	                  		<i class="icon-search text-primary pt-1 pe-2 fw-bold fs-5"></i>
					  		<input type="text" id="keyword" class="form-control" placeholder="SEARCH" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;" />
					  	</div>
					 </div>
					 <!-- 검색 E  -->
              </div>
              <div class="table-responsive">
                  <form name="clientForm">
                    <table class="table table-hover" id="client_list2" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
                      <thead>
                        <tr class="table-secondary">
                          <th>선택</th>
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
                      <c:forEach var="dto" items="${list}">
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
                          <td>${fn:substring(dto.register_num,0,3)} - ${fn:substring(dto.register_num,3,5)} - ${fn:substring(dto.register_num,5,9)}</td>
                          <td>${dto.ceo_name }</td>
                          <td>${fn:substring(dto.cl_phone,0,3)} - ${fn:substring(dto.cl_phone,3,7)} - ${fn:substring(dto.cl_phone,7,11)}</td>
                          <td>${dto.cl_address} , ${dto.cl_detail_address}</td>
                          <td class="text-success"><fmt:formatDate value="${dto.cl_register_date}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                      </c:forEach> 
                      </tbody>
                    </table>
                   <div class="d-flex justify-content-between mt-3 mb-3"> 
       		      <button type="button" class="btn btn-rounded btn-icon-text btn-outline-google btn-fw" id="client_delete" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
                       	<i class="mdi mdi-link-off btn-icon-preppend"></i>
                       	거래처 삭제
                  </button>
                  <div>
                  <button type="button"class="btn btn-rounded btn-icon-text btn-outline-twitter btn-fw me-2" id="client_insert" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
                      	 <i class="mdi mdi-library-plus btn-icon-preppend"></i>
                      	 신규거래처 등록
                  </button>
                  <button type="button" class="btn btn-outline-facebook btn-rounded btn-icon-text" id="client_print" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
                      		 거래처목록 출력<i class="ti-printer btn-icon-append"></i>
                  </button>
                  </div>
                  </div>                             
               </form>   
                  
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
