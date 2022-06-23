<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${cnt == 1}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		swal("비밀번호가 일치합니다.", {
	    icon: "success" 
	  })
	  .then((willDelete) => {
		 window.location="pw_update2.gh";
	  });
	</script>
</c:if>
<c:if test="${cnt == 0}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		swal("비밀번호가 일치하지 않습니다.", {
	    icon: "warning" 
	  })
	  .then((willDelete) => {
		 window.history.back();
	  });
	</script>
</c:if>

</body>
</html>