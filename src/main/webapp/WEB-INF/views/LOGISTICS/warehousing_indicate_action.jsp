<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>입고처리 액션</title>
</head>
<body>
      <!-- 여기서부터 작성 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<c:if test="${updateCnt == 2}">
<script type="text/javascript">
swal("${updateCnt_lack}개의 물품이 입고처리되었습니다.", {
    icon: "success" 
  })
  .then((willDelete) => {
     opener.document.location.reload();
     self.close();
  });
</script>
</c:if>
<c:if test="${updateCnt != 2}">
<script type="text/javascript">
swal("입고처리중에 오류가 발생하였습니다. 다시 확인해주세요.", {
    icon: "warning" 
  })
  .then((willDelete) => {
     window.history.back();
  });
</script>
</c:if>
<!-- 신규 계좌 등록처리-->
  <!-- End custom js for this page-->
</body>

</html>
