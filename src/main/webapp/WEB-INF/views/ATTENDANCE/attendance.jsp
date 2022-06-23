<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
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
  
 <!-- 풀캘린더 설정 S -->
     <link href="${path}/resources/css/fullcalender/main.css" rel="stylesheet" />
    <script src="${path}/resources/js/fullcalender/main.js"></script>
   <script>
   
   document.addEventListener('DOMContentLoaded', function() {
      $(function () {
         /* 페이지 진입시 처음으로 근태정보 호출  S */
         var request = $.ajax({
               url: "${path}/calender_call_ajax.is?${_csrf.parameterName}=${_csrf.token}", 
               method: "POST",
               dataType: "json",
         });
         
         request.done(function(data) {
            console.log(data);
            
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
               /* 캘린더 기본정보(CSS포함) S */
                 /* plugins : [ 'interaction', 'dayGrid' ],  */
                 initialView: 'dayGridMonth',
                   themeSystem: 'bootstrap',
                   locale: 'ko', 
                   /* 캘린더상단 툴바 */
                    headerToolbar: {
                  left: 'prev,next today',
                  center: 'title',
                  right: 'dayGridMonth,timeGridWeek,listWeek'
                  },
                  buttonText: {
                     today : "오늘",
                     month : "월별",
                     week : "주별",
                     list : "목록"
                     },
                 /* 캘린더 기본정보(CSS포함) E */
                 
                 /* 캘린더 기능 관련  */
               navLinks: true,
               editable: true,
               selectable: true,
               droppable: true,
               dayMaxEvents: true,
               
               /* 이벤트 생성 S */
                   select: function(arg) {
                 
                       alert('날짜를 선택하셨습니다. 휴가일정을 체크하세요');
                        var title = '휴가요청'
                        var start = ""
                        var g_color = "#378006"
                        
                       if (title) { 
                         calendar.addEvent({ 
                            title: title, 
                            start: arg.start, 
                            end: arg.end, 
                            /* allDay: arg.allDay,  */
                            color: g_color, 
                            /* textColor:"black" */
                         })
                      }
                        else {
                         return false;
                      } 
                      
                      console.log("입력정보시작");
                      console.log(arg);
                      console.log(arg.start); //00시
                      console.log("입력정보끝");
                        /* console.log("추가되는 이벤트정보 : " + addEvent_info); */
                        
                      /* var input_events = calendar.getEvents();
                      console.log("캘린더정보" + input_events); */
                      
                      var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                        var obj = new Object();
                      obj.title = title;
                      obj.start = arg.start.toISOString();
                      obj.end = arg.end.toISOString();
                      obj.color = g_color
                      /* obj.allDay = arg.allDay; */
                      events.push(obj);
                       
                /*    for (var i = 0; i < input_events.length; i++) { //전체 이벤트 정
                     var obj = new Object();     // Json 을 담기 위해 Object 선언
                     obj.title = input_events[i]._def.title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
                     obj.start = input_events[i]._instance.range.start; // 시작
                     obj.end = input_events[i]._instance.range.end; // 끝
                            events.push(obj);
                  }  */
                      
                  var jsondata = JSON.stringify(events);
                  console.log(jsondata);
              
                        $(function saveData(jsondata) {
                            $.ajax({
                                url: "${path}/calender_insert_ajax.is?${_csrf.parameterName}=${_csrf.token}",
                                method: "POST",
                               /*  dataType: "json", */
                                data: JSON.stringify(events),
                                contentType: 'application/json',
                        /* success: function(result) {  */ 
                                success: function() { 
                                 alert("휴가승인 요청되었습니다.");
                                  /* document.location.reload(); */
                                  /* location.reload();  */
                                  $.ajax({
                                   url: "${path}/calender_call_ajax.is?${_csrf.parameterName}=${_csrf.token}", 
                                   method: "POST",
                                   dataType: "json",
                                   success: function(result) {
                                      console.log("재로딩성공?")
                                      console.log(calendar.events);
                                      calendar.events;
                                      calendar.render(); 
                                      
                                   }
                                });
                                 
                              },
                              error : function(error) {
                                 alert("에러 발생 insert_ajax");
                              }  
                        });
                     calendar.unselect()
                        });
               },
               
                events : data
               
       /*         eventTimeFormat: { // like '14:30:00'
                   hour: '2-digit',
                   minute: '2-digit', 
                   hour12: false
               }, */

            });
            
              calendar.render();
            /* 페이지 진입시 처음으로 근태정보 호출  E */
         });
           request.fail(function( jqXHR, textStatus ) {
               alert( "Request failed: " + textStatus );
         });
      });
   });     

    </script>
  <!-- 풀캘린더 설정 E -->
  
  
</head>
<body>
<div class="container-scroller"> 
   <!-- 헤더 S -->
   <%@ include file="/WEB-INF/views/MYPAGE/header.jsp" %>
   <!-- 헤더 E -->
   
   <!-- partial -->
   <div class="container-fluid page-body-wrapper">
    
    <!-- 레프트메뉴 S -->
   <%-- <%@ include file="/WEB-INF/views/leftMenu.jsp" %> --%>
   <!-- 마이페이지 레프트 메뉴 -->
   <%@ include file="/WEB-INF/views/MYPAGE/leftMenu.jsp" %>
   <!-- 레프트메뉴 E -->
   
   <div class="main-panel">
      <div class="content-wrapper" style="display:flex; flex-direction: column;">
           <div class="row" >
            <div class="col-lg-12 grid-margin stretch-card">
               <div class="card" >
             
                <!-- 캘린더 -->
                 <div class="card-body" style="width:80%; height:80%">
                   <!-- 풀캘린더 S -->
                   <div id='calendar'>
                   </div>
                   <!-- 풀캘린더 E -->
               </div> <!-- class="card-body" -->
               
               <!-- 휴가정보 -->
               <div id="per_leave_info">
                  개인별 휴가 정보
               </div>
               
               </div><!-- class="card" -->
            </div>
         </div>
      </div>
   </div> <!-- class="main-panel" -->
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
