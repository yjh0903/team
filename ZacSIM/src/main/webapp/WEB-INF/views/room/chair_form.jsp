<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
	<head>
		<!-- head -->
		<c:import url="../module2/head.jsp"/>
		<style>
		  .draggable {width: 80px; height: 80px;  padding: 0.5em; float: left; margin: 0 10px 10px 0; background-color: #3d9970; color:white;}
		  #draggable, #draggable2 { margin-bottom:20px; }
		  #draggable { cursor: n-resize; }
		  #containment-wrapper { width: 95%; height:900px; border:2px solid #ccc; padding: 10px; }
		  h3 { clear: left; }
		</style>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script>
		  $( function() {
		    $( "#draggable" ).draggable({ axis: "y" });
		    $( ".seatdraggable" ).draggable({ containment: "#containment-wrapper", scroll: false });
		  });
		</script>
		
	</head>
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
		      <li class="active">열람실</li>
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
						<c:forEach var="s" items="${seat}">
							<div class="draggable seatdraggable ui-widget-content">
								<input type="hidden" class="seat_left" name="seat_left">
								<input type="hidden" class="seat_top" name="seat_top">
								<input type="hidden" name="room_cd" value="${s.room_cd}">
								<p><input type="hidden" name="seat_cnumber" class="seat_cnum" value="${s.seat_cnumber}">${s.seat_cnumber}</p>
								<p>빈좌석</p>
							</div>
						</c:forEach>
						</form>
					</div>
				</div>
				
				<div class="col-xs-3">
				<div style="clear: both; width: 200px;">
				
				<div class="box box-solid box-warning">
	                <div class="box-header">
	                  <h3 class="box-title">배치도</h3>
	                  <div class="box-tools right">
	                  </div>
	                </div>
	                <div class="box-body">
						<button id="add_btn" type="button" class="btn btn-block btn-info btn-xs">등록</button>
						<button id="cancel_btn" type="button" class="btn btn-block btn-danger btn-xs">취소</button>
						
	                </div><!-- /.box-body -->
	              </div><!-- /.box -->
				
				</div>
				</div>
			</div><!-- row -->
		</section><!-- content -->
	   </div><!-- content-wrapper -->
	  </div><!-- wrapper -->
  		<c:import url="../module2/jsscript.jsp" />
  		<script>
  		
  		$(document).on('click', '#add_btn', function(){
			  console.log('등록 테스트');
			  $('.seatdraggable').each(function (index, item) { 
				  var s = $(this).offset();
				  console.log('index :' + index  + 'item :' + item + 'left : ' + s.left + 'top :' + s.top);
				  var offsetleft =  Math.round(s.left/10)*10;
				  var offsettop = Math.round(s.top/10)*10;
				  console.log('offsetleft :' + offsetleft);
				  console.log('offsettop :' + offsettop);
				  
				  $(this).find('.seat_left').val(offsetleft);
				  $(this).find('.seat_top').val(offsettop);
				  console.log('seatleft val :' + $(this).find('.seat_left').val());
				  console.log('seattop val :' + $(this).find('.seat_top').val());
				});
			  
			  var result = confirm('정말로 이 배치도로 등록 하시겠습니까?');
				 if(result) { 
					console.log('yes');
					$('#col_form').submit();
					//location.replace(contextPath+'/dashboard/today_status'); 
				   }else{ 
					 
				   }
		  }); 
	  	$('#cancel_btn').click(function() {
			 var result = confirm('정말로 등록을 취소 하시겠습니까?');
			 if(result) { 
				console.log('yes');
				location.replace(contextPath+'/dashboard/today_status'); 
			   }else{ 
				 
			   } 
		 });	
  			
		  $('.seatdraggable').click(function(){
		    console.log('하이');
		    var offset = $(this).offset();
		    var offsetleft =  Math.round(offset.left/20)*20;
		    var offsettop = Math.round(offset.top/20)*20;
		    console.log('offset.left :' + offset.left);
		    console.log('offsetleft :' + offsetleft);
	
		    //$(this).css('left',offsetleft+'px');
		    //$(this).css('top',offsettop+'px');
		  });
		</script>
	</body>
</html>


