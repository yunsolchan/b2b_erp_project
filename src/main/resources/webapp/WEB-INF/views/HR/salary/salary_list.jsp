<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Star Admin2 </title>
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<style>
		.input1 { width: 150%; border: none; }
		th i { float: right; }
		#input-form { float: left; }
	</style> 
		<script type="text/javascript">
		$(document).ready(function() {
			/* 오름-내림차룬 정렬 기능 S */
			$('th').each(function (column) {
			      $(this).click(function() {
		              if($(this).is('.asc')) {
		                  $(this).removeClass('asc');
		                  $(this).addClass('desc');
		                  sortdir=-1;                
		              } else {
		                 $(this).addClass('asc');
		                 $(this).removeClass('desc'); 
		                 sortdir=1;
		              }
		              $(this).siblings().removeClass('asc');
		              $(this).siblings().removeClass('desc');
		             var rec = $('table').find('tbody>tr').get();
		             rec.sort(function (a, b) {
		                  var val1 = $(a).children('td').eq(column).text().toUpperCase();
		                  var val2 = $(b).children('td').eq(column).text().toUpperCase();
		                  return (val1 < val2)?-sortdir:(val1>val2)?sortdir:0;
		             });
		             $.each(rec, function(index, row) {
		                  $('tbody').append(row);
		               });
		         });
			});
		});
		
		$(function(){
		      $('#salary_list2 tr td.button').click(function(){
		         var click = $(this);
		         var tr = click.parent();
		         var td = tr.children();
		         
		         var input = "";
		         var name = "";
		         var tdArr = new Array();
		         
		         for(i=0; i<=td.length; i++) {
		        	input = td.eq(i).find('input').val();
		        	name = td.eq(i).find('input').attr('name');
		        	if(input != null) {
						var tdObj = new Object();
						tdObj.name = name;
			        	tdObj.value = input;
		        		tdArr.push(tdObj);
		        	}
		        }
		        console.log(tdArr);
		        
		        var month = td.eq(0).find('input').val();
		        
		        /* var jsonData = JSON.stringify(tdArr);
		        console.log(jsonData); */
		        
		        $.ajax({
		              type: "post",
		              url: "${path}/salary_update.hj?${_csrf.parameterName}=${_csrf.token}",
		              dataType: 'html',
		              data: tdArr,
		              success: function() {
		              	$("#salary_list").load("${path}/salary_list.hj?${_csrf.parameterName}=${_csrf.token}&month=" + month);
		              },
		              error: function() {
		              	alert("????????");

		              }
			        });
		    	});   
		   });
		 
		$(function(){
			// 급여명세서
		      $('#salary_list2 tr td.detail').click(function(){
		         var click = $(this);
		         var tr = click.parent();
		         var td = tr.children();
		         
		         var url = "${path}/salary_detail.hj?salary_id=" + td.eq(1).text();
				 window.open(url, "salary_detail", "menubar=no, width=1000px, height=800px");
		    }); 
		});

	    // 일괄요청  
/* 		$(function(){ 
	      $('#request').click(function(){
	    	  swal("Write something here:", {
	    		  content: "input",
	    		})
	    		.then((value) => {
	    			window.location="${path}/salary_request.hj?${_csrf.parameterName}=${_csrf.token}&month=2022-06&memo=" + ${value}`;
	    		});
	    	  
	    	  swal("Write something here:", {
	    		  content: "input",
	    		})
	    		.then((value) => {
	    		  swal(`You typed: ${value}`);
	    		});
              
            });
		}); */
		
		/* function salary_request(value){
		 $.ajax({
             type: "post",
             url: "${path}/salary_request.hj?${_csrf.parameterName}=${_csrf.token}&month=2022-06&memo=" + value,
             success: function() {
           	  $("#salary_list").load("${path}/salary_list.hj?${_csrf.parameterName}=${_csrf.token}&month=2022-06");
             },
             error: function() {
                 alert("????????");

             }
           });
		} */
		
	</script>
