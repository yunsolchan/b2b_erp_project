<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
 <title>expenditure_transfer_action</title>
</head>
<body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	$(function(){
		var result = ${result};
		if(result == 1){
			swal("지출결의서 작성이 정상적으로 완료됐습니다!", {
			    icon: "success" 
			  })
			  .then((willDelete) => {
				  opener.document.location.reload();
				  self.close();
			  });
		}
		else{
			swal("일시적인 오류로 인해 지출결의서 작성에 실패했습니다!", {
			    icon: "warning" 
			  })
			  .then((willDelete) => {
				  window.history.back();
			  });
		}
	});
</script>
</body>

</html>

