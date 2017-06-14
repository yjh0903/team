<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
 <head>
	  	<!-- 헤드 -->
	<c:import url="../module2/advanced_css.jsp"/>
	<style>
		    body{
		    	 background-color: #8dc9de;
		    }
		   
	</style>
 </head>
 <body class="skin-blue">
	<div class="row">
		<div class="col-md-12">
             <!-- Info box -->
             <div class="box box-solid bg-olive">
               <div class="box-header">
                 <h2 class="box-title"><i class="fa fa-pagelines"></i>결제</h2>
    	       </div>
             </div><!-- box box-solid bg-aqua -->
              <div class="col-md-12">
              <!-- small box -->
              <br/><br/><br/><br/><br/><br/><br/><br/><br/>
              <div class="small-box bg-blue">
                <div class="inner">
                  <h2>결제가 정상처리되었습니다. </h2>
                  <h3>출결번호 : ${inouting}</h3>
                </div>
                <div class="icon">
                  <i class="ion ion-ios-cart-outline"></i>
                </div>
              </div>
            </div><!-- ./col -->
   		</div><!-- col-md-12 -->
	</div>
	<c:import url="../module2/jsscript.jsp" />
	<script>
		opener.document.location.reload();
	</script>
</body>
</html>

 