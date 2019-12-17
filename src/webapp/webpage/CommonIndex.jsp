<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="appLayer.user.UserDAO"%>
<%@ page import ="appLayer.user.UserDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
    <title>HIGHLIGHT FLEA MARKET</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style>

    </style>
</head>

<body>
<%
	String userClass = (String)session.getAttribute("userClass");
	if(userClass != null){
  		PrintWriter script = response.getWriter();
		script.println("<script>");
		if(userClass.equals("Buyer"))
			script.println("location.href = 'BuyerIndex.jsp';");
		else if(userClass.equals("Seller"))
			script.println("location.href = 'SellerIndex.jsp';");
		else
			script.println("location.href = 'AdminUserList.jsp';");
		script.println("</script>");
		script.close();
	}
%>
  <div id=loggo><a href="CommonIndex.jsp"><img src="../images/loggo.png" alt="" width="100px"></a></div>

    <div id="vertical-navbar">
      <div id=signindiv><a href="CommonAbout.jsp"><i class="material-icons md-48">home</i>
        <h3>ABOUT</h3></a></div>
      <div id=signindiv><a href="CommonSignIn.jsp"><i class="material-icons md-48">face</i>
        <h3>SIGN IN</h3></a></div>
      <div id=signupdiv><a href="CommonSignUp.jsp"><i class="material-icons md-48">how_to_reg</i>
        <h3>SIGN UP</h3></a></div>
      <div id=Productdiv><a href="CommonProduct.jsp"><i class="material-icons md-48">store</i>
        <h3>PRODUCT</h3></a></div>
    </div>

    <div id="header">
        <img id="logo" src="../images/logo1.png" alt="">
        <img id="comment" src="../images/comment.png" alt="">
    </div>
    <hr id="hi">

<div id='hhhh'>
<a href="AdminUserList.jsp">admin</a>
<a href="BuyerIndex.jsp">buyer</a>
<a href="SellerIndex.jsp">seller</a>
<form action="../webaction/LogOutAction.jsp" method="post">
	<input type="submit" value="Log out">
</form> <br>
</div>
</body>

<script type="text/javascript" src="/static/js/admin/admin-main.js"></script>

</html>