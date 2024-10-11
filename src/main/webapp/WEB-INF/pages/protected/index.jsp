<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Homepage</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="bg-white">
	<nav class="naver bg-info naver-dark p-3 navbar-expand-lg">
		<div class="container">
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarSupportedContent">
				<span class="navbar-toggle-icon"></span>
			</button>
			<div class="collapse navbar-collapse">
            	<ul class="navbar-nav d-flex flex-row">
					<li class="nav-item me-3">
						<a href="" class="nav-link">首頁</a>
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
	
	<div class="p-5 text-center border-bottom">
		<h1 class="text-dark">~你好, ${username} !  歡迎登入~</h1>
		<p class="text-secondary">現在時間 : <%= SimpleDateFormat.getInstance().format(new Date()) %></p>
		<button class="btn btn-primary btn-lg" onclick="window.location.href='main';">Go Lottery</button>	
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>