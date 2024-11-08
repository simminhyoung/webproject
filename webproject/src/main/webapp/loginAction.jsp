<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
	<%
		// User 객체 대신 직접 요청 파라미터 사용
		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassWord");

		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(userID, userPassword);

		// 출력 스트림 설정
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter script = response.getWriter();

		if(result == 1) {
			script.println("<script>");
			script.println("alert('로그인 성공');");
			script.println("history.back();");
			script.println("</script>");
		} else if(result == 0) {
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다');");
			script.println("history.back();");
			script.println("</script>");
		} else if(result == -1) {
			script.println("<script>");
			script.println("alert('아이디가 존재하지 않습니다');");
			script.println("history.back();");
			script.println("</script>");
		} else if(result == -2) {
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다');");
			script.println("history.back();");
			script.println("</script>");
		}
		script.close();
	%>
</body>
</html>
