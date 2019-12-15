<%--
  Created by IntelliJ IDEA.
  User: magdalenafoltynova
  Date: 08/12/2019
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="appLayer.util.DatabaseUtil" %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Product Auction</title>
</head>
<body>
<h1>
    Product Auction Page <br>
</h1>

<form action="ProductAuctionPage.jsp" method="post">

    <!--put wish list-->

    <!--current price-->

    <!-- picture of the product DONE-->


    <%
        String ID = request.getParameter("userID");
        String driver = "com.mysql.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://localhost:3306/";
        String database = "FinalProject";
        String userID = "root";
        String password = "Velmitajneheslo";
        try {
        Class.forName(driver);
        } catch (ClassNotFoundException e) {
        e.printStackTrace();
        }
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
    %>

<h1>Retrieve data from database in jsp</h1>
<table border="1">
    <tr>
        <td>Product Name</td>
        <td>Product Price</td>
        <td>Seller Name</td>
        <td>Seller Number</td>
        <td>Trading Place</td>
        <td>Photo</td>

    </tr>
    <%
        try{
            connection = DriverManager.getConnection(connectionUrl+database, userID, password);
            statement = connection.createStatement();
            String SQL ="SELECT productName, productPrice, sellerName, sellerPhone, productPlace, productImg FROM PRODUCT";
            resultSet = statement.executeQuery(SQL);
            while(resultSet.next()){
    %>
    <tr>
        <td><%=resultSet.getString("productName") %></td>
        <td><%=resultSet.getString("productPrice") %></td>
        <td><%=resultSet.getString("sellerName") %></td>
        <td><%=resultSet.getString("sellerNumber") %></td>
        <td><%=resultSet.getString("productPlace") %></td>
        <td><%=resultSet.getBlob("productImg")%></td>
    </tr>
    <%
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>

    <a href="./WishAction.jsp"> Wishlist </a><br>

<form action="./ProductAuctionAction.jsp" method="post">
    <input type="submit" value="Bid!"> Bid! <br>
</form>

</body>
</html>
