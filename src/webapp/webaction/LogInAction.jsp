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
	if(result == 3){		// administor
		session.setAttribute("userID", userID);
		session.setAttribute("userName", userDAO.getUserName(userID));
		session.setAttribute("userClass", userDAO.getUserClass(userID));
		script.println("<script>");
		script.println("location.href = '../webpage/AdminUserList.jsp';");
		script.println("</script>");
	}
	else if(result == 2){	// seller
		session.setAttribute("userID", userID);
		session.setAttribute("userName", userDAO.getUserName(userID));
		session.setAttribute("userClass", userDAO.getUserClass(userID));
		script.println("<script>");
		script.println("location.href = '../webpage/SellerIndex.jsp';");
		script.println("</script>");
	}
	else if(result == 1){	// buyer
		session.setAttribute("userID", userID);
		session.setAttribute("userName", userDAO.getUserName(userID));
		session.setAttribute("userClass", userDAO.getUserClass(userID));
		script.println("<script>");
		script.println("location.href = '../webpage/BuyerIndex.jsp';");
		script.println("</script>");
	}
	else if(result == 0){	// failed
		script.println("<script>");
		script.println("alert('Wrong password')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if(result == -1){	// no id
		script.println("<script>");
		script.println("alert('Wrong ID')");
		script.println("history.back()");
		script.println("</script>");
	}
	else{					// something wrong in database
		script.println("<script>");
		script.println("alert('Something wrong')");
		script.println("history.back()");
		script.println("</script>");
	}
	script.close();
	return;
%>