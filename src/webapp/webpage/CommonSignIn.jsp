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
    <link rel="stylesheet" type="text/css" href="../css/signinstyle.css" />

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<body>
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


    <div id="happy">
      <form class="login-form" action="index.jsp" method="post">
        <div id="formdiv">
          <label for="tab-1" class="tab">Sign In</label>
          <div id="informdiv">
            <label class="ID">ID</label>
            <div id="idinput">
              <input type="text" name="userID" placeholder="Id" required>
            </div>
            <label class="PW">PW</label>
            <div id="pwinput">
              <input type="password" name="userPassword" placeholder="Password" required>
            </div>
            <div id="btndiv">
            <input id="btn" type="submit" formaction="../webaction/LogInAction.jsp" value="Log in">
          </div>
          </div>
        </div>
      </form>
    </div>


</body>

<script type="text/javascript" src="/static/js/admin/admin-main.js"></script>

</html>
