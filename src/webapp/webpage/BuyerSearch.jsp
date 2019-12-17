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
    <link rel="stylesheet" type="text/css" href="../css/searchstyle.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<body>
<%
	String UserClass = (String)session.getAttribute("userClass");
	if(UserClass == null || !UserClass.equals("Buyer")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Only <Buyer> can access')");
		script.println("location.href = '../webpage/CommonIndex.jsp';");
		script.println("</script>");
		script.close(); 
	}
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



    <!-- <h1 id="halmal">íì´ë¼ì´í¸ìµì¤ìµì¤</h1> -->
    <div id="happy">
      <form class="login-form" action="index.html" method="post">
        <div id="formdiv">
          <label for="tab-1" class="tab">SEARCH</label>
          <div id="informdiv">

                <div class="setPrice">
                  <!-- <label class="List">ID</label> -->

                  <input type="text" class="lowPrice" name="" placeholder="lowest price">
                  <button type="button" class="button">
                    <i>~</i>
                  </button>
                  <input type="text" class="highPrice" name="" placeholder="highest price">
                </div>

                  <div class="searchType">
                    <!-- <label class="List">ID</label> -->

                  <input type="text" class="searchName" name="search" placeholder="Seller Name">
                  <input type="text" class="searchProduct" name="search" placeholder="Product Name">
                </div>

                   <div class="search">
                     <!-- <label class="List">ID</label> -->

                    <input type="text" class="searchTerm" placeholder="What are you looking for?">
                    <button type="submit" class="searchButton">
                      <i class="fa fa-search"></i>
                   </button>
                 </div>

    </div> <!--happy end-->
    <script type="text/javascript" src="/static/js/admin/admin-main.js"></script>
  </body>


    </html>
