<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../module2/advanced_css.jsp"/>
</head >
<body class="skin-blue">

	<div class="row">
		<div class="col-md-12">
             <!-- Info box -->
             <div class="box box-solid bg-olive">
               <div class="box-header">
                 <h2 class="box-title"><i class="fa fa-search-minus"></i>기간 연장</h2>
    	       </div>
             </div><!-- box box-solid bg-aqua -->
              <div class="col-md-12">
              <!-- small box -->
              <br/><br/><br/><br/>
              <div class="small-box bg-purple">
                <div class="inner">
                  <h2>	기간 만료일 연장처리가</h2>
                  <h2>  정상 처리 되었습니다.</h2>
                </div>
                <div class="icon">
                  <i class="ion ion-ios-cart-outline"></i>
                </div>
              </div>
            </div><!-- ./col -->
   		</div><!-- col-md-12 -->
	</div>



</body>
	<c:import url="../module2/jsscript.jsp" />
	<script>
		opener.document.location.reload();
	</script>
</html>