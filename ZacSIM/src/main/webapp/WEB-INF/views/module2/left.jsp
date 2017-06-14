<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left info">
              <c:if test="${!empty sessionScope.branchOwner.branch_nm }">
              <p>${sessionScope.branchOwner.branch_nm} <a href="#"><i class="fa fa-circle text-success"></i> Online</a></p>
              </c:if>
              <c:if test="${!empty sessionScope.branchStaff.branch_nm}">
              <p>${sessionScope.branchStaff.branch_nm} <a href="#"><i class="fa fa-circle text-success"></i> Online</a></p>
              </c:if>
            </div>
          </div> 
          <!-- search form -->
          <!-- <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search..."/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form> -->
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <!-- active -->
          <ul class="sidebar-menu">
            <li class="header">Main Menu</li>
            <li class="treeview" id="dashboard_menu">
              <a href="#">
                <i class="fa fa-dashboard"></i> <span>Dashboard</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li id="dashboard02"><a href="${pageContext.request.contextPath}/dashboard/all_status"><i class="fa fa-circle-o"></i>지점 현황</a></li>
              </ul>
            </li>
            <li class="treeview" id="room_menu">
              <a href="#">
                <i class="fa fa-table"></i> <span>열람실 관리</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li id="room01"><a href="${pageContext.request.contextPath}/room/room_form"><i class="fa fa-circle-o"></i>열람실 등록</a></li>
                <li id="room02" ><a href="${pageContext.request.contextPath}/room/room_main"><i class="fa fa-circle-o"></i>열람석 결제</a></li>
                <li id="room03"><a href="${pageContext.request.contextPath}/room/room_dashboard"><i class="fa fa-circle-o"></i>열람실 현황</a></li>
              </ul>
            </li>
             <li class="treeview" id="member_menu">
              <a href="#">
                <i class="fa fa-edit"></i> <span>회원 관리</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li id="member01"><a href="${pageContext.request.contextPath}/member/member_form"><i class="fa fa-circle-o"></i> 회원 등록</a></li>
                <li id="member02"><a href="${pageContext.request.contextPath}/member/member_list"><i class="fa fa-circle-o"></i> 회원 목록</a></li>
                <li id="member03"><a href="${pageContext.request.contextPath}/member/member_exit"><i class="fa fa-circle-o"></i> 회원 입퇴실</a></li>
                <li id="member04"><a href="${pageContext.request.contextPath}/room/member_period"><i class="fa fa-circle-o"></i> 회원 만료예정</a></li>
              </ul>
            </li>
            <li class="treeview" id="staff_menu">
              <a href="#">
                <i class="fa fa-laptop"></i>
                <span>직원 관리</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li id="staff01"><a href="${pageContext.request.contextPath}/staff/staff_form"><i class="fa fa-circle-o"></i> 직원 등록</a></li>
                <li id="staff02"><a href="${pageContext.request.contextPath}/staff/staff_list"><i class="fa fa-circle-o"></i> 직원 목록</a></li>
              </ul>
            </li>
           

            <li class="treeview" id="account_menu">
              <a href="#">
                <i class="fa fa-credit-card"></i> <span>회계 관리</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu" >
                <li id="account01"><a href="${pageContext.request.contextPath}/account/income"><i class="fa fa-circle-o"></i>결제내역</a></li>
                <li id="expense"><a href="${pageContext.request.contextPath}/expense/expense_list"><i class="fa fa-circle-o"></i>지출내역</a></li>
              </ul>
            </li>

            <li class="header">Sub Menu</li>
            <li id="attendance_menu">
              <a href="${pageContext.request.contextPath}/attendance/attendance_form">
                <i class="fa fa-bell-o"></i> <span>출결번호 관리</span>
              </a>
            </li>
            <li id="charges_menu">
            	<a href="${pageContext.request.contextPath}/charges/charges_form"><i class="fa fa-book"></i> 요금제 설정</a>
            </li>
            <li id="staffboard_menu">
              <a href="${pageContext.request.contextPath}/staffboard/staffboard_list">
                <i class="fa fa-envelope"></i> <span>공지사항</span>
              </a>
            </li>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>