<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>출하지시목록  </title>
  
<script type="text/javascript">
$(function(){
    // tr태그 클릭 시 거래처 상세페이지 접근 이벤트 생성
    $('#deliver_indicate_list tr td').click(function(){
       var click = $(this);
       var tr = click.parent();
       var td = tr.children();
  
      var url="${path}/deliver_indicate.dh?request_id="+ td.eq(0).text();
      
      window.open(url, "deliver_indicate", "menubar=no, width=1500px, height=700px");  // (url, "별칭", size);
    });
 }); 
</script>
<!--  <script type="text/javascript">
   $(function(){
      $("#deliver_indicate").click(function(){
    	  deliver_indicate();
      });
   });
   
    //  출하지시 팝업
    function deliver_indicate() {
       var url = "${path}/deliver_indicate.dh";
       window.open(url, "deliver_indicate", "menubar=no, width=600px, height=800px");  // (url, "별칭", size);  
    }
</script>  -->
</head>
<body>
        <p class="card-description">
         		 출하지시목록
        </p>
        <div class="table-responsive">
          <table class="table table-hover" id="deliver_indicate_list">
             <thead>
                <tr>
                  <th>요청코드</th>
                  <th>구매처</th>
                  <th>요청일</th>
                  <th>출하예정일</th>
                  <th>출하예정창고</th>
                  <th>품목수</th>
                  <th>출하지시</th>
                </tr>
              </thead>
              <tbody>
               <c:forEach var="deliver" items="${list}">
                <tr>
                  <td>${deliver.request_id}</td>
                  <td>${deliver.cl_name}</td>
                  <td><fmt:formatDate value="${deliver.begin_date}" pattern="yyyy-MM-dd" /></td>
                  <td><fmt:formatDate value="${deliver.outbound_date}" pattern="yyyy-MM-dd" /></td>
                  <td>${deliver.wa_name}</td>
                  <td>${deliver.re_qty}</td>
                  <td id="arrival_indicate" style="cursor:pointer">${deliver.re_status}</td>
                </tr>
                </c:forEach>
            </tbody>
          </table>
  	</div>     
</body>

</html>

