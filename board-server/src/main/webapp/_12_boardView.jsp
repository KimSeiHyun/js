<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button onclick="setPost()">setPost</button>
   <button onclick="removePost()">removePost</button><br>
	<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	%>
	
	여기는 보드뷰페이지<br>
		
		넘어온 타이틀 
	 <h1><%=title %></h1>
	 	
	 넘어온 내용
	 <h1><%=content %></h1>
	 
	 
	 
	 <script>
	 
	 
	 function setPost() {
		 location.href="_13_boardUpdate.jsp?title=<%=title%>&content=<%=content%>"
	 }
	 
	 function removePost() {
		location.href="_15_boardDeletePro.jsp?title=<%=title%>&content=<%=content%>";
	 }
	 </script>
</body>
</html>