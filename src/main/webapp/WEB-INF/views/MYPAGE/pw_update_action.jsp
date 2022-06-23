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

<c:if test="${updateCnt == 1}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		swal("비밀번호가 변경되었습니다.", {
	    icon: "success" 
	  })
	  .then((willDelete) => {
		 window.location="myPage.gh";
	  });
	</script>
</c:if>
<c:if test="${updateCnt == 0}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		swal("비밀번호 변경에 실패하였습니다. 비밀번호를 확인해주세요", {
	    icon: "warning" 
	  })
	  .then((willDelete) => {
		 window.history.back();
	  });
	</script>
</c:if>

</body>
</html>