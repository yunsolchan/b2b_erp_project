<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>client_insert</title>
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
  
<script src="https://unpkg.com/vue@2.6.6/dist/vue.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

  <style type="text/css">
     h2 { text-align: center; padding: 2% 0;}
     
     input::-webkit-inner-spin-button{
       display: none;
   }
  </style>
  
<script type="text/javascript">

	// 번호 길이 제한
	function numberMaxLength(e){
	    if(e.value.length > e.maxLength){
	        e.value = e.value.slice(0, e.maxLength);
	    }
	}

   $(function(){
      check_state();
      $("#check").click(function(){
         // 입력창에 입력된 값 변수에 담기
         var keyword = $("#client_name").val();
         // input hidden에 있는 값 변수에 담기 => 중복여부 체크
         var client_insert_check = $("#client_insert_check").val();
         
         if(!keyword){   // 입력된 값이 없을 경우,
            // 입력창에 focus주기
            $("#client_name").focus();
            
            // 중복여부 체크 값에 초기값으로 값 대입
            $("#client_insert_check").val("0");
            
            // 화면 변경 메서드
            client_state();
            
            alert("중복확인할 거래처명을 입력해주세요!");
            return false;
         }else{
            // 중복체크 ajax메서드 => 입력 받은 값을 준다.
            client_check(keyword);
            
            // 화면변경 메서드
            check_state();
            return false;
         }
      });
      
      bcheck_state();
      
      $("#bcheck").click(function(){
         // 입력창에 입력된 값 변수에 담기
         var keyword = $("#account_number").val();
         // input hidden에 있는 값 변수에 담기 => 중복여부 체크
         var bank_insert_check = $("#bank_insert_check").val();
         
         if(!keyword){   // 입력된 값이 없을 경우,
            // 입력창에 focus주기
            $("#account_number").focus();
            
            // 중복여부 체크 값에 초기값으로 값 대입
            $("#bank_insert_check").val("0");
            
            // 화면 변경 메서드
            bcheck_state();
            
            alert("중복확인할 계좌번호를 입력해주세요!");
            return false;
         }else{
            // 중복체크 ajax메서드 => 입력 받은 값을 준다.
            bank_check(keyword);
            
            // 화면변경 메서드
            bcheck_state();
            return false;
         }
      });
   });
   
// 중복체크 ajax메서드(DB에 있는 값과 비교 후 1, 2로 값 받아오기)
   function bank_check(keyword){
      $.ajax({
         // url뒤에 get형식으로 보낼 값 붙여준다.
         url: '${path}/bank_check.jh?${_csrf.parameterName}=${_csrf.token}&keyword=' + keyword,
         type: 'POST',
         data: 'int',
         success: function(result){
            // input hidden에 있는 값 변수에 담기 => 중복여부 체크
            var bank_insert_check = $("#bank_insert_check").val();
            
               // 중복여부 변수에 값을 2로 넣어준다.
               if(result == "b"){
               $("#bank_insert_check").val("2");
               
               // 화면 변경 메서드
               bcheck_state();
            }
            else{
               // 중복여부 변수에 값을 1로 넣어준다.
               $("#bank_insert_check").val("1");
               
               // 화면 변경 메서드
               bcheck_state();
            }
         },
         error: function(){   // error 함수
            alert('AJAX 오류!');
         }
      });
   }
   
   // 화면 변경 메서드
   function bcheck_state(){
      // input hidden에 있는 값 변수에 담기 => 중복여부 체크
      var bank_insert_check = $("#bank_insert_check").val();
      
      if(bank_insert_check == 2){ // 만약 hidden값이 2일 경우 => 중복일 경우,
         // 뿌려줄 div에 해당 메세지를 띄운다.
         $("#bank_check_display").html("<p class='text-warning'><i class='mdi mdi-emoticon-sad'></i>&nbsp;중복계좌</p>");
      }
      else if(bank_insert_check == 1){ // 만약 hidden값이 1일 경우 => 중복이 아닐 경우,
         $("#bank_check_display").html("<p class='text-info'><i class='mdi mdi-emoticon-happy'></i>&nbsp;중복확인</p>");
      }
      else{ // 만약 hidden값이 이외 값일 경우 => 초기상태일 경우,
         $("#bank_check_display").html("<p class='text-danger'><i class='mdi mdi-emoticon-sad'></i>&nbsp;중복확인</p>");
      }
   }
   
   // 중복체크 ajax메서드(DB에 있는 값과 비교 후 1, 2로 값 받아오기)
   function client_check(keyword){
      $.ajax({
         // url뒤에 get형식으로 보낼 값 붙여준다.
         url: '${path}/client_check.jh?${_csrf.parameterName}=${_csrf.token}&keyword=' + keyword,
         type: 'POST',
         success: function(result){
            // input hidden에 있는 값 변수에 담기 => 중복여부 체크
            var client_insert_check = $("#client_insert_check").val();
            
            if(result == "b"){   // 만약 db에서 받아온 값이 0이 아닐 경우, count가 0이상일 경우, => 중복된 상태
               // 중복여부 변수에 값을 2로 넣어준다.
               $("#client_insert_check").val("2");
               
               // 화면 변경 메서드
               check_state();
            }
            else{
               // 중복여부 변수에 값을 1로 넣어준다.
               $("#client_insert_check").val("1");
               
               // 화면 변경 메서드
               check_state();
            } 
           
         },
         error: function(){   // error 함수
            alert('AJAX 오류!');
         }
      });
   }
   
   // 화면 변경 메서드
   function check_state(){
      // input hidden에 있는 값 변수에 담기 => 중복여부 체크
      var client_insert_check = $("#client_insert_check").val();
      
      if(client_insert_check == 2){ // 만약 hidden값이 2일 경우 => 중복일 경우,
         // 뿌려줄 div에 해당 메세지를 띄운다.
         $("#client_check_display").html("<p class='text-warning'><i class='mdi mdi-emoticon-sad'></i>&nbsp;중복이름</p>");
      }
      else if(client_insert_check == 1){ // 만약 hidden값이 1일 경우 => 중복이 아닐 경우,
         $("#client_check_display").html("<p class='text-info'><i class='mdi mdi-emoticon-happy'></i>&nbsp;중복확인</p>");
      }
      else{ // 만약 hidden값이 이외 값일 경우 => 초기상태일 경우,
         $("#client_check_display").html("<p class='text-danger'><i class='mdi mdi-emoticon-sad'></i>&nbsp;중복확인</p>");
      }
   }
   
   // 등록 버튼 제출 메서드
   function check_submit(){
      // input hidden에 있는 값 변수에 담기 => 중복여부 체크
      var client_insert_check = $("#client_insert_check").val();
      
      // 해당 값이 1이 아닐 때,
      if(client_insert_check != 1){
         // 입력 창으로 focus이동
         $("#client_name").focus();
         
         // 알림창
         alert("거래처명의 중복여부를 확인해주세요!");
         return false;
      }else{ // 해당 값이 1일 경우,
         // submit 제출
         document.clientform.submit();
      }
   }
