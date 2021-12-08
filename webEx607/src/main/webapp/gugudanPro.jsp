<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
<%request.setCharacterEncoding("UTF-8"); 
// 폼 안의 인풋태그 자체가 리퀘스트 처리를 위한 요소.
String inputAnswer[] = request.getParameterValues("inputAnswer");
String answer[] = request.getParameterValues("answer");
String OX[] = new String[inputAnswer.length];
for(int i=0; i<inputAnswer.length; i++) {
	if(inputAnswer[i].equals(answer[i])) {
		OX[i] = "O";
	}else {
		OX[i] = "X";
	}
}
%>

<table border=1>
	<tr>
	<td>번호</td>
	<td>정답</td>
	<td>사용자의입력값</td>
	<td>O,X</td>
	</tr>
	<%
	for(int i=0; i<OX.length; i++) {%>
		<tr>
			<td><%=i + 1%></td>
			<td><%=answer[i]%></td>
			<td><%=inputAnswer[i]%></td>
			<td><%=OX[i]%></td>
		</tr>
		<%}
	%>

</table>

</body>
</html>