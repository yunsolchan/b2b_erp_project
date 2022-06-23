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
   
      .date{
      font-size: 40px;
    font-weight: bold;
   }
   .time{
    font-size: 70px;
    font-weight: bold;
    color: rgb(179, 21, 171);  /*보라색 */
}
   </style>
   
<script type="text/javascript">
$(function(){ //페이지가 로드시 수행 
	
	// 개인 출/퇴근 정보 호출 
	per_attend_list();
	
	//현재시간 출력
	setClock();
	setInterval(setClock,1000); //1초마다 setClock 함수 실행
	
});

//변수 설정


/* 시간설정 S */
function setClock(){
    var dateInfo = new Date(); 
    var hour = modifyNumber(dateInfo.getHours());
    var min = modifyNumber(dateInfo.getMinutes());
    var sec = modifyNumber(dateInfo.getSeconds());
    var year = dateInfo.getFullYear();
    var month = dateInfo.getMonth()+1; //monthIndex를 반환해주기 때문에 1을 더해준다.
    var date = dateInfo.getDate();
    
   	
    document.getElementById("time").innerHTML = hour + ":" + min  + ":" + sec;
    document.getElementById("date").innerHTML = year + "년 " + month + "월 " + date + "일";
}
    
function modifyNumber(time){
    if(parseInt(time)<10){
        return "0"+ time;
    }
    else
        return time;
}
/* 시간설정  E */


//개인 출/퇴근 정보 호출 
function per_attend_list() {
	$.ajax({
		type: "post",
		url: "${path}/per_attend_list_call.is?${_csrf.parameterName}=${_csrf.token}",
		/* data: "num=${dto.num}", */
		success: function(result) {
			$('#per_attend_list').html(result);
		},
		error:function() {
			alert("오류 : 개인 출퇴근 정보 호출");
		}
	});
} 

//출근 등록 S--------------
function go_to_work() {
	alert("출근시간이 입력되었습니다.");
	var timezoneOffset = new Date().getTimezoneOffset() * 60 * 1000;	
	var curDate = new Date(Date.now() - timezoneOffset);
	
	var per_go_work_time = curDate.toISOString();
		console.log(per_go_work_time);
	var param = {
		"START_DATE": per_go_work_time,
		"ATTENDANCE_STATUS": '출근',
		"EMPLOYEE_ID": '${sessionID}'
	}
	
	
	$.ajax({
		type: "post",
		url: "${path}/per_attend_insert_ajax.is?${_csrf.parameterName}=${_csrf.token}",
		data: param,
		success: function() { 
			alert("성공")
			per_attend_list();
		},
		error:function() {
			alert("오류 : 개인 출근 정보 입력ajax");
		}
	});
}
//출근 등록 E--------------

//퇴근 등록 S--------------
function get_off_work() {
	alert("퇴근시간이 입력되었습니다.");
	var timezoneOffset = new Date().getTimezoneOffset() * 60 * 1000;	
	var curDate = new Date(Date.now() - timezoneOffset);
	
	var per_off_work_time = curDate.toISOString();
		console.log(per_off_work_time);
	var param = {	
		"END_DATE": per_off_work_time,
		"ATTENDANCE_STATUS": '퇴근',
		"EMPLOYEE_ID": '${sessionID}'
	}
	
	$.ajax({
		type: "post",
		url: "${path}/per_attend_update_ajax.is?${_csrf.parameterName}=${_csrf.token}",
		data: param,
		success: function() { 
			alert("성공")
			per_attend_list();
		},
		error:function() {
			alert("오류 : 개인 퇴근 정보 업데이트 ajax");
		}
	});
	
}
//퇴근 등록 E--------------



</script>     
  
</head>
<body>
<div class="container-scroller"> 
  <!-- 헤더 -->
  <%@ include file="/WEB-INF/views/header.jsp" %>
  
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
    <!-- 마이페이지 레프트메뉴 S-->
      <%@ include file="/WEB-INF/views/MYPAGE/leftMenu.jsp" %>
    <!-- 마이페이지 레프트메뉴 E-->
    
      <div class="main-panel">
        <div class="content-wrapper">
        <div class="d-flex flex-row align-items-center">
	      <i class="mdi mdi-alarm-check icon-lg text-success"></i>
	      	<h2 style="font-family: inherit; padding: 2% 0;">
	        	 출/퇴근 등록
	        </h2>
	    </div>
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
              
                <div class="card-body">
                  	<!-- 현재시간 S  -->
				    <div id="time" class="time"></div>
				    <div id="date" class="date"></div>
					<!-- 현재시간 E  -->					
                  
                  <hr>
                  	<!-- 개인 출/퇴근 정보 호출  ajax S  -->
					<div id="per_attend_list"></div>
                  	<!-- 개인 출/퇴근 정보 호출 ajax  E -->
                </div>
                
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
      </div>
      <!-- main-panel ends -->
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

