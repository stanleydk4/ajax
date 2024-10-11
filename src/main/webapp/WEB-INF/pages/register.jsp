<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Register</title>
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
						<a href="protected/index" class="nav-link">首頁</a>
					</li>
					<li class="nav-item">
						<a href="protected/main" class="nav-link">樂透</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center mb-4">註冊</h3>
                        <form action="<%= request.getContextPath() %>/register" method="post">
                            <div class="form-group">
                                <label for="username">帳號</label>
                                <input type="text" class="form-control" id="username" name="username" required placeholder="請輸入帳號">
                            </div>
                            <div class="form-group">
                                <label for="password">密碼</label>
                                <input type="password" class="form-control" id="password" name="password" required placeholder="請輸入密碼">
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary btn-block">註冊</button>
                                <a href="<%=request.getContextPath() %>/login" class="btn btn-secondary btn-block">返回</a>  
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <p class="text-center text-danger">${error}</p>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
	
</body>
</html>