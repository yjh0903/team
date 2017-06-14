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
 <body class="skin-blue">
	<div class="row">
		<div class="col-md-12">
             <!-- Info box -->
             <div class="box box-solid bg-olive">
               <div class="box-header">
                 <h2 class="box-title"><i class="fa fa-pagelines"></i>회원검색</h2>
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
              		</div>
             	</div>
            
		 </div><!-- col-md-12 -->
	</div><!-- row -->
    <!-- JS -->
    <c:import url="../module2/jsscript.jsp" />
	
</body>
</html>