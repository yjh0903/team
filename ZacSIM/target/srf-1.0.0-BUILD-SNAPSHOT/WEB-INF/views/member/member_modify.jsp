<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		//console.log("하이");
		$('#modifyForm').click(function(){
		var branch_owner_cd = $('#branch_owner_cd').val();
		var member_regi_path = $('#member_regi_path').val();
			if(branch_owner_cd == 'B0010'){
	            alert('지점대표코드를 선택해 주세요');
	            $('#branch_owner_cd').focus();
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
                $('#member_seat_state').focus();
			}  else if(member_regi_path == '설명'){
                alert('등록경로를 선택해 주세요');
                $('#member_regi_path').focus();
			} else {
				$('#modifyMember').submit();    
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
		  
		  <section class="content">
			
			<div class="row">
            <div class="col-md-12">
              <div class="box box-primary">
                <div class="box-header">
                  <h3 class="box-title">독서실 회원 수정</h3>
                  </div>
                  <form role="form" id="modifyMember" action="${pageContext.request.contextPath}/member/member_modify" method="post">
						<div class="box-body">
						 <div class="form-group">
							<label for="exampleInputmembercd">독서실회원코드</label>
							<input type="text" class="form-control" value="${member.member_cd}" name="member_cd" readonly>
						 </div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">지점 대표코드</label>
							<select class="form-control" name="branch_owner_cd" id="branch_owner_cd" > 
								<option value="B0010" selected>&nbsp;</option> 
							     <option value="B0011">B011</option> 
							     <option value="B0016">B016</option> 
							     <option value="B0017">B017</option> 
							     <option value="B0018">B018</option> 
							     <option value="B0019">B019</option>
							</select>
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">직원아이디</label>
							<input type="text" class="form-control" value="${member.staff_id}" name="staff_id" placeholder="직원아이디를 입력해주세요">
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">이름</label>
							<input type="text" class="form-control" value="${member.member_nm}" name="member_nm" placeholder="이름을 입력해주세요">
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">성별</label>
							<input type="text" class="form-control" value="${member.member_sex}" name="member_sex" placeholder="성별을 입력해주세요">
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">연락처</label>
							<input type="text" class="form-control" value="${member.member_tel}" name="member_tel" placeholder="연락처를 입력해주세요">
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">주소</label>
							<input type="text" class="form-control" value="${member.member_addr}" name="member_addr" placeholder="주소를 입력해주세요">
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">나이</label>
							<input type="text" class="form-control" value="${member.member_age}" name="member_age" placeholder="나이를 입력해주세요">
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">회원상태</label>
							<input type="text" class="form-control" value="${member.member_seat_state}" name="member_seat_state" placeholder="회원상태를 입력해주세요">
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">등록경로</label>
							<select class="form-control" name="member_regi_path" id="member_regi_path" > 
								<option value="설명" selected>&nbsp;</option> 
								<option value="지인소개">지인소개</option> 
								<option value="인터넷">인터넷</option> 
								<option value="플래카드">플래카드</option> 
								<option value="전단지">전단지</option> 
								<option value="기타">기타</option> 
							</select>
						</div>
						<div>
        					<input class="btn btn-primary" id="modifyForm" type="button" value="회원수정"/>
       					 	<input class="btn btn-primary" type="reset" value="초기화"/>
        				<a class="btn btn-primary" href="${pageContext.request.contextPath}/member/member_list">글목록</a>	
        				</div>
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