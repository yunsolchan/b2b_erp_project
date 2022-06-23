<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승인요청 처리</title>
</head>
<body>

<c:if test="${updateCnt == 1}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		swal("승인되었습니다.", {
	    icon: "success" 
	  })
	  .then((willDelete) => {
		  window.history.back();
	  });
	</script>
</c:if>
<c:if test="${updateCnt == 0}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		swal("승인에 실패하였습니다.", {
	    icon: "warning" 
	  })
	  .then((willDelete) => {
		 window.history.back();
	  });
	</script>
</c:if>

</body>
</html>