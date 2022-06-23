<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<title>매입/매출 리스트</title>

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
	
		$('#purchase_all_list tr td').click(function(){
			var click = $(this);
			var tr = click.parent();
			var td = tr.children();
			/*
			var tdArr = new Array();	// 클릭한 tr의 요소를 담을 배열선언
			
			// tdArr에 값 입력
			td.each(function(i){
				tdArr.push(td.eq(i).text());
			});
			*/
			window.location="${path}/purchase_detail.mh?sale_slip_id="+ td.eq(0).text();
		});
	</script>
</head>
<body>
<!-- 매입/매출장 목록 -->
	<table id="purchase_all_list" class="table table-hover" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">
		<thead>
			<tr class="table-secondary">
				<th>전표번호<i class="mdi mdi-swap-vertical"></i></th>
				<th>계정과목<i class="mdi mdi-swap-vertical"></i></th>
				<th>거래처<i class="mdi mdi-swap-vertical"></i></th>
				<th>적요<i class="mdi mdi-swap-vertical"></i></th>
				<th>공급가액<i class="mdi mdi-swap-vertical"></i></th>
				<th>세액<i class="mdi mdi-swap-vertical"></i></th>
				<th>합계액<i class="mdi mdi-swap-vertical"></i></th>
				<th>발행일자<i class="mdi mdi-swap-vertical"></i></th>
				<th>승인일자<i class="mdi mdi-swap-vertical"></i></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${purchase_list}">
				<tr>
					<td>${i.sale_slip_id}</td>
					<td>
						<c:if test="${i.sa_type eq '매출'}">
							<label class="badge badge-primary" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
								${i.sa_account_title}${i.sa_type}
							</label>
						</c:if>
						<c:if test="${i.sa_type eq '매입'}">
							<label class="badge badge-warning" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
								${i.sa_account_title}${i.sa_type}
							</label>
						</c:if>
					</td>
					<td>${i.cl_name}</td>
					<td>${i.sa_abstract}</td>
					<td>
						<c:set var="supply" value="${i.supply_amount}"/>
						<c:set var="tax" value="${i.tax_amount}"/>
						<c:set var="total" value="${supply + tax}"/>
						${supply}
					</td>
					<td>${tax}</td>
					<c:if test="${i.sa_type eq '매출'}">
						<td class="text-info">
							${total}
							<i class="ti-arrow-up"></i>
						</td>
					</c:if>
					<c:if test="${i.sa_type eq '매입'}">
						<td class="text-danger">
							${total}
							<i class="ti-arrow-down"></i>
						</td>
					</c:if>
					<td>
						<fmt:formatDate pattern="yyyy- MM-dd" value="${i.sl_register_date}" />
					</td>
					<c:if test="${i.state eq '승인'}">
						<td>
							<label class="badge badge-success" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
								<fmt:formatDate pattern="yyyy- MM-dd" value="${i.update_date}" />
							</label>
						</td>
					</c:if>
					<c:if test="${i.state eq '신청'}">
						<td>
							<label class="badge badge-danger" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
								승인대기
							</label>
						</td>
					</c:if>
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
</body>
</html>

