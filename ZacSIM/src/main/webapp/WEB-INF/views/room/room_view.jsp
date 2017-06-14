<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- 헤드 -->
<c:import url="../module2/head.jsp"/>
	<style>
	  .draggable { width: 80px; height: 80px; padding: 0.5em; float: left; margin: 0 10px 10px 0; background-color: #3d9970; color:white;}
	  #draggable, #draggable2 { margin-bottom:20px; }
	  #draggable { cursor: n-resize; }
	  #containment-wrapper { width: 95%; height:900px; border:2px solid #ccc; padding: 10px; }
	  h3 { clear: left; }
	</style>
</head>
<body>
<body class="skin-blue">
    <div class="wrapper">
      <!-- 상단 -->
      <c:import url="../module2/top.jsp"/>
      
      <!-- 왼쪽 -->
 	  <c:import url="../module2/left.jsp" />
	
	<!-- 오른쪽 -->
     <div class="content-wrapper">
	  <section class="content-header">
	    <h1>
	       ZakSim
	      <small>Control panel</small>
	    </h1>
	    <ol class="breadcrumb">
	      <li><a href="${pageContext.request.contextPath}/home/NewFile"><i class="fa fa-dashboard"></i>Home</a></li>
	      <li class="active">열람실현황</li>
	    </ol>
	  </section> 
	  	
	<!-- Main content -->
       <section class="content">
			<div class="row">
	            <div class="col-xs-12">
	            <div class='color-palette-set'>
	               <div class='bg-orange disabled color-palette'>
	               	 <h1>
		               	<span>열람실 ${room.room_nm} 배치도</span>
	               	</h1>
	               </div>
	             </div><!-- col-xs-12 -->  
	             </div>
					<h1></h1>
				<div class="col-xs-9">
					<div id="containment-wrapper">
						<form action="${pageContext.request.contextPath}/room/room_placement" id="col_form" method="post">
						<c:forEach var="s" items="${seatlist}">
							<div class="draggable seatdraggable ui-widget-content seat_btn">
								<input type="hidden" class="member_cd" name="member_cd" value="${s.member_cd }"/>
								<input type="hidden" class="seat_left" name="seat_left" value="${s.seat_col}">
								<input type="hidden" class="seat_top" name="seat_top" value="${s.seat_row}">
								<input type="hidden" name="room_cd" value="${s.room_cd}">								
								<div><input type="hidden" name="seat_cnumber" class="seat_cnum" value="${s.seat_cnumber}">${s.seat_cnumber}</div>
							<c:if test="${s.member_nm != null}">
								<p class="member_nm">${s.member_nm}</p>
							</c:if>
							</div>
						</c:forEach>
						</form>
					</div>
				</div>
				
				<div class="col-xs-3">
				<!-- <div style="clear: both; width: 200px;">
				
				<div class="box box-solid box-warning">
	                <div class="box-header">
	                  <h3 class="box-title">설정</h3>
	                  <div class="box-tools right">
	                  </div>
	                </div>
	                <div class="box-body">
						<button id="add_btn" type="button" class="btn btn-block btn-info btn-xs">수정</button>
						<button id="cancel_btn" type="button" class="btn btn-block btn-danger btn-xs">취소</button>
	                </div>/.box-body
	              </div>/.box
				
				</div> -->
				</div>
			</div><!-- row -->
		</section><!-- content -->
      
      </div><!--content-wrapper  -->
   </div><!-- wrapper -->
	<c:import url="../module2/jsscript.jsp" />
	<script>
		$('.seatdraggable').each(function(index, item){
			var seatleft = $(this).find('.seat_left').val();
			var seattop = $(this).find('.seat_top').val();
			console.log('seatleft :' + seatleft + 'seattop :' + seattop);
			
			$(this).offset({top:seattop, left:seatleft});
		});
		
		$('.member_nm').parent().css('background-color', '#84C8DC');
		
		
		
		/* var contextPath = '<c:out value='${pageContext.request.contextPath}'/>';
	     
		// window.name = "부모창 이름"; 
        window.name = "parentForm";
        
		$('.seat_btn').click(function(){
			console.log('클릭');
			var seat_cd = $(this).attr('value');
			console.log('seat_cd = ' + seat_cd);
		    var branch_owner_cd = $("input[name=chk]:eq(0)").val();
		    console.log('branch_owner_cd = ' + branch_owner_cd);
		    var room_cd = $(this).prev().val();
		    console.log('room_cd = ' + room_cd);
		    var member_cd = $(this).prev().prev().val();
		    console.log('member_cd = ' + member_cd);
		    
		    var windetail = $(this).find('.windetail').text();
		    console.log('windetail = ' + windetail);
		    var windetailon = $(this).find('.windetailon').text();
		    console.log('windetailon = ' + windetailon);
		    
		    if (windetail==("빈좌석")){		    	
		    var width=500, height=800;
		    var left = (screen.availWidth - width)/2;
		    var top = (screen.availHeight - height)/2;
		    var specs = "width=" + width;
		    specs += ",height=" + height;
		    specs += ",left=" + left;
		    specs += ",top=" + top;
			//결제창
			window.open(contextPath+'/payment/newwinpayment?branch_owner_cd='+branch_owner_cd+'&room_cd='+room_cd+'&seat_cd='+seat_cd+'&member_cd='+member_cd, '_blank', specs);
		    } else {
			    var width=500, height=500;
			    var left = (screen.availWidth - width)/2;
			    var top = (screen.availHeight - height)/2;
			    var specs = "width=" + width;
			    specs += ",height=" + height;
			    specs += ",left=" + left;
			    specs += ",top=" + top;
			//상세정보
				var seat_cd = $(this).val();
				window.open(contextPath+'/payment/newwindetail?member_nm='+windetailon+'&seat_cd='+seat_cd, '_blank', specs);
		    }
		}); */
		
	</script>
</body>
</html>