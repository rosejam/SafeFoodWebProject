<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel=icon href=/favicon.ico>
<link href=resources/css/app.25649080.css rel=preload as=style>
<link href=resources/js/app.5c658461.js rel=preload as=script>
<link href=resources/js/chunk-vendors.6240f7ba.js rel=preload as=script>
<link href=resources/css/app.25649080.css rel=stylesheet>

<style type="text/css">
#first_image {
	width: 180px;
	height: 180px;
	float: left;
}
</style>
</head>
<body>

	<!-- Navbar (sit on top) -->
	<div class="w3-top">
		<div class="w3-bar w3-white w3-wide w3-padding w3-card">
			<a href="#home" class="w3-bar-item w3-button"><b>Safe</b> Foods</a>
			<!-- Float links to the right. Hide them on small screens -->
			<div class="w3-right w3-hide-small">
				<a href="list.food" class="w3-bar-item w3-button">Main</a> <a
					href="listBoard.do" class="w3-bar-item w3-button">Notice</a>
				<c:if test="${not empty id }">
					<a href="myfood.food" class="w3-bar-item w3-button">Myfood</a>
				</c:if>
				<c:if test="${not empty id }">
					<a href='' class="w3-bar-item w3-button">Welcome, ${id }!!!</a>
					<a href='logout.food'><button class="w3-bar-item w3-button">Logout</button></a>
					<a href='mypage.food'><img id='user'
						src='resources/images/user.PNG' class="w3-bar-item w3-button"
						size=2></a>
				</c:if>

				<c:if test="${empty id }">
					<a href='safefood/login.food' class="w3-bar-item w3-button">Login</a>
					<a href=insert.food class="w3-bar-item w3-button">Sign in</a>
				</c:if>
			</div>
		</div>
	</div>

	<!-- Header -->
	<header class="w3-display-container w3-content w3-wide"
		style="max-width: 1500px;" id="home">
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br>
		<div class="w3-display-middle w3-margin-top w3-center">
			<h1 class="w3-xxlarge w3-text-white">
				<span class="w3-padding w3-black w3-opacity-min"><b>myfood</b></span>
			</h1>
		</div>
	</header>

	<!-- Page content -->
	<div class="w3-content w3-padding" style="max-width: 1564px">
		<div class="contents">
			<center>

				</table>
				<br></br>
				<div>
					<br> <br>

					<div class="container">

						<div class="contents">
							<table>
								<c:forEach items="${list }" var="c">
									<tr bgcolor=pink>

										<td align=center bgcolor=white><a
											href="detail.food?code=${c.code }&my=true"><img
												src="resources/${c.img }" id="first_image" /></a>
										<td align=center bgcolor=white><font color="black"
											size="10">${c.code }</font></td>
										<td align=center bgcolor=white><font color="black"
											size="5"> <a
												href="detail.food?code=${c.code }&my=true"><font
													color="black" size="5">${c.name }</a></font></font></td>
										<td align=center bgcolor=white><font color="black"
											size="5">1일 칼로리 양: ${c.supportpereat }</font></td>

										<td align=center bgcolor=white><font color="black"
											size="5">칼로리 : ${c.calory }</font></td>

										<td align=center bgcolor=white><font color="black"
											size="5">탄수화물 : ${c.carbo }</font></td>
									</tr>
								</c:forEach>
							</table>
							<hr>
							<!--  그래프 시작  -->
							
							<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
							<script type="text/javascript">
								google.charts.load('current', {
									'packages' : [ 'corechart' ]
								});
								google.charts.setOnLoadCallback(drawChart);

									function drawChart() {
										var data = google.visualization.arrayToDataTable([
												[ 'Task', 'Hours per Day' ], [ '탄수화물', ${nutrient.carbo } ], [ '단백질', ${nutrient.protein } ], [ '지방', ${nutrient.fat } ], [ '당류', ${nutrient.sugar } ],
												[ '나트륨', ${nutrient.natrium } ],
												[ '콜레스테롤', ${nutrient.chole } ], [ '포화지방산', ${nutrient.fattyacid } ] ,[ '트렌스지방', ${nutrient.transfat } ] ]);
										var options = {
											title : '영양정보'
										};
										var chart = new google.visualization.PieChart(document
												.getElementById('piechart'));
										chart.draw(data, options);
									}
</script>
							
							
													<div class="container">
								<div class="row">
									<div class="col-xs-12 col-sm-9 col-md-9">
										<div id="piechart" style="width: 700px; height: 700px;"></div>
									</div>
								</div>
							</div>
													
							
							
							
							
							
							
							
							
							
								<!--  그래프 끝 -->
							<c:set var="tmp" value="${mycal *200/(3.5* weight)}" />
							<h1 style="color: magenta">총섭취칼로리 = ${mycal } kcal</h1>
							<h3>
								가만히 숨쉬기(MET 1) :
								<fmt:formatNumber value="${tmp/60 - (tmp/60)%1 }" pattern="0" />
								시간
								<fmt:formatNumber value="${tmp%60 }" pattern="0" />
								분
							</h3>
							<h3>
								가벼운 운동(MET 4) :
								<fmt:formatNumber value="${tmp/(4*60)-(tmp/(4*60))%1 }"
									pattern="0" />
								시간
								<fmt:formatNumber value="${(tmp/4)%60 }" pattern="0" />
								분
							</h3>
							<h3>
								격렬한 운동(MET 10) : 
								<fmt:formatNumber value="${tmp/(10*60)-(tmp/(10*60))%1 }"
									pattern="0" />
								시간
								<fmt:formatNumber value="${(tmp/10)%60 }" pattern="0" />
								분
							</h3>
							<h3>
								인간한계의 운동(MET 23) :
								<fmt:formatNumber value="${tmp/(23*60)-(tmp/(23*60))%1 }"
									pattern="0" />
								시간
								<fmt:formatNumber value="${(tmp/23)%60 }" pattern="0" />
								분
							</h3>

						</div>
					</div>
				</div>
		</div>
		</center>



		<!-- Footer -->
		<div>
			<footer class="w3-center w3-black w3-padding-16">
				<p>
					<a class="w3-hover-text-green">
						<div class="col-md-10 col-lg-3">
							<div class="block-5 mb-5">
								<ul class="list-unstyled">
									<a class="address">(SSAFY) 서울시 강남구 테헤란로 멀티스퀘어 </a>
									<a class="phone">1544 - 9001</a>
									<a class="email"><a href="email:admin@ssafy.com">admin@ssafy.com</a>
								</ul>
							</div>
						</div>
					</a>
				</p>
			</footer>
		</div>
</body>
</html>