</script> 
</head>
<body> 
<script>
	/* 우편번호 찾기 */
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<c:if test="${insertCnt == 1}">
   <script type="text/javascript">
      swal("신규 거래처 등록이 정상적으로 완료됐습니다!", {
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
                  <h3 class="card-title">거래처 등록</h3>
                  <p class="card-description">
                         거래처 정보 입력
                  </p>
                  <div class="card">
          <div class="card-body">
          
            <form class="forms-sample" name= "joinform" method="post" action="client_insert_action.jh?${_csrf.parameterName}=${_csrf.token}">
            <div id="result">

               <!-- 이름 -->  
               <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;거래처명</label>
                <div class="input-group">
                   <input type="text" class="form-control" id="client_name" name="cl_name"  placeholder="" required>
                    <div class="input-group-append">
                       <button type="button" class="btn btn-outline-primary btn-sm" id="check" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">Check</button>
                    </div>
                 </div>
                 <input type="hidden" id="client_insert_check" value="0">
                 <div id="client_check_display"></div>
              </div>
              
              <!-- 이름 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;대표자</label>
                <input type="text" class="form-control" id="exampleInputName1" name="ceo_name" required />
              </div>   
              
              <!-- 이메일 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;거래처 이메일</label>
                <input type="email" class="form-control" id="exampleInputName1" name="cl_email" required />
              </div>
              
              <!-- 우편번호 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;우편번호</label>
                   <div class="col-sm-2 row" style="flex-wrap: nowrap; padding-left: 1%;">
                      <input type="text" class="form-control ms-4" id="zip_code" name="cl_zip_code" required readonly />
                      <div>
                      <button type="button" onclick="execDaumPostcode()" class="button btn btn-secondary btn-sm"><i class="icon-search"></i></button>
                      </div>
                    </div>
              </div>
              
              <!-- 주소 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;거래처 주소</label>
                <input type="text" class="form-control" size="auto" id="address" name="cl_address" required />
              </div>
              
              <!-- 상세주소 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;상세주소</label>
                <input type="text" class="form-control" size="auto" id="detail_address" name="cl_detail_address" required />
              </div>
              
              <!-- 연락처 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;사업자 번호</label>
                <div class="col-sm-3 row  ms-4" style="flex-wrap: nowrap; padding-left: 1%;">
				   <input type="number" class="form-control" maxlength="3" name="num1" required oninput="numberMaxLength(this);"/> 
                   &nbsp;&nbsp;-&nbsp;&nbsp;
                   <input type="number" class="form-control" maxlength="2" name="num2" required oninput="numberMaxLength(this);"/>
                   &nbsp;&nbsp;-&nbsp;&nbsp;
                   <input type="number" class="form-control" maxlength="5" name="num3" required oninput="numberMaxLength(this);"/>
                </div>
              </div>
              
              <!-- 연락처 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;거래처 연락처</label>
                <div class="col-sm-3 row ms-4" style="flex-wrap: nowrap; padding-left: 1%;">
				   <input type="number" class="form-control" maxlength="3" name="phone1" required oninput="numberMaxLength(this);"/> 
                   &nbsp;&nbsp;-&nbsp;&nbsp;
                   <input type="number" class="form-control" maxlength="4" name="phone2" required oninput="numberMaxLength(this);"/>
                   &nbsp;&nbsp;-&nbsp;&nbsp;
                   <input type="number" class="form-control" maxlength="4" name="phone3" required oninput="numberMaxLength(this);"/>
                </div>
              </div>      
              
              <!-- 계좌등록 -->
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;계좌번호</label>
                <div class="input-group">
                   <input type="number" class="form-control" id="account_number" name="account_number" placeholder="'-'를 제외한 모든 계좌번호를 입력해주세요!" required />
                    <div class="input-group-append">
                       <button class="btn btn-outline-primary btn-sm" id="bcheck" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">Check</button>
                    </div>
                 </div>
                 <input type="hidden" id="bank_insert_check" value="0">
                 <div id="bank_check_display">
                 </div>
              </div>
              
              <div class="form-group">
                 <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;은행</label>
                 <select class="js-example-basic-single form-control" name="bank" required>
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
			<div class="d-sm-flex justify-content-end form-group">
              <button type="reset" class="btn btn-light me-2 btn-rounded" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">초기화</button>
              <button type="submit" class="btn btn-twitter btn-rounded" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">신규거래처 등록</button>
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
       <%@ include file="/WEB-INF/views/MENU/footer.jsp" %>
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