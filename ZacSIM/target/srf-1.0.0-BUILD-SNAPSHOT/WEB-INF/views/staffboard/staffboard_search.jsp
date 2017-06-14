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
<div class="table-responsive">
 <!-- 검색 -->
    <form id="searchFrom" action="${pageContext.request.contextPath}/staffboard/staffboard_search" method="post">
	 <div class="form-group">
	 <div class="row">
	  <div class="col-sm-3">
	  </div>
	  <div class="col-sm-2">
	   <select name="so" class="form-control" id="sel1">
	    <option value="staffboard_title">제목</option>
	    <option value="staff_name">작성자</option>
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

    <div>전체행의 수 : ${staffboard_content}</div>
    <table class="table">
        <thead>
            <tr>
            	<th>staffboard_no</th>
                <th>staffboard_title</th>
                <th>staff_name</th>
                <th>staffboard_date</th>
            </tr>
        </thead>
        <tbody>

	<c:forEach var="s" items="${searchlist}">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/staffboard/staffboard_view?staffboard_no=${s.staffboard_no}">${s.staffboard_no}</a></td>
                    <td>${s.staffboard_title}</td>
                    <td>${s.staff_name}</td>
                    <td>${s.staffboard_date}</td>
                </tr>
 	</c:forEach>
        </tbody>
    </table>
    </div>
      
    <div>
        <a href="${pageContext.request.contextPath}/staffboard/staffboard_form">공지사항 입력</a>


	<c:if test="${currentPage > 1}">
	
		<span><a href="${pageContext.request.contextPath}/staffboard/staffboard_list?currentPage=${previousPage}"><span class="glyphicon glyphicon-chevron-left"></span></a></span>
         <span><a href="${pageContext.request.contextPath}/staffboard/staffboard_list?currentPage=${currentPage-1}">이전</a></span>
     </c:if>    

 
 <c:forEach var="i" begin="${startPage}" end="${endPage}" step="1"> 
 	<c:choose>
 		<c:when test="${i == currentPage}">
 			<span><a href="#">${i}</a></span>
 		</c:when>
 		<c:otherwise>	
			<span><a href="${pageContext.request.contextPath}/staffboard/staffboard_list?currentPage=${i}">${i}</a></span>
		</c:otherwise>	
	</c:choose>
</c:forEach>
	
		<c:if test="${currentPage < lastPage}">
            <span><a href="${pageContext.request.contextPath}/staffboard/staffboard_list?currentPage=${currentPage+1}">다음</a></span>
           <span><a href="${pageContext.request.contextPath}/staffboard/staffboard_list?currentPage=${nextPage}"><span class="glyphicon glyphicon-chevron-right"></span></a></span>
            
		</c:if>
	
    </div>
</div>
</div>
</body>
</html>
