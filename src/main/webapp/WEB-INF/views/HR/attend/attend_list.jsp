<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>근태목록</title>
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
  });
/* 오름-내림차룬 정렬 기능 E */



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
</head>
<body>
	<div class="table-responsive" >
      <table class="table table-hover" id="attend_list" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
          <thead>
            <tr class="table-secondary">
              <th>사번<i class="mdi mdi-swap-vertical"></i></th>
              <th>이름<i class="mdi mdi-swap-vertical"></i></th>
              <th>시작일<i class="mdi mdi-swap-vertical"></i></th>
              <th>종료일<i class="mdi mdi-swap-vertical"></i></th>
              <th>근태상태<i class="mdi mdi-swap-vertical"></i></th>
            </tr>
          </thead>
          <tbody>
          <c:forEach var="dto" items="${list}">
            <tr>
              <td>${dto.employee_id}</td>
              <td>${dto.em_name}</td>
              <td><fmt:formatDate value="${dto.at_start_date}" pattern="yyyy-MM-dd hh:mm:ss" /></td> 
              <td><fmt:formatDate value="${dto.at_end_date}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
              <td>
               <c:if test="${dto.attendance_status == '조퇴'}"><label class="badge badge-danger">${dto.attendance_status}</label></c:if>
               <c:if test="${dto.attendance_status == '지각'}"><label class="badge badge-danger">${dto.attendance_status}</label></c:if>
               <c:if test="${dto.attendance_status == '출근'}"><label class="badge badge-warning">${dto.attendance_status}</label></c:if>
               <c:if test="${dto.attendance_status == '퇴근'}"><label class="badge badge-success">${dto.attendance_status}</label></c:if>
               <c:if test="${dto.attendance_status == '휴가'}"><label class="badge badge-info">${dto.attendance_status}</label></c:if>
               <c:if test="${dto.attendance_status == '휴가요청'}"><label class="badge badge-danger">${dto.attendance_status}</label></c:if>
               <c:if test="${dto.attendance_status == '출근전'}"><label class="badge badge-danger">${dto.attendance_status}</label></c:if>
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
</body>

</html>

