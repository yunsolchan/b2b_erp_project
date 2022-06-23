<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
 <title>expenditure_request_reject</title>
</head>
<body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$(function(){
	var reject_result = ${reject_result};
	if(reject_result == 1){
		swal("지출요청 보류처리가 정상적으로 완료됐습니다!", {
		    icon: "success" 
		  })
		  .then((willDelete) => {
			  opener.document.location.reload();
			  self.close();
		  });
	}
	else{
		swal("일시적인 오류로 인해 지출요청 보류처리에 실패했습니다!", {
		    icon: "warning" 
		  })
		  .then((willDelete) => {
			  window.history.back();
		  });
	}
});
</script>
<!-- 지출요청 보류처리 -->
</body>

</html>

