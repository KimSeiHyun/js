<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	여기는 보드딜렉트 프로 <br>
	
	<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	String id = session.getAttribute("log")+"";
	
	BoardDAO dao = BoardDAO.getBoardDAOGetInstance();
	dao.printBoard();
	dao.deletBoard(id , title);
	
	response.sendRedirect("_7_boardList.jsp");
	%>
	
		넘어온 딜렉트타이틀
	 <h1><%=title %></h1>
	 	
	 넘어온 딜렉트곤탠츠
	 <h1><%=content %></h1>
</body>
</html>