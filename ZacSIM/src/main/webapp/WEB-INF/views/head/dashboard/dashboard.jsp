<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/head/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/head/css/templatemo-style.css" rel="stylesheet">
</head>
<body>
	<!-- Left column -->
	<c:import url="../module/left.jsp"/>
	<!-- top column -->	
	<c:import url="../module/top.jsp"/>
		
			<!-- Main content -->
			<div class="templatemo-content-container row" style="min-height: 700px;">
				<div class="templatemo-content-widget white-bg">
					<h2 class="margin-bottom-10">월별 매출현황 <small>(${today})</small></h2>
					<hr>
					<!-- main start -->
					
					<div id="container" style="width: 80%;">
				      <canvas id="canvas2"></canvas>
				      <div>
				      <c:forEach var="b" items="${branchlist}">
				      	<button class="branch_btn" value="${b.branch_owner_cd}">${b.branch_nm}</button>
				      </c:forEach>
				     </div>
				      <div>
				      	<input type="hidden" id="january" />
				      	<input type="hidden" id="february" />
				      	<input type="hidden" id="march" />
				      	<input type="hidden" id="april" />
				      	<input type="hidden" id="may" />
				      	<input type="hidden" id="june" />
				      	<input type="hidden" id="july" />
				      	<input type="hidden" id="august" />
				      	<input type="hidden" id="september"/>
				      	<input type="hidden" id="october" />
				      	<input type="hidden" id="november" />
				      	<input type="hidden" id="december" />
				      	
				      	<input type="hidden" id="mjanuary" />
				      	<input type="hidden" id="mfebruary" />
				      	<input type="hidden" id="mmarch" />
				      	<input type="hidden" id="mapril" />
				      	<input type="hidden" id="mmay" />
				      	<input type="hidden" id="mjune" />
				      	<input type="hidden" id="mjuly" />
				      	<input type="hidden" id="maugust" />
				      	<input type="hidden" id="mseptember"/>
				      	<input type="hidden" id="moctober" />
				      	<input type="hidden" id="mnovember" />
				      	<input type="hidden" id="mdecember" />
				      	
				      </div>
				   	</div>
					
					<!-- main end -->
				</div>
				
				<c:import url="../module/footer.jsp"/>
			</div>

	<!-- JS -->
	<!-- jQuery -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/head/js/jquery-1.11.2.min.js"></script>
	<!-- http://markusslima.github.io/bootstrap-filestyle/ -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/head/js/bootstrap-filestyle.min.js"></script>
	<!-- Templatemo Script -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/head/js/templatemo-script.js"></script>
	<!-- ChartJS 상위버젼 -->
    <script src="${pageContext.request.contextPath}/resources/chartjs/Chart.bundle.js"></script>
    <script src="${pageContext.request.contextPath}/resources/chartjs/utils.js"></script>
    
    <script>
       // 가로 바 차트
       
       
 		function income(january
                , february
                , march
                , april
                , may
                , june
                , july
                , august
                , september
                , october
                , november
                , december){
    	   
    	   var obj = {};
    	   obj.january = january;
    	   obj.february = february;
    	   obj.march = march;
    	   obj.april = april;
    	   obj.may = may;
    	   obj.june = june;
    	   obj.july = july;
    	   obj.august = august;
    	   obj.september = september;
    	   obj.october = october;
    	   obj.november = november;
    	   obj.december = december;
    	   
    	   console.log('obj :' + obj.january);
    	   
    	   return obj;
       } 
       
        
       var color = Chart.helpers.color;
       
       //차트 
       function chart(branch_nm) {
            var ctx = document.getElementById("canvas2").getContext("2d");
            window.myHorizontalBar = new Chart(ctx, {
                type: 'horizontalBar',
                data: {
                    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                    datasets: [{
                        label: '수입',
                        backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
                        borderColor: window.chartColors.red,
                        borderWidth: 1,
                        data: [january
                            , february
                            , march
                            , april
                            , may
                            , june
                            , july
                            , august
                            , september
                            , october
                            , november
                            , december
                        ]
                    }, {
                        label: '지출',
                        backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
                        borderColor: window.chartColors.blue,
                        data: [mjanuary
                            , mfebruary
                            , mmarch
                            , mapril
                            , mmay
                            , mjune
                            , mjuly
                            , maugust
                            , mseptember
                            , moctober
                            , mnovember
                            , mdecember
                        ]     
                    }]

                }	,
                options: {
                    // Elements options apply to all of the options unless overridden in a dataset
                    // In this case, we are setting the border of each horizontal bar to be 2px wide
                    elements: {
                        rectangle: {
                            borderWidth: 2,
                        }
                    },
                    responsive: true,
                    legend: {
                        position: 'right',
                    },
                    title: {
                        display: true,
                        text: branch_nm + ' 월별 매출 현황'
                    }
                }
            });

        };
		
        //지점별 수입 리스트
    	function total_incom(branch_owner_cd){
    		var params = {"branch_owner_cd" : branch_owner_cd, "account_type" : "수입"};
    		var result = '';
    		$.ajax({
    			url:'${pageContext.request.contextPath}/head/branchTotal',
    			type:'POST',
    			data:params,
    			success:function(data){
    				console.log('data.january' + data.january);
    				console.log('data.june ' + data.june);
    				$('#january').val(data.january);
    				$('#february').val(data.february);
    				$('#march').val(data.march);
    				$('#april').val(data.april);
    				$('#may').val(data.may);
    				$('#june').val(data.june);
    				$('#july').val(data.july);
    				$('#august').val(data.august);
    				$('#september').val(data.september);
    				$('#october').val(data.october);
    				$('#november').val(data.november);
    				$('#december').val(data.december);
    				
    				january = $('#january').val();
    	        	february = $('#february').val();
    	        	march = $('#march').val();
    	        	april = $('#april').val();
    	        	may = $('#may').val();
    	        	june = $('#june').val();
    	        	july = $('#july').val();
    	        	august = $('#august').val();
    	        	september = $('#september').val();
    	        	october = $('#october').val();
    	        	november = $('#november').val();
    	        	december = $('#december').val();
    	        	
    	        	result = income(january, february, march, april, may, june, july, august, september, october, november, december);
					console.log(result.january + result.february);
    	        	
    	        	
    			},
    			error:function(XHR, textStatus, error){
    				alert('실패 ' + error);
    			}
    		});
    		return result;
    		
    	}
    	
    	//지점별 지출 리스트
    	function total_expense(branch_owner_cd){
    		var params = {"branch_owner_cd" : branch_owner_cd, "account_type" : "지출"};
    		$.ajax({
    			url:'${pageContext.request.contextPath}/head/branchTotal',
    			type:'POST',
    			data:params,
    			success:function(data){
    				console.log('data.january' + data.january);
    				console.log('data.june ' + data.june);
    				$('#mjanuary').val(data.january);
    				$('#mfebruary').val(data.february);
    				$('#mmarch').val(data.march);
    				$('#mapril').val(data.april);
    				$('#mmay').val(data.may);
    				$('#mjune').val(data.june);
    				$('#mjuly').val(data.july);
    				$('#maugust').val(data.august);
    				$('#mseptember').val(data.september);
    				$('#moctober').val(data.october);
    				$('#mnovember').val(data.november);
    				$('#mdecember').val(data.december);
    				
    				mjanuary = '-'+$('#mjanuary').val();
    	        	mfebruary = '-'+$('#mfebruary').val();
    	        	mmarch = '-'+$('#mmarch').val();
    	        	mapril = '-'+$('#mapril').val();
    	        	mmay = '-'+$('#mmay').val();
    	        	mjune = '-'+$('#mjune').val();
    	        	mjuly = '-'+$('#mjuly').val();
    	        	maugust = '-'+$('#maugust').val();
    	        	mseptember = '-'+$('#mseptember').val();
    	        	moctober = '-'+$('#moctober').val();
    	        	mnovember = '-'+$('#mnovember').val();
    	        	mdecember = '-'+$('#mdecember').val();

    			},
    			error:function(XHR, textStatus, error){
    				alert('실패 ' + error);
    			}
    		});
    	}
			
    	//차트 초기화
		$(function(){
			chart('');
		});

		//지점 버튼 클릭시 
		$('.branch_btn').click(function(){
			
			var branch_cd = $(this).val(); //지점 코드
			var branch_nm = $(this).text(); //지점 이름
			var test = total_incom(branch_cd);
			console.log('테스트 :' + test.january);
			
			total_expense(branch_cd);
			chart(branch_nm);
		});		
    </script>
    
</body>
</html>
					