<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html><head>
<title>W3.CSS Template</title>
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
			<a href="#home" class="w3-bar-item w3-button"><b>Safe</b>
				Foods</a>
			<!-- Float links to the right. Hide them on small screens -->
			<div class="w3-right w3-hide-small">
				<a href="qna.food" class="w3-bar-item w3-button">Main</a> <a
					href="safefood/listBoard.do" class="w3-bar-item w3-button">Notice</a> 
					<c:if test="${not empty id }">
               <a href="myfood.food">Myfood</a>
				</c:if>
				 <c:if test="${not empty id }">
				Welcome, ${id }!!!
				<a href='safefood/logout.food'><button class="btn btn-danger btn-sm">Logout</button></a>
				<a href='mypage.food'><img id='user' src='resources/images/user.PNG'></a>
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
		<br><br><br><br><br><br><br><br>
		<div class="w3-display-middle w3-margin-top w3-center">
			<h1 class="w3-xxlarge w3-text-white">
				<span class="w3-padding w3-black w3-opacity-min"><b>Notice</b></span>
			</h1>
		</div>
	</header>

	<!-- Page content -->
	<div class="w3-content w3-padding" style="max-width: 1564px">
      	<div class="contents">
<center>
		<form method="get" action="searchBoard.do">
			<select name="search">
				<option value="name">글쓴이</option>
				<option value="title">제목</option>
			</select>
			<input type="text" name="searchtext"/>
			<input type="submit" value="검색"/>
		</form>
		<br>

		<TABLE BORDER=0 CELLSPACING=3 CELLPADDING = 10><TR>
		<th width=100 bgcolor=white><font color=black size=2>no</th>
		<th width=200 bgcolor=white><font color=black size=2>title</th>
		<th width=100 bgcolor=white><font color=black size=2>writer</th>
		<th width=150 bgcolor=white><font color=black size=2>date</th>
		<th width=100 bgcolor=white><font color=black size=2>hit</th>

	  <c:forEach var="row" items="${list}">
	    <tr bgcolor=black>
		   <td align=center bgcolor=white>&nbsp;<font size=2>${row.num }</td>
	       
	      <td align=center bgcolor=white>&nbsp;<font size=2>
	       <a href="detail.do?num=${row.num }">${row.title }</a></td>
	       
	      <td align=center bgcolor=white>&nbsp;<font size=2>${row.name }</td>
	       
	      <td align=center bgcolor=white>&nbsp;<font size=2>${row.wdate }</td>
	       
	      <td align=center bgcolor=white>&nbsp;<font size=2>${row.count }</td>
	       
	    </tr>
	    </c:forEach>
</table>
<br></br>
<c:if test="${not empty admins }">
<a href=insertBoardForm.do>새글쓰기</a>
</c:if>
		</div> 
      </div>
    </center>

  	 <!-- <div class="w3-row-padding w3-grayscale">
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="/w3images/team2.jpg" alt="John" style="width:100%">
      <h3>John Doe</h3>
      <p class="w3-opacity">CEO & Founder</p>
      <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
      <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="/w3images/team1.jpg" alt="Jane" style="width:100%">
      <h3>Jane Doe</h3>
      <p class="w3-opacity">Architect</p>
      <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
      <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="/w3images/team3.jpg" alt="Mike" style="width:100%">
      <h3>Mike Ross</h3>
      <p class="w3-opacity">Architect</p>
      <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
      <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="/w3images/team4.jpg" alt="Dan" style="width:100%">
      <h3>Dan Star</h3>
      <p class="w3-opacity">Architect</p>
      <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
      <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
    </div>
  </div> -->
  	

<!-- Image of location/map -->
<!-- <div class="w3-container">

</div> -->
<!-- End page content -->

</div>


<!-- Footer -->
<div>
<footer class="w3-center w3-black w3-padding-16">
  <p> <a class="w3-hover-text-green"> 
  		<div class="col-md-10 col-lg-3">
            <div class="block-5 mb-5">
              <ul class="list-unstyled">
                <a class="address">(SSAFY) 서울시 강남구 테헤란로 멀티스퀘어 </a>
                <a class="phone">1544 - 9001</a>
                <a class="email"><a href="email:admin@ssafy.com">admin@ssafy.com</a>
              </ul>
            </div>
          </div></a>
		</p>
</footer></div>

</body>
</html>