<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		       ZakSim
		      <small>Control panel</small>
		    </h1>
		    <ol class="breadcrumb">
		      <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
		      <li class="active">직원</li>
		    </ol>
		  </section>
<div class="container">
    <h1>STAFF VIEW(팀프로젝트)</h1>
     <table class="table">
         <tbody>
             <tr>
                <td>staffboard_no :</td>
                <td>${staffboard.staffboard_no}</td>
               </tr>
            <tr>
                   <td>staffboard_title :</td>
                   <td>${staffboard.staffboard_title}</td>
            </tr>
            <tr>
                   <td>staffboard_content :</td>
                   <td>${staffboard.staffboard_content}</td>
            </tr>
            <tr>
                   <td>staff_name :</td>
                   <td>${staffboard.staff_name}</td>
            </tr>
            <tr>
                   <td>staffboard_date :</td>
                   <td>${staffboard.staffboard_date}</td>
            </tr>
        </tbody>
    </table>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/staffboard/staffboard_modify?staffboard_no=${staffboard.staffboard_no}">수정</a>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/staffboard/staffboard_delete?staffboard_no=${staffboard.staffboard_no}">삭제</a>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/staffboard/staffboard_list">글목록</a>
 
         <div>
         	댓글 수 : ${totalReply}
         </div>
         <div class="groove">
         <c:forEach var="staffboardreply" items="${replylist}">
         	<div>${staffboardreply.staffboard_name} ${staffboardreply.staffboardreply_date}</div>
         	<div>${staffboardreply.staffboardreply_content}</div>
         	
         </c:forEach>
         </div>
       
         <form action="${pageContext.request.contextPath}/staffboard/staffboard_reply" method="post">
         <input type="hidden" name="staffboardreply_no" value="${staffboardreply_no}">
         <span>이름 <input class="textBar" name="staffboard_name" type="text"/> </span>
	     <span>비밀번호 <input class="textBar" name="staffboardreply_pw" type="password"/></span>
          <div>
	     	<textarea name="staffboardreply_content" rows="3" cols="50"></textarea><button id="reply_btn" type="submit" class="btn btn-default">답변</button>
	     </div>
		</form>
		<%-- <c:if test=>
			for
		</c:if> --%>
    
</div>
</div>
</div>
 
<!--foot-->
	<c:import url="../module/foot.jsp" />
</body>
</html>


