<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
 <head>
	<!-- 헤드 -->
	<c:import url="../module2/head.jsp"/>
 </head>
 <body class="skin-blue">
    <div class="row">
      <div class="col-md-6">
         <!-- Info box -->
             <div class="box box-solid bg-orange">
               <div class="box-header">
                 <h2 class="box-title"><i class="fa fa-search-minus"></i>상세정보</h2>
               </div>
              </div><!-- box box-solid bg-aqua -->
           <div class="container">
                <!-- form start -->
                  <div class="box-body">
					<form name="myForm" name="postForm" action="${pageContext.request.contextPath}/member/member_pro" method="post">
						<div class="form-group">
							<input type="hidden" class="form-control" name="branch_owner_cd" value="${detailmember.branch_owner_cd}" readonly>
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">이름</label>
							<input type="text" class="form-control" id="member_nm" name="member_nm" value="${detailmember.member_nm}" readonly>
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">연락처</label>
							<input type="text" class="form-control" id="member_tel" name="member_tel" value="${detailmember.member_tel}" readonly>
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">나이</label>
							<input type="text" class="form-control" id="member_age" name="member_age" value="${detailmember.member_age}" readonly>
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">시작일</label>
							<input type="text" class="form-control" id="member_regi_date" name="member_regi_date" value="${detailmember.member_regi_date}" readonly>
						</div>
						<div class="form-group">
							<label class="control-label" for="inputLarge">만료일</label>
							<input type="text" class="form-control" id="member_end_date" name="member_end_date" value="${detailmember.member_end_date}" readonly>
						</div>
						<a href="${pageContext.request.contextPath}/payment/extension_form?member_nm=${detailmember.member_nm}&seat_cd=${detailmember.seat_cd}"><button type="button" class="btn btn-primary">기간 연장</button></a>
						<a href="${pageContext.request.contextPath}/room/move_form?seat_cd=${detailmember.seat_cd}"><button type="button" class="btn btn-primary">좌석 이동</button></a>
                </form>         
              </div>
            </div>
         </div>
    </div>
 </body>
</html>

 