<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
		<!-- <meta name="viewport" content="width=device-width, initial-scale=1" /> -->
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
</head>
<body class="loading">
		<div id="wrapper">
			<div id="bg"></div>
			<div id="overlay"></div>
			<div id="main">

				<!-- Header -->
					<header id="header">
						<h1>ZAKSIM</h1>
						<p>효율적 &nbsp;&bull;&nbsp; 합리적 &nbsp;&bull;&nbsp; 독서실 운영 시스템</p>
						<div style="height: 5px;"></div>
						<nav>
							<ul>
								<li><a href="${pageContext.request.contextPath}/head" >본사</a></li>
								<li><a href="${pageContext.request.contextPath}/login/loginFrom" >지점</a></li>
								<li><a href="https://github.com/lsw23/ZacSIM" >메뉴얼</a></li>
							</ul>
						</nav>
					</header>

				<!-- Footer -->
					<footer id="footer">
						<span class="copyright">&copy; Untitled. Design: <a href="#"><b>Zak</b>Sim</a>.</span>
					</footer>

			</div>
		</div>
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script>
			window.onload = function() { document.body.className = ''; }
			window.ontouchmove = function() { return false; }
			window.onorientationchange = function() { document.body.scrollTop = 0; }
		</script>
	</body>
</html>