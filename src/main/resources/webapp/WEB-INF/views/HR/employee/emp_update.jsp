<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>인사카드추가</title>
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
  <link rel="stylesheet" href="/team_one/resources/css/vendors/select2/select2.min.css">
  <link rel="stylesheet" href="/team_one/resources/css/vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
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
<script src="https://unpkg.com/vue@2.6.6/dist/vue.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
/** 우편번호 찾기 */
function execDaumPostcode() {
    daum.postcode.load(function(){
        new daum.Postcode({
            oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            	document.querySelector("#zip_code").value = data.zonecode;
            	document.querySelector("#address").value =  data.address;
            }
        }).open();
    });
}
</script>
<script>
</script>  
</head>
<body>
	<h2>인사카드수정</h2>
		
		<div class="card">
          <div class="card-body">
            <h4 class="card-title">제목1</h4>
            
            <p class="card-description">제목2</p>
            <form class="forms-sample" name= "joinform" method="post" enctype="Multipart/form-data" action="emp_update_action.hj?${_csrf.parameterName}=${_csrf.token}">
            <div id="result">
	     	  	<input type="hidden" name="hiddenPhoto" value="${dto.photo}">
              <!-- 사진 -->
              <div class="form-group">
                <label><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;사진</label>
                <div v-for="item in fileList"><img v-bind:src="item.url" style='height:200px;width:180px;'></div>
                <input type="file" class="file-upload-default" id='uploadFile' name="photo" accept="image/*" value="${dto.photo}">
                <div class="input-group col-xs-12">
                  <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image">
                  <span class="input-group-append">
                    <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                  </span>
                </div>
              </div>	

	          <!-- 이름 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;이름</label>
                <input type="text" class="form-control" id="exampleInputName1" name="name" value="${dto.em_name}" />
              </div>
              
              <!-- 사번 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;사번</label>
                <input type="text" class="form-control" id="exampleInputName1" name="employee_id" value="${dto.employee_id}" />
              </div>
              
              <!-- 연락처 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;연락처</label>
                <div class="col-sm-3 row" style="flex-wrap: nowrap; padding-left: 1%;">
	                <c:if test="${dto.em_phone != null}">
						<c:set var="phone_arr" value="${fn:split(dto.em_phone,'-')}" />
			                <input type="text" class="form-control" size="3" name="phone1" value="${phone_arr[0]}" /> 
			       			&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
			          		<input type="text" class="form-control" size="4" name="phone2" value="${phone_arr[1]}" />
			          		&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
			          		<input type="text" class="form-control" size="4" name="phone3" value="${phone_arr[2]}" />
		          	</c:if>
          		</div>
              </div>
	            
	          <!-- 주민등록번호 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;주민등록번호</label>
                  <div class="col-sm-3 row" style="flex-wrap: nowrap; padding-left: 1%;">
	                <c:if test="${dto.register_number != null}">
						<c:set var="regi_arr" value="${fn:split(dto.register_number,'-')}" />
		           			<input type="text" class="form-control" size="1" name="regi_num1" value="${regi_arr[0]}" /> 
		           			&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
		              		<input type="password" class="form-control" size="1" name="regi_num2" value="${regi_arr[1]}" />
              		</c:if>
                 </div>
              </div>
              
              <!-- 이메일 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;이메일</label>
                <input type="email" class="form-control" id="exampleInputName1" name="email" value="${dto.em_email}" />
              </div>
              
                <!-- 부서명 -->
	            <div class="form-group">
	              <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;부서명</label>
	              <select class="js-example-basic-single form-control" name="department_id">
	              <c:forEach var="dto1" items="${list}">
	                <option <c:if test="${dto.department_id == dto1.department_id}">selected</c:if> value="${dto1.department_id}">${dto1.de_name}</option>
	              </c:forEach>
	              </select>
	            </div>
              
                <!-- 직급 -->
	            <div class="form-group">
	              <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;직급</label>
	              <select class="js-example-basic-single form-control" name="position_id">
	              <c:forEach var="dto2" items="${list2}">
	                <option <c:if test="${dto.position_id == dto2.position_id}">selected</c:if> value="${dto2.position_id}">${dto2.po_name}</option>
	              </c:forEach>
	              </select>
	            </div>
              
              <!-- 우편번호 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;우편번호</label>
                	<div class="col-sm-2 row" style="flex-wrap: nowrap; padding-left: 1%;">
		                <input type="text" class="form-control" id="zip_code" name="zip_code" value="${dto.em_zip_code}" readonly />
		                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                <div style="width:20%">
		                <button type="button" onclick="execDaumPostcode()" class="button btn btn-secondary"><i class="icon-search"></i></button>
		                </div>
              		</div>
              </div>
              
              <!-- 주소 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;주소</label>
                <input type="text" class="form-control" size="auto" id="address" name="address" value="${dto.em_address}" />
              </div>
              
              <!-- 상세주소 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;상세주소</label>
                <input type="text" class="form-control" size="auto" id="detail_address" name="detail_address" value="${dto.em_detail_address}" />
              </div>
              
              <!-- 연봉 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;연봉</label>
                <input type="number" class="form-control" name="salary" min="0" max="999999999" value="${dto.salary}" />
              </div>
              
              <!-- 휴가일수 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;휴가일수</label>
                <input type="number" class="form-control" name="annual_count"value="${dto.annual_count}" />
              </div>
              
	           <!-- 권한 -->
	           <div class="form-group">
	             <label><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;권한</label>
	             <select class="js-example-basic-single form-control" name="authority">
	               <option <c:if test="${dto.authority == 'ROLE_HR'}">selected</c:if> value="ROLE_HR">인사업무</option>
	               <option <c:if test="${dto.authority == 'ROLE_FINANCE'}">selected</c:if> value="ROLE_FINANCE">회계업무</option>
	               <option <c:if test="${dto.authority == 'ROLE_USER'}">selected</c:if> value="ROLE_USER">영업/구매/물류업무</option>
	             </select>
	           </div>
              
              <button type="submit" class="btn btn-primary me-2">Submit</button>
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
            
<!-- plugins:js -->
  <script src="/team_one/resources/css/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="/team_one/resources/css/vendors/chart.js/Chart.min.js"></script>
  <script src="/team_one/resources/css/vendors/select2/select2.min.js"></script>
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
  <script src="/team_one/resources/css/js/file-upload.js"></script>
  <script src="/team_one/resources/css/js/dashboard.js"></script>
  <script src="/team_one/resources/css/js/Chart.roundedBarCharts.js"></script>
  <script src="/team_one/resources/css/js/select2.js"></script>
  <!-- End custom js for this page-->
</body>
</html>