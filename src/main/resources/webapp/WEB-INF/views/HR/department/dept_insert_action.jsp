<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서등록 처리</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<c:if test="${insertCnt == 1}">
		<script type="text/javascript">
			swal("부서등록이 정상적으로 완료되었습니다", {
			    icon: "success" 
			  })
			  .then((willDelete) => {
			     opener.document.location.reload();
			     self.close();
			  });
		</script>
	</c:if>
	
	<c:if test="${insertCnt != 1}">
		<script type="text/javascript">
			swal("부서등록에 실패했습니다.", {
			    icon: "error" 
			  })
			  .then((willDelete) => {
				  window.location="${path}/dept_insert.hj";
			  });
		</script>
	</c:if>
</body>
</html>