</head>
<body>
<div class="table-responsive">
<form name="salary_list" id="salary_list2" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
 <table class="table table-hover" id="salary_list">
   <thead>
     <tr>
       <th>급여코드</th>
       <th>사원번호</th>
       <th>기본급</th>
       <th>초과수당</th>
       <th>상여금</th>
       <th>교통비</th>
       <th>주휴수당</th>
       <th>직급수당</th>
       <th>식대</th>
       <th>운전보조금</th>
       <th>육아수당</th>
       <th>소득세</th>
       <th>지방소득세</th>
       <th>국민연금</th>
       <th>건강보험</th>
       <th>고용보험</th>
       <th>요양보험</th>
       <th>지급합계</th>
       <th>공제합계</th>
       <th>실수령액</th>
       <th>급여계산</th>
       <th>
	 		<button class="btn btn-outline-linkedin btn-sm" id="request">
	 			요청
	 		</button>
	   </th>
     </tr>
   </thead>
   <tbody id="tbody">
   <c:forEach var="dto" items="${list}">
	 <tr>
	   <td style="display:none"><input type="hidden" class="input1" name="month" value="${dto.payday}"></td>
	   <td><input type="hidden" class="input1" name="salary_id" value="${dto.salary_id}">${dto.salary_id}</td>
	   <td>${dto.employee_id}</td>
	   
	   <td><input type="hidden" class="input1" name="basic_salary" value="${dto.basic_salary}">${dto.basic_salary}</td>
	   <td><input type="hidden" class="input1" id="overtime_pay" name="overtime_pay" value="${dto.overtime_pay}">${dto.overtime_pay}</td>
	   
	   <c:if test="${fn:contains(dto.payment_status, 'N')}">
		   <td><input type="text" class="input1" id="bonus_pay" name="bonus_pay" value="${dto.bonus_pay}"></td>
		   <td><input type="text" class="input1" name="transportation_fee" value="${dto.transportation_fee}"></td>
		   <td><input type="text" class="input1" name="holyday_pay" value="${dto.holyday_pay}"></td>
		   <td><input type="text" class="input1" name="position_pay" value="${dto.position_pay}"></td>
		   <td><input type="text" class="input1" name="meel_fee" value="${dto.meel_fee}"></td>
		   <td><input type="text" class="input1" name="drive_fee" value="${dto.drive_fee}"></td>
		   <td><input type="text" class="input1" name="child_fee" value="${dto.child_fee}"></td>
	   </c:if>
	   <c:if test="${fn:contains(dto.payment_status, 'R')}">
	   	   <td><input type="hidden" class="input1" id="bonus_pay" name="bonus_pay" value="${dto.bonus_pay}">${dto.bonus_pay}</td>
		   <td><input type="hidden" class="input1" name="transportation_fee" value="${dto.transportation_fee}">${dto.transportation_fee}</td>
		   <td><input type="hidden" class="input1" name="holyday_pay" value="${dto.holyday_pay}">${dto.holyday_pay}</td>
		   <td><input type="hidden" class="input1" name="position_pay" value="${dto.position_pay}">${dto.position_pay}</td>
		   <td><input type="hidden" class="input1" name="meel_fee" value="${dto.meel_fee}">${dto.meel_fee}</td>
		   <td><input type="hidden" class="input1" name="drive_fee" value="${dto.drive_fee}">${dto.drive_fee}</td>
		   <td><input type="hidden" class="input1" name="child_fee" value="${dto.child_fee}">${dto.child_fee}</td>
	   </c:if>
	   <c:if test="${fn:contains(dto.payment_status, 'Y')}">
	   	   <td><input type="hidden" class="input1" id="bonus_pay" name="bonus_pay" value="${dto.bonus_pay}">${dto.bonus_pay}</td>
		   <td><input type="hidden" class="input1" name="transportation_fee" value="${dto.transportation_fee}">${dto.transportation_fee}</td>
		   <td><input type="hidden" class="input1" name="holyday_pay" value="${dto.holyday_pay}">${dto.holyday_pay}</td>
		   <td><input type="hidden" class="input1" name="position_pay" value="${dto.position_pay}">${dto.position_pay}</td>
		   <td><input type="hidden" class="input1" name="meel_fee" value="${dto.meel_fee}">${dto.meel_fee}</td>
		   <td><input type="hidden" class="input1" name="drive_fee" value="${dto.drive_fee}">${dto.drive_fee}</td>
		   <td><input type="hidden" class="input1" name="child_fee" value="${dto.child_fee}">${dto.child_fee}</td>
	   </c:if>
	   <td><input type="hidden" class="input1" name="income_tax" value="${dto.income_tax}">${dto.income_tax}</td>
	   <td><input type="hidden" class="input1" name="local_income_tax" value="${dto.local_income_tax}">${dto.local_income_tax}</td>
	   <td><input type="hidden" class="input1" name="national_pension" value="${dto.national_pension}">${dto.national_pension}</td>
	   <td><input type="hidden" class="input1" name="health_insurance" value="${dto.health_insurance}">${dto.health_insurance}</td>
	   <td><input type="hidden" class="input1" name="employment_insurance" value="${dto.employment_insurance}">${dto.employment_insurance}</td>
	   <td><input type="hidden" class="input1" name="long_term_care" value="${dto.long_term_care}">${dto.long_term_care}</td>
	   <td><label class="badge badge-success">${dto.amount_pay}</label></td>
	   <td><label class="badge badge-success">${dto.tax}</label></td>
	   <td>
	   	<label class="badge badge-success">${dto.net_pay}</label>
	   </td>
	   <c:if test="${fn:contains(dto.payment_status, 'N')}">
	   		<td class="button"><label class="badge badge-info"><i class="mdi mdi-plus"></i></label></td>
	   </c:if>
	   <c:if test="${fn:contains(dto.payment_status, 'R')}">
	   		<td><label class="badge badge-danger"><i class="mdi mdi-minus"></i></label></td>
	   </c:if>
	   <c:if test="${fn:contains(dto.payment_status, 'Y')}">
	   		<td><label class="badge badge-danger"><i class="mdi mdi-minus"></i></label></td>
	   </c:if>
	   <c:if test="${fn:contains(dto.payment_status, 'N')}"><td><label class="badge badge-danger">승인대기</label></td></c:if>
	   <c:if test="${fn:contains(dto.payment_status, 'R')}"><td><label class="badge badge-warning">승인요청</label></td></c:if>
	   <c:if test="${fn:contains(dto.payment_status, 'Y')}"><td class="detail"><label class="badge badge-info">급여명세서</label></td></c:if>
	 </tr>
	</c:forEach>
    </tbody>
  </table>
</form>
</div>

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

