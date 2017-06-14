<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#staffboardbutton').click(function() {
			if ($('#staffboard_pw').val() == '') {
				alert('비밀번호를 입력하세요');
				$('#staffboard_pw').focus();
			} else if ($('#staffboard_pw').val().length < 4) {
				alert('패스워드는 4자이상 이어야 합니다');
				$('#staffboard_pw').focus();
			} else if ($('#staffboard_title').val() == '') {
				alert('제목을 입력하세요');
				$('#staffboard_title').focus();
			} else if ($('#staffboard_content').val() == '') {
				alert('내용을 입력하세요');
				$('#staffboard_content').focus();
			} else if ($('staff_name').val() == '') {
				alert('이름을 입력하세요');
				$('#staff_name').focus();
			} else {
				$('#addForm').submit();
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
							<!-- /.box-header -->
							<!-- form start -->
							<form id="addForm" role="form" action="${pageContext.request.contextPath}/staffboard/staffboard_modify_pro" method="post">
								<div class="box-body">
									<div class="form-group">
										<label for="staffboard_no">공지사항 번호</label> 
										<input class="form-control" name="staffboard_no" value="${staffboard.staffboard_no}" type="text" readonly="readonly" />
									</div>
									<div class="form-group">
										<label for="staffboard_pw">비밀번호</label> 
										<input class="form-control" name="staffboard_pw" id="staffboard_pw" type="password" placeholder="비밀번호를 입력해주세요" />
									</div>
									<div class="form-group">
										<label for="staffboard_title">공지사항 제목</label> 
										<input class="form-control" value="${staffboard.staffboard_title}" name="staffboard_title" id="staffboard_title" type="text" />
									</div>
									<div class="form-group">
										<label for="staffboard_content">공지사항 내용</label>
										<textarea class="form-control" id="staffboard_content" name="staffboard_content" rows="5" cols="50">${staffboard.staffboard_content}</textarea>
									</div>
									<div class="box-footer">
										<button id="staffboardbutton" type="button" class="btn btn-primary">글입력</button>
										<button type="reset" class="btn btn-primary">초기화</button>
										<a class="btn btn-default" href="${pageContext.request.contextPath}/staffboard/staffboard_list">글목록</a>
									</div>
								</div>
							</form>
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

