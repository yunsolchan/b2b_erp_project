<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여명세서</title>
<style type="text/css">
	h2 { text-align: center; }
	.right { text-align: right; }
	.total { text-align: center; font-weight: bold; }
</style>
</head>
<body>
	<h2>급여명세서</h2>
	<form>
		<table align="center" border="1" style="width:500px; background: #ccc;">
			<tr>
				<th colspan="4">지급내역</th>
			</tr>
			
			<tr>
				<td>기본급</td>
				<td class="right">111,111</td>
				<td>직급수당</td>
				<td class="right">111,111</td>
			</tr>
			
			<tr>
				<td>초과수당</td>
				<td class="right">111,111</td>
				<td>식대</td>
				<td class="right">111,111</td>
			</tr>
			
			<tr>
				<td>상여금</td>
				<td class="right">111,111</td>
				<td>자가운전보조금</td>
				<td class="right">111,111</td>
			</tr>
			
			<tr>
				<td>여비교통비</td>
				<td class="right">111,111</td>
				<td>육아수당</td>
				<td class="right">111,111</td>
			</tr>
			
			<tr>
				<td>주휴수당</td>
				<td class="right">111,111</td>
			</tr>
			
			<tr>
				<th colspan="4">공재내역</th>
			</tr>
			<tr>
				<td>소득세</td>
				<td class="right">111,111</td>
				<td>건강보험</td>
				<td class="right">111,111</td>
			</tr>
			
			<tr>
				<td>지방소득세</td>
				<td class="right">111,111</td>
				<td>고용보험</td>
				<td class="right">111,111</td>
			</tr>
			
			<tr>
				<td>국민연금</td>
				<td class="right">111,111</td>
				<td>장기요양보험</td>
				<td class="right">111,111</td>
			</tr>
			
			<tr>
				<td colspan="3" class="total">총수령액</td>
				<td class="right">111,111</td>
			</tr>
		</table>
	</form>
</body>
</html>