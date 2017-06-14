<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- head -->
	 <!-- 헤드 -->
	<c:import url="../module2/head.jsp"/>

</head>
<body class="skin-blue">
    <div class="wrapper">
 <!-- 상단 -->
      <c:import url="../module2/top.jsp"/>
      
      <!-- 왼쪽 -->
 	  <c:import url="../module2/left.jsp" />
		
	 <!-- 수정부분  -->
      <div class="content-wrapper">
		  <section class="content-header">
		    <h1>
		       	독서실 회원
		      <small>검색</small>
		    </h1>
		    <ol class="breadcrumb">
		      <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
		      <li class="active">회원</li>
		    </ol>
		  </section>
		  
		   <section class="content">
			
			<div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">독서실 회원 검색결과</h3>
                  <a class="btn btn-sm btn-default" href="${pageContext.request.contextPath}/member/member_list"><i class="fa fa-undo fa-spin"></i></a>
                  <div class="box-tools">
                  </div>
                </div>
   <table class="table table-hover">
   <thead>
   	   <tr>
   	   	<th>회원코드</th>
		<th>이름</th>
		<th>연락처</th>
		<th>주소</th>
		<th>회원상태</th>
		<th>가입일</th>
       </tr>
   </thead>
        <tbody>

		<c:forEach var="s" items="${searchlist}">
	        <tr>
	           <td>${s.member_cd}</td>
	           <td><a href="${pageContext.request.contextPath}/member/member_view?member_nm=${s.member_nm}">${s.member_nm}</a></td>
	           <td>${s.member_tel}</td>
	           <td>${s.member_addr}</td>
	           <td>${s.member_seat_state}</td>
	           <td>${s.member_date}</td>
	        </tr>
	 	</c:forEach>
	  </tbody>
	  </table>
     </div>
    </div>
   </div>
   </section>
   </div> 
  </div>
        <!-- JS -->
	<c:import url="../module2/jsscript.jsp" />
	<script>
		$('#member_menu').addClass('active');
		$('#member02').addClass('active');
	</script>
</body>
</html>