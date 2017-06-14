<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	//제이쿼리 사용
	$(document).ready(function(){
		$('#expensebutton').click(function(){
			if($('#expense_breakdown').val()==''){
				alert('지출내역을 입력하세요');	
				$('#expense_breakdown').focus();
			}else if($('#expense_price').val()==''){
				alert('지출금액을 입력하세요');
				$('#expense_price').focus();
			}else if($('#branch_name').val()==''){
				alert('지출담당자를 입력하세요');
				$('#branch_name').focus();
			}else if($('#expense_date').val()==''){
				alert('지출날짜를 입력하세요');
				$('#expense_date').focus();
			}else{
				$('#addForm').submit();
			}	
		});
	});
</script> 
<script type="text/javascript">
								$(function() {
									$('#minus').click(function(e) {
										var stat = $('#expense_amount').val();
										console.log('stat : ' + stat);
										var num = stat*1;
										num--;
										if (num < 0) {
											alert('더이상 줄일수 없습니다.');
											num = 0;
										}
										var expense_price = $('#expense_price').val();
										expense_price *=1;
										expense_price *= num;
										console.log('expense_price' + expense_price);
										$('#expense_amount').val(num);
										$('#expense_total').val(expense_price);
									});
									$('#plus').click(function() {
										var stat = $('#expense_amount').val();
										console.log('plus stat ' + stat);
										var num = stat*1;
										console.log(num);
										num +=1;
									
										if (num > 99) {
											alert('더이상 늘릴수 없습니다.');
											num = 99;
										}
										var expense_price = $('#expense_price').val();
										expense_price *=1;
										expense_price *= num;
										console.log('expense_price' + expense_price);
										$('#expense_amount').val(num);
										$('#expense_total').val(expense_price);
									});
								});
							</script>

<!-- 헤드 -->
<c:import url="../module2/head.jsp" />
<!-- JS -->
<c:import url="../module2/jsscript.jsp" />
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
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
								<h3 class="box-title">지출 내역</h3>
							</div>
							<!-- /.box-header -->
							<!-- form start -->
							<form id="addForm" role="form" action="${pageContext.request.contextPath}/expense/expense_form_pro" method="post">
								<div class="box-body">
									<div class="form-group">
										<label for="exampleInputbranch_owner_cd">지점 대표 코드</label> 
										<input type="text" class="form-control" name="branch_owner_cd" value="${sessionScope.branchOwner.branch_owner_cd}" readonly/>
									</div>
									<div class="form-group">
										<label for="exampleInputFile">지출 내역</label> 
										<input type="text" class="form-control" id="expense_breakdown" name="expense_breakdown" placeholder="내역을 입력해주세요">
									</div>
									<div class="form-group">
										<label for="exampleInputFile">지출 금액</label> 
										<input type="text" class="form-control" id="expense_price" name="expense_price" placeholder="금액을 입력해주세요">
									</div>
									<div class="form-group">
										<label for="exampleInputFile">지출 수량</label> 
										<input type="button" id="minus" value=" - "> 
										<input type="text" id="expense_amount" value="0" size="3"> 
										<input type="button" id="plus" value=" + "> 
									</div>
									<div class="form-group">
										<label for="exampleInputFile">지출 담당자</label> 
										<input type="text" class="form-control" id="branch_name" name="branch_name" placeholder="담당자를 입력해주세요">
									</div>
									<div class="form-group">
										<label for="exampleInputFile">지출 날짜</label> 
										<input type="date" class="form-control" id="expense_date" name="expense_date">
									</div>
									<div class="form-group">
										<label for="exampleInputFile">지출 합계</label> 
										<input type="text" class="form-control" id="expense_total" name="expense_total" readonly>
									</div>									
								</div>
								<div class="box-footer">
									<button id="expensebutton" type="button" class="btn btn-primary">글입력</button>
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
	$('#account_menu').addClass('active');
	$('#expense').addClass('active');
</script>

</body>
</html>