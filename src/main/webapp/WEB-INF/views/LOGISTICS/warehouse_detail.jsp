<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/MENU/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>창고상세</title>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
</head>
<body>
  <div class="container-scroller"> 
                <div class="card-body nav-item">
                  <h2 class="card-title" style="font-family:'IBM Plex Sans KR', sans-serif; font-weight:bold;">창고정보 -${dto.wa_name}</h2>
                  <p class="card-description">
                   		 창고상세
                  </p>
                 <!-- 여기서부터 작성 -->
       <div class="table-responsive nav flex-column sub-menu">
         <%--  <!-- 창고명 -->  
  		  	<div class="form-group nav-item" style="width:40%" >
              <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;창고명</label>
              <input type="text" class="form-control"  name="wa_name" value="${dto.wa_name}" disabled/>
            </div> --%>
            
           <!-- 주소 -->  
            <div class="form-group nav-item" style="width:70%">
              <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;주소</label>
              <input type="text" class="form-control" size="auto"  name="wa_address" value="${dto.wa_address}" disabled/>
            </div>
            
            <!-- 상세주소 -->  
            <div class="form-group nav-item" style="width:70%">
              <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;상세주소</label>
              <input type="text" class="form-control" size="auto"  name="wa_detail_address" value="${dto.wa_detail_address}" disabled />
            </div>  
            
            <!-- 등록일 -->  
            <div class="form-group nav-item" style="width:70%">
               <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;창고 등록일</label>
               <input type="text" class="form-control"  name="wa_reg_date" value="${dto.account_number}" disabled/>
            </div>
            
            <!-- 총용적 -->  
            <div class="form-group nav-item" style="width:40%">
               <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;총용적</label>
               <input type="text" class="form-control" name="volume" value="${dto.volume}" disabled />
            </div>
            
             <!-- 가용용적-->  
            <div class="form-group nav-item" style="width:66%;">
               <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;가용용적</label>
               <!-- <progress value="사용중인용적" max="창고용적"></progress> -->
               <div class="progress" style="border: 0.1px solid #BBBCD7;">
              	 <!-- <div class="progress-bar bg-primary" role="progressbar" style="width:50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div> -->
	              	 <c:if test="${rate <= 25 && rate > 0}">
	              	 	<div class="progress-bar bg-info" role="progressbar" style="width: ${rate}%" aria-valuenow="${rate}" aria-valuemin="0" aria-valuemax="100"></div> 
	              	 </c:if>
	              	 
	              	 <c:if test="${rate <= 50 && rate > 25}">
	              	 	<div class="progress-bar bg-success" role="progressbar" style="width: ${rate}%" aria-valuenow="${rate}" aria-valuemin="0" aria-valuemax="100"></div> 
	              	 </c:if>
	              	 
	              	 <c:if test="${rate <= 75 && rate > 50}">
	              	 	<div class="progress-bar bg-warning" role="progressbar" style="width: ${rate}%" aria-valuenow="${rate}" aria-valuemin="0" aria-valuemax="100"></div> 
	              	 </c:if>
	              	 
	              	 <c:if test="${rate <= 100 && rate > 75}">
	              	 	<div class="progress-bar bg-danger" role="progressbar" style="width: ${rate}%" aria-valuenow="${rate}" aria-valuemin="0" aria-valuemax="100"></div> 
	              	 </c:if>
               </div>
               <div class="d-flex justify-content-between fs-6 mt-2">
               		<p class="fw-bold">${use_lack}</p>
              	 	<p class="fw-bold">${all_lack}</p>
               </div>
               <%-- <input type="text" class="form-control" name="volume" value="${dto.volume}" disabled/> --%>
            </div>
	      </div>
	   </div>
	</div>             
</body>

</html>

