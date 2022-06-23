<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>(판매부)거래처 상세</title>
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
      $('#client_delete').click(function(){
    	  
          if (confirm("거래처를 삭제하시겠습니까?")){
        	  window.location="${path}/client_delete.jh?client_id=${dto.client_id}";
          }
       });
      
      $('#client_update').click(function() {
	      var url = "${path}/client_update.jh?client_id=${dto.client_id}";
	      window.open(url, "client_update", "menubar=no, width=1000px, height=800px");  // (url, "별칭", size);  
	   });   
      
      $('#back').click(function(){
    	  
          window.history.back();
       });      
      
      $('#client_print').click(function(){
    	  
          window.print();
       });    
      
      //내역보기
      $('#request_list').click(function(){ 
	      $.ajax({
	          type: "post",
	          url: "${path}/request_list.jh?${_csrf.parameterName}=${_csrf.token}&client_id=${dto.client_id}",
	          success: function(result){   
	             var e = $(result).find('#request_list2')
	             $('#request_list2').html(e);
	          },
	          error: function(){
	             alert("table ajax 오류");
	          }
	       }); 
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
	    .btn
	    {
	        display: none !important;
	    }
	}
	
	/* 페이징 css S */	
	.pagination {display:flex; padding-left:0; list-style:none; justify-content: center;}
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
  /* 페이징처리 S */
	function pagination(){
		var req_num_row=8;
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
 });
	/* 페이징처리 E */
    
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
                  
					<div class="d-sm-flex justify-content-between mb-4">
                     <p class="card-description">
                       	 거래처 상세
                     </p>
		            
		                   <button type="button" class="btn btn-outline-facebook btn-rounded btn-icon-text" id="client_print" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
		                    		  거래처 상세 출력<i class="ti-printer btn-icon-append"></i>
		                	 </button>  
		            
              		</div>
              <div class="table-responsive">
                    <table class="table table-bordered" style="font-family: 'IBM Plex Sans KR', sans-serif;">
                    <thead>
                    </thead>
                    <tbody>
                        <tr>
                          <th class="table-light">거래처 번호</th>
                          	<td>${dto.client_id }</td>
                          	                        
                          <th class="table-light">거래처 명</th>
                          	<td>${dto.cl_name }</td>
                        </tr>
                        
                        <tr>
                          <th class="table-light">대표자명</th>
                          	<td>${dto.ceo_name }</td>
                          	
                          <th class="table-light">구분</th>
                          	<td>${dto.cl_type }</td>                           	
                        </tr>
                        
                        <tr>
                          <th class="table-light">거래처 주소</th>
                          	<td>${dto.cl_address }, ${dto.cl_detail_address }</td>
                          	
                          <th class="table-light">거래처 연락처</th>
                          	<td>${dto.cl_phone }</td>                           	                         	
                        </tr>  
                        
                        <tr>
                          <th class="table-light">등록일</th>
                          	<td><fmt:formatDate value="${dto.cl_register_date}" pattern="yyyy-MM-dd" /></td>
                          	
                          <th class="table-light">사업자 번호</th>
                          	<td>${dto.register_num }</td>                           	
                        </tr>
					</tbody>
                    </table>
                <div class="btn-group mt-3">
	                <button type="button" class="btn btn-outline-warning btn-text-icon btn-fw" id="client_update" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
	                     <i class="mdi mdi-lead-pencil btn-icon-preppend"></i> 수정
	                  </button>
	                  <button type="button" class="btn btn-outline-danger btn-text-icon btn-fw" id="client_delete" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
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
