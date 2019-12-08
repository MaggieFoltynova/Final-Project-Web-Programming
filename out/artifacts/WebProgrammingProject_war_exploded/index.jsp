<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: magdalenafoltynova
  Date: 07/12/2019
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Web Programming Project</title>
</head>
<body>
  <h1>Hello World</h1>
<%
  Date date = new Date();
  out.print("<h2>" + date.toString() + "</h2>");

%>

</body>
</html>
