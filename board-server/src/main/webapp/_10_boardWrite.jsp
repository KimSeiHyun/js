<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="post" action='_11_boardWritePro.jsp'>
	<h1>boardWrite</h1>
	title : <input type="text" name="title" id="title" ><br>
	<textarea name="content" id="content" cols="30" rows="10">내용물 입력</textarea><br>
	<!-- textarea 줄바꿈 = 입력창이 작아서 줄이 바뀌어도 엔터를 치지않는한 실제 text값은 줄바꿈이 이루어지지 않는다 -->
	
	<button onclick="addPost(form)">등록하기</button><br>
	<button onclick="back()">뒤로가기</button><br>'
	
	</form>
	
	<script>
	
		document.querySelector('form').addEventListener('submit' ,e => {
			e.preventDefault();
		})
	
		function addPost(form) {
			const title = document.querySelector('#title').value;
			const content = document.querySelector('#content').value;
			if(title !== "" && content !== "") {
			form.submit();				
			}else {
				alert("타이틀 혹은 내용을 입력해주세요.");
			}
			
		}
		
		function back() {
			location.href = '_7_boardList.jsp';
		}
	</script>
</body>
</html>