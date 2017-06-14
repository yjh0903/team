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

				<!-- Main content -->
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary">
							<div class="box-header">
								<h3 class="box-title">공지사항 내용</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table class="table">
									<tbody>
										<tr>
											<td>공지사항 번호 :</td>
											<td>${staffboard.staffboard_no}</td>
										</tr>
										<tr>
											<td>공지사항 제목 :</td>
											<td>${staffboard.staffboard_title}</td>
										</tr>
										<tr>
											<td>공지사항 내용 :</td>
											<td>${staffboard.staffboard_content}</td>
										</tr>
										<tr>
											<td>공지사항 작성자 :</td>
											<td>${staffboard.staff_name}</td>
										</tr>
										<tr>
											<td>공지사항 등록일 :</td>
											<td>${staffboard.staffboard_date}</td>
										</tr>
									</tbody>
								</table>
								<a class="btn btn-default" href="${pageContext.request.contextPath}/staffboard/staffboard_modify?staffboard_no=${staffboard.staffboard_no}">수정</a>
								<a class="btn btn-default" href="${pageContext.request.contextPath}/staffboard/staffboard_delete?staffboard_no=${staffboard.staffboard_no}">삭제</a>
								<a class="btn btn-default" href="${pageContext.request.contextPath}/staffboard/staffboard_list">글목록</a>
							</div>
						</div>
						<div class="box box-primary">
							<div class="box-header">
								<h3 class="box-title">REPLY</h3>
							</div>
							<div class="box-body">
								<div>댓글 수 : ${totalReply}</div>
								<div style="height: 10px">&nbsp;</div>
								<c:forEach var="reply" items="${replylist}">
								<div class="table-responsive">
								<table class="table table-hover" style="width: 430px; height: 25px;">
								<tbody>
									<tr>
										<th class="success"><div>&nbsp;</div>${reply.staffboard_name} <div>&nbsp;</div></th>
										<th class="success"><div>${reply.staffboardreply_date}</div>${reply.staffboardreply_content}</th>
									</tr>						
									<%-- <tr>	
										
										<th class="success">${reply.staffboardreply_date}${reply.staffboardreply_content}</th>
									</tr> --%>
									</tbody>
									</table>
									</div>
								</c:forEach>
	
								<form action="${pageContext.request.contextPath}/staffboard/staffboard_reply_pro"method="post">
									<%-- <input type="hidden" name="staffboardreply_no" value="${staffboardreply_no}"> --%>
									<input type="hidden" name="staffboard_no" value="${staffboard.staffboard_no}"> 
									<span>이름: </span>
									<input class="textBar" name="staffboard_name" type="text" />
									<span>비밀번호: </span>
									<input class="textBar" name="staffboardreply_pw" type="password" />
									<div style="height: 10px">&nbsp;</div>
									<div>
										<textarea name="staffboardreply_content" rows="3" cols="59"></textarea>
									</div>
									<button id="reply_btn" type="submit" class="btn btn-default">답변</button>
								</form>
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


