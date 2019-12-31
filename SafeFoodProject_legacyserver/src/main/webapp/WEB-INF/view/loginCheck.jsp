<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:if test="${not empty id }">
환영합니다, ${id }님!
<a href="logout.food">로그아웃</a><br>

<a href="mypage.food">마이페이지</a>
</c:if>

<c:if test="${empty id }">
<li><a href='login.food'><button class="btn btn-danger btn-sm">로그인</button></a></li>
<li><a href=insert.food><button class="btn btn-danger btn-sm">회원가입</button></a></li>
</c:if>
</body>
</html>