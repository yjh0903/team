<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		//console.log("하이");
		$('#searchBtn').click(function(){
			if($('#searchForm').val()=='') {
				alert("검색어를 입력해주세요.");
				$('#searchForm').focus();
			} else {
                $('#searchMember').submit();
            }
		});
	});
</script>
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
		      <small>목록</small>
		    </h1>
		    <ol class="breadcrumb">
		      <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
		      <li class="active">회원</li>
		    </ol>
		  </section>
		  
		   <section class="content">
			<div class="col-md-9 col-lg-12 main" id="wrap">
			
			<div class="row">
              <div class="box box-info">
                <div class="box-header">
                    <h3 class="box-title" style="float: left;">독서실 회원 리스트</h3>
                </div>
               
                  <div class="box-body">
                  	  <div class="form-group">
					   <form id="searchMember" action="${pageContext.request.contextPath}/member/member_search" method="post">
						   <div class="input-group" style="float: left;"> 
							   <select name="so" class="form-control" id="sel1">
							    	<option value="member_cd">CODE</option>
									<option value="member_nm">이름</option>
									<option value="member_sex">성별</option>
								    <option value="member_seat_state">회원상태</option>
							   </select>
						   </div>
						   <div class="input-group" style="float: left;">
						   		<input name="sv" id="searchForm" type="text" class="form-control" placeholder="검색을 입력하시오."/>
						   </div>
						   <div class="input-group" style="float: left;">
						   		<button type="button" id="searchBtn" class="btn  btn-default"><i class="fa fa-search"></i></button>
						   </div>
					   </form>
					  </div>
					  <div style="height: 30px;">&nbsp;</div>
	                  <table class="table">
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
							<c:forEach var="b" items="${list}">
						                <tr>
						                    <td>${b.member_cd}</td>
						                    <td><a href="${pageContext.request.contextPath}/member/member_view?member_nm=${b.member_nm}">${b.member_nm}</a></td>
						                    <td>${b.member_tel}</td>
						                    <td>${b.member_addr}</td>
						                    <c:if test="${b.member_seat_state eq 'Y'}">
					            			<td>정회원</td>
					             			</c:if>
					              			<c:if test="${b.member_seat_state eq 'N'}">
					             			<td>일반회원</td>
					             			</c:if>
						                    <td>${b.member_date}</td>
				               		    </tr>
						 	</c:forEach>
					      </tbody>
                 	 </table>
                  	
	                  <nav aria-label="Page navigation example">
					    <ul class="pagination justify-content-center">
					        <c:if test="${currentPage > 1}">
					            <li class="page-item">
					            	<a class="page-link" href="${pageContext.request.contextPath}/member/member_list?currentPage=${currentPage-1}" aria-label="Previous">
					            		<span aria-hidden="true">&laquo;</span>
					            		<span class="sr-only">Previous</span>
					            	</a>
					            </li>	
					        </c:if>
					        <c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
								<c:if test="${i == currentPage}">
									<li class="page-item"><a class="page-link" href="#">${i}</a></li>
								</c:if>
								<c:if test="${i != currentPage}">
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/member/member_list?currentPage=${i}">${i}</a></li>
								</c:if>
							</c:forEach>
							
					        <c:if test="${currentPage < lastPage}">
					            <li class="page-item">
					            	<a class="page-link" href="${pageContext.request.contextPath}/member/member_list?currentPage=${currentPage+1}" aria-label="Next">
					            		<span aria-hidden="true">&raquo;</span>
					        			<span class="sr-only">Next</span>
					            	</a>	
					            </li>	
					        </c:if>
						 </ul>
					</nav>
				
                </div><!-- /.box-body -->
              </div><!-- /.box -->
          </div>
          </div>
          </section><!-- /.content -->
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