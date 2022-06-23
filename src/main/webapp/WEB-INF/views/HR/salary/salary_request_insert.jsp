<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여요청 처리</title>
</head>
<body>

<c:if test="${insert_result == 1}">
	<c:if test="${insertCnt3 == 1}">
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("요청이 완료되었습니다.", {
		    icon: "success" 
		  })
		  .then((willDelete) => {
			  window.location = "${path}/salary.hj?${_csrf.parameterName}=${_csrf.token}";
		  });
		</script>
	</c:if>
</c:if>

<c:if test="${insert_result == 1}">
	<c:if test="${insertCnt3 == 0}">
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("slip insert만 실패 - 급여상태변경", {
			    icon: "warning" 
		  })
		  .then((willDelete) => {
			  window.location = "${path}/salary.hj?${_csrf.parameterName}=${_csrf.token}";
		  });
		</script>
	</c:if>
</c:if>

<c:if test="${insert_result == 10}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		swal("이미 모두 요청되었습니다.", {
	    icon: "success" 
	  })
	  .then((willDelete) => {
		  window.location = "${path}/salary.hj?${_csrf.parameterName}=${_csrf.token}";
	  });
	</script>
</c:if>

</body>
</html>