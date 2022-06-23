<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원수정 처리</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<c:if test="${updateCnt == 1}">
		<script type="text/javascript">
			swal("사원수정이 정상적으로 완료되었습니다", {
			    icon: "success" 
			  })
			  .then((willDelete) => {
			     opener.document.location.reload();
			     self.close();
			  });
		</script>
	</c:if>
	
	<c:if test="${updateCnt != 1}">
		<script type="text/javascript">
			swal("사원수정에 실패했습니다.", {
			    icon: "error" 
			  })
			  .then((willDelete) => {
				  window.location="${path}/emp_update.hj";
			  });
		</script>
	</c:if>
</body>
</html>