<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = request.getParameter("userID");
	String userPassword = request.getParameter("userPassword");
	String userName = request.getParameter("userName");
	String Classification = request.getParameter("Classification");
	
	if(userID == null || userPassword == null || userName == null || Classification == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('miss in input')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.registration(new UserDTO(userID, userPassword, userName, Classification));
	PrintWriter script = response.getWriter();
	if(result == -1){
		script.println("<script>");
		script.println("alert('same ID already exists')");
		script.println("history.back()");
		script.println("</script>");
	}
	else{
		script.println("<script>");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
	}
	script.close();
	return;
%>