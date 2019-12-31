<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>MyPage</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel=icon href=/favicon.ico>
<link href=resources/css/app.25649080.css rel=preload as=style>
<link href=resources/js/app.5c658461.js rel=preload as=script>
<link href=resources/js/chunk-vendors.6240f7ba.js rel=preload as=script>
<link href=resources/css/app.25649080.css rel=stylesheet>
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
				<c:if test="${not empty m.id }">
					<a href="myfood.food" class="w3-bar-item w3-button">Myfood</a>
				</c:if>
				<c:if test="${not empty m.id }">
					<a href='' class="w3-bar-item w3-button">Welcome, ${m.id }!!!</a>
					<a href='logout.food'><button class="w3-bar-item w3-button">Logout</button></a>
					<a href='mypage.food'><img id='user'
						src='resources/images/user.PNG' class="w3-bar-item w3-button"
						size=2></a>
				</c:if>

				<c:if test="${empty m.id }">
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
				<span class="w3-padding w3-black w3-opacity-min"><b>myPage</b></span>
			</h1>
		</div>
	</header>
	<div class="w3-content w3-container w3-padding-64" id="contact">
		<div class="w3-row w3-padding-32 w3-section">
			<div class="w3-col m4 w3-container">
				<img src="resources/images/mypage.png" class="w3-image w3-round"
					style="width: 100%">
			</div>
			<div class="w3-col m8 w3-panel">
				<div class="w3-large w3-margin-bottom">
					ID : <i
						class="fa fa-map-marker fa-fw w3-hover-text-black w3-xlarge w3-margin-right"></i>${m.id}<br>
					WEIGHT : <i
						class="fa fa-phone fa-fw w3-hover-text-black w3-xlarge w3-margin-right"></i>
					${m.weight}<br> ALERGY : <i
						class="fa fa-envelope fa-fw w3-hover-text-black w3-xlarge w3-margin-right"></i>
					${m.alergy}<br>
				</div>
				<p>
					Weight Update <i class="fa fa-coffee"></i>
				</p>
				<!--   -->
				<form action="updateProcess.food" method="POST" id="signup-form"
					class="signup-form">
					<div class="form-group"></div>

					<div class="w3-half">
						<input type="text" class="w3-input w3-border" name="weight"
							id="weight" placeholder="몸무게" />
					</div>
					<br> <br> <br>

					<p>
						Alergy Update <i class="fa fa-coffee"></i>
					</p>
					<div class="form-group">
						<input type="checkbox" name="alergy" id="agree-term" value="두유"
							class="agree-term" /> <label for="agree-term"
							class="label-agree-term"><span><span></span></span>두유</label> <input
							type="checkbox" name="alergy" id="agree-term1" value="콩"
							class="agree-term1" /> <label for="agree-term1"
							class="label-agree-term"><span><span></span></span>콩 </label> <input
							type="checkbox" name="alergy" id="agree-term2" value="새우"
							class="agree-term2" /> <label for="agree-term2"
							class="label-agree-term"><span><span></span></span>새우 </label> <input
							type="checkbox" name="alergy" id="agree-term3" value="우유"
							class="agree-term3" /> <label for="agree-term3"
							class="label-agree-term"><span><span></span></span>우유 </label> <input
							type="checkbox" name="alergy" id="agree-term4" value="땅콩"
							class="agree-term4" /> <label for="agree-term4"
							class="label-agree-term"><span><span></span></span>땅콩 </label> <input
							type="checkbox" name="alergy" id="agree-term5" value="게"
							class="agree-term5" /> <label for="agree-term5"
							class="label-agree-term"><span></span>게 </label> <input
							type="checkbox" name="alergy" id="agree-term6" value="쑥"
							class="agree-term6" /> <label for="agree-term6"
							class="label-agree-term"><span><span></span></span>쑥 </label> <input
							type="checkbox" name="alergy" id="agree-term7" value="돼지고기"
							class="agree-term7" /> <label for="agree-term7"
							class="label-agree-term"><span><span></span></span>돼지고기 </label>
						<input type="checkbox" name="alergy" id="agree-term8" value="계란흰자"
							class="agree-term8" /> <label for="agree-term8"
							class="label-agree-term"><span><span></span></span>계란흰자 </label>
						<input type="checkbox" name="alergy" id="agree-term9" value="닭고기"
							class="agree-term9" /> <label for="agree-term9"
							class="label-agree-term"><span><span></span></span>닭고기 </label> <input
							type="checkbox" name="alergy" id="agree-term10" value="연어"
							class="agree-term10" /> <label for="agree-term10"
							class="label-agree-term"><span><span></span></span>연어 </label> <input
							type="checkbox" name="alergy" id="agree-term11"
							class="agree-term11" /> <label for="agree-term11"
							class="label-agree-term"><span><span></span></span>알레르기
							없음 </label>
							<br>
								<button class="w3-button w3-black w3-right w3-section"
									type="submit">회원정보 수정</button>
					</div>
				</form>
				<a href="delete.food" onclick="delcheck()"><button
						class="w3-button w3-black w3-right w3-section">회원 탈퇴</button></a>

			</div>
		</div>
	</div>
	
	<script>
	function delcheck() {
		return confirm("정말 탈퇴하시겠습니까?");
	}
	</script>

	<!-- JS -->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/js/register.js"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>