<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>salary_specification_list</title>
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
	        $("#salary_specification_list > tbody > tr").hide();
	        var temp = $("#salary_specification_list > tbody > tr > td:contains('" + k + "')");
	        $(temp).parent().show();
		}); 
	});
	
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
	/* 페이징처리 E */

	$(function(){
		$('#salary_specification_list tr td').click(function(){
			var click = $(this);
			var tr = click.parent();
			var td = tr.children();
			var sal_code = "";
			sal_code = td.find('input').val();
			
			var url = "${path}/salary_specification_detail.mh?salary_id="+ sal_code;
			window.open(url, "salary_specification_detail", "menubar=no, width=1000px, height=800px");
		});
	});
</script>
<!-- 급여명세서 목록 -->
<div class="main-panel">
        <div class="content-wrapper" style="padding-top:0;">
        <div class="d-flex flex-row align-items-center">
	      <i class="menu-icon mdi mdi-chart-line icon-lg text-linkedin me-2"></i>
	      	<h2 style="font-family:'IBM Plex Sans KR', sans-serif; font-weight:bold;  padding: 2% 0;">
	                    회계관리
	        </h2>
	    </div>
	<div class="row col-lg-11">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">급여명세서</h3>
                  <div class="d-sm-flex justify-content-between mb-4">
                   	<p class="card-description">
                   		급여명세서 목록
                    </p>
                    <div id="input-form">
	                  	<div class="d-sm-flex">
	                  		<i class="icon-search text-primary pt-1 pe-2 fw-bold fs-5"></i>
					  		<input type="text" id="keyword" class="form-control" placeholder="SEARCH" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;" />
					  	</div>
					  </div>
	               </div>
                  <div class="table-responsive">
					<table id="salary_specification_list" class="table table-hover" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">
						<thead>
							<tr class="table-secondary">
								<th>급여지급연월<i class="mdi mdi-swap-vertical"></i></th>
								<th></th>
								<th>부서명<i class="mdi mdi-swap-vertical"></i></th>
								<th>사원명<i class="mdi mdi-swap-vertical"></i></th>
								<th>지급합계<i class="mdi mdi-swap-vertical"></i></th>
								<th>공제합계<i class="mdi mdi-swap-vertical"></i></th>
								<th>실수령액<i class="mdi mdi-swap-vertical"></i></th>
								<th>송금일자<i class="mdi mdi-swap-vertical"></i></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" items="${specification_list}">
								<tr>
									<td class="text-danger">
										${i.payday}
									</td>
									<td>
										<input type="hidden" value="${i.salary_id}">
									</td>
									<td>${i.de_name}</td>
									<td>${i.em_name}</td>
									<td>${i.basic_salary}</td>
									<td>${i.amount_pay}</td>
									<td>${i.tax}</td>
									<td>
										<label class="badge badge-success" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">
											<fmt:formatDate pattern="yyyy-MM-dd" value="${i.end_date}" />
										</label>
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
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
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

