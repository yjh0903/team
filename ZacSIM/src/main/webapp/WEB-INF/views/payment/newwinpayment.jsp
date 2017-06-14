<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
  <head>
  	<!-- 헤드 -->
	<c:import url="../module2/advanced_css.jsp"/>
	<style>
		#span01{
			color:blue;
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
                      <form name="myForm" id="myForm" method="post" action="${pageContext.request.contextPath}/payment/paymentend">					    
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
					    <label for="fname">회원코드&nbsp;&nbsp;<button type="button" id="memberlist">검색</button>&nbsp;&nbsp;<span id="span01"></span> </label>
					    <input type="text" id="member_cd" name="member_cd" class="form-control">
					    </div>
					    
						<div class="form-group">
						 <label for="fname">요금제</label>
					    <div>
					     	<c:if test="${empty chargeslist}">
					    		<code>요금제설정</code>(왼쪽 메뉴)에서 요금제를 등록해주세요. 
					    	</c:if>
					    <c:forEach var="c" items="${chargeslist}">
					   
						    <label class="test" id="charges">
		                      	<input type="radio" name="r3" class="flat-red charges" value="${c.seat_charges_code}"/>
		                      	${c.seat_member_type}<span class="charges_date">${c.seat_charges_date}</span>일-<span class="charges_prices">${c.seat_charges_price}</span>원
		                    </label>
					    </c:forEach>
					    </div>
					    </div>
					    <div class="form-group">
					    <label for="fname">등록일</label>
					    <input type="text" name="member_regi_date" id="now_date" class="form-control" readonly="readonly">
					    </div>
					    
					    <div class="form-group">
					    <label for="fname">만료일</label>
					    <input type="text" name="member_end_date" id="d-day" class="form-control" readonly="readonly">
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
					       <button type="submit" class="btn btn-primary" id="btn" value="결제">결제</button>				   
					    </div>
					  </form>
              		</div>
             	</div>
           
		 </div><!-- col-md-12 -->
	</div><!-- row -->
    <!-- JS -->
    <c:import url="../module2/jsscript.jsp" />
	<script>
	
		//회원 검색
		$('#memberlist').click(function(){
			console.log('확인');
			var width=500, height=300;
		    var left = screen.availWidth - (width+150);
		    var top = (screen.availHeight - height)/2;
		    var specs = "width=" + width;
		    specs += ",height=" + height;
		    specs += ",left=" + left;
		    specs += ",top=" + top;
			window.open('${pageContext.request.contextPath}/payment/payment_search', '_blank', specs);
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
			
		$('#member_cd').blur(function(){
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
		
		
		//현재 DATE 구하기  
	      var now = new Date();
	      var year= now.getFullYear();
	      var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	      var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	      var now_date = year + '-' + mon + '-' + day;
	      console.log('now_date :' + now_date);
	      
	      $('#now_date').val(now_date);
	      
	     //날짜 더하기  함수
	      function dayPlus(value, num){
	    	  var arr = value.split('-');
	    	  var date = new Date(arr[0], arr[1], arr[2]);
	    	  console.log('date :' + date);
	    	  console.log('date.getDate() :' + date.getDate() + 'num :' + num);
	    	  date.setDate(date.getDate() + num);
	    	  var mon = date.getMonth()>9 ? ''+date.getMonth() : '0'+date.getMonth();
	    	  var day = date.getDate()>9 ? ''+date.getDate() : '0'+date.getDate();
	    	  
	    	  console.log('일자 더하기 :' + date.getFullYear()+'-'+mon+'-'+ day);
	    	  var plus_date = date.getFullYear()+'-'+mon+'-'+ day;
	    	  return plus_date;
	      }
		
		
		$('.charges').on('click', function(){
			console.log('라디오 확인');
			console.log($(this).val()); //요금제코드
			console.log($(this).next().html()); //요금제 기한
			console.log($(this).next().next().html());//요금제 요금
			var price = $(this).next().next().html();
			var num = $(this).next().html() *1;
			var result = dayPlus(now_date, num);
			$('#d-day').val(result);
			$('#total_amount').val(price);
		});
		
		//자식창 회원코드 클릭시 값 가져오는 함수
		function setChildValue(name){
		    $('#member_cd').val(name);
		    $('#member_cd').focus();
		    return;
		}
		
		//유효성 검사
		var re_str = /^[가-힣a-z0-9_-]+$/;
    	var re_num = /^[0-9]+$/;
    	
    	$('#btn').click(function(){
    			if(re_str.test($('#member_cd').val()) != true){
 					alert('회원코드를 입력해주세요.');
 					$('#member_cd').focus();
 					return false;
    			}else if($('#span01').html() != ''){
					alert('존재하지 않는 코드이거 이미 결제된 코드입니다.');    					
					$('#member_cd').focus();
					return false;
    			}else if(re_str.test($('#d-day').val()) != true){
    				alert('요금제를 선택해주세요.');
    				$('#charges').focus();
    				return false;
    			}else if(re_num.test($('#total_amount').val()) != true){
    				alert('숫자만 입력해주세요.');
    				$('#total_amount').focus();
    				return false;
    			}else{
    				$('#myForm').submit();
    			}
    	});
		
	</script>
 </body>
</html>

 