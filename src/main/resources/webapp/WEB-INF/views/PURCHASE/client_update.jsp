<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>client_update</title>
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
  <style type="text/css">
     h2 { text-align: center; padding: 2% 0;}
     
     input::-webkit-inner-spin-button{
       display: none;
   }
  </style>
</head>
<body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
function rowAdd() {
    var trCnt = $('#client_table tr').length;
    if(trCnt < 11){
        var innerHtml = "";
        innerHtml += '<tr>';
        innerHtml += '    <td><input type="text" class="form-control" size="auto" id="product_name" name="product_name" required /></td>';
        innerHtml += '    <td><input type="text" class="form-control" size="auto" id="product_name" name="product_name" required /></td>';
        innerHtml += '    <td><input type="text" class="form-control" size="auto" id="product_name" name="product_name" required /></td>';
        innerHtml += '</tr>';
        
        $('#client_table > tbody:last').append(innerHtml);
    }else{
        alert("최대 10개까지만 가능합니다.");
        return false;
    }
}
function rowDelete(){
    var trCnt = $('#client_table tr').length;
    if(trCnt>2){
        $('#client_table > tbody:last > tr:last').remove();
    }else{
        return false;
    }
}
   $(function(){
      $("#client_insert_action").click(function(){
         window.location="${path}/client_insert_action.sc";
      });
   });
   
   
   

</script>
<c:if test="${updateCnt == 1}">
	<script type="text/javascript">
	   swal("거래처 수정이 정상적으로 완료됐습니다!", {
	       icon: "success" 
	     })
	     .then((willDelete) => {
	        opener.document.location.reload();
	        self.close();
	     });
	   </script>
   </c:if>

<div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">거래처 수정</h3>
                  <p class="card-description">
                         수정할 정보 입력
                  </p>
                  <div class="card">
          <div class="card-body">
          
            <form class="forms-sample" name= "joinform" method="post" action="client_update_action.sc?${_csrf.parameterName}=${_csrf.token}">
            <input type="hidden" name="client_id" value="${dto.client_id}">
            <div id="result">

             <!-- 이름 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;거래처명</label>
                <input type="text" class="form-control" id="exampleInputName1" name="client_name" value="${dto.cl_name}"required />
              </div>
              
             <!-- 이름 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;대표자</label>
                <input type="text" class="form-control" id="exampleInputName1" name="ceo_name" value="${dto.cl_name}" required />
              </div>   
              
              <!-- 이메일 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;거래처 이메일</label>
                <input type="email" class="form-control" id="exampleInputName1" name="client_email" value="${dto.cl_email}"required />
              </div>
              
              <!-- 우편번호 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;우편번호</label>
                   <div class="col-sm-2 row" style="flex-wrap: nowrap; padding-left: 1%;">
                      <input type="text" class="form-control" id="zip_code" name="zip_code" value="${dto.cl_zip_code}"required readonly />
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <div style="width:20%">
                      <button type="button" onclick="execDaumPostcode()" class="button btn btn-secondary"><i class="icon-search"></i></button>
                      </div>
                    </div>
              </div>
              
              <!-- 주소 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;거래처 주소</label>
                <input type="text" class="form-control" size="auto" id="address" name="address" value="${dto.cl_address}" required />
              </div>
              
              <!-- 상세주소 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;상세주소</label>
                <input type="text" class="form-control" size="auto" id="detail_address" name="detail_address" value="${dto.cl_detail_address}" required />
              </div>
              
              <!-- 연락처 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;사업자 번호</label>
                <div class="col-sm-3 row" style="flex-wrap: nowrap; padding-left: 1%;">
                   <input type="text" class="form-control" size="3" name="num1" value="${fn:substring(dto.register_num,0,2)}" required /> 
                   &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
                   <input type="text" class="form-control" size="2" name="num2" value="${fn:substring(dto.register_num,3,4)}" required />
                   &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
                   <input type="text" class="form-control" size="5" name="num3" value="${fn:substring(dto.register_num,5,9)}" required />
                </div>
              </div>
              
              <!-- 연락처 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;거래처 연락처</label>
                <div class="col-sm-3 row" style="flex-wrap: nowrap; padding-left: 1%;">
                   <input type="text" class="form-control" size="3" name="phone1" value="${fn:substring(dto.cl_phone,0,2)}" required /> 
                   &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
                   <input type="text" class="form-control" size="4" name="phone2" value="${fn:substring(dto.cl_phone,3,6)}" required />
                   &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
                   <input type="text" class="form-control" size="4" name="phone3" value="${fn:substring(dto.cl_phone,7,10)}" required />
                </div>
              </div>      
              <div class="form-group">
              <button type="button" class="btn btn-primary me-2"  onclick="rowAdd();">항목 추가</button>
			  <button type="button" class="btn btn-light" onclick="rowDelete();">항목 삭제</button>
              	<table class="table" id="client_table">
              		<tr>
              			<th align="center">품목명</th>
              			<th align="center">상품종류</th>
              			<th align="center">상품가격</th>
              		</tr>
              		<c:forEach var="dtop" items="${list}">
              		<tr>
              		    
              			<td><input type="text" class="form-control" size="auto" id="product_name" name="product_name" value="${dtop.pr_name }" required />
              			<input type="hidden" class="form-control" size="auto" id="product_id" name="product_id" value="${dtop.product_id}" required />
              			</td>
              			<td><input type="text" class="form-control" size="auto" id="product_category" name="product_category" value="${dtop.category }" required /></td>
              			<td><input type="text" class="form-control" size="auto" id="product_price" name="product_price" value="${dtop.cost }" required /></td>
              		</tr>
              	    </c:forEach>
              		
              	</table>
              </div>        
               
              <button type="submit" class="btn btn-primary me-2" id="">Submit</button>
              <button class="btn btn-light">Cancel</button>
            </div>
            
            <script>
           var uploadApp = new Vue({
             el: '#result',
             data: {
               fileList: []
             }
           })
           $("#uploadFile").change(function(event){
             console.log($(this)[0].files);
             var files = $(this)[0].files;
             uploadApp.fileList = [];
             $.each(files, function(i, item){
               var fileReader = new FileReader();
               fileReader.onload = function(e){
                 var img = {
                   url: e.target.result,
                   name: item.name,
                   size: item.size
                 };
                 uploadApp.fileList.push(img);
               }
               fileReader.readAsDataURL(item);
             });
           });
         </script>
         
            </form>
          </div>
        </div>
   </div>
   </div>
    </div>
       <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Copyright © 2021. All rights reserved.</span>
          </div>
        </footer>
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
