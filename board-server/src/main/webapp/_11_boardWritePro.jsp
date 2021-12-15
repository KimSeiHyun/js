<%@page import="board.BoardDTO"%>
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
	여기는 11 pro
	<%request.setCharacterEncoding("UTF-8"); 
	
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id = session.getAttribute("log")+"";
		String pw = session.getAttribute("pw")+"";
		String tempC = "";
		String temp[] = content.split("\n");
		for(int i=0; i<temp.length; i++) {
			tempC += temp[i]+"\n";
		}
		BoardDAO dao = BoardDAO.getBoardDAOGetInstance();
		dao.addBoard(new BoardDTO(id , pw , title , content));
		
		response.sendRedirect("_7_boardList.jsp");
		%>
	<!-- _7_boardlist에게 title , content ,-->
	
	<script>
	
	</script>
</body>
</html>
