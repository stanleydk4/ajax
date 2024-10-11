<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LotteryResult</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="bg-light">
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
				<ul class="navbar-nav ms-auto">
                	<li class="nav-item">
                    	<a href="logout" class="nav-link">登出</a>
                	</li>
            	</ul>
			</div>
		</div>
	</nav>
    <div class="container mt-4">
        <h2 class="text-center">已產生號碼，祝您中獎</h2>
        <h5 class="text-danger text-center">購買彩券應該量力而為，勿因過度投注而影響正常生活</h5>
        
        <table class="table table-bordered mt-4">
            <thead>
                <tr>
                    <th class="text-center">產生的號碼</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<List<Integer>> generatedNumbers = (List<List<Integer>>) request.getAttribute("generatedNumbers"); 
                    for(List<Integer> group : generatedNumbers) {
                %>
                    <tr>
                        <td class="text-center"><%= group %></td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <div class="text-center mt-4">
            <a href="protected/main" class="btn btn-secondary me-2">重新產生</a>
            <a href="protected/index" class="btn btn-primary">回到首頁</a>
        </div>
    </div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
	
</body>
</html>