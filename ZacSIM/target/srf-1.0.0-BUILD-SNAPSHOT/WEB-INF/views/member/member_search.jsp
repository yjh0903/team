<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- head -->
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
		
	 <!-- 수정부분  -->
      <div class="content-wrapper">
		  <section class="content-header">
		    <h1>
		       StudyRoom
		      <small>웹 기반 독서실 관리프로그램</small>
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
                  <div class="box-tools">
                  </div>
                </div>
   <table class="table table-hover">
   <thead>
   	   <tr>
   	   	<th>회원코드</th>
   	   	<th>이름</th>
        <th>성별</th>
        <th>연락처</th>
        <th>주소</th>
        <th>나이</th>
        <th>회원상태</th>
       </tr>
   </thead>
        <tbody>

		<c:forEach var="s" items="${searchlist}">
	        <tr>
	           <td><a href="${pageContext.request.contextPath}/member/member_view?member_cd=${s.member_cd}">${s.member_cd}</a></td>
	           <td>${s.member_nm}</td>
	           <td>${s.member_sex}</td>
	           <td>${s.member_tel}</td>
	           <td>${s.member_addr}</td>
	           <td>${s.member_age}</td>
	           <td>${s.member_seat_state}</td>
	        </tr>
	 	</c:forEach>
	  </tbody>
	  </table>
	  <a class="btn btn-default" href="${pageContext.request.contextPath}/member/member_list">== 뒤로가기 ==</a>
     </div>
    </div>
   </div>
   </section>
   </div> 
  </div>
</body>
</html>