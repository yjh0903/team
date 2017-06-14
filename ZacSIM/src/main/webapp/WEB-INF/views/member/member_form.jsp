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
			var member_sex = $('#member_sex').val();
			var member_regi_path = $('#member_regi_path').val();
			var member_use_pur = $('#member_use_pur').val();
			if($('#staff_id').val().length < 5) {
	            alert('직원아이디를 5자 이상 입력하세요.');
	            $('#staff_id').focus();
			} else if($('#member_nm').val()=='') {
	            alert('이름을 입력해주세요');
	            $('#member_nm').focus();
			}  else if(member_sex == '선택'){
	            alert('성별을 선택해 주세요');
	            $('#member_sex').focus();
			} else if($('#member_tel').val()=='') {
	            alert('연락처를 입력해주세요');
	            $('#member_tel').focus();
			} else if($('#member_addr').val()=='') {
	            alert('주소를 입력해주세요');
	            $('#member_addr').focus();
			}else if($('#member_detail_addr').val()==''){
				alert('상세주소를 입력해주세요');
				$('#member_detail_addr').focus();
			} else if($('#member_age').val()=='') {
	            alert('나이를 입력해주세요');
	            $('#member_age').focus();
			}  else if(member_regi_path == '설명'){
	            alert('등록경로를 선택해 주세요');
	            $('#member_regi_path').focus();
			}  else if(member_use_pur == '설명'){
	            alert('이용목적을 선택해 주세요');
	            $('#member_use_pur').focus();    
			} else {
				$('#insertMember').submit();    
			}
		});
	});
</script>
    <!-- 헤드 -->
	<c:import url="../module2/head.jsp"/>

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
		                독서실 회원
		      <small>등록</small>
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
								<select class="form-control" name="member_sex" id="member_sex" >
								<option value="선택" selected>성별을 선택해 주세요</option> 
									<option value="남자">남자</option> 
									<option value="여자">여자</option> 
								</select>	
							</div>
							<div class="form-group">
								<label class="control-label" for="inputLarge">연락처</label>
								<input type="text" class="form-control" id="member_tel" name="member_tel" placeholder="연락처를 입력해주세요">
							</div>
							<div class="form-group">
								<label class="control-label" for="inputLarge">주소</label>
								<!-- <input type="text" class="form-control" id="member_addr" name="member_addr" placeholder="주소를 입력해주세요"> -->
									<div>
										<input type="text" id="member_postcode"  name="member_postcode" placeholder="우편번호">
										<input type="button"  onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" id="member_addr" name="member_addr" class="form-control" placeholder="주소">
										<input type="text" id="member_detail_addr" name="member_detail_addr" class="form-control"  placeholder="상세주소">
									</div>	
										
							</div>
							<div class="form-group">
								<label class="control-label" for="inputLarge">나이</label>
								<input type="text" class="form-control" id="member_age" name="member_age" placeholder="나이를 입력해주세요">
							</div>
							<div class="form-group">
								<label class="control-label" for="inputLarge">등록경로</label>
								<select class="form-control" name="member_regi_path" id="member_regi_path" > 
									<option value="설명" selected>등록경로를 선택해 주세요</option> 
									<option value="지인소개">지인소개</option> 
									<option value="인터넷">인터넷</option> 
									<option value="플래카드">플래카드</option> 
									<option value="전단지">전단지</option> 
									<option value="기타">기타</option> 
								</select>
							</div>
							<div class="form-group">
								<label class="control-label" for="inputLarge">주 이용 목적</label>
								<select class="form-control" name="member_use_pur" id="member_use_pur" > 
									<option value="설명" selected>이용목적을 선택해 주세요</option> 
									<option value="외국어">외국어</option> 
									<option value="수능">수능</option> 
									<option value="자격증">자격증</option> 
									<option value="공무원">공무원</option> 
									<option value="기타">기타</option> 
								</select>
							</div>
						<div>
							<input class="btn btn-primary" id="joinForm" type="button" value="회원등록"/>
       					 	<input class="btn btn-primary" type="reset" value="초기화"/>
               			</div>
               		</div>	
               </form>
              </div><!-- /.box -->
			 </div>
			</div> 
		   </section>
	      </div>	
		</div>
		
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
										<script>
										    function sample6_execDaumPostcode() {
										        new daum.Postcode({
										            oncomplete: function(data) {
										                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
										
										                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
										                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
										                var fullAddr = ''; // 최종 주소 변수
										                var extraAddr = ''; // 조합형 주소 변수
										
										                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
										                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
										                    fullAddr = data.roadAddress;
										
										                } else { // 사용자가 지번 주소를 선택했을 경우(J)
										                    fullAddr = data.jibunAddress;
										                }
										
										                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
										                if(data.userSelectedType === 'R'){
										                    //법정동명이 있을 경우 추가한다.
										                    if(data.bname !== ''){
										                        extraAddr += data.bname;
										                    }
										                    // 건물명이 있을 경우 추가한다.
										                    if(data.buildingName !== ''){
										                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
										                    }
										                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
										                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
										                }
										
										                // 우편번호와 주소 정보를 해당 필드에 넣는다.
										                document.getElementById('member_postcode').value = data.zonecode; //5자리 새우편번호 사용
										                document.getElementById('member_addr').value = fullAddr;
										
										                // 커서를 상세주소 필드로 이동한다.
										                document.getElementById('member_detail_addr').focus();
										            }
										        }).open();
										    }
										</script>
	<!-- JS -->
	<c:import url="../module2/jsscript.jsp" />
	<script>
		$('#member_menu').addClass('active');
		$('#member01').addClass('active');
	</script>		
	</body>
</html>