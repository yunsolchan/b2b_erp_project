<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div align="center">
   <h1>Product Manager</h1>
   
   <a href="new">Create New Product</a><br/><br/>   <!-- 컨트롤러 requestMapping("/new") -->
   <table border="1" cellpadding="10">
      <thead>
         <tr>
            <th>Product ID</th>
            <th>Name</th>
            <th>Brand</th>
            <th>MadeIn</th>
            <th>Price</th>
            <th>Actions</th>
         </tr>
      </thead>
      
      <tbody>
       <c:forEach var="dto" items="${list}">
       <tr>
            <td>${dto.product_id}</td>  
            <td>${dto.name}"></td>
          
         </tr>
         </c:forEach>
      </tbody>
   </table>
   
   <!-- 실행 -->
</div>

</body>
</html>

</body>
</html>