<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>창고목록 </title>
<script type="text/javascript">
   $(function(){
	      $('#warehouse_detail tr').click(function(){
	    	  $('#warehouse_detail_table').css("display","block");
		         var tr = $(this);   // 현재 클릭한 tr
		         var td = tr.children();   // 클릭한 tr의 요소(td)
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
	  <div class="d-sm-flex justify-content-between">
           <p class="card-description">창고목록</p>
           <button type="button" class="btn btn-outline-primary btn-sm ms-4 mb-3" id="warehouse_insert">창고등록</button>
      </div> 
      <div class="table-responsive" id="warehouse_list_table">
        <table class="table table-hover" id="warehouse_detail">
          <thead>
            <tr>
           	  <th>창고번호</th>
              <th>창고명</th>
              <th>사용용적</th>
              <th>창고등록일</th>
              <th>창고상태</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach var="warehouse" items="${list}">
            <tr>
              <td>${warehouse.wh_id}</td>
              <td style="cursor:pointer"><a class="nav-link" data-bs-toggle="collapse" href="#warehouse_detail_table">${warehouse.wa_name}</a></td>
              <td>${warehouse.volume}</td>
              <td>${warehouse.wa_reg_date}</td>
              <td>${warehouse.wa_status}</td>
            </tr>
           </c:forEach>
          </tbody>
        <%--      <div>
			<td colspan="5" style="text-align: center">
			<!-- 페이징 처리 -->
			<!-- 이전버튼 활성화 여부 -->
			<c:if test="${paging.startPage > 10}">
			<a href="${path}/warehouse_list.dh?pageNum=${paging.prev}">[이전]</a>
			</c:if>
			
			<!-- 페이지번호 처리 -->
			<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
			<a href="${path}/warehouse_list.dh?pageNum=${num}">${num}</a>
			</c:forEach>
			
			<!-- 다음 버튼 활성화 여부 -->
			<c:if test="${paging.endPage < paging.pageCount}">
			<a href="${path}/warehouse_list.dh?pageNum=${paging.next}">[다음]</a>
			</c:if>
			</td>
		</div> --%>
        </table>
        </div>
</body>

</html>

