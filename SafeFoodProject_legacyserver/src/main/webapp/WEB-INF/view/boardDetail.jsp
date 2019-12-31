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
				<a href="list.food" class="w3-bar-item w3-button">Main</a> <a
					href="listBoard.do" class="w3-bar-item w3-button">Notice</a> 
					<c:if test="${not empty id }">
               <a href="myfood.food">Myfood</a>
				</c:if>
				 <c:if test="${not empty id }">
				Welcome, ${id }!!!
				<a href='safefood/logout.food'><button class="btn btn-danger btn-sm">Logout</button></a>
				<a href='mypage.food'><img id='user' src='resources/images/user.PNG'></a>
				</c:if>
				
				<c:if test="${empty id }">
				<a href='login.food' class="w3-bar-item w3-button">Login</a>
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
				<span class="w3-padding w3-black w3-opacity-min"><b>Detail</b></span>
			</h1>
		</div>
	</header>

	<!-- Page content -->
	<div class="w3-content w3-padding" style="max-width: 1564px">
      	<div class="contents">
<center>
		
		<br>

		<TABLE BORDER=1 CELLSPACING=1 CELLPADDING = 1><TR>
		<th width=100 bgcolor=white><font color=black size=2>번호</th>
		<th width=200 bgcolor=white><font color=black size=2>제목</th>
		<th width=100 bgcolor=white><font color=black size=2>글쓴이</th>
		<th width=150 bgcolor=white><font color=black size=2>날짜</th>
		<th width=100 bgcolor=white><font color=black size=2>조회수</th>

	    <tr bgcolor=pink>
		   <td align=center bgcolor=white>&nbsp;<font size=2>${b.num }</td>
	       
	      <td align=center bgcolor=white>&nbsp;<font size=2>${b.title }</td>
	       
	      <td align=center bgcolor=white>&nbsp;<font size=2>${b.name }</td>
	       
	      <td align=center bgcolor=white>&nbsp;<font size=2>${b.wdate }</td>
	       
	      <td align=center bgcolor=white>&nbsp;<font size=2>${b.count }</td>
	       
	    </tr>
	    <th colspan="5" width=100 bgcolor=white ><font color=black size=2>내용</th>
	     <tr colspan="5" bgcolor=white>
		   <td   colspan="5" align=center bgcolor=white height="500px">&nbsp;<font size=4>${b.content }</td>
		   </tr>
</table><br>
<c:if test="${text == null }"> <a href= "listBoard.do" style="text-decoration:none"> back</a><br></c:if>
<c:if test="${not empty text }"> <a href= "searchBoard.do?search=${search}&searchtext=${text}"> back</a></c:if>

<c:if test="${not empty admins }">
<a href="updateForm.do?num=${b.num }&title=${b.title}&name=${b.name}&content=${b.content}">수정</a>
<a href="deleteBoard.do?num=${b.num }">delete</a>
</c:if>
		</div> 
      </div>
    </center>

</div>


<!-- Footer -->

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
</footer>

</body>
</html>