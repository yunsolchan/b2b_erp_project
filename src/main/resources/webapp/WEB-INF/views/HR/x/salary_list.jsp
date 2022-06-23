<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여 조회</title>
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
			<caption>급여 조회</caption>
			  <thead>
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">기본급</th>
			      <th scope="col">초과수당</th>
			      <th scope="col">상여금</th>
			      <th scope="col">여비교통비</th>
			      <th scope="col">주휴수당</th>
			      <th scope="col">직급수당</th>
			      <th scope="col">식대</th>
			      <th scope="col">자가운전보조금</th>
			      <th scope="col">육아수당</th>
			      <th scope="col">소득세</th>
			      <th scope="col">지방소득세</th>
			      <th scope="col">국민연금</th>
			      <th scope="col">건강보험</th>
			      <th scope="col">고용보험</th>
			      <th scope="col">장기요양보험</th>
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
			    
			  </tbody>
			</table>
			
			<div class="btn-group" role="group" aria-label="Basic mixed styles example">
			  <input type="button" class="btn btn-danger" value="급여등록" onclick="window.location.href='attend_insert.hj'">
			  <input type="button" class="btn btn-warning" value="pdf출력">
			  <input type="button" class="btn btn-success" value="">
			</div>
		</div>
	</div>
	
	<!-- 전체 wrap -->
	</div>
</body>
</html>