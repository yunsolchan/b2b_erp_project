<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>부서목록</title>
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
  
   <style>
   th i, #input-form { float: right; }
   </style>  

<script type="text/javascript">
$(document).ready(function() {
	
	/* --------- 변수설정 S --------- */
	//현재시간
	var sysdate = new Date(); 
	/* var ISO_sysdate = sysdate.toISOString(); */
	
	//타임오프존 설정으로 시간차 적용
	var timezoneOff =  new Date().getTimezoneOffset();
	var timezoneOffset = new Date().getTimezoneOffset() * 60 * 1000;
	
	console.log("타임오프존" + timezoneOffset);
	
	var curDate = new Date(Date.now() - timezoneOffset);
	var ISO_sysdate = curDate.toISOString();
	var str_sysdate = ISO_sysdate.substr(0,10); //0000-00-00 날짜 폼
	var str_systime = ISO_sysdate.substr(11,16); //0000-00-00 날짜 폼
	console.log("현재날짜 정보" + str_sysdate);
	
	
	console.log("현재시간 정보" + str_systime);
	
	
	//개인별 출/퇴근정보(<-서버) 
	var per_status = $('#per_attendance_info tr td').eq(1).text();
	var per_date = $('#per_attendance_info tr td').eq(0).text();
	var str_per_date = $('#per_attendance_info tr td').eq(0).text().substr(0,10); //0000-00-00 날짜 폼
	
	//출/퇴근 버튼 활성화 변수
	var go_target = document.getElementById('btn_go_to_work');
	var off_target = document.getElementById('btn_get_off_work');
	/* --------- 변수설정 E --------- */
	
	
	/* --------- 출/퇴근 버튼 활성화 S --------- */
	//출근버튼 활성화 / 퇴근버튼 비활성화 
	if(str_per_date != str_sysdate) {
		go_target.disabled = false;
		off_target.disabled = true;
	}
	//현재 날짜로 출근기록이 있는경우 -> 출근 버튼 비활성화/퇴근버튼 활성화
	else if(per_status == '출근' && str_per_date == str_sysdate) {
		go_target.disabled = true;
		off_target.disabled = false;
	} 
	//현재 날짜로 퇴근기록이 있는경우 -> 출/퇴근 버튼 모드 비활성화
	else if(per_status=='퇴근' && str_per_date == str_sysdate) {
		alert("오늘의 출/퇴근기록이 모두 등록되었습니다.")
		go_target.disabled = true;
		off_target.disabled = true;
		$('#commute_alert').text("출/퇴근 기록이 모두 등록되었습니다. 수정이 필요한 경우 인사부로 문의하시길 바랍니다.");
	}
	/* --------- 출/퇴근 버튼 활성화 E --------- */
		
	
	/* table 오름-내림차룬 정렬 기능 S */
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
	/* table 오름-내림차룬 정렬 기능 E */

	/* table 검색기능 S */
 	$("#keyword").keyup(function() {
        var k = $(this).val();
        console.log(k);
        $("#dept_list > tbody > tr").hide();
        var temp = $("#dept_list > tbody > tr > td:contains('" + k + "')");
        $(temp).parent().show();
	}); 
	/* table 검색기능 E */
	/* 페이징처리 S */
	/* 페이징처리 E */
});
	
</script>
	
</head>
<body>


	<!-- 해당 버튼타입은 그룹으로 묶어서 줘야한다 -->
	<div style="padding-top: 2%;">
		<button id="btn_go_to_work" class="btn btn-outline-primary" onclick="go_to_work()">
			출근등록
		</button>
		<button id="btn_get_off_work" class="btn btn-outline-primary" onclick="get_off_work()" disabled="">
		  	퇴근등록
		</button>
	</div>
                 
	<hr>

    <!-- partial -->
	<h3 class="card-title">출/퇴근 기록</h3>
	<div id ="commute_alert"></div>
	<div class="table-responsive">
	<!-- <form name="dept_list"> -->
		<div id="input-form">
		<input type="text" id="keyword" class="form-control" />
		</div>
		<table class="table table-hover" id="per_attendance_info">
			<thead>
				<tr>
					<th>날짜<i class="mdi mdi-swap-vertical"></i></th>
                    <th>근무<i class="mdi mdi-swap-vertical"></i></th>
                    <th>출근시간<i class="mdi mdi-swap-vertical"></i></th>
                    <th>퇴근시간<i class="mdi mdi-swap-vertical"></i></th>
                    <th>비고<i class="mdi mdi-swap-vertical"></i></th>	
                </tr>
            </thead>
			<tbody>
                <c:forEach var="dto" items="${list}">
			  	<tr>
			    	<td>${dto.at_start_date}</td>
			     	<td>${dto.attendance_status}</td>
			     	<td>${dto.at_start_date}</td>
			     	<td>${dto.at_end_date}</td>
			     	<td id="commute_status">-</td>
			   </tr>
			 	</c:forEach>
  			</tbody>
		</table>
		 <!-- </form> -->
	</div>
      <!-- main-panel ends -->
   

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

