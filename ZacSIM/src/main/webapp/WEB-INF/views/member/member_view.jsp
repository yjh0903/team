<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%--   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<!DOCTYPE html>
<html>
<head>
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
		      <small>상세정보</small>
		    </h1>
		    <ol class="breadcrumb">
		      <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
		      <li class="active">회원</li>
		    </ol>
		    </section>
			<section class="content">
				<div class="row" >
					<div class="col-md-12">
		              <div class="box box-primary">
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
				            <td>출결번호 :</td>
		                	<td>${member.inout_num}</td>
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
				            <td>나이 :</td>
				            <td>${member.member_age}</td>
				          </tr>
				           <tr>
				              <td>등록일 :</td>
				              <td>${member.member_regi_date}</td>
				           </tr>
				           <tr>
				              <td>기간만료일 :</td>
				              <td>${member.member_end_date}</td>
				           </tr>
				           <tr>
				              <td>회원상태 :</td>
				              <c:if test="${member.member_seat_state eq 'Y'}">
				              <td>정회원</td>
				              </c:if>
				              <c:if test="${member.member_seat_state eq 'N'}">
				              <td>일반회원</td>
				              </c:if>
				           </tr>
				           <tr>
				              <td>등록경로 :</td>
				              <td>${member.member_regi_path}</td>
				           </tr>
				           <tr>
				              <td>이용목적 :</td>
				              <td>${member.member_use_pur}</td>
				           </tr>
				           </table>
				           <a class="btn btn-default" href="${pageContext.request.contextPath}/member/member_modify?member_nm=${member.member_nm}">회원 수정</a>
		   				   <a class="btn btn-default" href="${pageContext.request.contextPath}/member/member_remove?member_cd=${member.member_cd}">회원 삭제</a>
		  				   <a class="btn btn-default" href="${pageContext.request.contextPath}/member/member_list">회원리스트</a>
		                </div><!-- /.box-body -->
		              </div><!-- /.box -->
					</div>
	           </div>
          </section>  
          </div>    
      </div><!-- /.content-wrapper -->
            <!-- JS -->
	<c:import url="../module2/jsscript.jsp" />
	<script>
		$('#member_menu').addClass('active');
		$('#member02').addClass('active');
	</script>
    </body>
</html>  