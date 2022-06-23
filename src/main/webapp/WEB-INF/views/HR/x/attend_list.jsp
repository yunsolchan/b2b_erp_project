<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태 조회</title>
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
			<caption>근태 조회</caption>
			  <thead>
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">근무일</th>
			      <th scope="col">시작시간</th>
			      <th scope="col">종료시간</th>
			      <th scope="col">야근시간</th>
			      <th scope="col">초과근무시간</th>
			      <th scope="col">근태</th>
			      <th scope="col">사번</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			   	<th scope="row"><input type="checkbox"></th>
			      <td>2022-01-01</td>
			      <td>09시 30분</td>
			      <td>18시 30분</td>
			      <td>30분</td>
			      <td>30분</td>
			      <td>1</td>
			      <td>1234</td>
			    </tr>
			    <tr>
			   	<th scope="row"><input type="checkbox"></th>
			      <td>2022-01-01</td>
			      <td>09시 30분</td>
			      <td>18시 30분</td>
			      <td>30분</td>
			      <td>30분</td>
			      <td>1</td>
			      <td>1234</td>
			    </tr>
			    <tr>
			   	<th scope="row"><input type="checkbox"></th>
			      <td>2022-01-01</td>
			      <td>09시 30분</td>
			      <td>18시 30분</td>
			      <td>30분</td>
			      <td>30분</td>
			      <td>1</td>
			      <td>1234</td>
			    </tr>
			    <tr>
			   	<th scope="row"><input type="checkbox"></th>
			      <td>2022-01-01</td>
			      <td>09시 30분</td>
			      <td>18시 30분</td>
			      <td>30분</td>
			      <td>30분</td>
			      <td>1</td>
			      <td>1234</td>
			    </tr>
			    <tr>
			   	<th scope="row"><input type="checkbox"></th>
			      <td>2022-01-01</td>
			      <td>09시 30분</td>
			      <td>18시 30분</td>
			      <td>30분</td>
			      <td>30분</td>
			      <td>1</td>
			      <td>1234</td>
			    </tr>
			  </tbody>
			</table>
			
			<div class="btn-group" role="group" aria-label="Basic mixed styles example">
			  <input type="button" class="btn btn-danger" value="근태등록" onclick="window.location.href='attend_insert.hj'">
			  <input type="button" class="btn btn-warning" value="근태수정">
			  <input type="button" class="btn btn-success" value="근태삭제">
			</div>
		</div>
	</div>
	
	<!-- 전체 wrap -->
	</div>
</body>
</html>