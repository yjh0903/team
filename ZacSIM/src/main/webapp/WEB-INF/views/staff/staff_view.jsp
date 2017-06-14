<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 헤드 -->
<c:import url="../module2/head.jsp" />
<!-- JS -->
<c:import url="../module2/jsscript.jsp" />
</head>
<body class="skin-blue">
	<div class="wrapper">
		<!-- 상단 -->
		<c:import url="../module2/top.jsp" />

		<!-- 왼쪽 -->
		<c:import url="../module2/left.jsp" />

		<!-- 수정부분  -->
		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					ZakSim <small>Control panel</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
					<li class="active">직원</li>
				</ol>
			</section>


			<!-- Main content -->
			<div class="row">
				<!-- left column -->
				<div class="col-md-12">
					<!-- general form elements -->
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">직원 정보</h3>
						</div>
						<!-- /.box-header -->
						<table class="table">
							<tbody>
								<tr>
									<td>직원 아이디</td>
									<td>${staff.staff_id}</td>
								</tr>
								<tr>
									<td>지점 대표코드 </td>
									<td>${staff.branch_owner_cd}</td>
								</tr>
								<tr>
									<td>직원 이름</td>
									<td>${staff.staff_name}</td>
								</tr>
								<tr>
									<td>직원 연락처</td>
									<td>${staff.staff_tel}</td>
								</tr>
								<tr>
									<td>직원 주소</td>
									<td>${staff.staff_addr}</td>
								</tr>
								<tr>
									<td>직원 가입일</td>
									<td>${staff.staff_in_date}</td>
								</tr>
							</tbody>
						</table>
						<a class="btn btn-default" href="${pageContext.request.contextPath}/staff/staff_modify?staff_id=${staff.staff_id}">수정</a>
						<a class="btn btn-default" href="${pageContext.request.contextPath}/staff/staff_delete?staff_id=${staff.staff_id}">삭제</a>
						<a class="btn btn-default" href="${pageContext.request.contextPath}/staff/staff_list">글목록</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	$('#staff_menu').addClass('active');
	$('#staff02').addClass('active');
</script>
</body>
</html>


