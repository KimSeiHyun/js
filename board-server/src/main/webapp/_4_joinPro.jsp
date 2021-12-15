<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GREEM</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 데이터베이스에 가져온 id , pw 등록
	
	// 데이터베이스와 소통하기 위한 오브젝트
	// ㄴ DTO (data Transfer Object) = Bean , VO , Entify Class
	
	UserDAO dao = UserDAO.getInstance();
	UserDTO user = new UserDTO(id , pw);
	if(dao.addUser(user) != -1) {
		response.sendRedirect("_1_index.jsp");		
	}
	else {
		response.sendRedirect("_3_join.jsp");		
			
	}
	
	
	%>
  </form>
</body>
</html>