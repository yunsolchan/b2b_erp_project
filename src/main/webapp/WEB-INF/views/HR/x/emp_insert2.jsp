<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addAccount</title>
<script src="https://unpkg.com/vue@2.6.6/dist/vue.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
<script>
</script>
</head>
<body>
	<form name= "joinform" method="post" enctype="Multipart/form-data" action="accountAdd.one?${_csrf.parameterName}=${_csrf.token}">
		<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
		<div id='result'>
			<table class="table">
				<tr v-for="item in fileList">
					<th rowspan="4" colspan="4"><img v-bind:src="item.url" style='height:200px;width:180px;'></th>
				</tr>
			</table>
			<table>
				<tr>
					<th colspan="4">사진<input type='file' id='uploadFile' name="photo" accept="image/*" required></th>
				</tr>
				<tr>
					<th>사번</th>
					<td><input type="text" name="employee_id" placeholder="ex)220417_01" required></td>
					<th>이름</th>
					<td><input type="text" name="name" required></td>
				</tr>				
				<tr>
					<th>부서</th>
					<td>
						<select name="department_id" required>
							<%-- 
							<c:forEach var="dto" items="${department_list}">
								<option value="${dto.department_id}">${dto.name}</option>
							</c:forEach>
							 --%>
							 <option value="100">인사부</option>
							 <option value="200">영업부</option>
							 <option value="300">구매부</option>
							 <option value="400">회계부</option>
							 <option value="500">물류부</option>
						</select>
					</td>
					<th>연락처</th>
					<td><input type="text" name="phone1" size="3" required>-
					<input type="text" name="phone2" size="4" required>-
					<input type="text" name="phone3" size="4" required></td>
				</tr>
				<tr>
					<th>주민등록번호</th>
					<td><input type="text" name="regi_num1" size="6" required>-<input type="text" name="regi_num2" size="7" required></td>
					<th>이메일</th>
					<td><input type="email" name="email" required></td>
				</tr>
				<tr>
					<th>입사일</th>
					<td><input type="date" name="hire_date" required></td>
					<th>직급</th>
					<td>
						<select name="position_id" required>
							<%-- 
							<c:forEach var="dto" items="${department_list}">
								<option value="${dto.department_id}">${dto.name}</option>
							</c:forEach>
							 --%>
							 <option value="100">사원</option>
							 <option value="200">계장</option>
							 <option value="300">대리</option>
							 <option value="400">과장</option>
							 <option value="500">부장</option>
						</select>
					</td>
				</tr>
				<tr>
					<th colspan="4">우편번호
					<input type="text" size="10" id="zip_code" name="zip_code" required readonly>
					<button type="button" onclick="execDaumPostcode()" class="button">찾기</button>
					</th>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3">
					<input type="text" size="auto" id="address" name="address" required>
					</td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td colspan="3">
					<input type="text" id="detail_address" name="detail_address" required>
					</td>
				</tr>
				<tr>
					<th>연봉</th>
					<td><input type="number" name="salary" required></td>
					<th>권한</th>
					<td>
						<select name="authority" required>
							 <option value="ROLE_HR">인사업무</option>
							 <option value="ROLE_FINANCE">회계업무</option>
							 <option value="ROLE_USER">영업/구매/물류업무</option>
						</select>
					</td>
				</tr>
			</table>
			<input type="submit" value="등록">
			<input type="reset" value="리셋" id="reset">
		</div>
		
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
<!-- 		
		<input type="file"> 1
		<input type="date"> 1
		<input type="number"> 1		
		<input type="text"> 8
		select 3
 -->
	</form>				
</body>
</html>