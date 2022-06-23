<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>창고목록 </title>
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
        $("#warehouse_detail > tbody > tr").hide();
        var temp = $("#warehouse_detail > tbody > tr > td:contains('" + k + "')");
        $(temp).parent().show();
	}); 
	/* 검색기능 E */
	
	/* 페이징처리 S */
	/* 페이징처리 E */
});

   $(function(){
	      $('#warehouse_detail tr td').click(function(){
	    	  $('#warehouse_detail_table').css("display","block");
	    	 	 var click = $(this);
				var tr = click.parent();
				var td = tr.children();
		         var code = td.eq(0).text();
		         /*
		         var tdArr = new Array();   // 클릭한 tr의 요소를 담을 배열선언
		         
		         // tdArr에 값 입력
		         td.each(function(i){
		            tdArr.push(td.eq(i).text());
		         });
		         */
		         warehouse_detail(code);
	      });
      $("#warehouse_insert").click(function(){
    	  warehouse_insert();
      });
   });
   
 	// 창고등록 팝업 
    function warehouse_insert() {
       var url = "${path}/warehouse_insert.dh";
       window.open(url, "warehouse_insert", "menubar=no, width=600px, height=800px");  // (url, "별칭", size);  
    }
 	
</script> 
</head>

<body>
	 <div class="d-sm-flex justify-content-between mb-4">
                     <p class="card-description">
                        창고 목록
                     </p>
                     <div id="input-form">
                     <div class="d-sm-flex">
                        <i class="icon-search text-primary pt-1 pe-2 fw-bold fs-5"></i>
                    <input type="text" id="keyword" class="form-control" placeholder="SEARCH" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;" />
              </div>
              </div>
              </div>
      <div class="table-responsive" id="warehouse_list_table">
        <table class="table table-hover" id="warehouse_detail" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
          <thead>
            <tr class="table-secondary">
           	  <th>창고ID<i class="mdi mdi-swap-vertical"></i></th>
              <th>창고명<i class="mdi mdi-swap-vertical"></i></th>
              <th>사용용적<i class="mdi mdi-swap-vertical"></i></th>
              <th>등록일<i class="mdi mdi-swap-vertical"></i></th>
              <th>상태<i class="mdi mdi-swap-vertical"></i></th>
            </tr>
          </thead>
          <tbody>
          <c:forEach var="warehouse" items="${list}">
            <tr>
              <td>${warehouse.wh_id}</td>
              <td>${warehouse.wa_name}</td>
              <td>${warehouse.volume}</td>
              <td>
              	<fmt:formatDate value="${warehouse.wa_reg_date}" pattern="yyyy-MM-dd" />
              </td>
              <td>${warehouse.wa_status}</td>
            </tr>
           </c:forEach>
          </tbody>
        </table>
        <div class="d-flex justify-content-end mt-3 mb-3">
        	<button type="button" class="btn btn-rounded btn-outline-twitter btn-text-icon btn-fw" id="warehouse_insert" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
        		<i class="mdi mdi-library-plus"></i>
        		창고등록
        	</button>
        </div>
        </div>
</body>
</html>

