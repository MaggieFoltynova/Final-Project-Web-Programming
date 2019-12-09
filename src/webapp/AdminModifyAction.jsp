<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="appLayer.user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% 
	String UserID = (String)session.getAttribute("userID");
	if(UserID == null || !UserID.equals("root")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Invalid User')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
	}
	
	request.setCharacterEncoding("UTF-8");
	String userID = request.getParameter("userID");
	String field = request.getParameter("field");
	String newValue = request.getParameter(field);
	
	int result = new UserDAO().modify(userID, field, newValue);
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('modified')");
		script.println("location.href = 'AdminPage.jsp';");
		script.println("</script>");
		script.close();
	} else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('error in database')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
	}
%>
