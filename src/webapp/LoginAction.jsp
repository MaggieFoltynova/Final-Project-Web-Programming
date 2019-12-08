<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="appLayer.user.UserDTO"%>
<%@ page import="appLayer.user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = request.getParameter("userID");
	String userPassword = request.getParameter("userPassword");
	
	if(userID == null || userPassword == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('miss in input')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(userID, userPassword);
	PrintWriter script = response.getWriter();
	if(result == 1){		//success
		session.setAttribute("userID", userID);
		script.println("<script>");
		script.println("location.href = 'index.jsp';");
		script.println("</script>");
	}
	else if(result == 0){	//failed
		script.println("<script>");
		script.println("alert('Wrong password')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if(result == -1){	//no id
		script.println("<script>");
		script.println("alert('Wrong ID')");
		script.println("history.back()");
		script.println("</script>");
	}
	else{					//something wrong
		script.println("<script>");
		script.println("alert('Something wrong')");
		script.println("history.back()");
		script.println("</script>");
	}
	script.close();
	return;
%>
