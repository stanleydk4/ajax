<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    .btn-lightblue {
        background-color: #4682B4; 
        color: white; 
    }
    .btn-lightblue:hover {
        background-color: #36648B; 
        color: white;
    }
</style>
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
                        <h3 class="text-center mb-4">登入</h3>
                        <form action="<%=request.getContextPath() %>/login" method="post">
                            <div class="form-group">
                                <label for="username">帳號</label>
                                <input type="text" class="form-control" id="username" name="username" required placeholder="請輸入帳號">
                            </div>
                            <div class="form-group">
                                <label for="password">密碼</label>
                                <input type="password" class="form-control" id="password" name="password" required placeholder="請輸入密碼">
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary btn-block">登入</button>                                                 
	                        	<a href="<%=request.getContextPath() %>/register" class="btn btn-secondary btn-block">註冊</a>
	                        	<a href="<%=request.getContextPath() %>/ajaxLogin" class="btn btn-lightblue btn-block">AJAX登入</a>
	                    	</div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
    
    const urlParams = new URLSearchParams(window.location.search);
    const error = urlParams.get('error');
    
    if (error === 'loginRequired') {
        alert('請先登入！');
    }
    if (error === 'regiSuccess') {
        alert('註冊成功！');
    }
</script>
    <p class="text-center text-danger">${error}</p>
</body>
</html>