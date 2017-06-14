<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- 헤드 -->
	<c:import url="../module2/advanced_css.jsp"/>
</head>
<body class="skin-blue">
	<div class="row">
		<div class="col-md-12">
             <!-- Info box -->
             <div class="box box-solid bg-olive">
               <div class="box-header">
                 <h2 class="box-title"><i class="fa fa-pagelines"></i>좌석이동</h2>
               </div>
              </div><!-- box box-solid bg-aqua -->
        </div><!-- col-md-12 -->
        <div class="col-md-12">
        	<h3>열람실</h3>
        	<c:forEach var="r" items="${roomlist}">
        	<span class="room_span">
        		<input type="hidden" value="${r.room_cd}"/>
        		<button class="btn bg-maroon margin" >${r.room_nm}</button>
        	</span>
        	</c:forEach>
					
        </div><!-- col-md-12 -->
        <hr/>
        <div class="col-md-12" id="seatzone">
        	<h3>열람석</h3>
        		
        </div><!-- col-md-12 -->
        <hr/>
        <div class="col-md-12" id="roomseat">
        	<h3>선택한 열람석</h3>
        	<form action="${pageContext.request.contextPath}/room/move_pro" method="post">
        		<input type="hidden" id="room_cd" name="room_cd"/>
        		<input type="hidden" id="seat_cnumber" name="seat_cnumber"/>
        		<input type="hidden" name="seat_cd" value="${seat_cd}"/>
        		<span id="namezone"></span>
        		<span id="namezone02"></span>
        	</form>
        </div><!-- col-md-12 -->
    </div><!-- row -->
    <!-- jQuery 2.1.3 -->
    <script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <script>
    	
    	$('.room_span').click(function(){
    		var room_cd =$(this).children().val();
    		var room_nm =$(this).children().next().text();
    		console.log('room_cd :' + room_cd + 'room_nm' + room_nm);
    		$('#room_cd').val(room_cd);
    		$('#namezone').html('<button type="button" class="btn bg-maroon margin" >'+room_nm+'</button>');
    		$('#namezone02').html('');
    		
    		var parm = {'room_cd':room_cd};
    		$.ajax({
    			type:"POST",
    			url:"${pageContext.request.contextPath}/room/move_seat",
    			data: parm,
    			success:function(data){
      			  console.log('통신 성공 data :' + data.cnumber0);
      			//초기화
      			$('#seatzone').html('<h3>열람석</h3>');
      			 //data 존재시 
      			 if(data.cnumber0 != null){
      				for(var key in data){
        				  console.log(key +','+ data[key]);
        				  $('#seatzone').append('<button type="button" class="btn bg-olive margin notpayseat" >'+data[key]+'</button>');
        			  }	
      			  }else{
      				$('#seatzone').html('<h3>열람석</h3>빈좌석이 존재하지 않습니다.');
      			  }
      			  
	      		},
	      		error:function(data){
	      		  console.log('통신 실패');
	      		}
    		});
    	});
    	
    	//동적 이벤트 
    	$(document).on("click",".notpayseat",function(){
    		//해당 text 가져오고 공백제거
    		var seat_cnumber = $.trim($(this).text());
    		console.log('seat_cnumber :' + seat_cnumber);
    		$('#seat_cnumber').val(seat_cnumber);
    		if($('.margin').length > 0) {
    			$('#namezone02').empty();	
    		}
    		var appendText ='<button type="button" class="btn bg-olive margin">'+seat_cnumber+'</button>(으)로 자리이동 하시겠습니까?';
    		appendText +='<button type="submit" class="btn bg-purple margin">확인</button>'; 
    		$('#namezone02').append(appendText);
    	});
    
    </script>         
</body>
</html>