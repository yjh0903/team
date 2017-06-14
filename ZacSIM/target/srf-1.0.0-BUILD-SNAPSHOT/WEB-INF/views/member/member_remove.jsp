<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		//console.log("하이");
		$('#removeForm').click(function(){
			if($('#branch_owner_cd').val()=='') {
				alert("지점대표코드를 입력해주세요.");
				$('#branch_owner_cd').focus();
			} else {
                $('#removeMember').submit();
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
		       StudyRoom
		      <small>웹 기반 독서실 관리프로그램</small>
		    </h1>
		    <ol class="breadcrumb">
		      <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
		      <li class="active">회원</li>
		    </ol>
		  </section>
		  
	  <!-- Main content -->
      <section class="content">
		<div class="row">
			<!-- left column -->
            <div class="col-md-12">
              <!-- general form elements -->
              <div class="box">
                <div class="box-header">
					<h3 class="box-title">독서실 회원 삭제</h3>		
				</div>
				<form class="form-inline" id="removeMember" action="${pageContext.request.contextPath}/member/member_remove" method="post">
					<input name="member_cd" value="${param.member_cd}" type="hidden"/>
	        		<div class="box-body">
	        		<div class="form-group">
	             		<label for="branch_owner_cd">지점대표코드 </label>
	            	 	<input class="form-control" id="branch_owner_cd" name="branch_owner_cd" type="text">
	        	 	</div><br>
	         	<div>
	       		 	<input class="btn btn-secondary" id="removeForm" type="button" value="회원삭제"/>
	        		<input class="btn btn-secondary" type="reset" value="초기화"/>
	   		 	</div><br>
	   		 	</div>
        		</form>	
        </div>   
	</div>
   </div>
  </section>
</div>
</div>
</body>
</html>        
					  