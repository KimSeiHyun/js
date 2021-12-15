<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%System.out.println("log : " +session.getAttribute("log")); %>
	<% 
	// 권한이 필요한 수정 / 탈퇴 처리 담당.
	int dir = 0;
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	UserDAO dao = UserDAO.getInstance();
	if(dir == UserDAO.REMOVE) {
		if(dao.deletUser(id, pw) == -1) {
			if(dao.deletUser(id, pw) == -1) {
			response.sendRedirect("_8_checkPass.jsp");
			System.out.println("탈퇴실패");
			}
		}else {
			// 탈퇴성공
			session.removeAttribute("log");
			session.removeAttribute("pw"); 
			  
			response.sendRedirect("_1_index.jsp");
			//session.getAttribute(name); << 브라우저에서는 확인불가 . 
		}
	}
	
	%>
</body>
</html>