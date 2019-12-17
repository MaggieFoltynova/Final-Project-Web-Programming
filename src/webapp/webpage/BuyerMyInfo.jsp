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
    <link rel="stylesheet" type="text/css" href="../css/myinfostyle.css" />

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<body>
<%
	String userClass = (String)session.getAttribute("userClass");
	if(userClass == null || !userClass.equals("Buyer")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Only <Buyer> can access')");
		script.println("location.href = '../webpage/CommonIndex.jsp';");
		script.println("</script>");
		script.close(); 
	}
	String userID = (String)session.getAttribute("userID");
	String userName = (String)session.getAttribute("userName");
%>
  <div id=loggo><a href="BuyerIndex.jsp"><img src="../images/loggo.png" alt="" width="100px"></a></div>
    <div id="vertical-navbar">
      <div id=signindiv><a href="BuyerMyInfo.jsp"><i class="material-icons md-48">account_circle</i>
        <h3>My INFO</h3></a></div>
        <div id=Productdiv><a href="BuyerProductList.jsp"><i class="material-icons md-48">store</i>
          <h3>PRODUCT</h3></a></div>
          <div id=searchdiv><a href="BuyerSearch.jsp"><i class="material-icons md-48">search</i>
            <h3>SEARCH</h3></a></div>
      <div id=signindiv><a href="BuyerShoppingList.jsp"><i class="material-icons md-48">add_shopping_cart</i>
        <h3>SHOPPING<br>LIST</h3></a></div>
      <div id=signupdiv><a href="BuyerWishList.jsp"><i class="material-icons md-48">favorite</i>
        <h3>WISH_LIST</h3></a></div>

    </div>


    <div id="header">
        <img id="logo" src="../images/logo1.png" alt="">
        <img id="comment" src="../images/comment.png" alt="">
    </div>
    <hr id="hi">

    <div id="happy">
      <form class="login-form" action="index.html" method="post">
        <div id="formdiv">
          <label for="tab-1" class="tab">Who am I?</label>
          <div id="informdiv">
            <label class="List">ID</label>
            <div class="data">
                  <p><%=userID %></p>
                </div>
            <label class="List">Name</label>
            <div class="data">
              <p><%=userName %></p>
            </div>
            <label class="List">Classification</label>
            <div class="data">
              <p><%=userClass %></p>
            </div>

            <div id="btndiv">
            <input id="btn" type="submit" value="ë´ ì ë³´ ìì ê°ë¥íì§">
          </div>


          </div>
        </div>
    </div>



    <script type="text/javascript" src="/static/js/admin/admin-main.js"></script>
  </body>


    </html>
