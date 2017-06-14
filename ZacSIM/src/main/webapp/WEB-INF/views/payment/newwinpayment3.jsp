<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
  <head>
  	<!-- 헤드 -->
	<c:import url="../module2/advanced_css.jsp"/>
	<style>
		#span01{
			color:red;
		}
	</style>
 </head>
 <body class="skin-blue">
	<div class="row">
		<div class="col-md-12">
             <!-- Info box -->
             <div class="box box-solid bg-olive">
               <div class="box-header">
                 <h2 class="box-title"><i class="fa fa-pagelines"></i>결제</h2>
               </div>
              </div><!-- box box-solid bg-aqua -->
		             
                <div class="container">
                <!-- form start -->
                  <div class="box-body">
                      <form name="myForm" name="postForm" method="post" action="${pageContext.request.contextPath}/payment/paymentend">					    
					    <div class="form-group">
					    <label for="fname">지점대표코드</label>
					    <input type="text" id="branch_owner_cd" name="branch_owner_cd" class="form-control" value="${branch_owner_cd}" readonly>
					    </div>
					    
					    <div class="form-group">
					    <label for="fname">열람실코드&nbsp;&nbsp;&nbsp;</label>
					    <input type="text" id="room_cd" name="room_cd" class="form-control" value="${room_cd}" readonly>
					    </div>
					    
					    <div class="form-group">
					    <label for="fname">열람석코드&nbsp;&nbsp;&nbsp;</label>
					    <input type="text" id="seat_cd" name="seat_cd" class="form-control" value="${seat_cd}" readonly>
					    </div>
					    
					    <div class="form-group">
					    <label for="fname">회원코드&nbsp;&nbsp;<button type="button" id="memberlist">목록</button>&nbsp;&nbsp;<span id="span01"></span> </label>
					    <input type="text" id="member_cd" name="member_cd" class="form-control">
					    </div>
					    
					    <div class="form-group">
					    <label for="fname">등록일</label>
					    <input type="date" name="member_regi_date" class="form-control">
					    </div>
					    
					    <c:forEach var="c" items="${chargeslist}">
						    <label>
		                      	<input type="radio" name="r3" class="flat-red" value="${c.seat_charges_code}"/>
		                      	${c.seat_member_type}${c.seat_charges_date}일-${c.seat_charges_price}원
		                    </label>
					    </c:forEach>
					    
					    <div class="form-group">
					    <label for="fname">만료일</label>
					    <input type="date" name="member_end_date" class="form-control">
					    </div>

						<div class="form-group">
					    <label for="lname">결제금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					    <input type="text" id="total_amount" name="total_amount" class="form-control">
					    </div>
						
					    <div class="form-group">
					    <label for="결제 방법">결제방법&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					    <select id="결제 방법" name="pay_option" class="form-control">
					      <option value="card">카드</option>
					      <option value="cash">현금</option>
					    </select>
					    </div>
					    

					    <div class="box-footer">
					       <button type="submit" class="btn btn-primary" value="결제">결제</button>				   
					    </div>
					  </form>
              		</div>
             	</div>
            
		 </div><!-- col-md-12 -->
	</div><!-- row -->
    <!-- JS -->
    <c:import url="../module2/jsscript.jsp" />
	<script>
		//라디오박스 css
	    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
	      checkboxClass: 'icheckbox_flat-green',
	      radioClass: 'iradio_flat-green'
	    });
		
		//목록 검색
		$('#memberlist').click(function(){
			console.log('클릭 확인');
			opener.parent.location='${pageContext.request.contextPath}/member/member_list'; 
		});
		
		
		//결제 요금 계산
		$('#discount_amount').blur(function(){
			console.log('요금 테스트');
			var pay = $('#pay_amount').val() *1;
			var discount = $('#discount_amount').val() *1;
			var total = pay - discount;
			$('#total_amount').val(total);
		});
		
		$('#member_cd').blur(function(){
			console.log('회원코드 중복체크');
			console.log($('#member_cd').val());
			var membercd = $('#member_cd').val();
			var parm = {"member_cd":membercd};
			
		$('#member_cd').keyup(function(){
			$('#span01').html('');
		});	
			
		
			$.ajax({
				url:'${pageContext.request.contextPath}/payment/check_membercd',
				type:'GET',
				data:parm,
				success:function(data){
					console.log('성공' + data.check);
					if(data.check === 'Y'){
						$('#span01').html('이미 결제된 회원코드입니다.');
					}
				},
				error:function(XHR, textStatus, error){
					$('#span01').html('존재하지 않는 회원코드 입니다.');
				}
				
				
			});
		});
	</script>
 </body>
</html>

 