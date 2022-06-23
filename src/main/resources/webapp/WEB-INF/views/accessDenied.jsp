<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>accessDenied</title>
<script>
	// security 접근제한
	$(function(){
		alert("${errMsg}");
		window.location("${path}/main.test");
	});
</script>
</head>
<body>
accessDenied
</body>
</html>