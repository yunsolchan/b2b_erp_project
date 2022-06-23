<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title></title>
  
</head>
<body>
  <div class="card-body">
     <form class="forms-sample" name= "cost_request" method="post" action="account_cost_request_action.gh">
         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <div id="result">
               
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;내용</label>
                <select class="js-example-basic-single form-control" name="what_cost" required>
	                <option value="비품관리비">비품관리비</option>
	                <option value="회식비">회식비</option>
              	</select>
              </div>
              
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;비용</label>
                <input type="number" class="form-control" id="exampleInputName1" name="how_much_cost" placeholder="청구할 비용을 입력해 주세요" required />
              </div>
               
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;상세내용</label>
                <input type="text" class="form-control" id="exampleInputName1" name="what_cost_detail" placeholder="상세내역을 입력해주세요." required />
              </div>
               
              <div class="form-group">
                <label for="exampleInputName1"><i class="mdi mdi-checkbox-marked-circle"></i>&nbsp;비용발생일자</label>
                <input type="date" class="form-control" id="exampleInputName1" name="cost_date" required />
              </div>
              
              <div align="center">
	              <button type="submit" class="btn btn-primary me-3">요청하기</button>
	              <button type="reset" class="btn btn-light">초기화</button>
              </div>
            </div>
       </form>
   </div>
</body>

</html>

