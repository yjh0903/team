<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- 헤드 -->
	<c:import url="../module2/head.jsp"/>
</head>
<body class="skin-blue">
    <div class="row">
      <div class="col-md-12">
         <!-- Info box -->
             <div class="box box-solid bg-orange">
               <div class="box-header">
                 <h2 class="box-title"><i class="fa fa-search-minus"></i>기간연장</h2>
               </div>
              </div><!-- box box-solid bg-aqua -->
           <div class="container">
                <!-- form start -->
                  <div class="box-body">
                  	<form id="extension_form" action="${pageContext.request.contextPath}/payment/extension_pro" method="post">
						<input type="hidden" name="branch_owner_cd" value="${detailmember.branch_owner_cd}"/>
						<input type="hidden" name="room_cd" value="${detailmember.room_cd}"/>
						<input type="hidden" name="seat_cd" value="${detailmember.seat_cd}"/>
						<input type="hidden" name="member_cd" value="${detailmember.member_cd}"/>
						<input type="hidden" name="member_regi_date" value="${detailmember.member_regi_date}"/>
						<div class="form-group">
							<label class="control-label" for="inputLarge">기존 만료일</label>
							<input type="text" class="form-control" id="end_date" value="${detailmember.member_end_date}" readonly/>
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">연장일</label>
							<input type="date" class="form-control" id="extension_date" name="member_end_date"/>
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">결제금액</label>
							<input type="text" class="form-control" id="payment_amount" name="total_amount"/>
						</div>
						<div class="form-group">
						    <label for="inputLarge">결제방법</label>
						    <select name="pay_option" class="form-control">
						      <option value="card">카드</option>
						      <option value="cash">현금</option>
						    </select>
					    </div>
						<div>
							<strong>${detailmember.member_nm}</strong>회원님의 기간을 연장하시겠습니까? 
							<button type="button" class="btn btn-primary" id="btn">확인</button>
						</div>
                  	</form>
                  </div> <!-- box_body -->
           </div> <!-- container -->
      </div> <!-- col-md-12 -->
    </div> <!-- row -->
    
    <c:import url="../module2/jsscript.jsp" />
    <script>
    	var re_num = /^[0-9]+$/;
    	var chk2 =/[0-9]{4}-[0-9]{2}-[0-9]{2}/;
    	
    	//연장일 유효성검사
    	$('#btn').click(function(){
    		if(chk2.test($('#extension_date').val()) != true){
    			alert('연장일을 입력해주세요.');
				$('#extension_date').focus();
				return;
    		}
    		//기존 만료일과 연장일 날짜 비교
    		var endDate = $('#end_date').val();
    		var endDateArr = endDate.split('-');
    		console.log(endDateArr);
    		
    		var extensionDate = $('#extension_date').val();
    		var extensionDateArr = extensionDate.split('-');
    		console.log(extensionDateArr);
    		
    		var endDateCompare = new Date(endDateArr[0], endDateArr[1], endDateArr[2]);
    		var extensionDateCompare = new Date(extensionDateArr[0], extensionDateArr[1], extensionDateArr[2]);
    		console.log('endDateCompare :' + endDateCompare + 'endDateCompare.get :' + endDateCompare.getTime());
    		console.log('extensionDateCompare :' + extensionDateCompare + 'extensionDateCompare.get :' + extensionDateCompare.getTime());
    		if(endDateCompare.getTime() > extensionDateCompare.getTime()){
    			alert('연장일이 기존만료일보다 이전일 수 없습니다.');
    			$('#extension_date').focus();
    			return;
    		};
    		
    		if(re_num.test($('#payment_amount').val()) !=true){
    			alert('결제금액(숫자)을 입력해주세요.');
    			$('#payment_amount').focus();
    			return;
    		}
    		
    		$('#extension_form').submit();

    	});
    </script>             
</body>
</html>