<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		//console.log("하이");
		$('#searchBtn').click(function(){
			if($('#selectValue').val().length < 2){
				alert("검색어는 2자 이상 입력하셔야 합니다.");
			}else if($('#selectValue').val().length >= 2){
				$('#searchFrom').submit();
			}
		});
		
	});
</script> -->
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
		       ZakSim
		      <small>Control panel</small>
		    </h1>
		    <ol class="breadcrumb">
		      <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
		      <li class="active">직원</li>
		    </ol>
		  </section>
<div class="table-responsive">
 <!-- 검색 -->
    <form id="searchFrom" action="${pageContext.request.contextPath}/staff/staff_search" method="post">
	 <div class="form-group">
	 <div class="row">
	  <div class="col-sm-3">
	  </div>
	  <div class="col-sm-2">
	   <select name="so" class="form-control" id="sel1">
	    <option value="staff_id">아이디</option>
	    <option value="branch_owner_cd">대표코드</option>
	    <option value="staff_name">직원이름</option>
	  </select>
	  </div>
	   <div class="col-sm-3">
	   		<input name="sv" id="selectValue" type="text" class="form-control" placeholder="검색어를 입력해주세요."/>
	   </div>
	   <div class="col-sm-4">
	   		<button type="button" id="searchBtn" class="btn btn-default">검색</button>
	   </div>
	   </div>
	</div>
	</form>
        <a href="${pageContext.request.contextPath}/staff/staff_form">직원 추가</a>
  <table class="table">
   <thead>
   	<tr>
   	<th>직원 아이디</th>
   	<th>지점 대표코드</th>
   	<th>직원 이름</th>
   	<th>직원 연락처</th>
   	<th>직원 주소</th>
   	<th>직원 가입일</th>
   	</tr>
   </thead>
        <tbody>

	<c:forEach var="s" items="${searchlist}">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/staffView?staff_id=${s.staff_id}">${s.staff_id}</a></td>
                    <td>${s.branch_owner_cd}</td>
                    <td>${s.staff_name}</td>
                    <td>${s.staff_tel}</td>
                    <td>${s.staff_addr}</td>
                    <td>${s.staff_in_date}</td>
                </tr>
 	</c:forEach>
        </tbody>
   
  </table>
   
 </div>
</div>
</div>

</body>
</html>