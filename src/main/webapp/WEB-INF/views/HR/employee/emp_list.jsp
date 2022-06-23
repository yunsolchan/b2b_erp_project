<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>인사카드 목록</title>
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
	th i, #input-form { float: right; }
		
	/* 페이징 css S */	
	.pagination {
	    display: flex;
	    padding-left: 0;
	    list-style: none;
	    justify-content: center;
	}
	a {
	    color: black;
	    text-decoration: none;
	    cursor: pointer;
	}
	.disabled{
	    display :none;
	}
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
	        $("#emp_list > tbody > tr").hide();
	        var temp = $("#emp_list > tbody > tr > td:contains('" + k + "')");
	        $(temp).parent().show();
		}); 
		/* 검색기능 E */
		
		
	});
	
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
	
		$(function(){
			// tr태그 클릭 시 거래처 상세페이지 접근 이벤트 생성
			$('#emp_list tr td').click(function(){
				var click = $(this);
		         var tr = click.parent();
		         var td = tr.children();
			    
				// 사원상세 
				window.location="${path}/emp_detail.hj?employee_id=" + td.eq(0).text();
			});
		});
		
		// 사원추가 open
		function emp_insert() {
			var url = "${path}/emp_insert.hj";
			window.open(url, "emp_insert", "menubar=no, width=1000px, height=800px");  // (url, "별칭", size);
			
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
	      	<h2 style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;  padding: 2% 0;">
	           	인사관리
	        </h2>
	    </div>
          <div class="row col-lg-11">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">인사관리</h3>
                  <div class="d-sm-flex justify-content-between mb-4">
                     <p class="card-description">
                     	인사카드 목록
                  	</p>
                  	<div id="input-form">
                  	<div class="d-sm-flex">
                  		<i class="icon-search text-primary pt-1 pe-2 fw-bold fs-5"></i>
				  		<input type="text" id="keyword" class="form-control" placeholder="SEARCH" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;" />
				  </div>
				  </div>
				  </div>
				  <div class="table-responsive">
                    <table class="table table-hover" id="emp_list" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
                      <thead>
                        <tr class="table-secondary">
                          <th>사번<i class="mdi mdi-swap-vertical"></i></th>
                          <th>이름<i class="mdi mdi-swap-vertical"></i></th>
                          <th>전화번호<i class="mdi mdi-swap-vertical"></i></th>
                          <th>이메일<i class="mdi mdi-swap-vertical"></i></th>
                          <th>입사일<i class="mdi mdi-swap-vertical"></i></th>
                          <th>부서명<i class="mdi mdi-swap-vertical"></i></th>
                          <th>직위<i class="mdi mdi-swap-vertical"></i></th>
                          <th>상태<i class="mdi mdi-swap-vertical"></i></th>
                        </tr>
                      </thead>
                      <tbody>
	                      <c:forEach var="dto" items="${list}">
	                        <tr>
	                          <td>${dto.employee_id}</td>
	                          <td>${dto.em_name}</td>
	                          <td>${dto.em_phone}</td>
	                          <td>${dto.em_email}</td>
	                          <td><fmt:formatDate value="${dto.hire_date}" pattern="yyyy-MM-dd" /></td>
	                          <td>${dto.de_name}</td>
	                          <td>${dto.po_name}</td>
	                          <td>
	                          	<c:if test="${dto.em_status eq '재직'}">
	                         		<label class="badge badge-warning">
	                         			${dto.em_status}
	                         		</label>
	                         	</c:if>
	                         	<c:if test="${dto.em_status eq '휴직'}">
	                         		<label class="badge badge-danger">
	                         			${dto.em_status}
	                         		</label>
	                         	</c:if>
	                          </td>
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
                   <button type="button" class="btn btn-rounded btn-outline-twitter btn-fw" onclick="emp_insert()" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
                    	인사카드추가
                  </button>
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
      <!-- main-panel ends -->
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

