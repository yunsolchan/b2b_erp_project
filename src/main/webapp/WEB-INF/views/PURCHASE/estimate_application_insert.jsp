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
</head>
<body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

// 팝업창의 값을 이 함수로 받아와 그 값을 기준으로 tr을 추가해준다
function rowAdd(name,id) {
	// 상품 목록 테이블의 tr의 길이를 받아와 trCnt에 넣어준다
    var trCnt = $('#client_table tr').length;
 	// tr의 길이가 10 이하라면
    if(trCnt < 11){
    	// innerHtml에 추가 될 tr의 정보를 입력해준다 
        var innerHtml = "";
        innerHtml += '<tr>';
        innerHtml += '    <td><input type="text" class="form-control" size="auto" id="product_name" name="product_name" value="'+name+ '" required readonly/><input type="hidden" name="product_id" value="'+id+'"></td>';
        innerHtml += '    <td><input type="text" class="form-control" size="auto" id="product_quantity" name="product_quantity"  required /></td>';
        innerHtml += '</tr>';
        // 상품 목로 테이블의 마지막행에 innerHtml변수에 입력해준 tr의 정보를 추가해준다
        $('#client_table > tbody:last').append(innerHtml);
        // tr의 길이가 10 이상이라면
    }else{
        alert("최대 10개까지만 가능합니다.");
        return false;
    }
}

// 상품 등록 버튼을 누르면 실행되는 함수
function rowAddd() {
	// client_id 에 입력된 값을 id에 담아준다
	var id = document.getElementById('client_id').value;
	// id의 값이 null이라면 알럿창을 띄우고 함수를 나간다
	if(!id){
		swal("거래처를 선택해주세요!", {
		       icon: "error" 
		     })
		     .then((willDelete) => {
		     });
		return;
	}
	
	// 현재 선택한 거래처 기준으로 상품 목록을 불러온다.
	var url = "${path}/product_list_select.sc?client_id="+id;
  	  window.open(url, "product","menubar=no, width=700px, height=700px");
}
function rowDelete(){
    var trCnt = $('#client_table tr').length;
    if(trCnt>1){
        $('#client_table > tbody:last > tr:last').remove();
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
      
      // 거래처 불러오기를 누르면 거래처 목록 팝업을 띄워주는 함수를 실행한다
      $("#client_list").click(function(){
    	  var url = "${path}/client_list_select.sc"
    	  window.open(url, "select","menubar=no, width=700px, height=700px");
       });
   
   });
   
   
   

</script>
<c:if test="${insertCnt == 1}">
	<script type="text/javascript">
	   swal("견적신청서작성이 정상적으로 완료됐습니다!", {
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
                  <h3 class="card-title">견적서 신청서 등록</h3>
                  <div class="card">
          <div class="card-body">
          
            <form class="forms-sample" name= "estimate_form" method="post" enctype="Multipart/form-data" action="estimate_application_insert_action.sc?${_csrf.parameterName}=${_csrf.token}">
			<input type="hidden" name="client_id" id="client_id">
			<input type="hidden" name="department_id" id="department_id" value="${dto.department_id }">
			<input type="hidden" name="employee_id" id="employee_id" value="${dto.employee_id }">
            <div id="result">

             <!-- 거래처명 -->  
              <div class="form-group" style="margin-bottom:5px">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;거래처명</label>
                <input type="text" class="form-control" id="exampleInputName1" name="client_name" required readonly/>
              </div>
              <div class="form-group" style="margin-top:0px;">
                <button type="button" class="btn btn-primary me-2" id="client_list">거래처 불러오기</button>
              </div>
              
             <!-- 대표자 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;대표자</label>
                <input type="text" class="form-control" id="exampleInputName1" name="ceo_name" required readonly />
              </div>   
              
              <!-- 거래처 이메일 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;거래처 이메일</label>
                <input type="email" class="form-control" id="exampleInputName1" name="client_email" required readonly/>
              </div>
              
              <!-- 우편번호 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;우편번호</label>
                   <div class="col-sm-2 row" style="flex-wrap: nowrap; padding-left: 1%; width:40%">
                      <input type="text" class="form-control" id="zip_code" name="zip_code" required readonly />
                     
                      <div style="width:20% margin-left:10px">
                      <button type="button" onclick="execDaumPostcode()" class="button btn btn-secondary" style="padding:7px"><i class="icon-search"></i></button>
                      </div>
                    </div>
              </div>
              
              <!-- 주소 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;거래처 주소</label>
                <input type="text" class="form-control" size="auto" id="address" name="address" required readonly/>
              </div>
              
              <!-- 상세주소 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;상세주소</label>
                <input type="text" class="form-control" size="auto" id="detail_address" name="detail_address" required readonly/>
              </div>
              
              <!-- 연락처 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;거래처 연락처</label>
                <div class="col-sm-3 row" style="flex-wrap: nowrap; padding-left: 1%;">
                   <input type="text" class="form-control" size="3" name="cl_phone1" required readonly/> 
                   &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
                   <input type="text" class="form-control" size="4" name="cl_phone2" required readonly/>
                   &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
                   <input type="text" class="form-control" size="4" name="cl_phone3" required readonly/>
                </div>
              </div>               
              
             <!-- 이름 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;담당자</label>
                <input type="text" class="form-control" id="exampleInputName1" name="name" required value="${dto.em_name }" readonly/>
              </div>              
              
              <!-- 연락처 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;담당자 연락처</label>
                <div class="col-sm-3 row" style="flex-wrap: nowrap; padding-left: 1%;">
                   <input type="text" class="form-control" size="3" name="em_phone1" required value="${fn:substring(dto.em_phone,0,2)}" readonly/> 
                   &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
                   <input type="text" class="form-control" size="4" name="em_phone2" required value="${fn:substring(dto.em_phone,4,7)}" readonly/>
                   &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
                   <input type="text" class="form-control" size="4" name="em_phone3" required value="${fn:substring(dto.em_phone,9,12)}" readonly/>
                </div>
              </div>
              
              <!-- 권한 -->
              <div class="form-group">
                <label><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;담당자 부서</label>
                <input type="text" class="form-control" id="exampleInputName1" name="departmentname" required value="${dto.de_name }" readonly/>

              </div>
              
              <!-- 이메일 -->  
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;담당자 이메일</label>
                <input type="email" class="form-control" id="exampleInputName1" name="em_email" value="${dto.em_email }" required readonly/>
              </div>      
              <div class="form-group">
              <button type="button" class="btn btn-primary me-2" onclick="rowAddd();">항목 추가</button>
			  <button type="button" class="btn btn-light" onclick="rowDelete();">항목 삭제</button>
              	<table class="table" id="client_table">
              		<tr>
              			<th align="center">품목명</th>
              			<th align="center">상품수량</th>
              		</tr>
              	</table>
              </div>                   
               <br><br><br>
              <button type="submit" class="btn btn-primary me-2">Submit</button>
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
