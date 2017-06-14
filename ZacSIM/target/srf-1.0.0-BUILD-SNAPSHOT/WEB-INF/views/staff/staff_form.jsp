<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  	  
  	  <!-- Main content -->
      <section class="content">
      <div class="row">
            <!-- left column -->
            <div class="col-md-12">
              <!-- general form elements -->
              <div class="box box-primary">
                <div class="box-header">
                  <h3 class="box-title">직원 등록</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                <form role="form" action="${pageContext.request.contextPath}/staff/staff_pro" method="post">
                  <div class="box-body">
                    <div class="form-group">
                      <label for="exampleInputstaffid">직원아이디</label>
                      <input type="text" class="form-control" id="staff_id" name="staff_id" placeholder="아이디를 입력해주세요">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">지점 대표코드</label>
                       <SELECT class="form-control" name="branch_owner_cd" id="branch_owner_cd" > 
					     <option value="B0010" selected>&nbsp;</option> 
					     <option value="B0011">B011</option> 
					     <option value="B0016">B016</option> 
					     <option value="B0017">B017</option> 
					     <option value="B0018">B018</option> 
					     <option value="B0019">B019</option> 
					    </SELECT>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputFile">직원 비밀번호</label>
                      <input type="password" class="form-control" id="staff_pw" name="staff_pw" placeholder="비밀번호를 입력해주세요">                
                    </div>
                     <div class="form-group">
                      <label for="exampleInputFile">직원 이름</label>
                      <input type="text" class="form-control" id="staff_name" name="staff_name" placeholder="이름을 입력해주세요">                
                    </div>
                     <div class="form-group">
                      <label for="exampleInputFile">직원 연락처</label>
                      <input type="text" class="form-control" id="staff_tel" name="staff_tel" placeholder="연락처를 입력해주세요">                
                    </div>
                     <div class="form-group">
                      <label for="exampleInputFile">직원 주소</label>
                      <input type="text" class="form-control" id="staff_addr" name="staff_addr" placeholder="주소를 입력해주세요">                
                    </div>
                     <div class="form-group">
                      <label for="exampleInputFile">직원 가입일</label>
                      <input type="date" class="form-control" id="staff_in_date" name="staff_in_date">                
                    </div>
                  </div><!-- /.box-body -->

                  <div class="box-footer">
                    <button type="submit" class="btn btn-primary">글입력</button>
                    <button type="reset" class="btn btn-primary">초기화</button>
                  </div>
                </form>
              </div><!-- /.box -->
	      
			</div>
			</div>
			</section>
			</div>
		</div>
	</body>
</html>