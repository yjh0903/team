<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		//console.log("하이");
		$('#joinForm').click(function(){
			var branch_owner_cd = $('#branch_owner_cd').val();
			var member_regi_path = $('#member_regi_path').val();
			if($('#member_cd').val().length < 20) {
				alert("독서실 회원코드는  11자 이상이어야 합니다.");
				$('#member_cd').focus();
			} else if($('#branch_owner_cd').val()=='') {
                alert('지점대표코드를 선택해 주세요');
                $('#branch_owner_cd').focus();
		  /*} else if(!$('#branch_owner_cd > option:selected').val == '0'){
                alert('지점대표코드가 선택이 안되어있습니다.');
                $('#branch_owner_cd').focus(); */
			} else if($('#staff_id').val()=='') {
                alert('직원아이디를 입력해주세요');
                $('#staff_id').focus();
			} else if($('#member_nm').val()=='') {
                alert('이름을 입력해주세요');
                $('#member_nm').focus();
			} else if($('#member_sex').val()=='') {
                alert('성별을 입력해주세요');
                $('#member_sex').focus();    
			} else if($('#member_tel').val()=='') {
                alert('연락처를 입력해주세요');
                $('#member_tel').focus();
			} else if($('#member_addr').val()=='') {
                alert('주소를 입력해주세요');
                $('#member_addr').focus();
			} else if($('#member_age').val()=='') {
                alert('나이를 입력해주세요');
                $('#member_age').focus();
			} else if($('#member_seat_state').val()=='') {
                alert('회원상태를 입력해주세요');
                $('#member_regi_path').focus();
			}  else if(member_regi_path == '설명'){
                alert('등록경로를 선택해 주세요');
                $('#member_regi_path').focus();
			} else {
				$('#insertMember').submit();    
			}
		});          
	});
</script>
    <!-- 헤드 -->
	<c:import url="../module2/head.jsp"/>
	<!-- JS -->
	<c:import url="../module2/jsscript.jsp" />
</head>
	<body class="skin-blue">
   	 <div class="wrapper">
   	 <!-- 상단 -->
      <c:import url="../module2/top.jsp"/>
      
      <!-- 왼쪽 -->
 	  <c:import url="../module2/left.jsp" />
		
	   <!-- 오른쪽 -->
      <!-- 수정부분  -->
      <div class="content-wrapper">
		  <section class="content-header">
		    <h1>
		       StudyRoom
		      <small>웹 기반 독서실 관리프로그램</small>
		    </h1>
		    <ol class="breadcrumb">
		      <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
		      <li class="active">회원</li>
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
					<h3 class="box-title">독서실 회원 등록</h3>
					</div><!-- /.box-header -->
                	<!-- form start -->
					<form role="form" id="insertMember" action="${pageContext.request.contextPath}/member/member_pro" method="post">
						<div class="box-body">	
						<div class="form-group">
                      	   <label class="control-label" for="inputLarge">지점대표코드</label>
							<input type="text" class="form-control" value="${sessionScope.branchOwner.branch_owner_cd}" name="branch_owner_cd" readonly>
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">직원 아이디</label>
							<input type="text" class="form-control" id="staff_id" name="staff_id" placeholder="직원아이디를 입력해주세요">
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">이름</label>
							<input type="text" class="form-control" id="member_nm" name="member_nm" placeholder="이름을 입력해주세요">
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">성별</label>
							<input type="text" class="form-control" id="member_sex" name="member_sex" placeholder="성별을 입력해주세요">
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">연락처</label>
							<input type="text" class="form-control" id="member_tel" name="member_tel" placeholder="연락처를 입력해주세요">
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">주소</label>
							<input type="text" class="form-control" id="member_addr" name="member_addr" placeholder="주소를 입력해주세요">
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">나이</label>
							<input type="text" class="form-control" id="member_age" name="member_age" placeholder="나이를 입력해주세요">
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">회원상태</label>
							<input type="text" class="form-control" id="member_seat_state" name="member_seat_state" placeholder="회원상태를 입력해주세요">
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">등록경로</label>
							<select class="form-control" name="member_regi_path" id="member_regi_path" > 
								<option value="설명" selected>등록경로를 입력해 주세요</option> 
								<option value="지인소개">지인소개</option> 
								<option value="인터넷">인터넷</option> 
								<option value="플래카드">플래카드</option> 
								<option value="전단지">전단지</option> 
								<option value="기타">기타</option> 
							</select>
							</div>
						</div>
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">회원등록</button>
                   			<button type="reset" class="btn btn-primary">초기화</button>
               			</div>
                </form>
              </div><!-- /.box -->
			</div>
			</div>
			</section>
			</div>	
		</div>	
	</body>
</html>