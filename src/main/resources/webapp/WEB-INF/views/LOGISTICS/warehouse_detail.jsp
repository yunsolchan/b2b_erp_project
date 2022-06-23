<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>창고상세</title>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
<style type="text/css">

    // CSS의 position 속성을 이용하여 두개의 DIV 레이아웃을 겹친다.

    .u.i-progressbar { position:relative; }
    .progress-label {
        position:absolute;
        left:50%;
        top:8px;
        font-weight:bold;
        margin-left:-40px;
    }
</style>
<script type="text/JavaScript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/JavaScript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
       
        var barProgress = jQuery(".progressbar");
       

        // value 값의 숫자를 입력함으로서 내용을 채울 수 있다.

        barProgress.eq(0).progressbar({value:25});
        barProgress.eq(0).find(".ui-progressbar-value").css({"background":"#CC66CC"});
       
        barProgress.eq(1).progressbar({value:75});
        barProgress.eq(1).find(".ui-progressbar-value").css({"background":"#FFCC66"});
       
        barProgress.eq(2).progressbar({value:50});
        barProgress.eq(2).find(".ui-progressbar-value").css({"background":"#DDDDDDD"});
    });
</script>

</head>
<body>
  <div class="container-scroller"> 
                <div class="card-body nav-item">
                  <h3 class="card-title">창고정보</h3>
                  <p class="card-description">
                   		 창고상세
                  </p>
                 <!-- 여기서부터 작성 -->
       <div class="table-responsive nav flex-column sub-menu">
          <!-- 창고명 -->  
  		  	<div class="form-group nav-item" style="width:40%" >
              <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;창고명</label>
              <input type="text" class="form-control"  name="wa_name" value="${dto.wa_name}" disabled/>
            </div>
         
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
               <input type="text" class="form-control"  name="wa_reg_date" value="${dto.wa_reg_date}" disabled/>
            </div>
            
            <!-- 총용적 -->  
            <div class="form-group nav-item" style="width:40%">
               <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;총용적</label>
               <input type="text" class="form-control" name="volume" value="${dto.volume}" disabled />
            </div>
            
             <!-- 가용용적-->  
            <div class="form-group nav-item" style="width:40%">
               <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;가용용적</label>
               <!-- <progress value="사용중인용적" max="창고용적"></progress> -->
            <!--    <div class="progressbar"><div class="progress-label">50%</div></div> -->
               <input type="text" class="form-control" name="volume" value="${dto.volume}" disabled/>
            </div>
	      </div>
	   </div>
	</div>             
</body>

</html>

