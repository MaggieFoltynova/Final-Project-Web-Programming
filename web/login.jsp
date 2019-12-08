
<%--
  Created by IntelliJ IDEA.
  User: magdalenafoltynova
  Date: 07/12/2019
  Time: 18:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h1>Welcome, please login</h1>
    <form action="/login" method="post">
        login-name: <input type="text" name="loginname" width="30px"/>
        password: <input type="password" name="password" width="30px"/>
        <input type="submit" value="Login"/>

    </form>
    <p style="color: red;">${errorMessage}</p>


</body>
</html>
