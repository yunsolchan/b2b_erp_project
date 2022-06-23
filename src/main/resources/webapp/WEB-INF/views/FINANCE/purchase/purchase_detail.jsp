<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>purchase_detail</title>
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
  <div class="container-scroller"> 
  <!-- 헤더 -->
  <%@ include file="/WEB-INF/views/header.jsp" %>
  
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
    <!-- 레프트메뉴 -->
      <%@ include file="/WEB-INF/views/leftMenu.jsp" %>
      
      <!-- 여기서부터 작성 -->
      
      
<script type="text/javascript">
	$(function(){
		$("#purchase_list").click(function(){
			window.history.back();
		});
		$('#purchase_in_confirm').click(function(){
			document.purchase_detail.action="${path}/purchase_in_confirm.mh?${_csrf.parameterName}=${_csrf.token}";
			document.purchase_detail.submit();
		});
		$('#purchase_out_confirm').click(function(){
			document.purchase_detail.action="${path}/purchase_out_confirm.mh?${_csrf.parameterName}=${_csrf.token}";
			document.purchase_detail.submit();
		});
	});
</script>
<!-- 매입/매출장 상세 -->
	<div class="main-panel">
        <div class="content-wrapper">
        <div class="d-flex flex-row align-items-center">
	      <i class="menu-icon mdi mdi-chart-line icon-lg text-linkedin"></i>
	      	<h2 style="font-family: inherit; padding: 2% 0;">
	                    회계관리
	        </h2>
	    </div>
	<div class="row col-lg-10">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">매입매출장 관리</h3>
                  <div class="d-sm-flex justify-content-between">
                  	<p class="card-description">매입/매출장 상세</p>
                  	<button type="button" class="btn btn-outline-primary btn-sm me-3 mb-3" onclick="window.print()">전표 출력</button>
                  </div>
                  <div class="table-responsive">
                  	<form name="purchase_detail" method="post">
	                    <table class="table table-bordered">
	                    	<thead>
		                    	<tr>
		                    		<c:if test="${purchase_detail.sa_type eq '매출'}">
										<th colspan="4">매출전표</th>
									</c:if>
		                    		<c:if test="${purchase_detail.sa_type eq '매입'}">
										<th colspan="4">매입전표</th>
									</c:if>
		                    	</tr>
	                    	</thead>
	                    	<tbody>
	                    		<tr>
	                    			<td class="table-light">문서번호</td>
	                    			<td>${purchase_detail.slip_id}</td>
	                    			<td class="table-light">작성일자</td>
	                    			<td>${purchase_detail.sl_register_date}</td>
	                    		</tr>
	                    		<tr>
	                    			<td class="table-light">계정과목(거래유형)</td>
	                    			<td>${purchase_detail.sa_account_title}</td>
	                    			<td class="table-light">거래처명</td>
	                    			<td>
	                    				<div class="dropdown">
					                   		 <button class="btn btn-primary btn-sm dropdown-toggle" type="button" id="dropdownMenuSizeButton3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					                       	 ${purchase_detail.cl_name}
					                    	</button>
					                    <div class="dropdown-menu" aria-labelledby="dropdownMenuSizeButton3" style="position: absolute; inset: auto auto 0px 0px; margin: 0px; transform: translate(0px, -32px);" data-popper-placement="bottom-start">
					                        <table class="table">
					                        	<thead>
						                        	<tr>
						                        		<th>사업자명</th>
						                        		<th>E-MAIL</th>
						                        		<th>연락처</th>
						                        		<th>주소지</th>
						                        		<th>사업자등록번호</th>
						                        	</tr>
					                        	</thead>
					                        	<tbody>
						                        	<tr class="table-light">
						                        		<td>${client_detail.ceo_name}</td>
						                        		<td>${client_detail.cl_email}</td>
						                        		<td>${client_detail.cl_phone}</td>
						                        		<td>${client_detail.cl_address}</td>
						                        		<td>${client_detail.register_num}</td>
						                        	</tr>
					                        	</tbody>
					                        </table>
					                    </div>
					                  </div>
	                    			</td>
	                    		</tr>
	                    		<tr>
	                    			<td class="table-light">공급가액</td>
	                    			<td>
	                    				<c:set var="supply" value="${purchase_detail.supply_amount}"/>
	                    				${supply}
	                    			</td>
	                    			<td class="table-light">세액</td>
	                    			<td>
	                    				<c:set var="tax" value="${purchase_detail.tax_amount}"/>
	                    				${tax}
	                    			</td>
	                    		</tr>
	                    		<tr>
	                    			<td class="table-light">부서명</td>
	                    			<td>${purchase_detail.de_name}</td>
	                    			<td class="table-light">요청 사원명</td>
	                    			<td>${purchase_detail.em_name}</td>
	                    		</tr>
	                    		<tr>
	                    			<td class="table-light">요청내용</td>
	                    			<td>${purchase_detail.sa_abstract}</td>
	                    		</tr>
	                    		<tr>
	                    			<td colspan="4">
	                                    <div class="d-flex align-items-center">
	                                      <h6 class="card-title card-title-dash">상품목록</h6>
	                                      <!-- div 하나 더 넣어서 table 중앙으로 보내주기 -->
	                                    </div>
	                                    <table class="table table-bordered">
	                                    	<thead>
			                                    <tr>
			                                    	<th class="table-light">상품명</th>
			                                    	<th class="table-light">가격</th>
			                                    	<th class="table-light">구매수량</th>
			                                    	<th class="table-light">비용</th>
			                                    </tr>
			                                </thead>
			                                <tbody>
		                                   	 <c:forEach var="i" items="${request_det_list}">
		                                        <tr>
			                                    	<td>${i.pr_name}</td>
			                                    	<td>
			                                    		<c:if test="${purchase_detail.sa_type eq '매출'}">
			                                    			<c:set var="p_price" value="${i.price}"/>
			                                    			${p_price}
			                                    		</c:if>
			                                    		<c:if test="${purchase_detail.sa_type eq '매입'}">
			                                    			<c:set var="p_price" value="${i.cost}"/>
			                                    			${p_price}
			                                    		</c:if>
			                                    	</td>
			                                    	<td>
			                                    		<c:set var="p_qty" value="${i.re_qty}"/>
			                                    		${p_qty}
			                                    	</td>
			                                    	<td>
			                                    		<c:set var="p_total" value="${p_price * p_qty}"/>
			                                    		<label class="badge badge-info">${p_total}</label>
			                                    	</td>
			                                    </tr>
			                                  </c:forEach>
	                                     	</tbody>
	                                     </table>
	                    			</td>
	                    		</tr>
	                    		<tr>
	                    			<td class="table-light">승인금액</td>
	                    			<td>
	                    				<c:set var="s_total" value="${supply + tax}"/>
	                    				${s_total}
	                    			</td>
	                    			<td class="table-light">승인일자</td>
	                    			<td style="text-align:center">
	                    				<c:if test="${purchase_detail.state eq '신청'}">
	                    					<input type="hidden" value="${purchase_detail.slip_id}" name="slip_id">
		                    				<input type="hidden" value="${s_total}" name="money">
		                    				<input type="hidden" value="${purchase_detail.client_id}" name="client_id">
		                    				<input type="hidden" value="${purchase_detail.sa_abstract}" name="memo">
		                    				<c:if test="${purchase_detail.sa_type eq '매입'}">
		                    					<button id="purchase_in_confirm" type="button" class="btn btn-outline-warning btn-icon" style="width: 40%">
				                    					<i class="mdi mdi-check"></i>
				                    			</button>
		                    				</c:if>
		                    				<c:if test="${purchase_detail.sa_type eq '매출'}">
			                    				<button id="purchase_out_confirm" type="button" class="btn btn-outline-warning btn-icon" style="width: 40%">
				                    					<i class="mdi mdi-check"></i>
				                    			</button>
			                    			</c:if>
	                    				</c:if>
	                    				<c:if test="${purchase_detail.state eq '승인'}">
	                    					<fmt:formatDate pattern="yyyy- MM-dd" value="${purchase_detail.update_date}" />
	                    				</c:if>
	                    			</td>
	                    		</tr>
	                    	</tbody>
	                    </table>
	                    <div class="d-sm-flex justify-content-end mt-3">
                    		<button type="button" class="btn btn-outline-primary me-2" id="purchase_list"> <i class="mdi mdi-format-list-bulleted"></i> </button>
                  		</div>
	                   </form>
                  </div>
                </div>
              </div>
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