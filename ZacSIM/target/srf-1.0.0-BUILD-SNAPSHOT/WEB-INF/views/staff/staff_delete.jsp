<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

 
<script>
    $(document).ready(function(){
        $('#removeButton').click(function(){
            if($('#boardPw').val().length <4) {
                alert('boardPw는 4자이상 이어야 합니다');
                $('#boardPw').focus();
            } else {
                $('#removeForm').submit();
            }
        });
    });
</script>
</head>
<body>
<div class="container">
<h1>직원 삭제</h1>
        <form  class="form-inline" id="removeForm" action="${pageContext.request.contextPath}/staff/staff_delete" method="post">
            <!-- boardPw와 함께 boardNo값도 숨겨서(hidden값으로) 넘김 -->
            <input name="staff_id" value="${param.staff_id}" type="hidden"/>
            <div class="form-group">
                <label for="staff_pw">비밀번호확인 :</label>
                <input class="form-control" id="staff_pw" name="staff_pw" type="password">
            </div>
            <div>
       		 <input type="submit" value="글입력"/>
        	<input type="reset" value="초기화"/>
   		 </div>
        </form>
    
</div>
</body>
</html>

