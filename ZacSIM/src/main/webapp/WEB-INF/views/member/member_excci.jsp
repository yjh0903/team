<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		//console.log("하이");
		$('#searchBtn').click(function(){
			if($('#searchForm').val()=='') {
				alert("검색어를 입력해주세요.");
				$('#searchForm').focus();
			} else {
                $('#exitMember').submit();
            }
		});
	});
</script>
    <!-- 헤드 -->
	<c:import url="../module2/head.jsp"/>
	<!-- JS -->
	<c:import url="../module2/jsscript.jsp" />
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
		      <small>입퇴실</small>
		    </h1>
      		<ol class="breadcrumb">
		      <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
		      <li class="active">회원</li>
		    </ol>
		  </section>

        <!-- Main content -->
        <section class="content">

         <!-- row 와 col로 폼 위치 조절 --> 
          <div class="row">
            <div class="col-md-6">

              <!-- 폼  테그 01 -->
              <div class="box box-primary">
                <div class="box-header">
                  <h3 class="box-title">독서실 회원 검색</h3>
			   		<a class="btn btn-sm btn-default" href="${pageContext.request.contextPath}/member/member_exit"><i class="fa fa-undo fa-spin"></i></a>
                </div>  
			
			<div class="box-body table-responsive no-padding">
                  <table class="table">
                  <thead>
                    <tr>
                      	<th>연락처</th>
		            	<th>이름</th>
            		  </tr>
            		</thead>  
                    <tbody>           
                   
			               <tr>  
			                    <td>${member.member_tel}</td>
			                    <td>${member.member_nm}</td>
	               		    </tr>
	              
			        </tbody>
                  </table>
                  </div>
                  </div>
                  </div>
                  
            	<!-- right column -->
	            <div class="col-md-6">
	            
	            <div class="box box-primary">
                <div class="box-header">
                  <h3 class="box-title">독서실 회원 입퇴실 리스트</h3>
                  <div class="box-tools">
                </div><!-- /.box-header -->
				<div class="box-body table-responsive no-padding">
                  <table class="table">
                  <thead>
                    <tr>
                      <th>이름</th>
                      <th>현재 날짜</th>
                      <th>입실시간</th>
                      <th>퇴실시간</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="seattime" items="${seattime}">
			                <tr>
			                    <td>${seattime.member_nm}</td>
			                    <td>${seattime.seat_date}</td>
			                    <td>${seattime.seat_in_time}</td>
			                    <td>${seattime.seat_out_time}</td>
	               		    </tr>
			 	 </c:forEach>
			 	  </tbody>
                  </table>
				   </div>
				   </div>
				  </div>
				 </div>
				 </div>
				 </section>
				</div>
				</div>

	</body>
</html>     