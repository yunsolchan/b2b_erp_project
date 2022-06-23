<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>견적서 신청 관리</title>
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
  
  <style>
	/* 페이징 css S */	
	.pagination {display: flex;padding-left: 0;list-style: none;justify-content: center;}
	a {color: black;text-decoration: none;cursor: pointer;}
	.disabled{display :none;}
	li.active a{
	    color:#6E7FC5;
	}
	th.hover{
	    color:#6E7FC5;
	}
	a:hover{
		color:#A7AECB;
	}
	/* 페이징 css E */	
</style>
  
  
  
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
         $("#estimate_application_list2 > tbody > tr").hide();
         var temp = $("#estimate_application_list2 > tbody > tr > td:contains('" + k + "')");
         $(temp).parent().show();
    }); 
    /* 검색기능 E */
    

	 });
 
	function numberMaxLength(e){
	    if(e.value.length > e.maxLength){
	        e.value = e.value.slice(0, e.maxLength);
	    }
	}
    
   $(function(){
      $('#estimate_application_insert').click(function(){
    	  var id = "${sessionScope.sessionID}";
    	  if(id == ""){
    		  swal("로그인이 되어있지 않습니다", {
    		       icon: "error" 
    		  })
    		  return;
    	  }
    	  var url = "${path}/estimate_application_insert.sc"
	  	      window.open(url, "insert","menubar=no, width=700px, height=800px");      
    	  });
      $('#estimate_application_delete').click(function(){
         
          if (confirm("견적서신청서를 삭제하시겠습니까?")){
             window.location="${path}/estimate_application_insert.sc";
          }
       });
      
      $('#estimate_application_print').click(function(){
          window.print();
       });      
   });
</script>
<script type="text/javascript">
   $(function(){
      // tr태그 클릭 시 거래처 상세페이지 접근 이벤트 생성
      $('#estimate_list tr td').click(function(){
    	  var td = $(this);   // 현재 클릭한 tr
          var tr = td.parent();   // 클릭한 tr의 요소(td)
          console.log(tr);
          var tdd = tr.children();
         window.location="${path}/estimate_application_detail.sc?request_id="+tdd.eq(0).text();
      });
   });
</script>
<script>


/* 페이징처리 S */
function pagination(){
	var req_num_row=6;
	var $tr=$('tbody tr');
	var total_num_row=$tr.length;
	var num_pages=0;
	if(total_num_row % req_num_row ==0){
		num_pages=total_num_row / req_num_row;
	      }
	      if(total_num_row % req_num_row >=1){
	          num_pages=total_num_row / req_num_row;
	          num_pages++;
	          num_pages=Math.floor(num_pages++);
	      }

	  $('.pagination').append("<li style='margin:10px'><a class='prev'><i class='mdi mdi-step-backward'></i></a></li>");

	      for(var i=1; i<=num_pages; i++){
	          $('.pagination').append("<li style='margin:10px'><a>"+i+"</a></li>");
	    $('.pagination li:nth-child(2)').addClass("active");
	    $('.pagination a').addClass("pagination-link2");
	      }

	  $('.pagination').append("<li style='margin:10px'><a class='next'><i class='mdi mdi-step-forward'></i></a></li>");

	      $tr.each(function(i){
	    $(this).hide();
	    if(i+1 <= req_num_row){
	              $tr.eq(i).show();
	          }
	      });

	      $('.pagination a').click('.pagination-link2', function(e){
	          e.preventDefault();
	          $tr.hide();
	          var page=$(this).text();
	          var temp=page-1;
	          var start=temp*req_num_row;
	    var current_link = temp;
	    
	    $('.pagination li').removeClass("active");
	          $(this).parent().addClass("active");
	  
	          for(var i=0; i< req_num_row; i++){
	              $tr.eq(start+i).show();
	          }
	    
	    if(temp >= 1){
	      $('.pagination li:first-child').removeClass("disabled");
	    }
	    else {
	      $('.pagination li:first-child').addClass("disabled");
	    }
	          
	      });

	  $('.prev').click(function(e){
	      e.preventDefault();
	      $('.pagination li:first-child').removeClass("active");
	  });

	  $('.next').click(function(e){
	      e.preventDefault();
	      $('.pagination li:last-child').removeClass("active");
	  });

	  }

	$('document').ready(function(){
	  pagination();

	$('.pagination li:first-child').addClass("disabled");

	});
/* 페이징처리 E */

    
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
                <div class="d-sm-flex justify-content-between">
                  <h3 class="card-title">견적서 관리</h3>
					<button type="button" class="btn btn-outline-facebook btn-icon-text btn-rounded" id="estimate_application_print" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
	            		견적서 목록 출력<i class="ti-printer btn-icon-append"></i>
	                </button>
                 
	             </div>
                  <div class="d-sm-flex justify-content-between mt-2 mb-4">
                     <p class="card-description">
                       	견적서 신청 목록
                     </p>
                      <div id="input-form">
                     <div class="d-sm-flex">
                        <i class="icon-search text-primary pt-1 pe-2 fw-bold fs-5"></i>
	                    <input type="text" id="keyword" class="form-control" placeholder="SEARCH" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;" />
	              	</div>
	              </div>

              </div>
              <div class="table-responsive" id="estimate_application_list3">
                    <table class="table table-hover" id="estimate_application_list2" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
                      <thead>
                        <tr class="table-secondary">
                          <th>견적신청서 번호<i class="mdi mdi-swap-vertical"></i></th>
                          <th>거래처명<i class="mdi mdi-swap-vertical"></i></th>
                          <th>대표자<i class="mdi mdi-swap-vertical"></i></th>
                          <th>거래처 연락처<i class="mdi mdi-swap-vertical"></i></th>
                          <th>담당자<i class="mdi mdi-swap-vertical"></i></th>
                          <th>요청일자<i class="mdi mdi-swap-vertical"></i></th>
                        </tr>
                      </thead>
                      <tbody id="estimate_list">
                      <c:forEach var="dto" items="${list}">
                       <tr>
                          <td>${dto.request_id }</td>
                          <td>${dto.cl_name }</td>
                          <td>${dto.ceo_name }</td>
                          <td>${fn:substring(dto.cl_phone,0,3)} - 
                             	${fn:substring(dto.cl_phone,3,7)} - 
                             	${fn:substring(dto.cl_phone,7,11)}</td>
                          <td>${dto.em_name }</td>
                          <td><fmt:formatDate value="${dto.begin_date }" pattern="yyyy-MM-dd" /></td>
                        </tr>
                        </c:forEach>
                      </tbody>
                     <tfoot>
							<tr>
							   <th colspan="8" >
							      <ul class="pagination" style="font-size: 16px; align-content:center;"></ul>
							   </th>
							</tr>
						</tfoot>
                    </table>
				 <div class="d-flex justify-content-end mt-3 mb-3">               
	                <button type="submit" class="btn btn-rounded btn-outline-twitter btn-fw btn-icon-text" id="estimate_application_insert" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
	                    <i class="mdi mdi-library-books btn-icon-preppend"></i>
						견적신청서 등록
	                </button>                                            
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