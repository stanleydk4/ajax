<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Lottery</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<nav class="naver bg-info naver-dark p-3 navbar-expand-lg">
		<div class="container">
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarSupportedContent">
				<span class="navbar-toggle-icon"></span>
			</button>
			<div class="collapse navbar-collapse">
            	<ul class="navbar-nav d-flex flex-row">
					<li class="nav-item me-3">
						<a href="../protected/index" class="nav-link">首頁</a>
					</li>
					<li class="nav-item">
						<a href="../protected/main" class="nav-link">樂透</a>
					</li>
				</ul>
				<ul class="navbar-nav ms-auto">
                	<li class="nav-item">
                    	<a href="../logout" class="nav-link">登出</a>
                	</li>
            	</ul>
			</div>
		</div>
	</nav>
	<br/>
	<h1 class="text-center">Lottery</h1>
	<form action="${pageContext.request.contextPath}/lotteryController.do" method="get">
		<div class="container mt-4">
        	<div class="row mb-3">
            	<label for="group" class="col-sm-2 col-form-label">組數:</label>
            		<div class="col-sm-10">
               		 <input type="number" class="form-control" name="group" id="group" placeholder="請輸入組數" required/>
            		</div>
        	</div>

	        <div class="row mb-3">
	            <label for="excludeNum" class="col-sm-2 col-form-label">欲排除的數字:</label>
	            <div class="col-sm-10">
	                <input type="text" class="form-control" name="excludeNum" id="excludeNum" placeholder="例如: 5 8 19 44 1" required/>
	            </div>
	        </div>

	        <div class="row mb-3">
	            <div class="col-sm-7 offset-sm-5">
	                <button type="reset" class="btn btn-secondary me-2">重設</button>
	                <button type="submit" class="btn btn-primary">提交</button>
	            </div>
	        </div>
	        <% 
            String error = (String) request.getAttribute("error");
            if (error != null && !error.isEmpty()) { 
        	%>
            <div class="alert alert-danger" role="alert">
                <%= error %>
            </div>
        	<% } %>
	    </div>
	</form>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
	
</body>
</html>

