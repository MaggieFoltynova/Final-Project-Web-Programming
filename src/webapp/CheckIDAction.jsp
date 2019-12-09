<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="appLayer.user.UserDTO"%>
<%@ page import="appLayer.user.UserDAO"%>
<%@
 page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = request.getParameter("userID");
	
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('enter the user ID')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.Checkduplicaition(userID);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	if(result == 1)
		script.println("alert('same ID already exists')");
	else if(result == 0)
		script.println("alert('You can use this ID')");
	else
		script.println("alert('Something wrong! please try again')");
	script.println("history.back()");
	script.println("</script>");
	script.close();
	return;
%>