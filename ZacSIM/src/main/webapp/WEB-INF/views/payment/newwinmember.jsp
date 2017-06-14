<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <HEAD>
  <TITLE> New Document </TITLE>
<script type="text/javascript">
$(document).ready(function(){
	var contextPath = '<c:out value='${pageContext.request.contextPath}'/>';
	$('.link').click(function(){
	var linkpage = $(this).attr('value');
    window.open(contextPath+'/payment/'+linkpage, '_self');
	});
});
</script>
 </HEAD>
 <BODY>
        <div class="row">
        <div class="col-md-6">
              <div class="box box-primary">
                <div class="container">
				  <ul class="nav nav-tabs">
				    <li><a data-toggle="tab" value="newwinmember" class="link">회원가입</a></li>
				    <li><a data-toggle="tab" value="newwinpayment" class="link">결제</a></li>
				    <li><a data-toggle="tab" value="newwindetail?member_cd=member_cd6" class="link">상세정보</a></li>
				  </ul>

                <!-- form start -->
                  <div class="box-body">
      					<h3 class="box-title">독서실 회원 등록</h3>
					<form name="myForm" name="postForm" action="${pageContext.request.contextPath}/member/member_pro" method="post">
						<div class="box-body">	
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
							<button type="submit" class="btn btn-primary" onclick="getSubmit()" value="회원등록">회원등록</button>
                   			<button type="reset" class="btn btn-primary">초기화</button>
               			</div>
                </form>
           
              		</div>
             	</div>
            </div>
           </div>
           </div>
 </BODY>
</HTML>

 