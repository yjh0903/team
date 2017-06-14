<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>3팀 프로젝트</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />

  <!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/elate/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/elate/css/icomoon.css">
	<!-- Simple Line Icons -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/elate/css/simple-line-icons.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/elate/css/magnific-popup.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/elate/css/bootstrap.css">

	<!-- 
	Default Theme Style 
	You can change the style.css (default color purple) to one of these styles
	
	1. pink.css
	2. blue.css
	3. turquoise.css
	4. orange.css
	5. lightblue.css
	6. brown.css
	7. green.css

	-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/elate/css/style.css">

	<!-- Styleswitcher ( This style is for demo purposes only, you may delete this anytime. ) -->
	<link rel="stylesheet" id="theme-switch" href="css/style.css">
	<!-- End demo purposes only -->


	<style>
	/* For demo purpose only */
	
	/* For Demo Purposes Only ( You can delete this anytime :-) */
	#colour-variations {
		padding: 10px;
		-webkit-transition: 0.5s;
	  	-o-transition: 0.5s;
	  	transition: 0.5s;
		width: 140px;
		position: fixed;
		left: 0;
		top: 100px;
		z-index: 999999;
		background: #fff;
		/*border-radius: 4px;*/
		border-top-right-radius: 4px;
		border-bottom-right-radius: 4px;
		-webkit-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
		-moz-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
		-ms-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
		box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
	}
	#colour-variations.sleep {
		margin-left: -140px;
	}
	#colour-variations h3 {
		text-align: center;;
		font-size: 11px;
		letter-spacing: 2px;
		text-transform: uppercase;
		color: #777;
		margin: 0 0 10px 0;
		padding: 0;;
	}
	#colour-variations ul,
	#colour-variations ul li {
		padding: 0;
		margin: 0;
	}
	#colour-variations li {
		list-style: none;
		display: block;
		margin-bottom: 5px!important;
		float: left;
		width: 100%;
	}
	#colour-variations li a {
		width: 100%;
		position: relative;
		display: block;
		overflow: hidden;
		-webkit-border-radius: 4px;
		-moz-border-radius: 4px;
		-ms-border-radius: 4px;
		border-radius: 4px;
		-webkit-transition: 0.4s;
		-o-transition: 0.4s;
		transition: 0.4s;
	}
	#colour-variations li a:hover {
	  	opacity: .9;
	}
	#colour-variations li a > span {
		width: 33.33%;
		height: 20px;
		float: left;
		display: -moz-inline-stack;
		display: inline-block;
		zoom: 1;
		*display: inline;
	}
	

	.option-toggle {
		position: absolute;
		right: 0;
		top: 0;
		margin-top: 5px;
		margin-right: -30px;
		width: 30px;
		height: 30px;
		background: #f64662;
		text-align: center;
		border-top-right-radius: 4px;
		border-bottom-right-radius: 4px;
		color: #fff;
		cursor: pointer;
		-webkit-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
		-moz-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
		-ms-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
		box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
	}
	.option-toggle i {
		top: 2px;
		position: relative;
	}
	.option-toggle:hover, .option-toggle:focus, .option-toggle:active {
		color:  #fff;
		text-decoration: none;
		outline: none;
	}
	
	#fh5co-home, #fh5co-intro{
		height: 350px;
	}
	
	#team{
	color : white;
	}
	</style>
	<!-- End demo purposes only -->


	<!-- Modernizr JS -->
	<script src="${pageContext.request.contextPath}/resources/elate/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
	<header role="banner" id="fh5co-header">
			<div class="container">
				<!-- <div class="row"> -->
			    <nav class="navbar navbar-default">
		        <div class="navbar-header">
		        	<!-- Mobile Toggle Menu Button -->
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
		         <a class="navbar-brand" href="#">Team ProJect</a>
		        </div>
		        
			    </nav>
			  <!-- </div> -->
		  </div>
	</header>

	<section id="fh5co-home" data-section="home" style="background-image: url(images/full_image_2.jpg);" data-stellar-background-ratio="0.5">
		<div class="gradient"></div>
		<div class="container">
			<div class="text-wrap">
				<div class="text-inner">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="slant"></div>
	</section>

	<section id="fh5co-intro">
		<div class="container">
			<div class="row row-bottom-padded-lg">
				<div class="fh5co-block to-animate">
					<div class="overlay-darker"></div>
					<div class="overlay"></div>
					<div class="fh5co-text">
						<div><img alt="작심 화면" width="300px" src="${pageContext.request.contextPath}/resources/elate/images/K-009.png"> </div>
						
						<p>독서실 프랜차이즈 관리시스템</p>
						<p><a href="${pageContext.request.contextPath}/home" class="btn btn-primary">Click</a></p>
					</div>
				</div>
				<div class="fh5co-block to-animate" >
					<div class="overlay-darker"></div>
					<div class="overlay"></div>
					<div class="fh5co-text">
						<div><img alt="중앙관리자" width="300px" src="${pageContext.request.contextPath}/resources/elate/images/ZakSIM_main.png"> </div>
						
						<p>본사</p>
						<p><a href="${pageContext.request.contextPath}/head" class="btn btn-primary">Click</a></p>
					</div>
				</div> 
				<div class="fh5co-block to-animate">
					<div class="overlay-darker"></div>
					<div class="overlay"></div>
					<div class="fh5co-text">
						<div><img alt="지점관리자" width="300px" src="${pageContext.request.contextPath}/resources/elate/images/K-011.png"> </div>
						
						<p>지점</p>
						<p><a href="${pageContext.request.contextPath}/login/loginFrom" class="btn btn-primary">Click</a></p>
					</div>
				</div> 
			</div>
		</div>
	</section>

	<section id="fh5co-work" data-section="work">
		<div class="container">
			<!-- <div class="row">
				<div class="col-md-12 section-heading text-center">
					<h3 class="to-animate" id="team">팀원 개인 포트폴리오</h3>
					
				</div>
			</div> -->
			<h3 id="team">팀원 개인포트폴리오</h3>
			<div class="row row-bottom-padded-sm">
				<div class="col-md-3 col-sm-6 col-xxs-12">
					<a href="images/work_1.jpg" class="fh5co-project-item image-popup to-animate">
						<img src="${pageContext.request.contextPath}/resources/elate/images/K-025.png" alt="Image" class="img-responsive">
						<div class="fh5co-text">
						<h2>박석민</h2>
						
						</div>
					</a>
				</div>
				<div class="col-md-3 col-sm-6 col-xxs-12">
					<a href="http://yjh0903.cafe24.com" class="fh5co-project-item to-animate">
						<img src="${pageContext.request.contextPath}/resources/elate/images/K-025.png" alt="Image" class="img-responsive">
						<div class="fh5co-text">
						<h2>양지훈</h2>
						
						</div>
					</a>
				</div>

				<div class="clearfix visible-sm-block"></div>

				<div class="col-md-3 col-sm-6 col-xxs-12">
					<a href="http://dprtm77.cafe24.com" class="fh5co-project-item to-animate">
						<img src="${pageContext.request.contextPath}/resources/elate/images/K-036.png" height="150px" alt="Image" class="img-responsive">
						<div class="fh5co-text">
						<h2>이승욱</h2>
						
						</div>
					</a>
				</div>
				<div class="col-md-3 col-sm-6 col-xxs-12">
					<a href="http://mandragora.cafe24.com" class="fh5co-project-item to-animate">
						<img src="${pageContext.request.contextPath}/resources/elate/images/K-029.png" height="150px" alt="Image" class="img-responsive">
						<div class="fh5co-text">
						<h2>이주녕</h2>
						
						</div>
					</a>
				</div>
				
				<div class="clearfix visible-sm-block"></div>

		</div>
		</div>
	</section>

		<section id="fh5co-services" data-section="services">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-left">
					<h2 class=" left-border to-animate">프로젝트 문서</h2>
					<div class="row">
						<div class="col-md-10 subtext to-animate">
							<h3>1.프로젝트 기본정보</h3>
							<p>  본 프로젝트는 Chrome에 최적화되어 있습니다. (최적 해상도는 가로 1600)</p>
							<h3> *프로젝트 명 : 독서실 프랜차이즈 관리시스템</h3>
							
							<table class="table">
								<tr>
									<td>총 기간</td>
									<td>■2017년 03월 23일 - 2016년 06월 05일</td>
									<td>----------------------------------------------</td>
								</tr>
								<tr>
									<td rowspan="6">개발일정</td>
									<td>■2017년 03월 23일 ~ 2017년 04월 08일</td>
									<td>프로젝트 주제 선정 및 사전조사</td>
								</tr>
								<tr>
									<td>■2017년 04월 09일 ~ 2017년 04월 21일</td>
									<td> 프로젝트 설계 (기능정의, 테이블 구상) <br/>
 										      설계자료 취합, 수정 및 보완 <br/>
 										   ERD 작업 및 메서드, 패키지 정리
									</td>
								</tr>
								<tr>
									<td>■2017년 04월 22일 ~ 2017년 04월 23일</td>
									<td>  서버 설정 <br/>
 										  개발환경 설정 <br/>
 										 Hosting 설정
									</td>
								</tr>
								<tr>
									<td>■2017년 04월 24일 ~ 2017년 05월 26일</td>
									<td>  기능 구현(개인 분담 프로그래밍)</td>
								</tr>
								<tr>
									<td>■2017년 05월 27일 ~ 2017년 06월 02일</td>
									<td> 테스트, 오류 수정 및 보완<br/>
 										  미완성 기능 구현 									
									</td>
								</tr>
								<tr>
									<td>■2017년 06월 3일 ~ 2017년 06월 05일</td>
									<td> 완료보고서 작성</td>
								</tr>
							</table>
							<hr/>
							<h3>*개발 목적 :</h3>
							<p>독서실 각 지점의 주요 업무에 편의를 제공. 회원 정보 및 회계 정보를 통해 지점의 데이터를 취합하여 단일 지점의 현황과 전체 지점의 현황을 테이블 및 각종 차트를 통해 확인 할 수 있도록 하며, 취합된 데이터를 바탕으로 주변 상권과의 연계를 통해 보다 효과적인 독서실 운영을 꾀할 수 있도록 돕는다. </p>
							<h3>*개발 방향 :</h3>
							<li>독서실 관리 시스템을 PC와 모바일 환경에서도 활용이 가능하도록 제공한다.</li>
							<li>단순 회원 관리 뿐 아니라 직원 관리, 회계 관리가 가능하도록 한다.</li>
							<li>회원으로부터 수집된 데이터를 바탕으로 2차 정보를 생산, 지점 및 본사에 제공한다.</li>
							<li>webhosting 서비스로 개발 이후 에러와 오류에 대한 유지보수를 경험한다.</li>
							<li>프로젝트에 참여한 각 팀원들 개발 역량의 상향평준화 꾀한다.</li>
							<br/>
							<h3>*개발 환경 :</h3>
							<table class="table">
								<tr>
									<td>OS</td>
									<td>Window7</td>
								</tr>
								<tr>
									<td>웹브라우저</td>
									<td>Chrome</td>
								</tr>
								<tr>
									<td>WAS</td>
									<td>Apache Tomcat 8.0.35</td>
								</tr>
								<tr>
									<td rowspan="6">언어</td>
									<td>java1.8</td>
								</tr>
								<tr>
									<td>javascript</td>
								</tr>
								<tr>
									<td>jquery</td>
								</tr>
								<tr>
									<td>ajax</td>
								</tr>
								<tr>
									<td>jsp 2.3</td>
								</tr>
								<tr>
									<td>html5</td>
								</tr>
								<tr>
									<td>프레임워크</td>
									<td>spring framwork 4.1.1, maven, mybatis 3.4.1, bootstrap </td>
								</tr>
								<tr>
									<td>DB</td>
									<td>MySQL 5.1.39</td>
								</tr>
								<tr>
									<td>툴</td>
									<td>spring tool suite, HeidiSQL, eXerd, git</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<h3>2.업무분담(담당 업무)</h3>
			<div class="row">
				<div class="col-md-6 col-sm-6 fh5co-service to-animate">
					<i class="icon to-animate-2 icon-anchor"></i>
					<h3>이주녕</h3>
					<table class="table">
						<tr>
							<td>팀장</td>
							<td>회의 진행, 일정 관리, 업무 조율</td>
						</tr>
						<tr>
							<td>열람실 - 관리</td>
							<td>열람실관리 기능 담당 / 열람실&amp;열람석 등록, 배치도 등록 및 상세보기, 열람석 자리이동</td>
						</tr>
						<tr>
							<td>결제 - 관리</td>
							<td>결제 관리 기능 담당 / 열람석 결제처리, 열람석 기간연장결제처리, 결제 취소</td>
						</tr>
						<tr>
							<td>출입 - 관리</td>
							<td>출입 관리 기능 담당 / 입퇴실 입력 및 리스트</td>
						</tr>
						<tr>
							<td>Hosting</td>
							<td>프로젝트 호스팅 계정관리 및 URL 연결 작업 및 프로젝트 배포 업무 수행</td>
						</tr>
					</table>
				</div>
				
				<div class="col-md-6 col-sm-6 fh5co-service to-animate">
					<i class="icon to-animate-2 icon-layers2"></i>
					<h3>이승욱</h3>
					<table class="table">
						<tr>
							<td>통계-관리</td>
							<td>통계 관리 담당/ 각 지점별 현황 그래프 등록, 리스트 </td>
						</tr>
						<tr>
							<td>문서-관리</td>
							<td>네이밍 규칙 , 디렉토리 구조, 패키지 구조, 개발/서비스 환경</td>
						</tr>
						<tr>
							<td>회계-관리</td>
							<td>회계 관리 담당/ 결제 내역 리스트, 검색</td>
						</tr>
						<tr>
							<td>본사-관리</td>
							<td>본사 관리 담당/ 사업자 관리, 등록, 검색, 리스트 수정 및 삭제 처리 </td>
						</tr>
						<tr>
							<td>--</td>
							<td>--</td>
						</tr>
						
					</table>
				</div>

				<div class="col-md-6 col-sm-6 fh5co-service to-animate">
					<i class="icon to-animate-2 icon-monitor"></i>
					<h3>박석민</h3>
					<table class="table">
						<tr>
							<td>회원 - 관리</td>
							<td>회원관리 기능 담당 / 입력, 리스트, 상세보기, 검색 및  수정,삭제 처리</td>
						</tr>
						<tr>
							<td>문서 - 관리</td>
							<td>업무담당, 요구사항 정의서 작성 및 관리</td>
						</tr>
					</table>
				</div>
				
				<div class="col-md-6 col-sm-6 fh5co-service to-animate">
					<i class="icon to-animate-2 icon-video2"></i>
					<h3>양지훈</h3>
					<table class="table">
						<tr>
							<td>DB/ERD</td>
							<td>DBMS(mySql) 관리 및 table 설계, ERD 작성</td>
						</tr>
						<tr>
							<td width="46px">문서-관리</td>
							<td>설계사양서  및 테이블 구조</td>
						</tr>
						<tr>
							<td>직원-관리</td>
							<td>직원 관리 담당 / 입력, 리스트, 상세보기 및 수정 삭제 처리</td>
						</tr>
						<tr>
							<td>공지-관리</td>
							<td>공지 관리 담당 / 입력, 리스트, 상세보기 및 수정 삭제 처리</td>
						</tr>
						<tr>
							<td>지출-관리</td>
							<td>지출 관리 담당/ 지출 내역 리스트, 기간 검색</td>
						</tr>
						<tr>
							<td>본사-관리</td>
							<td>본사 관리 담당 / 지점현황 입력, 리스트, 다음 지도 API 활용하여 지점위치 표시</td>
						</tr>
					</table>
				</div>
				
				
			</div>
		</div>
	</section>



	<section id="fh5co-testimonials" data-section="testimonials">
		<div class="container">
			<div class="row">
			
				<div class="col-lg-12 section-heading text-center">
					<h2 class="to-animate">ERD</h2>
				</div>
			</div>
			<img alt="ERD" width="120%" src="${pageContext.request.contextPath}/resources/elate/images/erd2.png">
		</div>
	</section>
		
	
	<footer id="footer" role="contentinfo">
		<a href="#" class="gotop js-gotop"><i class="icon-arrow-up2"></i></a>
		<div class="container">
			<div class="">
				<div class="col-md-12 text-center">
					<p>&copy; Elate Free HTML5. All Rights Reserved. <br>Created by <a href="http://freehtml5.co/" target="_blank">FREEHTML5.co</a> Images: <a href="http://pexels.com/" target="_blank">Pexels</a>, <a href="http://plmd.me/" target="_blank">plmd.me</a></p>
					
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<ul class="social social-circle">
						<li><a href="#"><i class="icon-twitter"></i></a></li>
						<li><a href="#"><i class="icon-facebook"></i></a></li>
						<li><a href="#"><i class="icon-youtube"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/resources/elate/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath}/resources/elate/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/resources/elate/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath}/resources/elate/js/jquery.waypoints.min.js"></script>
	<!-- Stellar Parallax -->
	<script src="${pageContext.request.contextPath}/resources/elate/js/jquery.stellar.min.js"></script>
	<!-- Counter -->
	<script src="${pageContext.request.contextPath}/resources/elate/js/jquery.countTo.js"></script>
	<!-- Magnific Popup -->
	<script src="${pageContext.request.contextPath}/resources/elate/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/elate/js/magnific-popup-options.js"></script>
	<!-- Google Map -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
	<script src="${pageContext.request.contextPath}/resources/elate/js/google_map.js"></script>

	<!-- For demo purposes only styleswitcher ( You may delete this anytime ) -->
	<script src="${pageContext.request.contextPath}/resources/elate/js/jquery.style.switcher.js"></script>
	<script>
		$(function(){
			$('#colour-variations ul').styleSwitcher({
				defaultThemeId: 'theme-switch',
				hasPreview: false,
				cookie: {
		          	expires: 30,
		          	isManagingLoad: true
		      	}
			});	
			$('.option-toggle').click(function() {
				$('#colour-variations').toggleClass('sleep');
			});
		});
	</script>
	<!-- End demo purposes only -->

	<!-- Main JS (Do not remove) -->
	<script src="${pageContext.request.contextPath}/resources/elate/js/main.js"></script>

	</body>
</html>

