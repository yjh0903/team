<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="UTF-8">
	<title>프렌차이즈:독서실</title>
		<link rel= "stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css">
		<style>
			#logo{
				color : white;
				margin-bottom: 150px;
			}
			body{
				background : bluesky;
			}
		</style>
	</head>
	<body>
	<!-- Form-->
	<h1 id="logo">ZakSIM 지점사이트</h1>
	<div class="form">
	  <div class="form-panel one">
	    <div class="form-content">
	      <form action="${pageContext.request.contextPath}/login/loginpro" method="post">
	        <div class="form-group">
	          <label for="username">아이디</label>
	          <input type="text" id="username" name="branch_owner_id" value="bid001" required="required"/>
	        </div>
	        <div class="form-group">
	          <label for="password">비밀번호</label>
	          <input type="password" id="password" name="branch_owner_pw"  value="bpw001" required="required"/>
	        </div>
	        <div class="form-group">
	          <label class="form-remember">
	            <input type="checkbox"/>Remember Me
	          </label><a href="#" class="form-recovery">비밀번호찾기</a>
	        </div>
	        <div class="form-group">
	          <button type="submit">로그인</button>
	        </div>
	      </form>
	    </div>
	  </div>
	</div>
	
	
</body>
</html>
