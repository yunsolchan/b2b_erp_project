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

function numberMaxLength(e){
		if(e.value.length > e.maxLength){
			e.value = e.value.slice(0, e.maxLength);
		}
	}
</script>
<script type="text/javascript">
   $(function(){
	   
	  //사번 및 계화 중복체크 상태표시
      id_check_state();
	  account_check_state();
	  
      /* 사번중복체크 버튼 클릭시  */
      $("#employee_id_check").click(function(){
         // 입력창에 입력된 값 변수에 담기
         var str_employee_id = $("#employee_id").val();
         console.log("사번현재입력된값" + str_employee_id);
        
         // input hidden에 있는 값 변수에 담기 => 중복여부 체크
         var id_submit_check = $("#id_submit_check").val();
         
         if(!str_employee_id){   // 입력된 값이 없을 경우,

            $("#employee_id").focus();   
            $("#id_submit_check").val("0");
            
            id_check_state();
            
            alert("중복확인할 사번을 입력해주세요!");
            return false;
            
         } else { 
        	 console.log("입력된 아이디가 있는 경우 - 중복체크 ajax 진입 ")
            // 중복체크 ajax메서드 => 입력 받은 값을 준다.
            id_check(str_employee_id);
        
            // 화면변경 메서드
            id_check_state();
            return false;
         }
      });
      
      /* 계좌중복체크 버튼 클릭시  */
      $("#employee_account_check").click(function(){
         // 입력창에 입력된 값 변수에 담기
         var str_account_number = $("#account_number").val();
         console.log("계좌현재입력된값" + str_account_number);
        
         // input hidden에 있는 값 변수에 담기 => 중복여부 체크
         var account_submit_check = $("#account_submit_check").val();
         
         if(!str_account_number){   // 입력된 값이 없을 경우,

            $("#account_number").focus();   
            $("#account_submit_check").val("0");
            
            account_check_state();
            
            alert("중복확인할 계좌을 입력해주세요!");
            return false;
            
         } else { 
        	 console.log("입력된 계좌가 있는 경우 - 중복체크 ajax 진입 ")
            // 중복체크 ajax메서드 => 입력 받은 값을 준다.
            account_check(str_account_number);
        
            // 화면변경 메서드
            account_check_state();
            return false;
         }
      });
      
       $("#submit").click(function(){
          // 등록 버튼 제출 메서드
          check_submit();
      });
   });
   
   
   // 사번중복체크 ajax메서드(DB에 있는 값과 비교 후 1, 2로 값 받아오기)
   function id_check(str_employee_id){
      $.ajax({
         // url뒤에 get형식으로 보낼 값 붙여준다.
         url: '${path}/employee_id_check.hj?${_csrf.parameterName}=${_csrf.token}&employee_id=' + str_employee_id,
         type: 'POST',
         data: 'int',
         success: function(result){
            // input hidden에 있는 값 변수에 담기 => 중복여부 체크
            var id_submit_check = $("#id_submit_check").val();
            console.log("ajax 중복체크 된 값 0>중복없음/1>중복 :" + result)
            if(result != 0){   // 만약 db에서 받아온 값이 0이 아닐 경우, count가 0이상일 경우, => 중복된 상태
               // 중복여부 변수에 값을 2로 넣어준다.
               $("#id_submit_check").val("2");
               // 화면 변경 메서드
               id_check_state();
            }
            else{
               // 중복여부 변수에 값을 1로 넣어준다.
               $("#id_submit_check").val("1");
               // 화면 변경 메서드
               id_check_state();
            }
         },
         error: function(){   // error 함수
            alert('AJAX 오류!');
         }
      });
   }
   
   // 계좌중복체크 ajax메서드(DB에 있는 값과 비교 후 1, 2로 값 받아오기)
   function account_check(str_account_number){
      $.ajax({
         // url뒤에 get형식으로 보낼 값 붙여준다.
         url: '${path}/account_submit_check.hj?${_csrf.parameterName}=${_csrf.token}&account_number=' + str_account_number,
         type: 'POST',
         data: 'int',
         success: function(result){
            // input hidden에 있는 값 변수에 담기 => 중복여부 체크
            var account_submit_check = $("#account_submit_check").val();
            console.log("ajax 중복체크 된 값 0>중복없음/1>중복 :" + result)
            if(result != 0){   // 만약 db에서 받아온 값이 0이 아닐 경우, count가 0이상일 경우, => 중복된 상태
               // 중복여부 변수에 값을 2로 넣어준다.
               $("#account_submit_check").val("2");
               // 화면 변경 메서드
               account_check_state();
            }
            else{
               // 중복여부 변수에 값을 1로 넣어준다.
               $("#account_submit_check").val("1");
               // 화면 변경 메서드
               account_check_state();
            }
         },
         error: function(){   // error 함수
            alert('AJAX 오류!');
         }
      });
   }
   
   // 사번 중복체크 상태표시 
   function id_check_state(){
      // input hidden에 있는 값 변수에 담기 => 중복여부 체크
      var id_submit_check = $("#id_submit_check").val();
      console.log("사번 중복체크 상태표시 : " + id_submit_check); 
      
      if(id_submit_check == 2){ // 만약 hidden값이 2일 경우 => 중복일 경우,
         // 뿌려줄 div에 해당 메세지를 띄운다.
         $("#id_check_display").html("<p class='text-warning'><i class='mdi mdi-emoticon-sad'></i>&nbsp;중복된 사번</p>");
      }
      else if(id_submit_check == 1){ // 만약 hidden값이 1일 경우 => 중복이 아닐 경우,
         $("#id_check_display").html("<p class='text-info'><i class='mdi mdi-emoticon-happy'></i>&nbsp;중복확인 완료</p>");
      }
      else{ // 만약 hidden값이 이외 값일 경우 => 초기상태일 경우,
         $("#id_check_display").html("<p class='text-danger'><i class='mdi mdi-emoticon-sad'></i>&nbsp;중복체크가 필요합니다</p>");
      }
   }
   
   // 계좌 중복체크 상태표시 
   function account_check_state(){
      // input hidden에 있는 값 변수에 담기 => 중복여부 체크
      var account_submit_check = $("#account_submit_check").val();
      console.log("계좌 중복체크 상태표시 : " + account_submit_check); 
      
      if(account_submit_check == 2){ // 만약 hidden값이 2일 경우 => 중복일 경우,
         // 뿌려줄 div에 해당 메세지를 띄운다.
         $("#account_check_display").html("<p class='text-warning'><i class='mdi mdi-emoticon-sad'></i>&nbsp;중복된 계좌</p>");
      }
      else if(account_submit_check == 1){ // 만약 hidden값이 1일 경우 => 중복이 아닐 경우,
         $("#account_check_display").html("<p class='text-info'><i class='mdi mdi-emoticon-happy'></i>&nbsp;중복확인 완료 </p>");
      }
      else{ // 만약 hidden값이 이외 값일 경우 => 초기상태일 경우,
         $("#account_check_display").html("<p class='text-danger'><i class='mdi mdi-emoticon-sad'></i>&nbsp;중복체크가 필요합니다</p>");
      }
   }
   
   // 등록 버튼 제출 메서드
   function check_submit(){
      // input hidden에 있는 값 변수에 담기 => 중복여부 체크
      var id_submit_check = $("#id_submit_check").val();
      var account_submit_check = $("#account_submit_check").val();
      
      console.log("등록버튼클릭시 사번중복체크 번호 " + id_submit_check);
      console.log("등록버튼클릭시 계좌중복체크 번호 " + account_submit_check);
     /*  
      // 사번 중복체크 값이 1이  아닌경우
      if(id_submit_check != 1){
         $("#employee_id").focus();
         alert("사번 중복여부를 확인해주세요!");
         return false;
         
      } 
      // 계좌 중복체크 값이 1이  아닌경우
      else if(account_submit_check != 1) {
          $("#account_number").focus();
          alert("계좌번호 중복여부를 확인해주세요!");
          return false; 
      }  
      else{ // 해당 값이 1일 경우,
         // 해당 action경로로
         document.joinform.action="emp_insert_action.hj?${_csrf.parameterName}=${_csrf.token}";
         // submit 제출
         document.joinform.submit();
      } */
    
      //중복체크가 완료된 경우
      if(account_submit_check == 1 && id_submit_check == 1 ) {
          document.joinform.action="emp_insert_action.hj?${_csrf.parameterName}=${_csrf.token}";
          console.log("버그")
          document.joinform.submit();
       
      }
      else if(id_submit_check != 1){
         $("#employee_id").focus();
         alert("사번 중복여부를 확인해주세요!");
         return false;
      } 
      // 계좌 중복체크 값이 1이  아닌경우
      else if(account_submit_check != 1) {
          $("#account_number").focus();
          alert("계좌번호 중복여부를 확인해주세요!");
          return false; 
      }  
      
   }
