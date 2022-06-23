<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>bank_insert</title>
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
<script type="text/javascript">
	$(function(){
		check_state();
		
		$("#check").click(function(){
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
				check_state();
				
				alert("중복확인할 계좌번호를 입력해주세요!");
				return false;
			}else{
				// 중복체크 ajax메서드 => 입력 받은 값을 준다.
				bank_check(keyword);
				
				// 화면변경 메서드
				check_state();
				return false;
			}
		});
		
 		$("#bank_insert_submit").click(function(){
 			// 등록 버튼 제출 메서드
 			check_submit();
		});
	});
	
	// 중복체크 ajax메서드(DB에 있는 값과 비교 후 1, 2로 값 받아오기)
	function bank_check(keyword){
		$.ajax({
			// url뒤에 get형식으로 보낼 값 붙여준다.
			url: '${path}/bank_check.mh?${_csrf.parameterName}=${_csrf.token}&keyword=' + keyword,
			type: 'POST',
			data: 'int',
			success: function(result){
				// input hidden에 있는 값 변수에 담기 => 중복여부 체크
				var bank_insert_check = $("#bank_insert_check").val();
				
				if(result != 0){	// 만약 db에서 받아온 값이 0이 아닐 경우, count가 0이상일 경우, => 중복된 상태
					// 중복여부 변수에 값을 2로 넣어준다.
					$("#bank_insert_check").val("2");
					
					// 화면 변경 메서드
					check_state();
				}
				else{
					// 중복여부 변수에 값을 1로 넣어준다.
					$("#bank_insert_check").val("1");
					
					// 화면 변경 메서드
					check_state();
				}
			},
			error: function(){	// error 함수
				alert('AJAX 오류!');
			}
		});
	}
	
	// 화면 변경 메서드
	function check_state(){
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
	
	// 등록 버튼 제출 메서드
	function check_submit(){
		// input hidden에 있는 값 변수에 담기 => 중복여부 체크
		var bank_insert_check = $("#bank_insert_check").val();
		
		// 해당 값이 1이 아닐 때,
		if(bank_insert_check != 1){
			// 입력 창으로 focus이동
			$("#account_number").focus();
			
			// 알림창
			alert("계좌번호의 중복여부를 확인해주세요!");
			return false;
		}else{ // 해당 값이 1일 경우,
			// 해당 action경로로
			document.bankform.action="bank_insert_action.mh";
			
			// submit 제출
			document.bankform.submit();
		}
	}
</script>

<!-- 신규 계좌 등록 -->
<div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">신규 계좌등록</h3>
                  <p class="card-description">
                   		 계좌정보 입력
                  </p>
                  <div class="card">
          <div class="card-body">
          
            <form class="forms-sample" name= "bankform" method="post" >
            <!-- <form class="forms-sample" name= "bankform" method="post" action="bank_insert_action.mh"> -->
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <div id="result">
	          <!-- 계좌번호 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;계좌번호</label>
                <div class="input-group">
                	<input type="number" class="form-control" id="account_number" name="account_number" placeholder="'-'를 제외한 모든 계좌번호를 입력해주세요!" required />
              		<div class="input-group-append" style="margin-left:10px;">
              			<button class="btn btn-outline-primary btn-sm" id="check" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">Check</button>
              		</div>
              	</div>
              	<input type="hidden" id="bank_insert_check" value="0">
              	<div id="bank_check_display">
              		<%-- <c:if test="${bank_check == null}"> --%>
              			<!-- <p class="text-danger"><i class="mdi mdi-emoticon-sad"></i>&nbsp;중복확인</p> -->
              		<%-- </c:if> --%>
              	</div>
              </div>
              
              <!-- 계좌송금 비밀번호 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;비밀번호 입력</label>
                <input type="password" class="form-control" id="exampleInputName1" name="bank_password" maxLength="9" placeholder="신규계좌의 송금 비밀번호를 입력해주세요!" required />
              </div>
              
              <!-- 은행 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;은행명</label>
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
              
              <!-- 예금주 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;예금주</label>
                <input type="text" class="form-control" id="exampleInputName1" name="name" placeholder="계좌의 예금주명을 입력해주세요!" required />
              </div>
              
              <!-- 계좌메모 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;계좌메모</label>
                <input type="text" class="form-control" id="exampleInputName1" name="purpose" placeholder="계좌 사용 용도를 입력해주세요!" required />
              </div>
              
              <!-- 초기 잔액 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;초기 잔액</label>
                <input type="number" class="form-control" id="exampleInputName1" name="balance" max="999999999" placeholder="계좌의 초기 잔액을 입력해주세요!" required />
              </div>
              
              <!-- 계좌명 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;계좌명</label>
                <input type="text" class="form-control" id="exampleInputName1" name="account_name" placeholder="ex) 급여출금 계좌" required />
              </div>
              <div class="d-sm-flex justify-content-between form-group">
              <button type="reset" class="btn btn-outline-light btn-rounded me-2" style="width:45%; font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">초기화</button>
              <button type="button" id="bank_insert_submit" class="btn btn-outline-twitter btn-rounded ms-2" style="width:45%; font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">등록</button>
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

