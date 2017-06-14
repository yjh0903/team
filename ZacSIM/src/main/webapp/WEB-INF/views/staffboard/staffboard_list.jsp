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
			<section class="content">
				<div class="row">
					<!-- left column -->
					<div class="col-md-12">
						<!-- general form elements -->
						<div class="box box-primary">
							<div class="box-header">
								<h3 class="box-title">공지사항 등록</h3>
							</div>
							<!-- 검색 -->
							<div class="box-body">
							<form id="searchFrom" action="${pageContext.request.contextPath}/staffboard/staffboard_search" method="post">
									<div class="form-group">
										<div class="input-group" style="float: left;">
											<select name="so" class="form-control" id="sel1">
												<option value="staffboard_title">제목</option>
												<option value="staff_name">작성자</option>
											</select>
										</div>
										<div class="input-group" style="float: left;">
											<input name="sv" id="selectValue" type="text" class="form-control" placeholder="검색어를 입력해주세요." />
										</div>
										<div class="input-group">
											<button type="button" id="searchBtn" class="btn btn-default">검색</button>
										</div>
									</div>
							</form>
							

							<table class="table ">
								<thead>
									<tr>
										<th>공지사항 번호</th>
										<th>공지사항 제목</th>
										<th>작성자</th>
										<th>등록일</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="s" items="${list}">
										<tr>
											<td>${s.staffboard_no}</td>
											<td><a href="${pageContext.request.contextPath}/staffboard/staffboard_view?staffboard_no=${s.staffboard_no}">${s.staffboard_title}</a></td>
											<td>${s.staff_name}</td>
											<td>${s.staffboard_date}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
							<nav aria-label="Page navigation example">
								<ul class="pagination"> <!-- justify-content-center --> 
									<c:if test="${currentPage > 1}">
										<li class="page-item">
										<a class="page-link" href="${pageContext.request.contextPath}/staffboard/staffboard_list?currentPage=${currentPage-1}" aria-label="Previous"> 
										<span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
										</a>
										</li>
									</c:if>
									<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
										<c:if test="${i == currentPage}">
											<li class="page-item">
											<a class="page-link" href="#">${i}</a>
											</li>
										</c:if>
										<c:if test="${i != currentPage}">
											<li class="page-item">
											<a class="page-link" href="${pageContext.request.contextPath}/staffboard/staffboard_list?currentPage=${i}">${i}</a>
											</li>
										</c:if>
									</c:forEach>

									<c:if test="${currentPage < lastPage}">
										<li class="page-item">
										<a class="page-link" href="${pageContext.request.contextPath}/staffboard/staffboard_list?currentPage=${currentPage+1}" aria-label="Next"> 
											<span aria-hidden="true">&raquo;</span>
												<span class="sr-only">Next</span>	
										</a></li>
									</c:if>
								</ul>
		
								<a href="${pageContext.request.contextPath}/staffboard/staffboard_form" class="btn btn-default" style="margin-top:-67px;">공지사항입력</a>
																
							</nav> 
							
								
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<script>
		$('#staffboard_menu').addClass('active');
	</script>
</body>
</html>




