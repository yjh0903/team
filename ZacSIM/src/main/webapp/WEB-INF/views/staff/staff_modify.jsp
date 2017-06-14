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
<!-- <!-- jquery를 사용하기위한 CDN주소 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
    $(document).ready(function(){
    	$('#staffbutton').click(function(){
			if($('#staff_id').val()==''){
				alert('아이디를 입력하세요');	
				$('#staff_id').focus();
			}else if($('#staff_pw').val()==''){
				alert('비밀번호를 입력하세요');
				$('#staff_pw').focus();
			}else if($('#staff_pw').val().length <4){
				alert('비밀번호는 4자이상 이어야 합니다');
				$('#staff_pw').focus();
			}else if($('#staff_name').val()==''){
				alert('이름을 입력하세요');
				$('#staff_name').focus();
			}else if($('#staff_tel').val()==''){
				alert('전화번호를 입력하세요');
				$('#staff_tel').focus();
			}else if($('#staff_addr').val()==''){
				alert('주소를 입력하세요');
				$('#staff_addr').focus();
			}else if($('#staff_detail_addr').val()==''){
				alert('상세주소를 입력하세요');
				$('#staff_detail_addr').focus();
			}else{
				$('#addForm').submit();
			}	
		});
	});
</script>


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
								<h3 class="box-title">직원 수정</h3>
							</div>
							<!-- /.box-header -->
							<!-- form start -->
							<form id="addForm" role="form" action="${pageContext.request.contextPath}/staff/staff_modify" method="post">
								<div class="box-body">
									<div class="form-group">
										<label for="exampleInputstaffid">직원아이디</label> 
										<input type="text" class="form-control" value="${staff.staff_id}" name="staff_id" readonly>
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">지점 대표코드</label> 
										<input type="text" class="form-control" name="branch_owner_cd" value="${sessionScope.branchOwner.branch_owner_cd}" readonly />
									</div>
									<div class="form-group">
										<label for="exampleInputFile">직원 비밀번호</label>
										 <input type="password" class="form-control" id="staff_pw" name="staff_pw" placeholder="비밀번호를 입력해주세요">
									</div>
									<div class="form-group">
										<label for="exampleInputFile">직원 이름</label> 
										<input type="text" class="form-control" value="${staff.staff_name}" name="staff_name" placeholder="이름을 입력해주세요">
									</div>
									<div class="form-group">
										<label for="exampleInputFile">직원 연락처</label> 
										<input type="text" class="form-control" value="${staff.staff_tel}" name="staff_tel" placeholder="연락처를 입력해주세요">
									</div>
									<div class="form-group">
										<label for="exampleInputFile">직원 주소</label> 
										<!-- <input type="text" class="form-control" id="staff_addr" name="staff_addr" placeholder="주소를 입력해주세요"> -->
									<div>
										<input type="text" value="${staff.staff_postcode}"  name="staff_postcode" placeholder="우편번호">
										<input type="button"  onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" value="${staff.staff_addr}" name="staff_addr" class="form-control" placeholder="주소">
										<input type="text" value="${staff.staff_detail_addr}" name="staff_detail_addr" class="form-control"  placeholder="상세주소">
									</div>											
									</div>
								</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<button id="staffbutton" type="button" class="btn btn-primary">글수정</button>
									<button type="reset" class="btn btn-primary">초기화</button>
									<a class="btn btn-default" href="${pageContext.request.contextPath}/staff/staff_list">글목록</a>
								</div>
							</form>
						</div>
						<!-- /.box -->
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
										                document.getElementById('staff_postcode').value = data.zonecode; //5자리 새우편번호 사용
										                document.getElementById('staff_addr').value = fullAddr;
										
										                // 커서를 상세주소 필드로 이동한다.
										                document.getElementById('staff_detail_addr').focus();
										            }
										        }).open();
										    }
										</script>
	<script>
	$('#staff_menu').addClass('active');
	$('#staff02').addClass('active');
</script>
</body>
</html>

