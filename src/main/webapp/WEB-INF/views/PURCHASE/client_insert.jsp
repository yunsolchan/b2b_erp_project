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
  <script>
   /* 우편번호 찾기 */
   $(".inputs").keyup(function () {
	   alert("ssad");
	   if (this.value.length == this.maxLength) {
		   
		   $(this).next().focus(); 
		   } 
	   });

    function numberMaxLength(e){
        if(e.value.length > e.maxLength){
            e.value = e.value.slice(0, e.maxLength);
        }
    }
    
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
<script type="text/javascript">
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
			
			if(!keyword){	// 입력된 값이 없을 경우,
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
			url: '${path}/bank_check.sc?${_csrf.parameterName}=${_csrf.token}&keyword=' + keyword,
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
			error: function(){	// error 함수
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
         url: '${path}/client_check.sc?${_csrf.parameterName}=${_csrf.token}&keyword=' + keyword,
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript">

// 항목 추가 버튼을 누르면 이 함수가 실행
function rowAdd() {
	// 상품 추가 테이블의 tr의 길이를 받아와 trCnt에 넣어준다.
    var trCnt = $('#client_table tr').length;
	// tr의 길이가 10 이하라면
    if(trCnt < 11){
    	// innerHtml에 추가 될 tr의 정보를 입력해준다 
        var innerHtml = "";
        innerHtml += '<tr>';
        innerHtml += '    <td><input type="text" class="form-control" size="auto" id="product_name" name="product_name" required /></td>';
        innerHtml += '    <td><input type="text" class="form-control" size="auto" id="product_category" name="product_category" required /></td>';
        innerHtml += '    <td><input type="text" class="form-control" size="auto" id="product_price" name="product_price" required /></td>';
        innerHtml += '</tr>';
        // 상품 추가 테이블의 마지막행에 innerHtml변수에 입력해준 tr의 정보를 추가해준다
        $('#client_table > tbody:last').append(innerHtml);
    }else{
    	// tr의 길이가 10 초과라면 추가가 되지 않고 알림창을 출력해준다
        alert("최대 10개까지만 가능합니다.");
        return false;
    }
}

// 항목 삭제 버튼을 누르면 이 함수가 실행
function rowDelete(){
		// tr의 길이를 trCnt에 입력해준다
    var trCnt = $('#client_table tr').length;
		
		// 길이가 2 이상이라면 상품목록의 마지막 tr을 삭제시켜준다
    if(trCnt>1){
        $('#client_table > tbody:last > tr:last').remove();
    	// 1 이하라면 삭제가 되지 않는다
    }else{
        return false;
    }
}


function allDelete(){
	$('#client_table > tbody').empty();
}
   $(function(){
      $("#client_insert_action").click(function(){
         window.location="${path}/client_insert_action.sc";
      });
   });
   
   
   

</script>
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
                  <div class="card">
          <div class="card-body">
          
            <form class="forms-sample" name= "clientform"  method="post" action="client_insert_action.sc?${_csrf.parameterName}=${_csrf.token}">
            <div id="result">

             <!-- 이름 -->  
              
               <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;거래처명</label>
                <div class="input-group">
                	<input type="text" class="form-control" id="client_name" name="client_name"  placeholder="" required="">
              		<div class="input-group-append">
              			&nbsp;&nbsp;<button type="button" class="btn btn-outline-primary btn-sm" id="check">Check</button>
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
                <input type="email" class="form-control" id="exampleInputName1" name="client_email" required />
              </div>
              
              <!-- 우편번호 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;우편번호</label>
                   <div class="col-sm-2 row ms-3" style="flex-wrap: nowrap; padding-left: 1%; width:40%">
                      <input type="text" class="form-control" id="zip_code" name="zip_code" required readonly />
                      <div style="width:20% margin-left: 5px;">
                      <button type="button" onclick="execDaumPostcode()" class="button btn btn-secondary" style="padding: 7px;"><i class="icon-search"></i></button>
                      </div>
                    </div>
              </div>
              
              <!-- 주소 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;거래처 주소</label>
                <input type="text" class="form-control" size="auto" id="address" name="address" required />
              </div>
              
              <!-- 상세주소 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;상세주소</label>
                <input type="text" class="form-control" size="auto" id="detail_address" name="detail_address" required />
              </div>
              
              <!-- 연락처 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;사업자 번호</label>
                <div class="col-sm-3 row" style="flex-wrap: nowrap; padding-left: 1%;">
               	   <input type="number" class="form-control inputs" maxlength="3" name="num1" required oninput="numberMaxLength(this);"/> 
                   &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
                   <input type="number" class="form-control inputs" maxlength="2" name="num2" required oninput="numberMaxLength(this);"/>
                   &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
                   <input type="number" class="form-control inputs" maxlength="5" name="num3" required oninput="numberMaxLength(this);"/>
                </div>
              </div>
              
              <!-- 연락처 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;거래처 연락처</label>
                <div class="col-sm-3 row" style="flex-wrap: nowrap; padding-left: 1%;">
               <input type="number" class="form-control" maxlength="3" name="phone1" required oninput="numberMaxLength(this);"/> 
                   &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
                   <input type="number" class="form-control" maxlength="4" name="phone2" required oninput="numberMaxLength(this);"/>
                   &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
                   <input type="number" class="form-control" maxlength="4" name="phone3" required oninput="numberMaxLength(this);"/>
                </div>
              </div>     
              
              <!-- 계좌 번호  -->  
              <!-- <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;계좌번호</label>
                <input type="text" class="form-control" id="exampleInputName1" name="ac_num" required />
              </div> -->
              
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;계좌번호</label>
                <div class="input-group">
                	<input type="number" class="form-control" id="account_number" name="ac_num" placeholder="'-'를 제외한 모든 계좌번호를 입력해주세요!" required />
              		<div class="input-group-append">
              			&nbsp;&nbsp;<button class="btn btn-outline-primary btn-sm" id="bcheck">Check</button>
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
                
              <div class="form-group">
              <button type="button" class="btn btn-primary me-2"  onclick="rowAdd();">항목 추가</button>
			  <button type="button" class="btn btn-light" onclick="rowDelete();">항목 삭제</button>
              	<table class="table" id="client_table">
              		<tr>
              			<th align="center">품목명</th>
              			<th align="center">상품종류</th>
              			<th align="center">상품가격</th>
              		</tr>
              		<tr>
              			<td> <input type="text" class="form-control" size="auto" id="product_name" name="product_name" required /></td>
              			<td><input type="text" class="form-control" size="auto" id="product_category" name="product_category" required /></td>
              			<td><input type="text" class="form-control" size="auto" id="product_price" name="product_price" required /></td>
              		</tr>
              	</table>
              </div>        
               
              <button type="button" onclick="check_submit()" class="btn btn-primary me-2" id="">Submit</button>
              <button type="reset" class="btn btn-light" onclick="allDelete()">Reset</button>
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
