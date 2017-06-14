<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery를 사용하기위한 CDN주소 -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

 
<script>
    $(document).ready(function(){
        $('#removeButton').click(function(){
            if($('#staffboard_pw').val().length <4) {
                alert('staffboard_pw는 4자이상 이어야 합니다');
                $('#staffboard_pw').focus();
            } else {
                $('#removeForm').submit();
            }
        });
    });
</script>  -->
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
								<h3 class="box-title">공지사항 삭제</h3>
							</div>
							<!-- /.box-header -->
							<!-- form start -->
							<form class="form-inline" id="removeForm" action="${pageContext.request.contextPath}/staffboard/staffboard_delete_pro" method="post">
								<input name="staffboard_no" value="${param.staffboard_no}" type="hidden" />
								<div class="form-group">
									<label for="staffboard_pw">비밀번호확인 :</label> 
									<input class="form-control" id="staffboard_pw" name="staffboard_pw" type="password">
								</div>
								<div class="box-footer">
									<button type="submit" class="btn btn-primary">글입력</button>
									<button type="reset" class="btn btn-primary">초기화</button>
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

