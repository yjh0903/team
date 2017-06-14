<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- head -->
	<c:import url="../module/head.jsp" />
</head>
<body>

<!-- top -->
	<c:import url = "../module/top.jsp" />
	
	<!-- left -->
	<div class="container-fluid" id="main">
		<div class="row row-offcanvas row-offcanvas-left">
			<c:import url = "../module/left.jsp" />
	
	<!-- main -->
			<div class="col-md-9 col-lg-10 main" id="wrap">
<div class="container">
    <h1>STAFF VIEW(팀프로젝트)</h1>
     <table class="table">
         <tbody>
             <tr>
                <td>staff_id :</td>
                <td>${staff.staff_id}</td>
               </tr>
            <tr>
                   <td>branch_owner_cd :</td>
                   <td>${staff.branch_owner_cd}</td>
            </tr>
            <tr>
                   <td>staff_name :</td>
                   <td>${staff.staff_name}</td>
            </tr>
            <tr>
                   <td>staff_tel :</td>
                   <td>${staff.staff_tel}</td>
            </tr>
            <tr>
                   <td>staff_addr :</td>
                   <td>${staff.staff_addr}</td>
            </tr>
              <tr>
                   <td>staff_in_date :</td>
                   <td>${staff.staff_in_date}</td>
            </tr>
        </tbody>
    </table>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/staff/staff_modify?staff_id=${staff.staff_id}">수정</a>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/staff/staff_delete?staff_id=${staff.staff_id}">삭제</a>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/staff/staff_list">글목록</a>
</div>
</div>
</div>
</div>

<!--foot-->
	<c:import url="../module/foot.jsp" />
</body>
</html>


