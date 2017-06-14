<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <head>
    <!-- 헤드 -->
	<c:import url="../module2/head.jsp"/>
	<!-- JS -->
	<c:import url="../module2/jsscript.jsp" />
  
<style>
.container{
	float : left;
}

.column {
	width: 170px;
	float: left;
	padding-bottom: 100px;
}

.ui-widget-content{
	border: 1px solid;
}

.portlet {
	margin: 0 1em 1em 0;
	padding: 0.3em;
}

.portlet-header {
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
</style>
<style>
* {
	box-sizing: border-box;
}

.menu {
	width: 75%;
	float: left;
	padding: 15px;
}
</style>
<style>
.flex-container {
	display: -webkit-flex;
	display: flex;
	-webkit-flex-flow: row wrap;
	flex-flow: row wrap;
	text-align: center;
}

.flex-container>* {
	padding: 15px;
	-webkit-flex: 1 100%;
	flex: 1 100%;
}

.article {
	text-align: left;
}

header {
	background: black;
	color: white;
}

footer {
	background: #aaa;
	color: white;
}
ecoration: none;
}



@media all and (min-width: 768px) {
	.nav {
		text-align: left;
		-webkit-flex: 1 auto;
		flex: 1 auto;
		-webkit-order: 1;
		order: 1;
	}
	.article {
		-webkit-flex: 5 0px;
		flex: 5 0px;
		-webkit-order: 2;
		order: 2;
	}
	footer {
		-webkit-order: 3;
		order: 3;
	}
}
</style>

<style>
#draggable {
	width: 60px;
	height: 60px;
	padding: 0.1em;
	float: left;
	margin: 0px 0px 0px 0;
}
</style>

<script type="text/javascript">
$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').focus()
})
</script>

<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});
</script>

</head>
<body class="skin-blue">
    <div class="wrapper">
    <!-- 상단 -->
      <c:import url="../module2/top.jsp"/>
      
      <!-- 왼쪽 -->
 	  <c:import url="../module2/left.jsp" />
		
	  <!-- 오른쪽 -->
      <c:import url="../module2/right.jsp"/>
  	  
  	  <!-- Main content -->
      <section class="content">
	<!-- main -->
	  <div class="col-md-9 col-lg-10 main" id="wrap">		
			<button type="button" class="btn btn-success btn-lg">전체화면</button>
			<c:forEach var="r" items="${roomlist}">
				<button type="button" class="btn btn-success btn-lg">열람실 ${r.room_nm}</button>
			</c:forEach>
			<div class="container text-left con">
			<hr>
			 <h3>열람실 전체 화면</h3>
				<div class="row">			
					<br>
					<div class="col-sm-6">					
						<div class="menu">
							<h5>201</h5>
							<div class="column1">
								<%@include file="modalinclude.jsp"%>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>2</h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>3</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>4</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>5</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>6</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>7</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>8</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>9</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>11</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>12</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>13</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>14</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>15</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>16</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>17</h6>
									<h6></h6>
								</div>
							</div>
						</div>
					</div>
					<br>

					<div class="col-sm-6">
						<div class="menu">
							<h5>202</h5>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>18</h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>19</h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>20</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>21</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>22</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>23</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>24</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>25</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>26</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>27</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>28</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>29</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>30</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>31</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>32</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>33</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>34</h6>
									<h6></h6>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-6">
						<div class="menu">
							<h5>203</h5>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>35</h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>36</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>37</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>38</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>39</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>40</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>41</h6>
									<h6></h6>
								</div>
							</div>
						</div>
					</div>
					<br>

					<div class="col-sm-6">
						<div class="menu">
							<h5>204</h5>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>42</h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>43</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>44</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>45</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>46</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>47</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>48</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>49</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>50</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>51</h6>
									<h6></h6>
								</div>
							</div>
							<div class="column1">
								<div id="draggable" class="ui-widget-content">
									<h6>53</h6>
									<h6></h6>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>
	</section>
  </div>
</body>
</html>
