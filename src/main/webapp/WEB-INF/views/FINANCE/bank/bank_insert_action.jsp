<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>bank_insert_action</title>
</head>
<body>
<!-- 여기서부터 작성 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	$(function(){
		var bank_insert = ${bank_insert};
		if(bank_insert == 1){
			swal("계좌등록이 정상적으로 완료됐습니다!", {
			    icon: "success" 
			  })
			  .then((willDelete) => {
				  opener.document.location.reload();
				  self.close();
			  });
		}
		else{
			swal("일시적인 오류로 인해 신규계좌등록에 실패했습니다!", {
			    icon: "warning" 
			  })
			  .then((willDelete) => {
				  window.history.back();
			  });
		}
	});
</script>
<!-- 계좌등록 처리 -->
</body>
</html>

