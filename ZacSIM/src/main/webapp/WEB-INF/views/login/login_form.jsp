<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>ZakSIM</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="templatemo">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/resources/head/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/head/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/head/css/templatemo-style.css" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
	.minusMargin{
		margin-top: -15px;
	}
	
	.button-color{
		background-color: green;
		
	}
	.margin-top{
		margin-top: 150px;
	}
</style>
</head>
<body class="light-gray-bg">
		<div class="text-center margin-top">
		  <button class="w3-bar-item templatemo-blue-button" onclick="openCity('Owner')">Owner</button>
		  &nbsp;
		  <button class="w3-bar-item templatemo-blue-button" onclick="openCity('Staff')">Staff</button>
		  <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		  <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		  <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	   <div id="Owner" class="level minusMargin">
	    <div class="templatemo-content-widget templatemo-login-widget white-bg" style="padding-bottom: 20px;">
			<header class="text-center">
				<h1 style="margin-bottom: 10px;">Zak<b>SIM</b></h1><br>
				<h1>BranchOwner</h1>
			</header>
			<form id="owner-form" class="templatemo-login-form row" action="${pageContext.request.contextPath}/login/loginpro" method="POST">
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-addon">
							<i class="fa fa-user fa-fw"></i>
						</div>
						<input type="text" class="form-control" id="username" name="branch_owner_id"  value="bid001" required="required"/>
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-addon">
							<i class="fa fa-key fa-fw"></i>
						</div>
						<input type="password" class="form-control" id="password" name="branch_owner_pw"  value="bpw001" required="required"/>
					</div>
				</div>
				<div class="form-group">
					<div class="checkbox squaredTwo">
						<input type="checkbox" id="c1" name="cc" /> <label for="c1"><span></span>Remember me</label>
					</div>
				</div>
				<div class="form-group">
					<input type="submit" class="templatemo-blue-button width-100 button-color" value="Login">
				</div>
			</form>
		</div>
		<div class="templatemo-content-widget templatemo-login-widget templatemo-register-widget white-bg">
			<p>
				<a href="${pageContext.request.contextPath}/head" class="blue-text" style="font-size: 13px;">본사 로그인 바로가기</a>
			</p>
		</div>
      </div>	
      
	  <div id="Staff" class="level minusMargin" style="display:none">
	    <div class="templatemo-content-widget templatemo-login-widget white-bg" style="padding-bottom: 20px;">
			<header class="text-center">
				<h1 style="margin-bottom: 10px;">Zak<b>SIM</b></h1><br>
				<h1>BranchStaff</h1>
			</header>
			<form id="owner-form" class="templatemo-login-form row" action="${pageContext.request.contextPath}/login/loginStaff" method="POST">
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-addon">
							<i class="fa fa-user fa-fw"></i>
						</div>
						<input type="text" class="form-control" id="username" name="branch_owner_id"  value="bid001" required="required"/>
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-addon">
							<i class="fa fa-key fa-fw"></i>
						</div>
						<input type="password" class="form-control" id="password" name="branch_owner_pw"  value="bpw001" required="required"/>
					</div>
				</div>
				<div class="form-group">
					<div class="checkbox squaredTwo">
						<input type="checkbox" id="c1" name="cc" /> <label for="c1"><span></span>Remember me</label>
					</div>
				</div>
				<div class="form-group">
					<input type="submit" class="templatemo-blue-button width-100 button-color" value="Login">
				</div>
			</form>
		</div>
		<div class="templatemo-content-widget templatemo-login-widget templatemo-register-widget white-bg">
			<a href="${pageContext.request.contextPath}/head" class="blue-text" style="font-size: 13px;">본사 로그인 바로가기</a>
	  </div>
	  
	<script>
		function openCity(cityName) {
		    var i;
		    var x = document.getElementsByClassName("level");
		    for (i = 0; i < x.length; i++) {
		       x[i].style.display = "none";  
		    }
		    document.getElementById(cityName).style.display = "block";  
		}
	</script>
	
</body>
</html>
