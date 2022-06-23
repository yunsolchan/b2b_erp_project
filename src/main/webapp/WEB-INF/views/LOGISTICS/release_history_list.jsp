<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>출고내역  </title>
<style>
	th i, #input-form { float: right; }
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
   /* 오름-내림차순 정렬 기능 S */
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
</script>
</head>
<body>
           <table class="table table-hover" id="release_history_list" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
             <thead>
               <tr class="table-secondary">
                 <th>요청코드 <i class="mdi mdi-swap-vertical"></i></th>
                 <th>수량 <i class="mdi mdi-swap-vertical"></i></th>
                 <th>구매처 <i class="mdi mdi-swap-vertical"></i></th>
                 <th>출고완료일 <i class="mdi mdi-swap-vertical"></i></th>
                 <th>출고창고 <i class="mdi mdi-swap-vertical"></i></th>
               </tr>
             </thead>
             <tbody>
             <c:forEach var="release_history" items="${list}">
               <tr>
                 <td>${release_history.request_id}</td>
                 <td>${release_history.re_qty}</td>
                 <td>${release_history.cl_name}</td>
                 <td><fmt:formatDate value="${release_history.outbound_date}" pattern="yyyy-MM-dd" /></td>
                 <td>
                 <label class="badge badge-warning" id="list_name" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
                 ${release_history.wa_name}
                 </label>
                 </td>
               </tr>
               </c:forEach>           
                </tbody>
		   		 <tfoot>
					<tr>
					   <th colspan="5">
					      <ul class="pagination" style="font-size: 16px; align-content:center;"></ul>
					   </th>
					</tr>
				</tfoot>                
              </table> 
</body>

</html>

