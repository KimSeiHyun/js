<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
 
</style>
<title>Insert title here</title>
</head>
<body>
	<%
	// 폼 예제
	// gugudan.jsp
	// 2~9단 안에서 랜덤으로 5개 문제를 출제 (table)
	// 사용자가 문제에 대한 답을 입력 (input > request)
	
	// gugudanPro.jsp
	// 넘어온 파라미터를 바탕으로 
	// 성적표를 출력 (정오표)	
	
	%>
	<% Random rn = new Random();
	%>
	<form method="get" action="gugudanPro.jsp">
	<h1>구구단 문제</h1>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>문제</td>
			<td>정답</td>
		</tr>
		<%
		for(int i=0; i<5; i++) {
			int x = rn.nextInt(8)+2;
			int y = rn.nextInt(9)+1;
			%>
		<tr >
			<td><%=i + 1 %> </td>
			<td><%=x %> * <%=y %></td>
			<td><input type="text" name='inputAnswer'></td>
			 <input type="hidden" name="answer" value="<%=x*y %>">
		</tr>
		
		<%
		}
		%>

	</table>

	<input type="submit" value="전송">
	</form>
</body>
</html>