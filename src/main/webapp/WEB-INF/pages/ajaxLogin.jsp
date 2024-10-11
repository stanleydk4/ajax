<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AJAX Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                        <h3 class="text-center mb-4">AJAX登入</h3>
                        <form id="loginForm" method="post">
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
                                <a href="<%=request.getContextPath() %>/login" class="btn btn-secondary btn-block">返回</a>                                                 
                            </div>
                        </form>
                        <p id="errorMessage" class="text-danger text-center"></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            $('#loginForm').on('submit', function(event) {
                event.preventDefault(); // Prevent default form submission
                //console.log(1)
                $.ajax({
                    url: '<%=request.getContextPath() %>/ajaxLogin',
                    type: 'POST',
                    data: $(this).serialize(),
                    success: function(response) {
                        console.log(response)
                        if (response.success) {
                            window.location.href = '<%=request.getContextPath() %>/protected/index';
                        } else {
                            $('#errorMessage').text(response.message);
                        }
                    },
                    error: function() {
                        $('#errorMessage').text('登入失敗，請稍後再試。');
                    }
                });
            });
        });
    </script>
</body>
</html>