<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
  <head>
  	<!-- 헤드 -->
	<c:import url="../module2/advanced_css.jsp"/>
	<style>
		#span01{
			color:red;
		}
	</style>
 </head>
<body>
<body class="skin-blue">
	<div class="row">
		<div class="col-md-12">
             <!-- Info box -->
             <div class="box box-solid bg-olive">
               <div class="box-header">
                 <h2 class="box-title"><i class="fa fa-pagelines"></i>회원검색결과</h2>
               </div>
              </div><!-- box box-solid bg-aqua -->
		             
                <div class="container">
                <!-- form start -->
                  <div class="box-body">
                     <form action="${pageContext.request.contextPath}/payment/payment_search_pro" method="get" class="sidebar-form">
			            <div class="input-group">
			              <input type="text" name="sv" class="form-control" placeholder="회원이름을 검색해주세요."/>
			              <span class="input-group-btn">
			                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
			              </span>
			            </div>
			          </form> 
			      
			          <table class="table ">
						<thead>
							<tr>
								<th>코드</th>
								<th>이름</th>
								<th>나이</th>
								<th>연락처</th>
								<th>등급</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty memberlist}">
								<tr>
									<td colspan="4">이름이 일치하는 회원이 존재하지 않습니다.</td>
								</tr>
					 		</c:if>
							 <c:forEach var="m" items="${memberlist}">
								<tr>
									<td><a href="#" class="member_cd">${m.member_cd}</a></td>
									<td>${m.member_nm}</td>
									<td>${m.member_age}</td>
									<td>${m.member_tel}</td>
								<c:if test="${m.member_seat_state == 'Y'}">
									<td>정회원</td>
								</c:if>	
								<c:if test="${m.member_seat_state == 'N'}">
									<td>일반</td>
								</c:if>		
								</tr>
								
						  	</c:forEach>
							
						</tbody>
						</table>
              		</div>
             	</div>
            
		 </div><!-- col-md-12 -->
	</div><!-- row -->
    <!-- JS -->
    <c:import url="../module2/jsscript.jsp" />

	<script>
		function sendChildValue(name){
			opener.setChildValue(name);
			window.close();
		}
		$('.member_cd').click(function(){
			console.log('졸려');
			var code = $(this).text();
			sendChildValue(code);
		});
	</script>
	
	
</body>
</html>