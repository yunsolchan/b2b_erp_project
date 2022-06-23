<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서목록</title>
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
			<caption>부서목록</caption>
			  <thead>
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">부서명</th>
			      <th scope="col">업무</th>
			      <th scope="col">전화</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			   	<th scope="row"><input type="checkbox"></th>
			      <td><a href="dept_detail.hj">인사</a></td>
			      <td>인사관리</td>
			      <td>010-111-1111</td>
			    </tr>
			    <tr>
			      <th scope="row"><input type="checkbox"></th>
			      <td>물류</td>
			      <td>물류관리</td>
			      <td>010-111-1111</td>
			    </tr>
			    <tr>
			      <th scope="row"><input type="checkbox"></th>
			      <td colspan="2">구매</td>
			      <td>010-111-1111</td>
			    </tr>
			  </tbody>
			</table>
			
			<div class="btn-group" role="group" aria-label="Basic mixed styles example">
			  <input type="button" class="btn btn-danger" value="부서추가" onclick="window.location.href=''">
			  <input type="button" class="btn btn-warning" value="Middle">
			  <input type="button" class="btn btn-success" value="Right">
			</div>
		</div>
	</div>
	
	<!-- 전체 wrap -->
	</div>
</body>
</html>