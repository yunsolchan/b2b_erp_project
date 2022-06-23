<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태 등록</title>
<style type="text/css">
	.wrap { display: flex; justify-content: center; }
	.wrap2 { display: flex; justify-content: center; }
	h3 { padding: 50px 0; text-align: center; }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

	
	<h3>근태 등록</h3>
	<div class="wrap">
	
		<div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">근무일</span>
			  <input type="date" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
			</div>

			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">시작시간</span>
			  <input type="time" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
			</div>
			
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">종료시간</span>
			  <input type="time" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
			</div>
			
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">야근시간</span>
			  <input type="number" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
			</div>
			
		</div>
		
		&nbsp;&nbsp;&nbsp;&nbsp;
		
		<div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">초과근무시간</span>
			  <input type="number" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
			</div>
			
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">근태</span>
			  <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
			</div>

			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">사번</span>
			  <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
			</div>
		</div>
		
		
	
	</div>	
		<div class="wrap2">
		<div>
			<button type="button" class="btn btn-light">Light</button>
			<button type="button" class="btn btn-light">Light</button>
			<button type="button" class="btn btn-light">Light</button>
		</div>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>	
</body>
</html>