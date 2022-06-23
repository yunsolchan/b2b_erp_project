<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<c:if test="${updateCnt == 1}">
	<script type="text/javascript">
	$(function(){
	   swal("입고신청을 정상적으로 완료됐습니다!", {
	       icon: "success" 
	     })
	     .then((willDelete) => {
	    	  opener.document.location.reload();
	    	     self.close();	    
	    	     });
	});
	   </script>
   </c:if>
   
   <c:if test="${updateCnt == 0}">
	<script type="text/javascript">
	$(function(){
	   swal("입고 신청을 실패하였습니다", {
	       icon: "error" 
	     })
	     .then((willDelete) => {
	    	  opener.document.location.reload();
	    	     self.close();	     
	    	     });
	});
	   </script>
   </c:if>
   
</body>
</html>