<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>request_list</title>
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
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/team_one/resources/css/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/team_one/resources/css/images/favicon.png" />
  <style type="text/css">
     h2 { text-align: center; padding: 2% 0;}
     
     input::-webkit-inner-spin-button{
       display: none;
       }
     ul{
         list-style:none;
         padding-left:0px;
         margin: 0px;
         font-size: 0px;
      }
  </style>
</head>
<body>
	
<c:if test="${empty list}">
<script type="text/javascript">
	   swal("거래내역이 존재하지 않습니다", {
	       icon: "error" 
	     })
	     .then((willDelete) => {
	     });
	   </script>
</c:if>
<c:if test="${!empty list}">
<div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">주문서 내역 목록</h3>
                  <div class="card">
          <div class="card-body">
            <form class="forms-sample" name= "joinform" method="post" >
            <div id="result">
              <div class="form-group">
               <table class="table table-hover" id="request_list2" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">
                     <thead>
                     <tr class="table-secondary">
                        <th>상품명</th>
                        <th>카테고리</th>
                        <th>구매가</th>
                        <th>구메수량</th>
                        <th>합계</th>
                        <th>주문날짜</th>
                     </tr>
                     </thead>
                     <tbody>
                  <c:forEach var="dto" items="${list }">               
                     <tr>
                        <td>${dto.pr_name }</td>
                        <td>${dto.category }</td>
                        <td>${dto.price }</td>
                        <td>${dto.re_qty }</td>
                        <td>${dto.re_qty * dto.price }</td>
                        <td><fmt:formatDate value="${dto.begin_date}" pattern="yyyy-MM-dd" /></td>
                     </tr>
                     </c:forEach>   
               	</tbody>
               </table>
            
           </div>
         </div>         
            </form>
          </div>
        </div>
   </div>
   </div>
    </div>
       <%@ include file="/WEB-INF/views/MENU/footer.jsp" %>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
</c:if>
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