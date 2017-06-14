<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <head>
    <!-- 헤드 -->
	<c:import url="../module2/head.jsp"/>
  	<!-- JS -->
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<script>
		$(document).ready(function(){

			var contextPath = '<c:out value='${pageContext.request.contextPath}'/>';
     
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
			});
		});

	</script>
	
	<style>
		   .bg-bluesky{
		    	background-color: #3c8dbc;
		    	color : white;
		   }
		   
	</style>

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
	       	열람실
	      <small>관리</small>
	    </h1>
	    
	    <ol class="breadcrumb">
	      <li><a href="${pageContext.request.contextPath}/dashboard/today_status"><i class="fa fa-table"></i>Home</a></li>
	      <li class="active">열람실관리</li>
	    </ol>
	  </section>
	  
  	  <!-- Main content -->
      <section class="content">
	<!-- main -->
	<div class="row">	
	  <div class="col-md-9 col-lg-10 main" id="wrap">		
			<c:forEach var="r" items="${roomlist}">
				<a href="${pageContext.request.contextPath}/room/room_view?room_cd=${r.room_cd}&room_nm=${r.room_nm}"><button class="btn bg-purple margin">열람실 ${r.room_nm}</button></a>


			<div class="col-sm-12">
				<c:forEach var="s" items="${seatlist}">
					<c:if test="${s.room_cd eq r.room_cd}">
					 <input type="hidden" class="get_seat" value="${s.seat_cd}"/>
	 				 <input type="hidden" name="chk" class="bocd" value="${s.branch_owner_cd}">
					 <input type="hidden" name="chk" class="mcd" class="mcdc" value="${s.member_cd}">
					 <input type="hidden" name="chk" class="rcd" value="${s.room_cd}">	
					 <button class="btn bg-olive btn-flat margin seat_btn" id="scd" value="${s.seat_cd}">	
							<c:if test="${s.colseat_state eq '빈좌석' or s.colseat_state eq '배치' }">
								<p>${s.seat_cnumber}</p>
							</c:if>
							<c:if test="${s.colseat_state eq '입실'}">
								<p>${s.seat_cnumber} <small class="label pull-right bg-yellow"> ${s.colseat_state}</small></p>
							</c:if>
							<c:if test="${s.colseat_state eq '퇴실'}">
								<p>${s.seat_cnumber} <small class="label pull-right bg-red">${s.colseat_state}</small></p>
							</c:if>

							<c:choose> 
							 <c:when test="${s.member_nm eq null}">
								<p class="windetail">빈좌석</p>
								<p>_________</p>
							 </c:when>
							 <c:otherwise>
							 	<p class="windetailon">${s.member_nm}</p>
							 	<p class="end_date">${s.member_end_date}</p>
							 </c:otherwise>
							</c:choose>
						</button>
					</c:if>		
				</c:forEach>	
				
					
			</div>
			<hr>
			</c:forEach>

			</div> <!-- col-md-9 col-lg-10 main -->
		</div><!-- row -->
		</section><!-- content -->
	</div><!-- content-wrapper -->
   </div><!-- wrapper -->

<c:import url="../module2/jsscript.jsp" />
<script>
	console.log('하이');
	$('#room_menu').addClass('active');
	$('#room02').addClass('active');
	
	if($('.windetailon').length > 0){
		console.log('헬로우');
		$('.windetailon').parent().removeClass('bg-olive');
		$('.windetailon').parent().addClass('bg-bluesky');	
	}
	
	
	 var now = new Date();
     var year= now.getFullYear();
     var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
     var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
     var now_date = year + '-' + mon + '-' + day;
	 console.log('now_date :' + now_date);
	 
	 $('.end_date').each(function(){
			var s = $(this).text();
	 		if(now_date == s){
	 			$(this).parent().addClass('bg-red');	
	 		}
	 });
	
</script>
</body>
</html>
