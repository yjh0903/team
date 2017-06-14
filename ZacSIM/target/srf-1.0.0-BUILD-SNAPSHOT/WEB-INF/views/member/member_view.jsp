<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%--   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<!DOCTYPE html>
<html>
<head>
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
			<div class="col-md-9 col-lg-12 main" id="wrap">
			
			<div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">독서실 회원 상세정보</h3>
                </div><!-- /.box-header -->
                <div class="box-body table-responsive no-padding">
                  <table class="table table-hover">
                  <tr>
                	<td>독서실 회원코드 :</td>
                	<td>${member.member_cd}</td>
		          </tr>
		          <tr>
		            <td>이름 :</td>
		            <td>${member.member_nm}</td>
		          </tr>
		          <tr>
		            <td>성별 :</td>
		            <td>${member.member_sex}</td>
		          </tr>
		          <tr>
		             <td>연락처 :</td>
		             <td>${member.member_tel}</td>
		          </tr>
		          <tr>
		             <td>주소 :</td>
		             <td>${member.member_addr}</td>
		           </tr>
		           <tr>
		              <td>나이 :</td>
		              <td>${member.member_age}</td>
		           </tr>
		           <tr>
		              <td>회원상태 :</td>
		              <td>${member.member_seat_state}</td>
		           </tr>
		           </table>
		           <a class="btn btn-default" href="${pageContext.request.contextPath}/member/member_modify?member_cd=${member.member_cd}">회원 수정</a>
   				   <a class="btn btn-default" href="${pageContext.request.contextPath}/member/member_remove?member_cd=${member.member_cd}">회원 삭제</a>
  				   <a class="btn btn-default" href="${pageContext.request.contextPath}/member/member_list">회원리스트</a>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div>
           </div>
           </div>
          </section>  
          </div>    
      </div><!-- /.content-wrapper -->
    </body>
</html>  