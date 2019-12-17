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
	UserDAO userDAO = new UserDAO();
	
	int result = new UserDAO().delete(userID);
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('deleted')");
		script.println("location.href = '../webpage/AdminUserList.jsp';");
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