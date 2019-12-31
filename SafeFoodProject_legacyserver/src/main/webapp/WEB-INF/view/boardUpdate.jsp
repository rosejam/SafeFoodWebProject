<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<form method="post" action="boardUpdate.do" >
	<table>
		
		<tbody>
			<tr height="50"><td><label for="title">번호</label></td>
			    <td><input type="text" value="${num }" name="num" id="num"/></td>
			</tr>
			<tr height="50"><td><label for="title">제목</label></td>
			    <td><input type="text" value ="${title }" name="title" id="title"/></td>
			</tr>
			<tr height="50"><td><label for="title">글쓴이</label></td>
			    <td><input type="text" value="${name }" name="name" id="name"/></td>
			</tr>	
			<tr><td colspan="2"><label for="content">내용</label></td></tr>
			<tr><td colspan="2" align="center">
			    <textarea name="content" id="content" cols="30" rows="10">${content }</textarea>
			</td></tr>			
		</tbody>
		<tfoot>
			<tr><td colspan="2" align="center">
				<input type="submit" value="수정하기"/>
				<input type="reset" value="취소"/>
			</td></tr>
		</tfoot>
	</table>
</form>
<br>
<a href="listBoard.do">back</a>
</body>
</html>