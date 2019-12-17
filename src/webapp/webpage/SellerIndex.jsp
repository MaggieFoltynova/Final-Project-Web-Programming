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
    <link rel="stylesheet" type="text/css" href="../css/aboutstyle.css" />

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<body>
<%
	String UserClass = (String)session.getAttribute("userClass");
	if(UserClass == null || !UserClass.equals("Seller")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Only <Seller> can access')");
		script.println("location.href = '../webpage/CommonIndex.jsp';");
		script.println("</script>");
		script.close(); 
	}
	String userID = (String)session.getAttribute("userID");
	String userName = (String)session.getAttribute("userName");
%>
  <div id=loggo><a href="SellerIndex.jsp"><img src="../images/loggo.png" alt="" width="100px"></a></div>
    <div id="vertical-navbar">
    <div id=signindiv><a href="SellerMyInfo.jsp"><i class="material-icons md-48">account_circle</i>
    <h3>My INFO</h3></a></div>
    <div id=Productdiv><a href="SellerProductRegistration.jsp"><i class="material-icons md-48">store</i>
    <h3>REGISTER</h3></a></div>


    </div>
    <div id="header">
        <img id="logo" src="../images/logo1.png" alt="">
        <img id="comment" src="../images/comment.png" alt="">
    </div>
    <hr id="hi">
    <div id='hhhh'>
    <form action="../webaction/LogOutAction.jsp" method="post">
			<input type="submit" value="Log out">
		</form> <br>
    <a href="AdminUserList.jsp">admin</a>
    <a href="BuyerIndex.jsp">buyer</a>
    <a href="SellerIndex.jsp">seller</a>
    <span>hello <%=userName %></span>
    </div>

    <h1 id="halmal">íì´ë¼ì´í¸ìµì¤ìµì¤</h1>

    <script type="text/javascript" src="/static/js/admin/admin-main.js"></script>
  </body>


    </html>
