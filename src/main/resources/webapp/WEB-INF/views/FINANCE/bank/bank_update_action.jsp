<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <title>bank_update_action</title>
</head>
<body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	$(function(){
		var bank_update = ${bank_update};
		if(bank_update == 1){
			swal("계좌정보 수정이 정상적으로 완료됐습니다!", {
			    icon: "success" 
			  })
			  .then((willDelete) => {
				  opener.document.location.reload();
				  self.close();
			  });
		}
		else{
			swal("일시적인 오류로 인해 계좌정보 수정에 실패했습니다!", {
			    icon: "warning" 
			  })
			  .then((willDelete) => {
				  window.history.back();
			  });
		}
	});
</script>
<!-- 계좌수정 처리 -->
</body>
</html>

