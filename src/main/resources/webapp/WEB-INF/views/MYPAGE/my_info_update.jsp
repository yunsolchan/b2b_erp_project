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
<script src="https://unpkg.com/vue@2.6.6/dist/vue.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
/** 우편번호 찾기 */
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
</head>
<body>
  <div class="container-scroller"> 
  <!-- 헤더 -->
  <%@ include file="/WEB-INF/views/MYPAGE/header.jsp" %>
    <div class="container-fluid page-body-wrapper">
    <!-- 레프트메뉴 -->
      <%@ include file="/WEB-INF/views/MYPAGE/leftMenu.jsp" %>
      
      
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-12 stretch-card">
		     <div class="card">
		       <div class="card-body">
		          <h3 class="card-title">정보 수정</h3>
		         <div class="table-responsive pt-3">
			         <form class="forms-sample" name= "joinform" method="post" enctype="Multipart/form-data" action="update_info_action.gh?${_csrf.parameterName}=${_csrf.token}">
			           <table class="table table-bordered">
			             <thead>
			             </thead>
			             
			             <tbody>
			             
			               <tr>
			                 <td class="table-light">변경 전 사진</td>
			                 <td><img src="${dto.photo}" width=90px height=100px/><input type="hidden" value="${dto.photo}" name="old_photo"></td>
			                 <td class="table-light">
			                 	변경 후 사진 
			                 </td>
			                 <td>
			                 	<div id="result">
							        <div v-for="item in fileList"><img v-bind:src="item.url" style='height:100px;width:90px;'></div>
				                	<input type="file" class="file-upload-default" id='uploadFile' name="photo" accept="image/*">
			                	</div>
			                </td>
			                 
			               </tr>
			               
			               <tr>
			                 <td class="table-light">이름</td>
			                 <td><input type="text" class="form-control" id="exampleInputName1" name="name" value="${dto.em_name}" required /></td>
			                 <td class="table-light">입사일</td>
			                 <td><fmt:formatDate value="${dto.hire_date}" pattern="yyyy-MM-dd" /></td>
			               </tr>
			               
			               <tr>
			                 <td class="table-light">사번</td>
			                 <td id="emp_id">${dto.employee_id}</td>
			                 <td class="table-light">직급</td>
			                 <td>${dto.po_name}</td>
			               </tr>
			               
			               <tr>
			                 <td class="table-light">주민번호</td>
			                 <td>${dto.register_number}</td>
			                 <td class="table-light" rowspan="3">
			                 	주소
			                 	<button type="button" onclick="execDaumPostcode()" class="button btn btn-primary btn-sm"><i class="icon-search"></i></button>
			                 </td>
			                 <td>
			                 <input type="text" class="form-control" id="zip_code" name="zip_code" value="${dto.em_zip_code }" required readonly />
			                 </td>
			               </tr>
			               
			               <tr>
			                 <td class="table-light">전화번호</td>
			                 <td><input type="text" class="form-control" size="auto" id="hp" name="hp" value="${dto.em_phone}" placeholder="-를 포함하여 13자리로 입력해주세요" required /></td>
			                 <td><input type="text" class="form-control" size="auto" id="address" name="address" value="${dto.em_address}" required /></td>
			               </tr>
			               
			               <tr>
			                 <td class="table-light">이메일</td>
			                 <td><input type="email" class="form-control" id="exampleInputName1" name="email" value="${dto.em_email}" required /></td>
			                 <td><input type="text" class="form-control" size="auto" id="detail_address" name="detail_address" value="${dto.em_detail_address}" required /></td>
			               </tr>
			               
			               <tr>
			                 <td class="table-light">계좌번호</td>
			                 <td>${dto.account_number}</td>
			                 <td class="table-light">급여</td>
			                 <td>${dto.salary}</td>
			               </tr>
			               
			               <tr>
			                 <td class="table-light">부서명</td>
			                 <td>${dto.de_name}</td>
			                 <td class="table-light">남은 휴가일수</td>
			                 <td>${dto.annual_count}</td>
			               </tr>
			               
			             </tbody>
			           </table>
			           <div align="center" style="margin:20px">
			           	<button type="submit" class="button btn btn-primary btn-md">수정</button>
			           </div>
			       </form>
		         </div>
		       </div>
		     </div>
		   </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  <!-- container-scroller -->
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
