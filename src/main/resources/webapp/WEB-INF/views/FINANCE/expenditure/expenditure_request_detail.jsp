<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <title>expenditure_request_detail</title>
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
</head>
<body>
<script type="text/javascript">
	$(function(){
		check_state();
		$("#check").click(function(){
			// 입력창에 입력된 값 변수에 담기
			var password = $("#password").val();
			// input hidden에 있는 값 변수에 담기 => 중복여부 체크
			var password_check = $("#password_check").val();
			
			var account = $("#account option:selected").val();
			if(!password){	// 입력된 값이 없을 경우,
				// 입력창에 focus주기
				$("#password").focus();
				
				// 중복여부 체크 값에 초기값으로 값 대입
				$("#password_check").val("0");
				
				// 화면 변경 메서드
				check_state();
				
				alert("계좌 비밀번호를 입력해주세요!");
				return false;
			}else{
				// 중복체크 ajax메서드 => 입력 받은 값을 준다.
				password_confirm(account, password);
				// 화면변경 메서드
				check_state();
				return false;
			}
		});
		
		$("#expenditure_request_confirm").click(function(){
			check_submit();
		});
		$("#expenditure_request_reject").click(function(){
			$('#expenditure_request_form').attr('action','expenditure_request_reject.mh').submit();
		});
	});

	// 중복체크 ajax메서드(DB에 있는 값과 비교 후 1, 2로 값 받아오기)
	function password_confirm(account, password){
		$.ajax({
			// url뒤에 get형식으로 보낼 값 붙여준다.
			url: '${path}/bank_pw_check.mh?${_csrf.parameterName}=${_csrf.token}&password=' + password + '&account_number=' + account,
			type: 'POST',
			data: 'int',
			success: function(result){
				// input hidden에 있는 값 변수에 담기 => 중복여부 체크
				var password_check = $("#password_check").val();
				
				if(result != 1){	// 만약 db에서 받아온 값이 0이 아닐 경우, count가 0이상일 경우, => 중복된 상태
					// 중복여부 변수에 값을 2로 넣어준다.
					$("#password_check").val("2");
					
					// 화면 변경 메서드
					check_state();
				}
				else{
					// 중복여부 변수에 값을 1로 넣어준다.
					$("#password_check").val("1");
					
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
		var password_check = $("#password_check").val();
		
		if(password_check == 2){ // 만약 hidden값이 2일 경우 => 중복일 경우,
			// 뿌려줄 div에 해당 메세지를 띄운다.
			$("#password_check_display").html("<p class='text-warning'><i class='mdi mdi-emoticon-sad'></i>&nbsp;비밀번호 불일치</p>");
		}
		else if(password_check == 1){ // 만약 hidden값이 1일 경우 => 중복이 아닐 경우,
			$("#password_check_display").html("<p class='text-info'><i class='mdi mdi-emoticon-happy'></i>&nbsp;비밀번호체크</p>");
		}
		else{ // 만약 hidden값이 이외 값일 경우 => 초기상태일 경우,
			$("#password_check_display").html("<p class='text-danger'><i class='mdi mdi-emoticon-sad'></i>&nbsp;비밀번호체크</p>");
		}
	}
	
	// 승인버튼 제출 메서드
	function check_submit(){
		// input hidden에 있는 값 변수에 담기 => 비밀번호 체크
		var password_check = $("#password_check").val();
		
		// 해당 값이 1이 아닐 때,
		if(password_check != 1){
			// 입력 창으로 focus이동
			$("#password").focus();
			
			// 알림창
			alert("계좌의 비밀번호 일치여부를 확인해주세요!");
			return false;
		}else{ // 해당 값이 1일 경우,
			// 해당 action경로로
			document.expenditure_request_form.action="expenditure_request_confirm.mh";
			
			// submit 제출
			document.expenditure_request_form.submit();
		}
	}
</script>
<!-- 지출요청 상세 -->
	<div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">지출관리</h3>
                  <p class="card-description">
                   		 지출요청 상세
                  </p>
                  <div class="table-responsive">
	              	<form name="expenditure_request_form" id="expenditure_request_form" method="post">
	                    <table class="table table-bordered">
	                    	<thead>
		                    	<tr>
		                    		<th colspan="4">지출요청서</th>
		                    	</tr>
	                    	</thead>
	                    	<tbody>
	                    		<tr>
	                    			<td class="table-light">계정명</td>
	                    			<td>${request_detail.re_type}</td>
	                    			<td class="table-light">요청금액</td>
	                    			<td>${request_detail.expenses}</td>
	                    		</tr>
	                    		<tr>
	                    			<td class="table-light">부서명</td>
	                    			<td>
	                    				<c:if test="${request_detail.department_id == 100}">
											인사과
										</c:if>
										<c:if test="${request_detail.department_id == 200}">
											회계과
										</c:if>
										<c:if test="${request_detail.department_id == 300}">
											구매과
										</c:if>
										<c:if test="${request_detail.department_id == 400}">
											영업과
										</c:if>
										<c:if test="${request_detail.department_id == 500}">
											물류과
										</c:if>
										<c:if test="${request_detail.department_id < 100}">
											기타부서
										</c:if>
										<c:if test="${request_detail.department_id > 500}">
											기타부서
										</c:if>
	                    			</td>
	                    			<td class="table-light">요청 사원명</td>
	                    			<td>${request_detail.em_name}</td>
	                    		</tr>
	                    		<tr>
	                    			<td class="table-light">요청세부</td>
	                    			<td colspan="3">${request_detail.re_memo}</td>
	                    		</tr>
	                    		<tr>
	                    			<td colspan="4">
	                                    <div class="d-flex align-items-center mb-2">
	                                      <h4 class="card-title card-title-dash">요청상세</h4>
	                                      <!-- div 하나 더 넣어서 table 중앙으로 보내주기 -->
	                                    </div>
	                                    <table class="table table-bordered">
		                                    <thead>
			                                    <tr>
			                                    	<th class="table-light">예금주</th>
			                                    	<th class="table-light">송금내용</th>
			                                    	<th class="table-light">송금금액</th>
			                                    	<th class="table-light">송금계좌</th>
			                                    </tr>
			                                 </thead>
			                                 <tbody>
			                                    <c:forEach var="i" items="${request_detail_list}">
			                                        <tr>
				                                    	<td>${i.ac_name}</td>
				                                    	<td>${i.op_abstract}</td>
				                                    	<td>${i.expenses}</td>
				                                    	<td>
				                                    		<label class="badge badge-info">${i.bank} ${i.account_number}</label>
				                                    	</td>
				                                    </tr>
		                                     	</c:forEach>
		                                     </tbody>
	                                     </table>
	                    			</td>	
	                    		</tr>
	                    		<tr>
	                    			<td class="table-light">승인계좌</td>
	                    			<td>
	                    				<c:if test="${request_detail.re_status eq '신청'}">
		                    				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		                    				<input type="hidden" name="slip_id" value="${request_detail.slip_id}">
		                    				<input type="hidden" name="request_id" value="${request_detail.request_id}">
		                    				<input type="hidden" name="cost" value="${request_detail.expenses}">
		                    				<input type="hidden" name="re_type" value="${request_detail.re_type}">
		                    				<select class="js-example-basic-single form-control" id="account" name="account_number" required>
								               <c:forEach var="i" items="${bank_list}">
								               		<option value="${i.account_number}">${i.ac_name}</option>
								               </c:forEach>
								             </select>
								             
								             <div class="form-group mt-3">
								                <div class="input-group">
								                	<input type="password" class="form-control" id="password" name="password" placeholder="송금 비밀번호를 입력해주세요!" required />
								              		<div class="input-group-append">
								              			<button class="btn btn-outline-primary btn-sm" id="check">Check</button>
								              		</div>
								              	</div>
								              	<input type="hidden" id="password_check" value="0">
								              	<div id="password_check_display">
								              	</div>
								              </div>
								         </c:if>
								         <c:if test="${request_detail.re_status eq '승인'}">
								         	${account}
								         </c:if>
								         <c:if test="${request_detail.re_status eq '보류'}">
								         	--
								         </c:if>
	                    			</td>
	                    			<td class="table-light">승인일자</td>
	                    			<td>
	                    				<c:if test="${request_detail.re_status eq '신청'}">
		                    				<button id="expenditure_request_reject" type="button" class="btn btn-outline-danger btn-incon" id="purchase_all_list" style="width:45%">
		                    					<i class="mdi mdi-block-helper"></i>
		                    				</button>
		                    				<button id="expenditure_request_confirm" type="button" class="btn btn-outline-info btn-incon" id="purchase_all_list" style="width:45%; margin-left: 7%">
		                    					<i class="mdi mdi-check"></i>
		                    				</button>
		                    			</c:if>
		                    			<c:if test="${request_detail.re_status eq '승인'}">
		                    				<div class="text-success">
		                    					<fmt:formatDate pattern="yyyy- MM-dd hh:mm" value="${request_detail.end_date}" />
		                    				</div>
		                    			</c:if>
		                    			<c:if test="${request_detail.re_status eq '보류'}">
		                    				<div class="text-warning">
		                    					<fmt:formatDate pattern="yyyy- MM-dd hh:mm" value="${request_detail.end_date}" />
											</div>
										</c:if>
	                    			</td>
	                    		</tr>
	                    	</tbody>
	                    </table>
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

