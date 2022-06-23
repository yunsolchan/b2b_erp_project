<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <title>expenditure_transfer</title>
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
<script type="text/javascript">
	function rowAdd() {
	    var trCnt = $('#bank_table tr').length;
	    if(trCnt < 11){
	        var innerHtml = "";
	        innerHtml += '<tr>';
	        innerHtml += '    <td><input type="text" class="form-control" size="auto" id="ac_name" name="ac_name" placeholder="예금주명" required /></td>';
	        innerHtml += '    <td><input type="text" class="form-control" size="auto" id="ac_number" name="ac_number" placeholder="송금계좌번호" required /></td>';
	        innerHtml += '    <td>	';
	        innerHtml += '		<select class="js-example-basic-single form-control" name="ac_bank" required>	';
	        innerHtml += '		   <option value="국민">국민은행</option>	';
	        innerHtml += '		   <option value="신한">신한은행</option>	';
	        innerHtml += '		   <option value="우리">우리은행</option>	';
	        innerHtml += '		   <option value="하나">하나은행</option>	';
	        innerHtml += '		   <option value="카카오">카카오뱅크</option>	';
	        innerHtml += '		   <option value="토스">토스뱅크</option>	';
	        innerHtml += '		   <option value="농협">농협은행</option>	';
			innerHtml += '		   <option value="지역농협">지역농협은행</option>	';
			innerHtml += '		   <option value="제일">SC제일은행</option>	';
			innerHtml += '		   <option value="외환">외환은행</option>	';
			innerHtml += '		   <option value="시티">한국시티은행</option>	';
			innerHtml += '	       <option value="기업">기업은행</option>	';
			innerHtml += '		   <option value="수협">수협은행</option>	';
			innerHtml += '	       <option value="산업">산업은행</option>	';
			innerHtml += '	       <option value="우체국">우체국은행</option>	';
			innerHtml += '		 </select>	';
			innerHtml += '	  </td>';
	        innerHtml += '    <td><input type="number" class="form-control" size="auto" id="ac_money" placeholder="송금금액" name="ac_money" required /></td>';
	        innerHtml += '</tr>';
	        $('#bank_table > tbody:last').append(innerHtml);
	    }else{
	        alert("계좌입력은 최대 10개까지만 가능합니다!");
	        return false;
	    }
	}
	function rowDelete(){
	    var trCnt = $('#bank_table tr').length;
	    if(trCnt>2){
	        $('#bank_table > tbody:last > tr:last').remove();
	    }else{
	        return false;
	    }
	}

	$(function(){
		check_state();
		
		$("#check").click(function(){
			// 입력창에 입력된 값 변수에 담기
			var client_name = $("#client_name").val();
			// input hidden에 있는 값 변수에 담기 => 중복여부 체크
			var client_name_check = $("#client_name_check").val();
			
			if(!client_name){	// 입력된 값이 없을 경우,
				// 입력창에 focus주기
				$("#client_name").focus();
				
				// 중복여부 체크 값에 초기값으로 값 대입
				$("#client_name_check").val("0");
				
				// 화면 변경 메서드
				check_state();
				
				alert("확인하실 거래처명을 입력해주세요!");
				return false;
			}else{
				// ajax메서드 => 입력 받은 값을 준다.
				client_check(client_name);
				
				// 화면변경 메서드
				check_state();
				return false;
			}
		});
		
 		$("#transfer_submit").click(function(){
 			// 등록 버튼 제출 메서드
 			check_submit();
		});
	});
	
	// 중복체크 ajax메서드(DB에 있는 값과 비교 후 1, 2로 값 받아오기)
	function client_check(client_name){
		$.ajax({
			// url뒤에 get형식으로 보낼 값 붙여준다.
			url: '${path}/client_check.mh?${_csrf.parameterName}=${_csrf.token}&client=' + client_name,
			type: 'POST',
			data: 'int',
			success: function(result){
				// input hidden에 있는 값 변수에 담기 => 중복여부 체크
				var client_name_check = $("#client_name_check").val();
				
				if(result != 1){	// 만약 db에서 받아온 값이 0이 아닐 경우, count가 0이상일 경우, => 중복된 상태
					// 중복여부 변수에 값을 2로 넣어준다.
					$("#client_name_check").val("2");
					
					// 화면 변경 메서드
					check_state();
				}
				else{
					// 중복여부 변수에 값을 1로 넣어준다.
					$("#client_name_check").val("1");
					
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
		var client_name_check = $("#client_name_check").val();
		
		if(client_name_check == 2){ // 만약 hidden값이 2일 경우 => 중복일 경우,
			// 뿌려줄 div에 해당 메세지를 띄운다.
			$("#client_check_display").html("<p class='text-warning'><i class='mdi mdi-emoticon-sad'></i>&nbsp;추가되지 않은 거래처</p>");
		}
		else if(client_name_check == 1){ // 만약 hidden값이 1일 경우 => 중복이 아닐 경우,
			$("#client_check_display").html("<p class='text-info'><i class='mdi mdi-emoticon-happy'></i>&nbsp;거래처확인</p>");
		}
		else{ // 만약 hidden값이 이외 값일 경우 => 초기상태일 경우,
			$("#client_check_display").html("<p class='text-danger'><i class='mdi mdi-emoticon-sad'></i>&nbsp;거래처확인</p>");
		}
	}
	
	// 등록 버튼 제출 메서드
	function check_submit(){
		// input hidden에 있는 값 변수에 담기 => 중복여부 체크
		var client_name_check = $("#client_name_check").val();
		
		// 해당 값이 1이 아닐 때,
		if(client_name_check != 1){
			// 입력 창으로 focus이동
			$("#client_name").focus();
			
			// 알림창
			alert("거래처 추가여부를 확인해주세요!");
			return false;
		}else{ // 해당 값이 1일 경우,
			// 해당 action경로로
			document.transferform.action="expenditure_transfer_action.mh";
			
			// submit 제출
			document.transferform.submit();
		}
	}
</script>
</head>
<body>
<!-- 직접 송금추가(지출결의서 작성) -->
	<div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">지출관리</h3>
                  <p class="card-description">
                   		 신규 지출등록
                  </p>
                  <div class="card">
          <div class="card-body">
          
            <form class="forms-sample" name= "transferform" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <div id="result">
	          <!-- 거래처명 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;거래처명</label>
                <div class="input-group">
                	<input type="text" class="form-control" id="client_name" name="client_name" placeholder="송금하실 거래처명을 입력해주세요!" required />
              		<div class="input-group-append" style="margin-left:10px;">
              			<button class="btn btn-outline-primary btn-sm" id="check" style="font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">Check</button>
              		</div>
              	</div>
              	<input type="hidden" id="client_name_check" value="0">
              	<div id="client_check_display">
              	</div>
              </div>
              
              <!-- 계정명 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;계정명</label>
                <select class="js-example-basic-single form-control" name="account_title" required>
	                <option value="여비교통비">여비교통비</option>
	                <option value="소모품비">소모품비</option>
	                <option value="통신비">통신비</option>
	                <option value="접대비">접대비</option>
	                <option value="수도광열비">수도광열비</option>
	                <option value="창고관리비">창고관리비</option>
	                <option value="복리후생비">복리후생비</option>
              	</select>
              </div>
              
              <!-- 메모 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;지출세부</label>
                <input type="text" class="form-control pt-3 pb-3" id="exampleInputName1" name="memo" placeholder="지출결의서에 입력하실 지출내용을 입력해주세요!" required />
              </div>
              
              <!-- 송금계좌추가 -->  
       		  <div class="d-sm-flex justify-content-between form-group mt-4">
       		  	<label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;송금계좌</label>
              	<div>
              		<button class="btn btn-outline-linkedin btn-icon btn-sm me-2" onclick="rowAdd();">
              			<i class="mdi mdi-plus"></i>
              		</button>
              		<button class="btn btn-outline-linkedin btn-icon btn-sm" onclick="rowDelete();">
              			<i class="mdi mdi-replay"></i>
              		</button>
              	</div>
              </div>
              <div class="row">
            	<div class="col-lg-12 grid-margin stretch-card">
              		<div class="card">
               			<div class="card-body">
               				<!--
               				예금주명
               				<div class="form-group">
               					<label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;예금주명</label>
			                	<input type="text" class="form-control pt-4 pb-4" id="exampleInputName1" name="name" placeholder="송금계좌의 예금주명을 입력해주세요!" required />
			              	</div>
			              	
			              	계좌번호
			              	<div class="form-group">
               					<label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;계좌번호</label>
			                	<input type="text" class="form-control pt-4 pb-4" id="exampleInputName1" name="account_number" placeholder="송금계좌의 계좌번호를 입력해주세요!" required />
			              	</div>
			              	
			              	송금액
			              	<div class="form-group">
               					<label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;송금액</label>
			                	<input type="text" class="form-control pt-4 pb-4" id="exampleInputName1" name="expenses" placeholder="송금할 비용의 액수를 입력해주세요!" required />
			              	</div>
			              	
			              	적요
			              	<div class="form-group">
               					<label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;적요</label>
			                	<input type="text" class="form-control pt-4 pb-4" id="exampleInputName1" name="employee_id" placeholder="해당 송금의 내용을 간단히 입력해주세요!" required />
			              	</div>
			              	 -->
			              	 <table class="table" id="bank_table">
			              	 	<thead>
				              		<tr>
				              			<th class="table-light">예금주</th>
				              			<th class="table-light">계좌번호</th>
				              			<th class="table-light" width="22%">은행명</th>
				              			<th class="table-light">송금액</th>
				              		</tr>
				              	</thead>
				              	<tbody>
				              		<tr>
				              			<td><input type="text" class="form-control" size="auto" id="ac_name" name="ac_name" placeholder="예금주명" required /></td>
				              			<td><input type="text" class="form-control" size="auto" id="ac_number" name="ac_number" placeholder="송금계좌번호" required /></td>
				              			<td>
							                <select class="js-example-basic-single form-control" name="ac_bank" required>
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
										</td>
				              			<td><input type="number" class="form-control" size="auto" id="ac_money" name="ac_money" placeholder="송금금액" required /></td>
				              		</tr>
				              	</tbody>
			              	</table>
			              	<!-- 추가 input -->
              			</div>
             		</div>
              	</div>
              </div>
             
              <!-- 부서명 -->
            <div class="form-group">
              <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;출금계좌</label>
              <select class="js-example-basic-single form-control" name="account_number" required>
                <c:forEach var="i" items="${bank_list}">
               		<option value="${i.account_number}">${i.ac_name}</option>
                </c:forEach>
              </select>
            </div>
            	<div class="d-sm-flex justify-content-between form-group mt-4">
            	  <button type="reset" class="btn btn-outline-light btn-rounded btn-text-icon ms-2" style="width: 45%; font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">
            	  	<i class="mdi mdi-flattr btn-icon-preppend"></i>
            	  	초기화
            	  </button>
	              <button type="submit" class="btn btn-outline-twitter btn-rounded btn-text-icon me-2" id="transfer_submit" style="width: 45%; font-family: 'IBM Plex Sans KR', sans-serif; font-weight: bold">
	              	<i class="mdi mdi-loupe btn-icon-preppend"></i>
	              	송금완료
	              </button>
	            </div>
	            </div>
            </form>
          </div>
        </div>
	</div>
	</div>
	</div>
	</div>
    	<%@ include file="/WEB-INF/views/MENU/footer.jsp" %>
    <!-- page-body-wrapper ends --
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

