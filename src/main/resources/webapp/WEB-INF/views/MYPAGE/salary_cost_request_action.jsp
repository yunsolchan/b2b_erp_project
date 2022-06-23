<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${insertCnt == 1}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		swal("요청되었습니다.", {
	    icon: "success" 
	  })
	  .then((willDelete) => {
		 window.location="my_request_list.gh";
	  });
	</script>
</c:if>
<c:if test="${insertCnt == 0}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		swal("요청에 실패하였습니다. 입력하신 정보를 확인해주세요", {
	    icon: "warning" 
	  })
	  .then((willDelete) => {
		 window.history.back();
	  });
	</script>
</c:if>

</body>
</html>