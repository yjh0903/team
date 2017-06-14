<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="col-md-3 col-lg-2 sidebar-offcanvas" id="sidebar"
		role="navigation">
		<ul class="nav flex-column pl-1">
			<li class="nav-item"><a class="nav-link" href="#submenu1"
				data-toggle="collapse" data-target="#submenu1">DashBoard ▾</a>
				<ul class="list-unstyled flex-column pl-3 collapse" id="submenu1"
					aria-expanded="false">
					<li class="nav-item"><a class="nav-link" href="">매출현황</a></li>
					<li class="nav-item"><a class="nav-link" 
						href="${pageContext.request.contextPath}/dashboard/member_status">회원 현황</a></li>
				</ul>
			</li>
			<li class="nav-item"><a class="nav-link" href="#submenu2"
				data-toggle="collapse" data-target="#submenu2">열람실 ▾</a>
				<ul class="list-unstyled flex-column pl-3 collapse" id="submenu2"
					aria-expanded="false">
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/room/room_form">열람실등록</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/room/room_main">열람실현황</a></li>
				</ul>
			</li>
			<li class="nav-item"><a class="nav-link" href="#submenu3"
				data-toggle="collapse" data-target="#submenu3">회원관리 ▾</a>
				<ul class="list-unstyled flex-column pl-3 collapse" id="submenu3"
					aria-expanded="false">
					<li class="nav-item"><a class="nav-link" 
						href="${pageContext.request.contextPath}/member/member_form">회원등록</a></li>
					<li class="nav-item"><a class="nav-link" 
						href="${pageContext.request.contextPath}/member/member_list">회원목록</a></li>
				</ul>
			</li>
			<li class="nav-item"><a class="nav-link" href="#submenu4"
				data-toggle="collapse" data-target="#submenu4">직원관리 ▾</a>
				<ul class="list-unstyled flex-column pl-3 collapse" id="submenu4"
					aria-expanded="false">
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/staff/staff_form">직원등록</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/staff/staff_list">직원목록</a></li>
				</ul>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">요금제 설정</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/staffboard/staffBoard_list">공지사항</a></li>
		</ul>
</div>