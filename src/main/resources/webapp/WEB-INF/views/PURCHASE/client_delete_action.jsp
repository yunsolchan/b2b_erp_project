<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<c:if test="${deleteCnt == 1}">
	<script type="text/javascript">
	$(function(){
	   swal("거래처 삭제가 정상적으로 완료됐습니다!", {
	       icon: "success" 
	     })
	     .then((willDelete) => {
	    	 history.back();
	     });
	});
	   </script>
   </c:if>
   
   <c:if test="${deleteCnt == 0}">
	<script type="text/javascript">
	$(function(){
	   swal("거래처 삭제를 실패하였습니다", {
	       icon: "error" 
	     })
	     .then((willDelete) => {
	    	 history.back();
	     });
	});
	   </script>
   </c:if>
   
</body>
</html>