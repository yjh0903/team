<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- 헤드 -->
<c:import url="../module2/head.jsp"/>

<style>
.column {
	width: 170px;
	float: left;
	padding-bottom: 100px;
}

.portlet {
	margin: 0 1em 1em 0;
	padding: 0.3em;
	border: 1px solid;
}

.portlet-header {
	background-color: orange;
	padding: 0.2em 0.3em;
	margin-bottom: 0.5em;
	position: relative;
}

.portlet-toggle {
	position: absolute;
	top: 50%;
	right: 0;
	margin-top: -8px;
}

.portlet-content {
	padding: 0.4em;
}

.portlet-placeholder {
	border: 1px dotted black;
	margin: 0 1em 1em 0;
	height: 50px;
}

.ui-state-default {
	border: 1px dotted;
}

#sortable {
	inline: blokc;
}

.space{
	background-color : black;
}
</style>
</head>
<body>
<body class="skin-blue">
    <div class="wrapper">
      <!-- 상단 -->
      <c:import url="../module2/top.jsp"/>
      
      <!-- 왼쪽 -->
 	  <c:import url="../module2/left.jsp" />
	
	<!-- 오른쪽 -->
     <div class="content-wrapper">
	  <section class="content-header">
	    <h1>
	       ZakSim
	      <small>Control panel</small>
	    </h1>
	    <ol class="breadcrumb">
	      <li><a href="${pageContext.request.contextPath}/home/NewFile"><i class="fa fa-dashboard"></i>Home</a></li>
	      <li class="active">열람실현황</li>
	    </ol>
	  </section> 
	  	
	<!-- Main content -->
      <section class="content">
		<div class="row">
            <div class="col-xs-12">
            	<div class="col-xs-9">
            		<c:forEach var="s" items="${seatlist}">
	            		 <div class="column">
							<div class="portlet">
							 	<input type="hidden" class="column_i" id="seat_row" name="seat_row">
								<input type="hidden" class="column_num" id="seat_col" name="seat_col">
								<div class="portlet-header "><input type="hidden" name="seat_cnumber" class="seat_cnum" value="${s.seat_cnumber}">${s.seat_cnumber}</div>
								<div class="portlet-content"><input type="text" value="${s.member_nm}, ${s.seat_row}, ${s.seat_col}" readonly></div>
							</div>
						</div> 
					</c:forEach>
					<%-- 
						<div>
							${s.seat_cnumber}<br/>
							${s.seat_row}<br/>
							${s.seat_col}<br/>
							${s.member_nm}<br/>
						</div> 
					--%>
				</div>
            </div><!-- col-xs-12 -->
        </div><!-- row -->
      </section><!-- content -->
      
      </div><!--content-wrapper  -->
   </div><!-- wrapper -->
	<c:import url="../module2/jsscript.jsp" />
</body>
</html>