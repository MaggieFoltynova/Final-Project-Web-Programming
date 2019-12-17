<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="appLayer.user.UserDAO"%>
<%@ page import="appLayer.user.UserDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<title>HIGHLIGHT FLEA MARKET</title>
<meta charset="utf-8" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
div#hhh {
	position: absolute;
	top: 600px;
	left: 500px;
}
</style>
</head>

<body>
	<%
		String UserClass = (String) session.getAttribute("userClass");
		if (UserClass == null || !UserClass.equals("Administer")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Only <Administer> can access')");
			script.println("location.href = '../webpage/CommonIndex.jsp';");
			script.println("</script>");
			script.close();
		}
		int pageNumber = 0;
		if (request.getParameter("pageNumber") != null)
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	%>
	<div id=loggo>
		<a href="AdminUserList.jsp"><img src="../images/loggo.png" alt=""
			width="100px"></a>
	</div>

	<div id="vertical-navbar">
		<div id=signindiv>
			<a href="AdminUserList.jsp"><i class="material-icons md-48">face</i>
				<h3>USER</h3></a>
		</div>
		<div id=Productdiv>
			<a href="AdminProduct.jsp"><i class="material-icons md-48">store</i>
				<h3>PRODUCT</h3></a>
		</div>
	</div>

	<div id="header">
		<img id="logo" src="../images/logo1.png" alt=""> <img
			id="comment" src="../images/comment.png" alt="">
	</div>
	<hr id="hi">
	<div id="user-list">
		<table id="table">
			<thead>
				<th>ID</th>
				<th>Password</th>
				<th>Name</th>
				<th>Classification</th>
				<th>DEL/MOD</th>
			</thead>
			<tbody>
				<%
					ArrayList<UserDTO> userList = new ArrayList<UserDTO>();
					userList = new UserDAO().getList(pageNumber);
					if (userList != null) {
						for (int i = 0; i < userList.size(); ++i) {
							UserDTO userInfo = userList.get(i);
				%>
				<tr class="alt">
					<td><span><%=userInfo.getUserID()%></span></td>
					<td><span><%=userInfo.getUserPassword()%></span></td>
					<td><span><%=userInfo.getUserName()%></span></td>
					<td><span><%=userInfo.getUserClass()%></span></td>
					<td><a
						href="../webaction/AdminDeleteAction.jsp?userID=<%=userInfo.getUserID()%>"
						class="button"><i class="material-icons ">delete</i></a> <a
						href="AdminModify.jsp?userID=<%=userInfo.getUserID()%>"
						class="button"><i class="material-icons">check</i></a></td>
					<%
						}
					}
					%>
				</tr>
			</tbody>
		</table>
	</div>

	<%
		if (pageNumber > 0) {
	%>
	<a href="AdminUserList.jsp?pageNumber=<%=pageNumber - 1%>"> prev </a>
	<%
		} else if (userList.size() == 10) {
	%>

	<a href="AdminUserList.jsp?pageNumber=<%=pageNumber + 1%>"> next </a>
	<%
		}
	%>

	<div id='hhh'>
		<form action="../webaction/LogOutAction.jsp" method="post">
			<input type="submit" value="Log out">
		</form>
		<br> <a href="AdminUserList.jsp">admin</a> <a
			href="BuyerIndex.jsp">buyer</a> <a href="SellerIndex.jsp">seller</a>
	</div>
</body>

<script type="text/javascript" src="/static/js/admin/admin-main.js"></script>

</html>