</script> 
</head>
<body>
	<h2>인사카드추가</h2>
		
		<div class="card">
          <div class="card-body">
            <form class="forms-sample" name= "joinform" method="post" enctype="Multipart/form-data">
            <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
            <div id="result">
              <!-- 사진 -->
              <div class="form-group">
                <label><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;사진</label>
                <div v-for="item in fileList"><img v-bind:src="item.url" style='height:200px;width:180px;'></div>
                <input type="file" class="file-upload-default" id='uploadFile' name="photo" accept="image/*" >
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
                <input type="text" class="form-control" id="exampleInputName1" name="name"  />
              </div>
              
              <!-- 사번 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;사번</label>
                <input type="text" class="form-control" id="employee_id" name="employee_id" placeholder="ex)220417_01"  />
                <!-- 사번 중복체크 버튼 S -->
                	<div class="input-group-append">
              			<button class="btn btn-outline-primary btn-sm" id="employee_id_check">Check</button>
              		</div>
              	</div>
              	<input type="hidden" id="id_submit_check" value="0">
              	<div id="id_check_display"></div>
              	<!-- 사번 중복체크 버튼 E -->
              </div>
              
              <!-- 연락처 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;연락처</label>
                <div class="col-sm-3 row" style="flex-wrap: nowrap; padding-left: 1%;">
	                <input type="text" class="form-control" maxlength="3" name="phone1"  /> 
	       			&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
	          		<input type="text" class="form-control" maxlength="4" name="phone2"  />
	          		&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
	          		<input type="text" class="form-control" maxlength="4" name="phone3"  />
          		</div>
              </div>
	            
	          <!-- 주민등록번호 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;주민등록번호</label>
                  <div class="col-sm-3 row" style="flex-wrap: nowrap; padding-left: 1%;">
           			<input type="text" class="form-control" maxlength="6" name="regi_num1"  /> 
           			&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
              		<input type="password" class="form-control" maxlength="7" name="regi_num2"  />
                 </div>
              </div>
              
              <!-- 이메일 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;이메일</label>
                <input type="email" class="form-control" id="exampleInputName1" name="email"  />
              </div>
              
              <!-- 입사일 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;입사일</label>
                <input type="date" class="form-control" id="exampleInputName1" name="hire_date"  />
              </div>
              
                <!-- 부서명 -->
	            <div class="form-group">
	              <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;부서명</label>
	              <select class="js-example-basic-single form-control" name="department_id" >
	              <c:forEach var="dto1" items="${list}">
	                <option value="${dto1.department_id}">${dto1.de_name}</option>
	              </c:forEach>
	              </select>
	            </div>
              
                <!-- 직급 -->
	            <div class="form-group">
	              <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;직급</label>
	              <select class="js-example-basic-single form-control" name="position_id" >
	                <c:forEach var="dto2" items="${list2}">
	                	<option value="${dto2.position_id}">${dto2.po_name}</option>
	              	</c:forEach>
	              </select>
	            </div>
              
              <!-- 우편번호 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;우편번호</label>
                	<div class="col-sm-2 row" style="flex-wrap: nowrap; padding-left: 1%;">
		                <input type="text" class="form-control" id="zip_code" name="zip_code"  readonly />
		                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                <div style="width:20%">
		                <button type="button" onclick="execDaumPostcode()" class="button btn btn-secondary"><i class="icon-search"></i></button>
		                </div>
              		</div>
              </div>
              
              <!-- 주소 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;주소</label>
                <input type="text" class="form-control" size="auto" id="address" name="address"  />
              </div>
              
              <!-- 상세주소 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;상세주소</label>
                <input type="text" class="form-control" size="auto" id="detail_address" name="detail_address"  />
              </div>
              
              <!-- 연봉 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;연봉</label>
                <input type="number" class="form-control" maxlength="10" oninput="numberMaxLength(this);" name="salary"  />
              </div>
              
              <!-- 은행 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;은행</label>
                <select class="js-example-basic-single form-control" name="bank" >
                	<option value="국민">국민은행</option>
	                <option value="신한">신한은행</option>
	                <option value="우리">우리은행</option>
	                <option value="하나">하나은행</option>
	                <option value="카카오">카카오뱅크</option>
	                <option value="토스">토스뱅크</option>
	                <option value="농협">농협은행</option>
	                <option value="지역농협">지역농협은행</option>
	                <option value="제일">SC제일은행</option>
	                <option value="외환">외환은행</option>
	                <option value="시티">한국시티은행</option>
	                <option value="기업">기업은행</option>
	                <option value="수협">수협은행</option>
	                <option value="산업">산업은행</option>
	                <option value="우체국">우체국은행</option>
                </select>
              </div>
              
              <!-- 계좌번호 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;계좌번호</label>
                <input type="text" class="form-control" maxlength="10" oninput="numberMaxLength(this);" name="account_number" id="account_number" />
                <!-- 계좌 중복체크 버튼 S -->
                	<div class="input-group-append">
              			<button class="btn btn-outline-primary btn-sm" id="employee_account_check">Check</button>
              		</div>
              
              	<input type="hidden" id="account_submit_check" value="0">
              	<div id="account_check_display"></div>
              	<!-- 계좌 중복체크 버튼 E -->
              </div>
              
              <!-- 휴가일수 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;휴가일수</label>
                <input type="number" class="form-control" maxlength="5" oninput="numberMaxLength(this);" name="annual_count"  />
              </div>
              
	           <!-- 권한 -->
	           <div class="form-group">
	             <label><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;권한</label>
	             <select class="js-example-basic-single form-control" name="authority" >
	               <option value="ROLE_HR">인사업무</option>
	               <option value="ROLE_FINANCE">회계업무</option>
	               <option value="ROLE_USER">영업/구매/물류업무</option>
	             </select>
	           </div>
              
            </form>
              <button type="button" class="btn btn-primary me-2" id="submit">Submit</button>
              <!-- <button type="submit" class="btn btn-primary me-2" id="submit">Submit</button> -->
              <button class="btn btn-light">Cancel</button>
              
     
            </div>
			
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