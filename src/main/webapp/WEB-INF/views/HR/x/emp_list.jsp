<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사카드 조회</title>
<style type="text/css">
	.wrap { display: flex; justfiy-content: center; height: 100%; }
	.contents_wrap1 { display: flex; align-items: center; justfiy-content: center; width: 100%;}
	.contents_wrap2 { width: 90%; height: auto; margin: 0 auto; }
	caption { caption-side:top; font-size: 26px; }
</style>
</head>
<body>
	<div class="wrap" style="overflow-y: scroll;">
	<%@ include file="/WEB-INF/views/leftMenu.jsp" %>
	<div class="contents_wrap1">
		<div class="contents_wrap2">
			<table class="table">
			<caption>인사카드 조회</caption>
			  <thead>
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">사원코드</th>
			      <th scope="col">이름</th>
			      <th scope="col">전화번호</th>
			      <th scope="col">이메일</th>
			      <th scope="col">입사일</th>
			      <th scope="col">부서코드</th>
			      <th scope="col">직급코드</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			   	<th scope="row"><input type="checkbox"></th>
			      <td>1234</td>
			      <td><a href="emp_detail.hj">Mark</a></td>
			      <td>010-111-1111</td>
			      <td>email@gmail.com</td>
			      <td>2022-01-01</td>
			      <td>인사</td>
			      <td>1</td>
			    </tr>
			    <tr>
			   	<th scope="row"><input type="checkbox"></th>
			      <td>1234</td>
			      <td>Mark</td>
			      <td>010-111-1111</td>
			      <td>email@gmail.com</td>
			      <td>2022-01-01</td>
			      <td>인사</td>
			      <td>1</td>
			    </tr>
			    <tr>
			   	<th scope="row"><input type="checkbox"></th>
			      <td>1234</td>
			      <td>Mark</td>
			      <td>010-111-1111</td>
			      <td>email@gmail.com</td>
			      <td>2022-01-01</td>
			      <td>인사</td>
			      <td>1</td>
			    </tr>
			  </tbody>
			</table>
			
			<div class="btn-group" role="group" aria-label="Basic mixed styles example">
			  <input type="button" class="btn btn-danger" value="사원등록" onclick="window.location.href='addAccount.test'">
			  <input type="button" class="btn btn-warning" value="선택수정">
			  <input type="button" class="btn btn-success" value="pdf출력">
			</div>
		</div>
	</div>
	
	<!-- 전체 wrap -->
	</div>
</body>
</html>