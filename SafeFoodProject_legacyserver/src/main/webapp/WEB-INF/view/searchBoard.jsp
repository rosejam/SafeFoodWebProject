<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>안전식품 &mdash; Colorlib Template</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css?family=Rubik:400,700|Crimson+Text:400,400i" rel="stylesheet">
  <link rel="stylesheet" href="resources/fonts/icomoon/style.css">

  <link rel="stylesheet" href="resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/css/magnific-popup.css">
  <link rel="stylesheet" href="css/jquery-ui.css">
  <link rel="stylesheet" href="resources/css/owl.theme.default.min.css/css/owl.carousel.min.css">
  <link rel="stylesheet" href="resources/css/owl.theme.default.min.css">


  <link rel="stylesheet" href="resources/css/aos.css">

  <link rel="stylesheet" href="resources/css/style.css">
  <style type="text/css">
  	p{
  		text-align:center;
  	}
  	#SSAFY{
  		width : 60px;
  		height : 60px;
  	}
  	#MAIN_image{
  		width : 1100px;
  		height : 300px;
  	}
  	#first_image{
  		width : 250px;
  		height : 250px;
  		float:left;
  	}
  	#second_image{
  		width : 250px;
  		height : 250px;
  		float:left;
  	}
  	.row {
        font-weight: 700;
        color:black;
      }
     #name{
     	font-size: 11pt;
     }
     #date{
     	font-size: 10pt;
     }
     #info{
     	font-size: 10pt;
     }
     
     #container{
    		width: 1200px;
    		padding: 20px;
     }
     #image{
     	float:left;
     	width: 450px;
     }
     #search{
     	width:20px;
     	hwight:20px;
     }
     #user{
     	width:45px;
     	hwight:45px;
     }
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">


</script>

</head>
<body>

  <div class="site-wrap">


    <div class="site-navbar py-2">

      <div class="search-wrap">
        <div class="container">
          <a href="#" class="search-close js-search-close"><span class="icon-close2"></span></a>
          <form action="#" method="post">
            <input type="text" class="form-control" placeholder="Search keyword and hit enter...">
          </form>
        </div>
      </div>

      <div class="container">
        <div class="d-flex align-items-center justify-content-between">
          <div class="logo">
            <div class="site-logo">
              <a href='list.food'><img src="resources/images/ssafy배너.PNG" id="SSAFY"></a>
            </div>
          </div>
          <div class="main-nav d-none d-lg-block">
            <nav class="site-navigation text-right text-md-center" role="navigation">
              <ul class="site-menu js-clone-nav d-none d-lg-block">
                <li class="active"><a href="listBoard.do">공지사항</a></li>
                <li><a href="list.food">상품정보</a></li>
                <li><a href="sortkw.food">베스트 섭취 정보</a></li>
              <!--   <li><a href="myfood.food">내 섭취 정보</a></li> -->
	       
     			<form method="post" action="search.food">
				<select name="condition">
				<option value="name">상품명</option>
				<option value="maker">제조사</option>
				<option value="material">영양정보</option>
				</select>
				<input type="text" name="word">
				<input type="submit" value="검색">
				</form>

	            
	            <c:if test="${not empty id }">
				환영합니다, ${id }님!
				<li><a href='logout.food'><button class="btn btn-danger btn-sm">로그아웃</button></a></li>
				<li><a href='mypage.food'><img id='user' src='resources/images/user.PNG'></a></li>
				</c:if>
				
				<c:if test="${empty id }">
				<li><a href='login.food'><button class="btn btn-danger btn-sm">로그인</button></a></li>
				<li><a href=insert.food><button class="btn btn-danger btn-sm">회원가입</button></a></li>
				</c:if>
	            
              </ul>
            </nav>
          </div>
          <div class="icons">
            <a href="#" class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none"><span
                class="icon-menu"></span></a>
          </div>
        </div>
      </div>
    </div>
    
	<hr>
	
    <div><p><img src="resources/images/총메인.PNG"  id="MAIN_image"></p><br><br>
      	
      	<div class="container">
      	
      	<div class="contents">

<center>
		<form method="get" action="searchBoard.do">
			<select name="search">
				<option value="name">글쓴이</option>
				<option value="title">제목</option>
			</select>
			<input type="text" value="${text }" name="searchtext" />
			<input type="submit" value="검색"/>
		</form>
		
		<TABLE BORDER=1 CELLSPACING=1 CELLPADDING = 1><TR>
		<th width=100 bgcolor=#113366><font color=#ffffee size=2>번호</th>
		<th width=200 bgcolor=#113366><font color=#ffffee size=2>제목</th>
		<th width=100 bgcolor=#113366><font color=#ffffee size=2>글쓴이</th>
		<th width=150 bgcolor=#113366><font color=#ffffee size=2>날짜</th>
		<th width=100 bgcolor=#113366><font color=#ffffee size=2>조회수</th>

	  <c:forEach var="row" items="${list}">
	    <tr bgcolor=black>
		   <td align=center bgcolor=black>&nbsp;<font size=2>${row.num }</td>
	       
	       <td align=center bgcolor=black>&nbsp;<font size=2>
	       <a href="detail.do?num=${row.num }&search=${search}&searchtext=${text}">${row.title }</a></td>
	       
	      <td align=center bgcolor=black>&nbsp;<font size=2>${row.name }</td>
	       
	      <td align=center bgcolor=black>&nbsp;<font size=2>${row.wdate }</td>
	       
	      <td align=center bgcolor=black>&nbsp;<font size=2>${row.count }</td>
	       
	    </tr>
	    </c:forEach>
</table>
<br></br>
<a href="listBoard.do">back</a>
		</div> 
      </div>
    </div>
    

   
    <footer class="site-footer">
      <div class="container">
        <div class="row">

          <div class="col-md-10 col-lg-3">
            <div class="block-5 mb-5">
              <h3 class="footer-heading mb-4">Contact Info</h3>
              <ul class="list-unstyled">
                <li class="address">(SSAFY) 서울시 강남구 테헤란로 멀티스퀘어 </li>
                <li class="phone">1544 - 9001</a></li>
                <li class="email"><a href="email:admin@ssafy.com">admin@ssafy.com</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </footer>
  </div>

  <script src="resources/js/jquery-3.3.1.min.js"></script>
  <script src="resources/js/jquery-ui.js"></script>
  <script src="resources/js/popper.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="resources/js/owl.carousel.min.js"></script>
  <script src="resources/js/jquery.magnific-popup.min.js"></script>
  <script src="resources/js/aos.js"></script>

  <script src="resources/js/main.js"></script>

</body>
</html>




   	