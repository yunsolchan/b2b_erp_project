<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <title>전체 거래처 목록</title>
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
$(function(){
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
		
		// tr태그 클릭 시 거래처 상세페이지 접근 이벤트 생성
		$('#client_list tr td').click(function(){
			var click = $(this);
			var tr = click.parent();
			var td = tr.children();
			// var tr = $(this);	// 현재 클릭한 tr
			// var td = tr.children();	// 클릭한 tr의 요소(td)
			/*
			var tdArr = new Array();	// 클릭한 tr의 요소를 담을 배열선언
			
			// tdArr에 값 입력
			td.each(function(i){
				tdArr.push(td.eq(i).text());
			});
			*/
			window.location="${path}/client_transaction.mh?client_id="+ td.eq(0).text();
			
			// var client_id = td.eq(0).text();
			// client_transaction(client_id);
		});
		
		
	/* function client_transaction(client_id){
		$.ajax({
			type: "post",
			url: "${path}/client_transaction.mh?${_csrf.parameterName}=${_csrf.token}&client_id=" + client_id,
			success: function(result){	
				$('#client_transaction').html(result);
			},
			error: function(){
				alert("table ajax 오류");
			}
		});
	} */
		/* $("#client_transaction").click(function(){
			window.location="${path}/client_transaction.mh";
		}); */
});

/* 페이징처리 S */
function pagination(){
	var req_num_row=8;
	var $tr=jQuery('tbody tr');
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

	  jQuery('.pagination').append("<li style='margin:10px'><a class='prev'><i class='mdi mdi-step-backward'></i></a></li>");

	      for(var i=1; i<=num_pages; i++){
	          jQuery('.pagination').append("<li style='margin:10px'><a>"+i+"</a></li>");
	    jQuery('.pagination li:nth-child(2)').addClass("active");
	    jQuery('.pagination a').addClass("pagination-link2");
	      }

	  jQuery('.pagination').append("<li style='margin:10px'><a class='next'><i class='mdi mdi-step-forward'></i></a></li>");

	      $tr.each(function(i){
	    jQuery(this).hide();
	    if(i+1 <= req_num_row){
	              $tr.eq(i).show();
	          }
	      });

	      jQuery('.pagination a').click('.pagination-link2', function(e){
	          e.preventDefault();
	          $tr.hide();
	          var page=jQuery(this).text();
	          var temp=page-1;
	          var start=temp*req_num_row;
	    var current_link = temp;
	    
	    jQuery('.pagination li').removeClass("active");
	          jQuery(this).parent().addClass("active");
	  
	          for(var i=0; i< req_num_row; i++){
	              $tr.eq(start+i).show();
	          }
	    
	    if(temp >= 1){
	      jQuery('.pagination li:first-child').removeClass("disabled");
	    }
	    else {
	      jQuery('.pagination li:first-child').addClass("disabled");
	    }
	          
	      });

	  jQuery('.prev').click(function(e){
	      e.preventDefault();
	      jQuery('.pagination li:first-child').removeClass("active");
	  });

	  jQuery('.next').click(function(e){
	      e.preventDefault();
	      jQuery('.pagination li:last-child').removeClass("active");
	  });

	  }

	jQuery('document').ready(function(){
	  pagination();

	jQuery('.pagination li:first-child').addClass("disabled");

	});
/* 페이징처리 E */
	
</script>
<!-- 거래처거래내역 리스트 -->
	<!-- <div class="content"> -->
	<div class="main-panel">
        <div class="content-wrapper" style="padding-top:0;">
        <div class="d-flex flex-row align-items-center">
	      <i class="menu-icon mdi mdi-chart-line icon-lg text-linkedin me-2"></i>
	      	<h2 style="font-family:'IBM Plex Sans KR', sans-serif; font-weight:bold;  padding: 2% 0;">
	                    회계관리
	        </h2>
	    </div>
	<div class="row col-lg-12">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">거래처목록</h3>
                  <div class="d-sm-flex justify-content-between mb-4">
                     <p class="card-description">
                     	전체 거래처목록
                  	</p>
                  	<div id="input-form">
                  	<div class="d-sm-flex">
                  		<i class="icon-search text-primary pt-1 pe-2 fw-bold fs-5"></i>
				  		<input type="text" id="keyword" class="form-control" placeholder="SEARCH" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;" />
				  	</div>
				  </div>
				 </div>
            <div class="table-responsive">
		<table id="client_list" class="table table-hover" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">
			<thead>
				<tr class="table-secondary">
					<th>거래처코드<i class="mdi mdi-swap-vertical"></i></th>
					<th>거래처유형<i class="mdi mdi-swap-vertical"></i></th>
					<th>등록일<i class="mdi mdi-swap-vertical"></i></th>
					<th>거래처명<i class="mdi mdi-swap-vertical"></i></th>
					<th>대표자<i class="mdi mdi-swap-vertical"></i></th>
					<th>사업자등록번호<i class="mdi mdi-swap-vertical"></i></th>
					<th>주소지<i class="mdi mdi-swap-vertical"></i></th>
					<th>전화번호<i class="mdi mdi-swap-vertical"></i></th>
					<th>이메일<i class="mdi mdi-swap-vertical"></i></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" items="${client_list}">
					<tr>
						<td>${i.client_id}</td>
						<td>
							<c:if test="${i.cl_type eq '판매'}">
								<label class="badge badge-warning">
									${i.cl_type}
								</label>
							</c:if>
							<c:if test="${i.cl_type eq '구매'}">
								<label class="badge badge-primary">
									${i.cl_type}
								</label>
							</c:if>
						</td>
						<td>
							<%-- <c:set var="register_date" value="${i.cl_register_date}"/>
							${fn:substring(register_date, 0, 10)} --%>
							<fmt:formatDate pattern="yyyy- MM-dd" value="${i.cl_register_date}" />
						</td>
						<td>${i.cl_name}</td>
						<td>${i.ceo_name}</td>
						<td>${i.register_num}</td>
						<td>${i.cl_address}</td>
						<td>${i.cl_phone}</td>
						<td>${i.cl_email}</td>
					</tr>
					
				</c:forEach>
			</tbody>
		   <tfoot>
			<tr>
			   <th colspan="9" >
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

