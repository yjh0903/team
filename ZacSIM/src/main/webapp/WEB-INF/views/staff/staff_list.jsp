<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		//console.log("하이");
		$('#searchBtn').click(function(){
			if($('#selectValue').val().length < 2){
				alert("검색어는 2자 이상 입력하셔야 합니다.");
			}else if($('#selectValue').val().length >= 2){
				$('#searchFrom').submit();
			}
		});
		
	});
</script>
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

			<section class="content">
				<div class="col-md-9 col-lg-12 main" id="wrap">
					<div class="row">
						<div class="box box-info">
							<div class="box-header">
								<h3 class="box-title">독서실 직원 리스트</h3>
								<div class="box-tools">

									<!-- 검색 -->
									<form id="searchFrom" action="${pageContext.request.contextPath}/staff/staff_search" method="post">
										<div class="form-group">
											<div class="row">
												<div class="col-sm-4">
													<select name="so" class="form-control" id="sel1">
														<option value="staff_id">아이디</option>
														<option value="branch_owner_cd">대표코드</option>
														<option value="staff_name">직원이름</option>
													</select>
												</div>
												<div class="col-sm-6">
													<input name="sv" id="selectValue" type="text" class="form-control" placeholder="검색어를 입력해주세요." />
												</div>
												<div class="col-sm-2">
													<button type="button" id="searchBtn" class="btn btn-sm btn-default">
														<i class="fa fa-search"></i>
													</button>
												</div>
											</div>
										</div>
									</form>

								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive no-padding">
								<table class="table">
									<thead>
										<tr>
											<th>직원 아이디</th>
											<th>지점 대표코드</th>
											<th>직원 이름</th>
											<th>직원 연락처</th>
											<th>직원 주소</th>
											<th>직원 등록일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="s" items="${list}">
											<tr>
												<td><a href="${pageContext.request.contextPath}/staff/staff_view?staff_id=${s.staff_id}">${s.staff_id}</a></td>
												<td>${s.branch_owner_cd}</td>
												<td>${s.staff_name}</td>
												<td>${s.staff_tel}</td>
												<td>${s.staff_addr}</td>
												<td>${s.staff_in_date}</td>
												<%-- <td><fmt:formatDate value="${s.staff_in_date}" pattern="yyyy-MM-dd"/></td>  --%>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
				</div>
			</section>
			<!-- /.content -->
		</div>

	</div>
	<!-- /.content-wrapper -->
	<script>
	$('#staff_menu').addClass('active');
	$('#staff02').addClass('active');
</script>
</body>
</html>