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
ȯ���մϴ�, ${id }��!
<a href="logout.food">�α׾ƿ�</a><br>

<a href="mypage.food">����������</a>
</c:if>

<c:if test="${empty id }">
<li><a href='login.food'><button class="btn btn-danger btn-sm">�α���</button></a></li>
<li><a href=insert.food><button class="btn btn-danger btn-sm">ȸ������</button></a></li>
</c:if>
</body>
</html>