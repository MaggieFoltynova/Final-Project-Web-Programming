<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="appLayer.user.UserDAO"%>
<%@ page import ="appLayer.user.UserDTO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>
		<br> show all user list
	</h1>
	<p>
		(userID) (userName) (userClass)
	<p>
	<%
		ArrayList<UserDTO> userList = new ArrayList<UserDTO>();
		userList = new UserDAO().getList();
		for(int i = 0; i < userList.size(); ++i) {
			UserDTO userInfo = userList.get(i);
	%>
		<span> <%= userInfo.getUserID() %>&emsp;</span>
		<span> <%= userInfo.getUserPassword() %>&emsp;</span>
		<span> <%= userInfo.getUserName() %>&emsp;</span>
		<span> <%= userInfo.getuserClass() %>&emsp;</span>
		<a href="http://localhost:8080/Final-Project-Web-Programming-master/AdminDeleteAction.jsp?userID=<%=userInfo.getUserID() %>">KILL</a>
		<span> <br> </span>
	<%
		}
	%>
</body>
</html>