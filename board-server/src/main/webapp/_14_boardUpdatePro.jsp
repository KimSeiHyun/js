<%@page import="java.util.ArrayList"%>
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
	14페이지 업데이트프로
	<br><br><br>
	<%
	String id = session.getAttribute("log")+"";
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	System.out.println("14page : " +content);
	content = content.replace("<br>", "\n");
	
	BoardDAO dao = BoardDAO.getBoardDAOGetInstance();
	boolean check = false;
	if(dao.setBoard(id, title, content)) {
		dao.setContent(id, title, content);
		response.sendRedirect("_7_boardList.jsp");
		check = true;
	}else {
		check = false;
	}
	
	%>
	넘겨받은 타이틀 
	<h3><%=title %></h3>
	
	넘겨받은 내용
	<h3><%=content %></h3>
	
	ㅁㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴ
	<script>
	const a = <%=check%>;
	<% content = content.replace("\n", "<br>");%>
	if(a === false) {
		alert("중복된 제목입니다.");
		location.href="_13_boardUpdate.jsp?title=<%=title%>&content=<%=content%>"
		console.log(a);
	}
	</script>
</body>
</html>