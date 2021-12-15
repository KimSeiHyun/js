<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Board List</title>
</head>
<body>
   <button onclick="logOut()">logout</button>
   <button onclick="signOut()">signOut</button>
   <button onclick="addPost()">addPost</button>
   <h1>List</h1>
   
   <form action="_12_boardView.jsp">
   <div class="wrap">
        <table border="solid 1px" style="border-collapse: collapse;">
            <tr>
                <td>no</td>
                <td>title</td>
                <td>id</td>
                <td>like</td>
                <td>regdate</td>
            </tr>
            <%
            	BoardDAO dao = BoardDAO.getBoardDAOGetInstance();
            	ArrayList<BoardDTO> boards = dao.getBoards(); 
            	dao.printBoard();
            	String id = session.getAttribute("log")+"";
            	int cnt = 0;
            	for(int i=0; i<boards.size(); i++) {
            		String title = boards.get(i).getTitle();
            		String content = boards.get(i).getContent();
            		
            		if(id.equals(boards.get(i).getId())){
            			cnt ++;
            		%> 
            		<tr>
            		<td><%=cnt %></td>
            		<td><a href="_12_boardView.jsp?title=<%=title %>&content=<%=content %>" class="a2" method="post" target='_blank'><%=boards.get(i).getTitle() %></a></td>
            		<td><%=boards.get(i).getId() %></td>
            		<td><%=boards.get(i).getLikes() %></td>
            		<td><%=boards.get(i).getRegDate() %></td>
            		</tr>
            		
            	<%}
            		}
            %>
        </table>
   </div>
   </form>
   
   <script>

   function logOut() {
   	location.href ='_1_index.jsp';	   
   }
   
   function signOut() {
   	location.href ='_8_checkPass.jsp';	   
   }
   function addPost() {
	   location.href = '_10_boardWrite.jsp';
   }
   
   
   </script>
</body>
</html>