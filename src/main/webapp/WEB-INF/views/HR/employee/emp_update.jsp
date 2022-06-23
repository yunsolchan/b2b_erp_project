<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>인사카드 수정</title>
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
     	
  	.button {
  		padding: 7px 7px;
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

function numberMaxLength(e){
   if(e.value.length > e.maxLength){
      e.value = e.value.slice(0, e.maxLength);
   }
}
</script>
<script>
</script>  
</head>
<body>
<div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">인사카드 수정</h3>
                  <p class="card-description">
                   		 인사정보 입력
                  </p>
      <div class="card">
          <div class="card-body">
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
                  
                  <div class="input-group-append" style="margin-left:10px;">
                    <button class="file-upload-browse btn btn-outline-facebook btn-rounded" type="button" style="padding: 9px 8px; margin-left:5px; font-family: 'IBM Plex Sans KR', sans-serif; font-weight:bold;">Upload</button>
                  </div>
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
                <div class="col-sm-3 row ms-3" style="flex-wrap: nowrap;">
                   <c:if test="${dto.em_phone != null}">
                  <c:set var="phone_arr" value="${fn:split(dto.em_phone,'-')}" />
                         <input type="number" class="form-control" maxlength="3" oninput="numberMaxLength(this);" name="phone1" value="${phone_arr[0]}" /> 
                         &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
                         <input type="number" class="form-control" maxlength="3" oninput="numberMaxLength(this);" name="phone2" value="${phone_arr[1]}" />
                         &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
                         <input type="number" class="form-control" maxlength="4" oninput="numberMaxLength(this);" name="phone3" value="${phone_arr[2]}" />
                   </c:if>
                </div>
              </div>
               
             <!-- 주민등록번호 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;주민등록번호</label>
                  <div class="col-sm-3 row ms-3" style="flex-wrap: nowrap;">
                   <c:if test="${dto.register_number != null}">
                  <c:set var="regi_arr" value="${fn:split(dto.register_number,'-')}" />
                          <input type="number" class="form-control" maxlength="6" oninput="numberMaxLength(this);" name="regi_num1" value="${regi_arr[0]}" /> 
                          &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
                          <input type="password" class="form-control" maxlength="7" oninput="numberMaxLength(this);" name="regi_num2" value="${regi_arr[1]}" />
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
                      <input type="number" class="form-control ms-2" id="zip_code" name="zip_code" value="${dto.em_zip_code}" readonly />
                      
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
                <input type="number" class="form-control" name="salary" maxlength="9" oninput="numberMaxLength(this);" value="${dto.salary}" />
              </div>
              
              <!-- 휴가일수 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;휴가일수</label>
                <input type="number" class="form-control" maxlength="5" oninput="numberMaxLength(this);" name="annual_count"value="${dto.annual_count}" />
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
              
              <!-- 재직상태 -->
              <div class="form-group">
                <label><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;재직상태</label>
                <select class="js-example-basic-single form-control" name="status">
                  <option value="재직">재직</option>
                  <option value="휴직">휴직</option>
                  <option value="퇴직">퇴직</option>
                </select>
              </div>
              <div class="d-sm-flex justify-content-between form-group">
              <button class="btn btn-outline-light btn-rounded me-2" onClick="window.close()" style="width:45%; font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">초기화</button>
              <button type="submit" class="btn btn-outline-twitter btn-rounded ms-2" style="width:45%; font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">정보수정</button>
              </div>
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