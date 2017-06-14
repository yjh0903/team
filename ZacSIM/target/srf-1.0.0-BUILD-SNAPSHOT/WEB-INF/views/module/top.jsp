<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<nav class="navbar navbar-fixed-top navbar-toggleable-sm navbar-inverse bg-primary mb-3">
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#collapsingNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="flex-row d-flex">
			<a class="navbar-brand mb-1" href="#">${sessionScope.branchOwner.branch_owner_nm}</a>
			<button type="button" class="hidden-md-up navbar-toggler"
				data-toggle="offcanvas" title="Toggle responsive left sidebar">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
		<div class="navbar-collapse collapse" id="collapsingNavbar">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/dashboard/home">Home
						<span class="sr-only">Home</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#features">Features</a>
				</li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/login/logout">로그아웃</a>
				</li>
			</ul>
		</div>
	</nav>