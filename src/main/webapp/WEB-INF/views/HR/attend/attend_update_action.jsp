<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태승인 처리</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<c:if test="${updateCnt == 1}">
		<c:if test="${updateCnt2 == 1}">
		<script type="text/javascript">
			swal("근태승인이 정상적으로 완료되었습니다.", {
			    icon: "success" 
			  })
			  .then((willDelete) => {
			     window.location="${path}/attend_update.hj";
			  });
		</script>
	</c:if>
</c:if>

</body>
</html>