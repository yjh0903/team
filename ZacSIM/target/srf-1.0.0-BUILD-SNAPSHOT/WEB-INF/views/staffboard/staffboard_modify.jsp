<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- <!-- jquery를 사용하기위한 CDN주소
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->

<!-- <script>
    $(document).ready(function(){
        $('#modifyButton').click(function(){
            if($('#boardPw').val().length <4) {
                alert('boardPw는 4자이상 이어야 합니다');
                $('#boardPw').focus();
            } else if($('#boardTitle').val()=='') {
                alert('boardTitle을 입력하세요');
                $('#boardTitle').focus();
            } else if($('#boardContent').val()=='') {
                alert('boardContent을 입력하세요');
                $('#boardContent').focus();
            } else if($('#boardUser').val()=='') {
                alert('boardUser을 입력하세요');
                $('#boardUser').focus();
            } else {
                $('#modifyForm').submit();
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
<div class="container">
    <h1>공지사항 수정</h1> 
    <form class="form-horizontal" action="${pageContext.request.contextPath}/staffboard/staffboard_modify_pro" method="post">
		
		 <div class="form-group">staffboard_no :
            <input class="form-control" name="staffboard_no" value="${staffboard.staffboard_no}" type="text" readonly="readonly"/>
        </div>
        <div class="form-group">
            <label for="staffboard_pw">staffboard_pw :</label>
            <input class="form-control" name="staffboard_pw" id="staffboard_pw" type="password" placeholder="비밀번호를 입력해주세요"/>
        </div>    
        <div class="form-group">
            <label for="staffboard_title">staffboard_title :</label>
            <input class="form-control" value="${staffboard.staffboard_title}" name="staffboard_title" id="staffboard_title" type="text"/>
        </div>
        <div class="form-group">staffboard_content :
            <textarea class="form-control" id="staffboard_content" name="staffboard_content" rows="5" cols="50">${staffboard.staffboard_content}</textarea>
        </div>
       
          <div class="box-footer">
                    <button type="submit" class="btn btn-primary">글입력</button>
                    <button type="reset" class="btn btn-primary">초기화</button>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/staffboard/staffboard_list">글목록</a>
        </div>
    </form>
</div>
</div>
</div>

</body>
</html>

