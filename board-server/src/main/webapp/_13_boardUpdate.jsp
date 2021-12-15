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
<!-- 	수정 또는 삭제  -->
여기는 13보드업데이트 페이지<br>
<%
String id = session.getAttribute("log")+"";
String title = request.getParameter("title");
String content = request.getParameter("content");
content = content.replace("<br>", "\n");

%>
<form action="_14_boardUpdatePro.jsp">
<button onclick="update(form)">수정완료</button>
<input type="text" value="<%=title%>" name="title" id="title"><br>
수정할 내용<br>
<textarea name="content" id="content" cols="30" rows="10"><%=content%></textarea><br>

</form>
수정할 타이틀 <br>
<script>	
<% %>
function update() {
	form.submit();
}

</script>


</body>
</html>
